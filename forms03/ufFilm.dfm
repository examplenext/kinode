object fm_Film: Tfm_Film
  Left = 4
  Top = 10
  Width = 740
  Height = 500
  Caption = '���������� �������'
  Color = clBtnFace
  Constraints.MinHeight = 370
  Constraints.MinWidth = 640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pn_Top: TPanel
    Left = 0
    Top = 0
    Width = 732
    Height = 169
    Align = alTop
    TabOrder = 1
    object gb_Edit: TGroupBox
      Left = 1
      Top = 1
      Width = 730
      Height = 167
      Align = alClient
      Caption = '��������������'
      Constraints.MinWidth = 336
      TabOrder = 0
      object lbl_Kod: TLabel
        Left = 16
        Top = 16
        Width = 23
        Height = 13
        Caption = '&���'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_1st: TLabel
        Left = 112
        Top = 16
        Width = 109
        Height = 13
        Caption = '&�������� ������'
        FocusControl = dbed_BASE_NAM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtx_BASE_KOD: TDBText
        Left = 8
        Top = 42
        Width = 73
        Height = 17
        Alignment = taCenter
        Color = clBtnFace
        DataField = 'FILM_KOD'
        DataSource = dsrc_Data
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object lbl_Genre: TLabel
        Left = 16
        Top = 72
        Width = 84
        Height = 13
        Caption = '&���� ������'
        FocusControl = dbcm_Genre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_Year: TLabel
        Left = 288
        Top = 72
        Width = 109
        Height = 13
        Caption = '&��� ������������'
        FocusControl = dbed_Year
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_Length: TLabel
        Left = 416
        Top = 72
        Width = 122
        Height = 13
        Caption = '&�����������������'
        FocusControl = dbed_Length
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_Comment: TLabel
        Left = 568
        Top = 72
        Width = 82
        Height = 13
        Caption = '&�����������'
        FocusControl = dbme_Comment
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object bt_AddRec: TBitBtn
        Left = 8
        Top = 128
        Width = 97
        Height = 25
        Caption = '&��������'
        TabOrder = 7
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          04000000000068010000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333333300003333333388883333333333333FFFF3333333
          00003333333111183333333333338333F3333333000033333331111833333333
          33338333F333333300003333333111183333333333338333F333333300003333
          333111183333333333338333F333333300003388888111188888883FFFFF8333
          FFFFFFF300003111111111111111188333333333333333F30000311111111111
          1111188333333333333333F300003111111111111111188333333333333333F3
          0000311111111111111113888888833388888833000033333331111833333333
          33338333F333333300003333333111183333333333338333F333333300003333
          333111183333333333338333F333333300003333333111183333333333338333
          F333333300003333333111133333333333338888333333330000333333333333
          3333333333333333333333330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object bt_EditRec: TBitBtn
        Left = 216
        Top = 128
        Width = 97
        Height = 25
        Caption = '&���������'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object bt_DeleteRec: TBitBtn
        Left = 112
        Top = 128
        Width = 97
        Height = 25
        Caption = '&�������'
        TabOrder = 8
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          04000000000068010000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333333333333333
          0000333333333333333333333333333333333333000033333333333333333333
          3333333333333333000033333333333333333333333333333333333300003333
          3333333333333333333333333333333300003388888888888888883FFFFFFFFF
          FFFFFFF300003444444444444444488333333333333333F30000344444444444
          4444488333333333333333F300003444444444444444488333333333333333F3
          0000344444444444444443888888888888888833000033333333333333333333
          3333333333333333000033333333333333333333333333333333333300003333
          3333333333333333333333333333333300003333333333333333333333333333
          3333333300003333333333333333333333333333333333330000333333333333
          3333333333333333333333330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object bt_Cancel: TBitBtn
        Left = 320
        Top = 128
        Width = 97
        Height = 25
        Caption = '&��������'
        TabOrder = 10
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333FFFFF333333000033333388888833333333333F888888FFF333
          000033338811111188333333338833FFF388FF33000033381119999111833333
          38F338888F338FF30000339119933331111833338F388333383338F300003391
          13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
          33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
          33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
          000039183811193333918338F8F833F83333838F000039118111933339118338
          F3833F83333833830000339111193333391833338F33F8333FF838F300003391
          11833338111833338F338FFFF883F83300003339111888811183333338FF3888
          83FF83330000333399111111993333333388FFFFFF8833330000333333999999
          3333333333338888883333330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object dbed_BASE_NAM: TDBEdit
        Left = 96
        Top = 40
        Width = 619
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'FILM_NAM'
        DataSource = dsrc_Data
        TabOrder = 0
      end
      object bt_Genre: TWc_BitBtn
        Left = 256
        Top = 93
        Width = 25
        Height = 27
        TabOrder = 3
        OnClick = bt_GenreClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000000000000000000000000000000000000000000000000000
          000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00000000000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
          00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF00000000000000840000000000FF00FF00FF00FF00FF00FF00000000000000
          0000000084000000840000008400000084000000840000008400000084000000
          840000000000000084000000840000000000FF00FF00FF00FF00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000084000000840000000000FF00FF00FF00FF000000
          00008484840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF0000000000FFFFFF0000000000000084000000840000000000FF00FF00FF00
          FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF0000000000FFFFFF0000000000000000000000840000000000FF00FF00FF00
          FF00FF00FF0000000000FFFFFF00FFFFFF008484840000000000000000000000
          000000000000FFFFFF0000000000FFFFFF000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00000000000000000000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00848484000000
          0000000000000000000000000000FFFFFF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFF
          FF008484840000000000000000000000000000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
          000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      end
      object dbcm_Genre: TDBLookupComboBox
        Left = 8
        Top = 96
        Width = 217
        Height = 21
        DataField = 'FILM_GENRE_KOD'
        DataSource = dsrc_Data
        DropDownRows = 9
        KeyField = 'GENRE_KOD'
        ListField = 'GENRE_KOD;GENRE_VER;GENRE_NAM'
        ListFieldIndex = 2
        ListSource = dsrc_Lookup
        TabOrder = 1
      end
      object bt_Refresh: TBitBtn
        Left = 424
        Top = 128
        Width = 97
        Height = 25
        Caption = '��&������'
        TabOrder = 11
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
          33333333333F8888883F33330000324334222222443333388F3833333388F333
          000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
          F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
          223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
          3338888300003AAAAAAA33333333333888888833333333330000333333333333
          333333333333333333FFFFFF000033333333333344444433FFFF333333888888
          00003A444333333A22222438888F333338F3333800003A2243333333A2222438
          F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
          22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
          33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
          3333333333338888883333330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object dbed_Year: TDBEdit
        Left = 296
        Top = 96
        Width = 105
        Height = 21
        DataField = 'FILM_RELEASE'
        DataSource = dsrc_Data
        TabOrder = 4
      end
      object dbed_Length: TDBEdit
        Left = 416
        Top = 96
        Width = 105
        Height = 21
        DataField = 'FILM_SCREENTIME'
        DataSource = dsrc_Data
        TabOrder = 5
      end
      object dbme_Comment: TDBMemo
        Left = 528
        Top = 96
        Width = 189
        Height = 65
        Anchors = [akLeft, akTop, akRight]
        DataField = 'FILM_COMMENT'
        DataSource = dsrc_Data
        ScrollBars = ssBoth
        TabOrder = 6
      end
      object bt_Genre_Last: TWc_BitBtn
        Left = 232
        Top = 93
        Width = 19
        Height = 27
        TabOrder = 2
        OnClick = bt_Genre_LastClick
        Glyph.Data = {
          56040000424D560400000000000036000000280000000F000000160000000100
          18000000000020040000C40E0000C40E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF000000000000000000FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FF00000000800000
          8000008000000000FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
          FF00FFFF00FF000000000000008000008000008000000000000000FF00FFFF00
          FFFF00FFFF00FF000000FF00FFFF00FFFF00FF00000000000000800000800000
          8000008000008000000000000000FF00FFFF00FFFF00FF000000FF00FFFF00FF
          0000000000000080000080000080000080000080000080000080000000000000
          00FF00FFFF00FF000000FF00FFFF00FF00000000800000800000800000800000
          8000008000008000008000008000000000FF00FFFF00FF000000FF00FFFF00FF
          0000000080000080000080000000000080000000000080000080000080000000
          00FF00FFFF00FF000000FF00FFFF00FF00000000800000800000800000000000
          8000000000008000008000008000000000FF00FFFF00FF000000FF00FFFF00FF
          0000000080000000000000000000000000000000000000000000000080000000
          00FF00FFFF00FF000000FF00FFFF00FF00000000800000800000800000000000
          8000000000008000008000008000000000FF00FFFF00FF000000FF00FFFF00FF
          0000000080000080000080000000000080000000000080000080000080000000
          00FF00FFFF00FF000000FF00FFFF00FF00000000800000800000800000800000
          8000008000008000008000008000000000FF00FFFF00FF000000FF00FFFF00FF
          0000000000000080000080000080000080000080000080000080000000000000
          00FF00FFFF00FF000000FF00FFFF00FFFF00FF00000000000000800000800000
          8000008000008000000000000000FF00FFFF00FFFF00FF000000FF00FFFF00FF
          FF00FFFF00FF000000000000008000008000008000000000000000FF00FFFF00
          FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FF00000000800000
          8000008000000000FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF000000000000000000FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000}
      end
    end
  end
  object dbgr_Data: TDBGrid
    Left = 0
    Top = 169
    Width = 732
    Height = 263
    Align = alClient
    DataSource = dsrc_Data
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Color = clBtnHighlight
        Expanded = False
        FieldName = 'FILM_KOD'
        Title.Caption = '���'
        Visible = True
      end
      item
        Color = clBtnHighlight
        Expanded = False
        FieldName = 'FILM_VER'
        Title.Caption = '������'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FILM_DESC'
        Title.Caption = '�������� ������'
        Width = 384
        Visible = True
      end
      item
        Color = clBtnHighlight
        Expanded = False
        FieldName = 'FILM_GENRE_KOD'
        Title.Caption = '��� �����'
        Width = 16
        Visible = True
      end
      item
        Color = clBtnHighlight
        Expanded = False
        FieldName = 'FILM_GENRE_VER'
        Title.Caption = '������ �����'
        Width = 16
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GENRE_NAM'
        Title.Caption = '����'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FILM_COMMENT'
        Title.Caption = '�����������'
        Width = 128
        Visible = True
      end
      item
        Color = clBtnHighlight
        Expanded = False
        FieldName = 'SESSION_ID'
        Title.Caption = '��� ������'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DBUSER_NAM'
        Title.Caption = '������������'
        Width = 128
        Visible = True
      end
      item
        Color = clBtnHighlight
        Expanded = False
        FieldName = 'SESSION_HOST'
        Title.Caption = '��� �����'
        Width = 128
        Visible = True
      end>
  end
  object pn_Bottom: TPanel
    Left = 0
    Top = 432
    Width = 732
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    OnDblClick = Activate_After_Once
    object pn_Close: TPanel
      Left = 602
      Top = 0
      Width = 130
      Height = 41
      Align = alRight
      BevelOuter = bvNone
      Caption = 'pn_Close'
      TabOrder = 0
      object bt_Close: TBitBtn
        Left = 8
        Top = 8
        Width = 106
        Height = 25
        Caption = '������� (&X)'
        TabOrder = 0
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
          F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
          000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
          338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
          45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
          3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
          F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
          000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
          338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
          4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
          8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
          333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
          0000}
        NumGlyphs = 2
      end
    end
  end
  object dsrc_Data: TDataSource
    DataSet = dm_Base.ds_Film
    Left = 368
    Top = 8
  end
  object dsrc_Lookup: TDataSource
    DataSet = dm_Base.ds_Genre
    Left = 416
    Top = 8
  end
end
