object fm_Info: Tfm_Info
  Left = 572
  Top = 220
  AutoScroll = False
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = '����������'
  ClientHeight = 300
  ClientWidth = 512
  Color = clBtnFace
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 520
  Constraints.MinHeight = 200
  Constraints.MinWidth = 365
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pnInfo: TPanel
    Left = 0
    Top = 0
    Width = 512
    Height = 281
    Align = alClient
    BevelOuter = bvLowered
    Caption = 'pnInfo'
    TabOrder = 0
    object lv_Info: TListView
      Left = 1
      Top = 1
      Width = 510
      Height = 279
      Align = alClient
      Columns = <
        item
          Caption = '[��� ������]'
          Width = 170
        end
        item
          Alignment = taRightJustify
          Caption = '����'
          Width = 40
        end
        item
          Alignment = taRightJustify
          Caption = '����������'
          Width = 40
        end
        item
          Alignment = taRightJustify
          Caption = '�����'
          Width = 60
        end
        item
          Alignment = taRightJustify
          Caption = '����������'
          Width = 30
        end
        item
          Caption = '###'
          Width = 60
        end>
      GridLines = True
      IconOptions.Arrangement = iaLeft
      IconOptions.AutoArrange = True
      Items.Data = {
        D00000000400000000000000FFFFFFFFFFFFFFFF040000000000000007313131
        31313131073131313030313107313131303032320731313130303333032D2D2D
        00000000FFFFFFFFFFFFFFFF0400000000000000073232323232323207323232
        3030313107323232303032320130012A00000000FFFFFFFFFFFFFFFF04000000
        0000000007333333333333330131000132012D00000000FFFFFFFFFFFFFFFF02
        0000000000000007343434343434340003323232FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      LargeImages = iml_Ticket_Icons
      ReadOnly = True
      RowSelect = True
      ShowColumnHeaders = False
      SmallImages = iml_Ticket_Icons
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  object sbarInfo: TStatusBar
    Left = 0
    Top = 281
    Width = 512
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 200
      end>
    SimplePanel = False
    OnDblClick = CycleMinMax
  end
  object iml_Ticket_Icons: TImageList
    Left = 79
    Top = 27
  end
end
