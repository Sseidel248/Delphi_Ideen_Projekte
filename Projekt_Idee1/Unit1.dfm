object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 431
  ClientWidth = 644
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 353
    Height = 431
    Align = alLeft
    TabOrder = 0
    object GB_NewLoad: TGroupBox
      Left = 1
      Top = 1
      Width = 351
      Height = 208
      Align = alTop
      Caption = 'Neue Ladevariante'
      TabOrder = 0
      object BLoad: TButton
        Left = 225
        Top = 111
        Width = 121
        Height = 25
        Caption = 'Lade Konv. <-'
        TabOrder = 0
        OnClick = BLoadClick
      end
      object BSave: TButton
        Left = 225
        Top = 16
        Width = 121
        Height = 25
        Caption = 'Speicher Konv. ->'
        TabOrder = 1
        OnClick = BSaveClick
      end
      object GridAfterLoad: TStringGrid
        Left = 10
        Top = 111
        Width = 209
        Height = 89
        ColCount = 3
        FixedCols = 0
        RowCount = 3
        TabOrder = 2
      end
      object GridBeForeSave: TStringGrid
        Left = 10
        Top = 16
        Width = 209
        Height = 89
        ColCount = 3
        FixedCols = 0
        RowCount = 3
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColMoving, goEditing, goFixedColClick]
        TabOrder = 3
      end
    end
    object GB_OldLoad: TGroupBox
      Left = 1
      Top = 209
      Width = 351
      Height = 221
      Align = alClient
      Caption = 'Alte Ladevariente'
      TabOrder = 1
      object OldGridAfterLoad: TStringGrid
        Left = 10
        Top = 119
        Width = 209
        Height = 89
        ColCount = 3
        FixedCols = 0
        RowCount = 3
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedColClick]
        TabOrder = 0
      end
      object OldGridBeForeSave: TStringGrid
        Left = 10
        Top = 24
        Width = 209
        Height = 89
        ColCount = 3
        FixedCols = 0
        RowCount = 3
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColMoving]
        TabOrder = 1
      end
      object B_OldSave: TButton
        Left = 225
        Top = 24
        Width = 121
        Height = 25
        Caption = 'Speicher Konv. ->'
        TabOrder = 2
        OnClick = B_OldSaveClick
      end
      object B_OldLoad: TButton
        Left = 225
        Top = 119
        Width = 121
        Height = 25
        Caption = 'Lade Konv. <-'
        TabOrder = 3
        OnClick = B_OldLoadClick
      end
    end
  end
  object Panel2: TPanel
    Left = 353
    Top = 0
    Width = 291
    Height = 431
    Align = alClient
    TabOrder = 1
    object GB_Inhalt: TGroupBox
      Left = 1
      Top = 1
      Width = 289
      Height = 429
      Align = alClient
      Caption = 'Inhalt Datei'
      TabOrder = 0
      object GB_FindSpalte: TGroupBox
        Left = 2
        Top = 144
        Width = 285
        Height = 283
        Align = alClient
        Caption = 'Finde Spalte'
        TabOrder = 0
        object LResult: TLabel
          Left = 176
          Top = 24
          Width = 34
          Height = 13
          Caption = 'Spalte:'
        end
        object LResult2: TLabel
          Left = 176
          Top = 56
          Width = 34
          Height = 13
          Caption = 'Spalte:'
        end
        object Label1: TLabel
          Left = 16
          Top = 93
          Width = 108
          Height = 39
          Caption = 'Brot, Bread = ID:1'#13#10'Wasser, Water = ID:2'#13#10'Eis, Ice = ID:3'
        end
        object CB_Spalten: TComboBox
          Left = 16
          Top = 24
          Width = 145
          Height = 21
          TabOrder = 0
          Text = 'CB_Spalten'
          OnChange = CB_SpaltenChange
        end
        object CB_SpaltenID: TComboBox
          Left = 16
          Top = 51
          Width = 145
          Height = 21
          TabOrder = 1
          Text = 'CB_SpaltenID'
          OnChange = CB_SpaltenIDChange
        end
      end
      object GB_SimFile: TGroupBox
        Left = 2
        Top = 15
        Width = 285
        Height = 129
        Align = alTop
        Caption = 'Simulation gespeicherte Datei'
        TabOrder = 1
        object GridAfterSave: TStringGrid
          Left = 2
          Top = 15
          Width = 281
          Height = 112
          Align = alClient
          ColCount = 3
          FixedCols = 0
          RowCount = 3
          TabOrder = 0
        end
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 512
    Top = 344
    object Sprache1: TMenuItem
      Caption = 'Sprache Grids'
      object Deutsch1: TMenuItem
        Caption = 'Deutsch'
        Checked = True
        OnClick = Deutsch1Click
      end
      object Englisch1: TMenuItem
        Caption = 'Englisch'
        OnClick = Englisch1Click
      end
    end
    object Reset1: TMenuItem
      Caption = 'Reset'
      OnClick = Reset1Click
    end
  end
end
