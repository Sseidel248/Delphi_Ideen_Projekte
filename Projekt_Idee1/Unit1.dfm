object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 257
  ClientWidth = 574
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
  object GridBeForeSave: TStringGrid
    Left = 0
    Top = 0
    Width = 209
    Height = 89
    ColCount = 3
    FixedCols = 0
    RowCount = 3
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColMoving, goEditing, goFixedColClick]
    TabOrder = 0
  end
  object GridAfterLoad: TStringGrid
    Left = 0
    Top = 135
    Width = 209
    Height = 89
    ColCount = 3
    FixedCols = 0
    RowCount = 3
    TabOrder = 1
  end
  object BLoad: TButton
    Left = 225
    Top = 135
    Width = 121
    Height = 25
    Caption = 'Lade Konv. <-'
    TabOrder = 2
    OnClick = BLoadClick
  end
  object BSave: TButton
    Left = 225
    Top = 64
    Width = 121
    Height = 25
    Caption = 'Speicher Konv. ->'
    TabOrder = 3
    OnClick = BSaveClick
  end
  object GB_FindSpalte: TGroupBox
    Left = 225
    Top = 166
    Width = 336
    Height = 83
    Caption = 'Finde Spalte'
    TabOrder = 4
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
    Left = 352
    Top = 48
    Width = 214
    Height = 111
    Caption = 'Simulation gespeicherte Datei'
    TabOrder = 5
    object GridAfterSave: TStringGrid
      Left = 2
      Top = 15
      Width = 210
      Height = 94
      Align = alClient
      ColCount = 3
      FixedCols = 0
      RowCount = 3
      TabOrder = 0
      ExplicitLeft = 3
      ExplicitTop = 24
      ExplicitWidth = 209
      ExplicitHeight = 96
    end
  end
  object MainMenu1: TMainMenu
    Left = 264
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
