object Form1: TForm1
  Left = 306
  Top = 168
  Width = 916
  Height = 647
  Caption = #1048#1043
  Color = clGradientInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clHighlight
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 384
    Top = 80
    Width = 297
    Height = 433
    Color = clSkyBlue
    Constraints.MaxHeight = 433
    Constraints.MaxWidth = 297
    Constraints.MinHeight = 400
    Constraints.MinWidth = 270
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuHighlight
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    OnPaint = PaintBox1Paint
  end
  object Label1: TLabel
    Left = 40
    Top = 112
    Width = 265
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072
    Color = clGradientInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 216
    Width = 265
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1044#1072#1074#1083#1077#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 208
    Top = 448
    Width = 153
    Height = 57
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Kind = bkClose
  end
  object TrackBar1: TTrackBar
    Left = 40
    Top = 136
    Width = 265
    Height = 41
    Hint = '0'
    Max = 15
    Position = 1
    TabOrder = 1
    OnChange = TrackBar1Change
  end
  object TrackBar2: TTrackBar
    Left = 40
    Top = 240
    Width = 265
    Height = 41
    Max = 80
    Position = 35
    TabOrder = 2
    OnChange = TrackBar2Change
  end
  object Button1: TButton
    Left = 24
    Top = 448
    Width = 145
    Height = 57
    Caption = #1057#1090#1086#1087
    TabOrder = 3
    OnClick = Button1Click
  end
  object pnl1: TPanel
    Left = 384
    Top = 80
    Width = 297
    Height = 41
    BevelOuter = bvLowered
    Caption = #1055#1086#1088#1096#1077#1085#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
    OnDragOver = pnl1DragOver
    OnMouseDown = pnl1MouseDown
  end
  object Timer1: TTimer
    Interval = 30
    OnTimer = Timer1Timer
    Left = 840
    Top = 16
  end
end
