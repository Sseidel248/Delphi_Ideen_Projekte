unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, GradientPanel,
  Vcl.StdCtrls, MyGlassButton, Vcl.BaseImageCollection, Vcl.ImageCollection,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, Vcl.Grids, Generics.Collections,
  Vcl.Menus;

type
  TForm1 = class(TForm)
    GridBeForeSave: TStringGrid;
    GridAfterSave: TStringGrid;
    GridAfterLoad: TStringGrid;
    BLoad: TButton;
    BSave: TButton;
    MainMenu1: TMainMenu;
    Sprache1: TMenuItem;
    Deutsch1: TMenuItem;
    Englisch1: TMenuItem;
    GB_FindSpalte: TGroupBox;
    CB_Spalten: TComboBox;
    CB_SpaltenID: TComboBox;
    LResult: TLabel;
    LResult2: TLabel;
    GB_SimFile: TGroupBox;
    Reset1: TMenuItem;
    GB_NewLoad: TGroupBox;
    GB_OldLoad: TGroupBox;
    GB_Inhalt: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    OldGridAfterLoad: TStringGrid;
    OldGridBeForeSave: TStringGrid;
    B_OldSave: TButton;
    B_OldLoad: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Reset1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Deutsch1Click(Sender: TObject);
    procedure Englisch1Click(Sender: TObject);
    procedure BSaveClick(Sender: TObject);
    procedure BLoadClick(Sender: TObject);
    procedure CB_SpaltenChange(Sender: TObject);
    procedure CB_SpaltenIDChange(Sender: TObject);
    procedure B_OldSaveClick(Sender: TObject);
    procedure B_OldLoadClick(Sender: TObject);
  private
    Sprache : String;
    procedure ClearGrid( var ASG : TStringGrid );
    procedure SetHeader( var ASG : TStringGrid );
    procedure SetIDs( var ASG : TStringGrid );
    procedure SetHeaderInCB( var CB : TComboBox );
    procedure CopyNormalCells( ASG_Src : TStringGrid; var ASG_Dest : TStringGrid );
    procedure CopyAllCells( ASG_Src : TStringGrid; var ASG_Dest : TStringGrid );
    procedure ConvForSave( ASG_Src : TStringGrid; var ASG_Dest : TStringGrid; NeedOldWay : Boolean = false );
    function ExistIDHeader( ASG_Src : TStringGrid ) : Boolean;
    procedure ConvForLoad( ASG_Src : TStringGrid; var ASG_Dest : TStringGrid );
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

var
  DictHeaderWithID_D : TDictionary<Integer,String>;
  DictHeaderWithID_E : TDictionary<Integer,String>;
  DictIDWithHeader : TDictionary<String,Integer>;
  DictColWithHeader : TDictionary<String,Integer>;
  DictColWithID : TDictionary<Integer,Integer>;

implementation

{$R *.dfm}

uses
Unit2,
Unit3;

const
h1_d = 'Brot';
h2_d = 'Wasser';
h3_d = 'Eis';
h1_e = 'Bread';
h2_e = 'Water';
h3_e = 'Ice';
id1  = 1;
id2  = 2;
id3  = 3;

procedure TForm1.BSaveClick(Sender: TObject);
begin
  CopyNormalCells( GridBeForeSave, GridAfterSave );
  ConvForSave( GridBeForeSave, GridAfterSave );
end;

procedure TForm1.B_OldLoadClick(Sender: TObject);
begin
  ConvForLoad( GridAfterSave, OldGridAfterLoad );
end;

procedure TForm1.B_OldSaveClick(Sender: TObject);
begin
  CopyNormalCells( OldGridBeForeSave, GridAfterSave );
  ConvForSave( OldGridBeForeSave, GridAfterSave, true );
end;

procedure TForm1.CB_SpaltenChange(Sender: TObject);
var
key : String;
sCol : Integer;
begin
  if CB_Spalten.ItemIndex > 0 then
  begin
    if Sprache.Equals('D') then
    begin
      case CB_Spalten.ItemIndex of
        1: key := h1_d;
        2: key := h2_d;
        3: key := h3_d;
      end;
    end
    else
    begin
      case CB_Spalten.ItemIndex of
        1: key := h1_e;
        2: key := h2_e;
        3: key := h3_e;
      end;
    end;

    if DictColWithHeader.TryGetValue( key, sCol ) then
      LResult.Caption := Format( 'Spalte: %d', [sCol+1] )
    else
      LResult.Caption := 'Spalte Nicht gefunden.';
  end;
end;

procedure TForm1.CB_SpaltenIDChange(Sender: TObject);
var
key, sCol : integer;
begin
  if CB_SpaltenID.ItemIndex > 0 then
  begin
    case CB_SpaltenID.ItemIndex of
      1: key := id1;
      2: key := id2;
      3: key := id3;
    end;
    if DictColWithID.TryGetValue( key, sCol ) then
      LResult2.Caption := Format( 'Spalte: %d', [sCol+1] )
    else
      LResult2.Caption := 'ID Nicht gefunden.';
  end;
end;

procedure TForm1.ClearGrid( var ASG : TStringGrid );
var
  col: Integer;
  row: Integer;
begin
  for col := 0 to ASG.ColCount-1 do
  begin
    for row := 0 to ASG.RowCount-1 do
      ASG.Cells[col,row] := '';
  end;
end;

procedure TForm1.Deutsch1Click(Sender: TObject);
begin
  Self.Sprache := 'D';
  Deutsch1.Checked := true;
  Englisch1.Checked := false;
  SetHeader( GridBeForeSave );
  SetHeader( OldGridBeForeSave );
end;

procedure TForm1.Englisch1Click(Sender: TObject);
begin
  Self.Sprache := 'E';
  Deutsch1.Checked := false;
  Englisch1.Checked := true;
  SetHeader( GridBeForeSave );
  SetHeader( OldGridBeForeSave );
end;

procedure TForm1.SetHeader( var ASG : TStringGrid );
begin
  if Sprache.Equals('D') then
  begin
    ASG.Cells[0,0] := h1_d;
    ASG.Cells[1,0] := h2_d;
    ASG.Cells[2,0] := h3_d;
  end
  else
  begin
    ASG.Cells[0,0] := h1_e;
    ASG.Cells[1,0] := h2_e;
    ASG.Cells[2,0] := h3_e;
  end;
end;

procedure TForm1.SetIDs( var ASG : TStringGrid );
begin
  ASG.Cells[0,0] := IntToStr( id1 );
  ASG.Cells[1,0] := IntToStr( id2);
  ASG.Cells[2,0] := IntToStr( id3);
end;

procedure TForm1.SetHeaderInCB( var CB : TComboBox );
begin
  CB_Spalten.Clear;
  CB_Spalten.Items.Add( 'Bitte Spalte w?hlen' );
  if Sprache.Equals('D') then
  begin
    CB_Spalten.Items.Add( h1_d );
    CB_Spalten.Items.Add( h2_d );
    CB_Spalten.Items.Add( h3_d );
  end
  else
  begin
    CB_Spalten.Items.Add( h1_e );
    CB_Spalten.Items.Add( h2_e );
    CB_Spalten.Items.Add( h3_e );
  end;
  CB_Spalten.ItemIndex := 0;
end;

procedure TForm1.CopyNormalCells( ASG_Src : TStringGrid; var ASG_Dest : TStringGrid );
var
  col: Integer;
  row: Integer;
begin
  for col := 0 to ASG_Src.ColCount-1 do
  begin
    for row := 1 to ASG_Src.RowCount-1 do
      ASG_Dest.Cells[col,row] := ASG_Src.Cells[col,row];
  end;
end;

procedure TForm1.CopyAllCells( ASG_Src : TStringGrid; var ASG_Dest : TStringGrid );
var
  col: Integer;
  head : String;
begin
  DictColWithHeader.Clear;
  for col := 0 to ASG_Src.ColCount-1 do
  begin
    head := ASG_Src.Cells[col,0];
    DictColWithHeader.TryAdd( head, col );
    ASG_Dest.Cells[col,0] := head;
  end;
  CopyNormalCells( ASG_Src, ASG_Dest );
end;

procedure TForm1.ConvForSave( ASG_Src : TStringGrid; var ASG_Dest : TStringGrid; NeedOldWay : Boolean = false );
var
  col: Integer;
  head : String;
  id : Integer;
begin
  DictColWithID.Clear;
  if NeedOldWay then
  begin
    for col := 0 to ASG_Src.ColCount-1 do
    begin
      head := ASG_Src.Cells[col,0];
      ASG_Dest.Cells[col,0] := head;
    end;
  end
  else
  begin
    for col := 0 to ASG_Src.ColCount-1 do
    begin
      head := ASG_Src.Cells[col,0];
      if DictIDWithHeader.TryGetValue( head, id ) then
      begin
        ASG_Dest.Cells[col,0] := IntToStr( id );
        DictColWithID.TryAdd( id, col );
      end;
    end;
  end;
end;

function TForm1.ExistIDHeader( ASG_Src : TStringGrid ) : Boolean;
var
col, id : Integer;
sHead : String;
begin
  Result := true;
  for col := 0 to ASG_Src.ColCount-1 do
  begin
    sHead := ASG_Src.Cells[col,0];
    id := StrToIntDef( sHead, -1 );
    if id = -1 then
    begin
      Result := false;
      Break;
    end;
  end;
end;

procedure TForm1.ConvForLoad( ASG_Src : TStringGrid; var ASG_Dest : TStringGrid );

  procedure ConvSavedHeader( Dict : TDictionary<Integer,String> );
  var
  col: Integer;
  head : String;
  id : Integer;
  begin
    DictColWithHeader.Clear;
    for col := 0 to ASG_Src.ColCount-1 do
    begin
      id := StrToInt( ASG_Src.Cells[col,0] );
      if Dict.TryGetValue( id, head ) then
      begin
        ASG_Dest.Cells[col,0] := head;
        DictColWithHeader.TryAdd( head, col );
      end;
    end;
  end;

  procedure SaveAllHeader( );
  var
    col: Integer;
    head : String;
  begin
    DictColWithHeader.Clear;
    for col := 0 to ASG_Src.ColCount-1 do
    begin
      head := ASG_Src.Cells[col,0];
      DictColWithHeader.TryAdd( head, col );
    end;
  end;

begin
  if ExistIDHeader( GridAfterSave ) then
  begin
    if Sprache.Equals('D') then
      ConvSavedHeader( DictHeaderWithID_D )
    else
      ConvSavedHeader( DictHeaderWithID_E );
  end
  else
  begin
    CopyAllCells( ASG_Src, ASG_Dest );
    SaveAllHeader();
  end;

  SetHeaderInCB( CB_Spalten );
end;

procedure TForm1.BLoadClick(Sender: TObject);
begin
  CopyNormalCells( GridAfterSave, GridAfterLoad );
  ConvForLoad( GridAfterSave, GridAfterLoad );
end;

procedure TForm1.Reset1Click(Sender: TObject);
begin
  ClearGrid( GridBeForeSave );
  ClearGrid( GridAfterSave );
  ClearGrid( GridAfterLoad );
  ClearGrid( OldGridBeForeSave );
  ClearGrid( OldGridAfterLoad );

  SetHeader( GridBeForeSave );
  SetHeader( OldGridBeForeSave );

  LResult.Caption := 'Spalte:';
  LResult2.Caption := 'Spalte:';

  CB_Spalten.ItemIndex := 0;
  CB_SpaltenID.ItemIndex := 0;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DictHeaderWithID_D.Free;
  DictHeaderWithID_E.Free;
  DictIDWithHeader.Free;
  DictColWithHeader.Free;
  DictColWithID.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
Test : TMyClass;
begin
  DictHeaderWithID_D := TDictionary<Integer,String>.Create;
  DictHeaderWithID_E := TDictionary<Integer,String>.Create;
  DictIDWithHeader := TDictionary<String,Integer>.Create;
  DictColWithHeader := TDictionary<String,Integer>.Create;
  DictColWithID := TDictionary<Integer,Integer>.Create;

  //Header bef?llen - deutsch -
  DictHeaderWithID_D.Add( id1, h1_d );
  DictHeaderWithID_D.Add( id2, h2_d );
  DictHeaderWithID_D.Add( id3, h3_d );
  //Header bef?llen - englisch -
  DictHeaderWithID_E.Add( id1, h1_e );
  DictHeaderWithID_E.Add( id2, h2_e );
  DictHeaderWithID_E.Add( id3, h3_e );
  //ID bef?llen
  DictIDWithHeader.Add( h1_d, id1 );
  DictIDWithHeader.Add( h2_d, id2 );
  DictIDWithHeader.Add( h3_d, id3 );
  DictIDWithHeader.Add( h1_e, id1 );
  DictIDWithHeader.Add( h2_e, id2 );
  DictIDWithHeader.Add( h3_e, id3 );

  Self.Sprache := 'D';

  SetHeader( GridBeForeSave );
  SetHeader( OldGridBeForeSave );

  CB_SpaltenID.Clear;
  CB_SpaltenID.Items.Add( 'Bitte ID w?hlen' );
  CB_SpaltenID.Items.Add( IntToStr( id1 ) );
  CB_SpaltenID.Items.Add( IntToStr( id2 ) );
  CB_SpaltenID.Items.Add( IntToStr( id3 ) );
  CB_SpaltenID.ItemIndex := 0;

  SetHeaderInCB( CB_Spalten );

  //Test
  Test := TMyClass.Create('hallo');
end;


end.
