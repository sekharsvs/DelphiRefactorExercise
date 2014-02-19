object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'TeamCity Monitor'
  ClientHeight = 374
  ClientWidth = 1127
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1127
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 48
    ExplicitTop = 24
    ExplicitWidth = 185
    DesignSize = (
      1127
      41)
    object Label1: TLabel
      Left = 16
      Top = 13
      Width = 82
      Height = 13
      Caption = 'Teamcity Server:'
    end
    object Label2: TLabel
      Left = 905
      Top = 13
      Width = 24
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Port:'
      ExplicitLeft = 560
    end
    object edUrl: TEdit
      Left = 104
      Top = 11
      Width = 778
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Text = 'cltd-spf-teamcity.cochlear.com'
      ExplicitWidth = 433
    end
    object Button1: TButton
      Left = 1033
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Scan'
      TabOrder = 1
      OnClick = Button1Click
      ExplicitLeft = 688
    end
    object sePort: TSpinEdit
      Left = 945
      Top = 10
      Width = 73
      Height = 22
      Anchors = [akTop, akRight]
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 8111
      ExplicitLeft = 600
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 185
    Height = 333
    Align = alLeft
    TabOrder = 1
    ExplicitLeft = 328
    ExplicitTop = 136
    ExplicitHeight = 497
    object CheckListBox1: TCheckListBox
      Left = 1
      Top = 1
      Width = 183
      Height = 292
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
      ExplicitWidth = 686
      ExplicitHeight = 177
    end
    object Button2: TButton
      Left = 1
      Top = 293
      Width = 183
      Height = 39
      Align = alBottom
      Caption = 'Monitor'
      TabOrder = 1
      OnClick = Button2Click
      ExplicitTop = 648
    end
  end
  object StringGrid1: TStringGrid
    Left = 185
    Top = 41
    Width = 942
    Height = 333
    Align = alClient
    ColCount = 6
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    TabOrder = 2
    ExplicitLeft = 191
    ExplicitTop = 47
    ExplicitWidth = 730
    ExplicitHeight = 314
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    HandleRedirects = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = True
    Request.Password = '2mib4eva1'
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Username = 'ssedgwick'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 24
  end
  object XMLDocument1: TXMLDocument
    Left = 72
    DOMVendorDesc = 'MSXML'
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = Timer1Timer
    Left = 112
  end
end
