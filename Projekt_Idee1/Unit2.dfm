object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Test Fenster'
  ClientHeight = 176
  ClientWidth = 312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GradientPanel1: TGradientPanel
    Left = 0
    Top = 0
    Width = 312
    Height = 176
    Align = alClient
    Color = clAqua
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    ColorGradient = cgHorizontal
    RGB_Gradient = rgbLinear
    ColorTo = clOlive
    ExplicitLeft = 80
    ExplicitTop = 32
    ExplicitWidth = 185
    ExplicitHeight = 41
  end
end
