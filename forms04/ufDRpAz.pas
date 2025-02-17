{-----------------------------------------------------------------------------
 Unit Name: ufDRpAz
 Author:    n0mad
 Version:   1.2.8.x
 Creation:  19.11.2004
 Purpose:   Daily Report Preview
 History:
-----------------------------------------------------------------------------}
unit ufDRpAz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, SLForms, Dialogs,
  FR_Class, FR_DSet, FR_DBSet, StdCtrls, Db, Grids, DBGrids, ExtCtrls,
  Buttons, WcBitBtn, ComCtrls, DBCtrls, ImgList, ActnList,
  FR_E_HTM, FR_E_CSV, FR_E_RTF, FR_E_TXT;

type
  Tfm_DRpAz = class(TSLForm)
    frReport_Daily: TfrReport;
    dsrc_Master: TDataSource;
    pn_Top: TPanel;
    gb_Edit: TGroupBox;
    lbl_1st: TLabel;
    dtp_Date_Filt_Start: TDateTimePicker;
    dtp_Date_Filt_Finish: TDateTimePicker;
    sb_Up_Start: TSpeedButton;
    sb_Down_Start: TSpeedButton;
    sb_Today_Start: TSpeedButton;
    sb_Up_Finish: TSpeedButton;
    sb_Down_Finish: TSpeedButton;
    sb_Today_Finish: TSpeedButton;
    lbl_Zal: TLabel;
    dbcm_Zal: TComboBox;
    cmb_Report_Mode: TComboBox;
    bt_ShowReport: TBitBtn;
    bt_Refresh: TBitBtn;
    RPImageList: TImageList;
    RPActionList: TActionList;
    DTRefresh: TAction;
    DTExit: TAction;
    DTAltExit: TAction;
    DTStatusBar: TStatusBar;
    pn_Bottom: TPanel;
    pn_Close: TPanel;
    bt_Close: TBitBtn;
    dsrc_Detail: TDataSource;
    dsrc_SubDetail: TDataSource;
    dbgr_Data_Master: TDBGrid;
    Splitter1: TSplitter;
    dbgr_Data_Detail: TDBGrid;
    Splitter2: TSplitter;
    dbgr_Data_SubDetail: TDBGrid;
    frDBds_Master: TfrDBDataSet;
    frDBds_Detail: TfrDBDataSet;
    frDBds_SubDetail: TfrDBDataSet;
    DTPreview: TAction;
    dsrc_Abonem: TDataSource;
    frDBds_Abonem: TfrDBDataSet;
    dbgr_Data: TDBGrid;
    Splitter3: TSplitter;
    dsrc_Detail_2: TDataSource;
    frDBds_Detail_2: TfrDBDataSet;
    dbgr_Data_Detail_2: TDBGrid;
    Splitter4: TSplitter;
    frTextExport1: TfrTextExport;
    frRTFExport1: TfrRTFExport;
    frCSVExport1: TfrCSVExport;
    frHTMExport1: TfrHTMExport;
    procedure sb_Up_StartClick(Sender: TObject);
    procedure sb_Down_StartClick(Sender: TObject);
    procedure sb_Today_StartClick(Sender: TObject);
    procedure sb_Up_FinishClick(Sender: TObject);
    procedure sb_Down_FinishClick(Sender: TObject);
    procedure sb_Today_FinishClick(Sender: TObject);
    procedure bt_CloseClick(Sender: TObject);
    procedure bt_RefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PrepReport(Sender: TObject);
    procedure bt_ShowReportClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DTStatusBarClick(Sender: TObject);
    procedure Activate_After_Once(Sender: TObject);
    procedure DTRefreshUpdate(Sender: TObject);
    procedure frReport_DailyGetValue(const ParName: string;
      var ParValue: Variant);
    procedure frReport_DailyUserFunction(const Name: string; p1, p2,
      p3: Variant; var Val: string);
  private
    FNotYetActivated: Boolean;
    function SetDTStatus(PanelIndex: Integer; StatusText: string): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

procedure acDRpAzShowModal(v_Repert_Date: TDateTime; v_Repert_Odeum: Integer);

var
  fm_DRpAz: Tfm_DRpAz;
  pm_Repert_Date: TDateTime;
  pm_Repert_Odeum: Integer;

implementation

uses
  Bugger, pFIBDataSet, udBase, urCommon, uhMain, StrConsts, uhCommon;

{$R *.DFM}

const
  UnitName: string = 'ufDRpAz';

var
  cv_Repert_Date_Start: TDateTime;
  cv_Repert_Date_Finish: TDateTime;
  // cv_Repert_Odeum: Integer;

procedure acDRpAzShowModal(v_Repert_Date: TDateTime; v_Repert_Odeum: Integer);
const
  ProcName: string = 'acDRpAzShowModal';
begin
  // --------------------------------------------------------------------------
  // ���������� �����
  // --------------------------------------------------------------------------
  DEBUGMessBrk(1, ')   >>> [' + UnitName + '::' + ProcName + '] >>>   (');
  // DEBUGMessEnh(1, UnitName, ProcName, '->');
  // --------------------------------------------------------------------------
  try
    pm_Repert_Date := v_Repert_Date;
    pm_Repert_Odeum := v_Repert_Odeum;
    Application.CreateForm(Tfm_DRpAz, fm_DRpAz);
    DEBUGMessEnh(0, UnitName, ProcName, fm_DRpAz.Name + '.ShowModal');
    fm_DRpAz.ShowModal;
  finally
    fm_DRpAz.Free;
    fm_DRpAz := nil;
  end;
  // --------------------------------------------------------------------------
  // DEBUGMessEnh(-1, UnitName, ProcName, '<-');
  DEBUGMessBrk(-1, ')   <<< [' + UnitName + '::' + ProcName + '] <<<   (');
end;

procedure Tfm_DRpAz.sb_Up_StartClick(Sender: TObject);
begin
  if dtp_Date_Filt_Start.Enabled then
  begin
    dtp_Date_Filt_Start.Date := dtp_Date_Filt_Start.Date + 1;
    dtp_Date_Filt_Start.OnChange(Self);
  end;
end;

procedure Tfm_DRpAz.sb_Up_FinishClick(Sender: TObject);
begin
  if dtp_Date_Filt_Finish.Enabled then
  begin
    dtp_Date_Filt_Finish.Date := dtp_Date_Filt_Finish.Date + 1;
    dtp_Date_Filt_Finish.OnChange(Self);
  end;
end;

procedure Tfm_DRpAz.bt_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfm_DRpAz.bt_RefreshClick(Sender: TObject);
begin
  PrepReport(Sender);
end;

procedure Tfm_DRpAz.FormCreate(Sender: TObject);
begin
  // --------------------------------------------------------------------------
  FNotYetActivated := true;
  // --------------------------------------------------------------------------
  dtp_Date_Filt_Start.Date := pm_Repert_Date;
  dtp_Date_Filt_Finish.Date := pm_Repert_Date;
  cv_Repert_Date_Start := dtp_Date_Filt_Start.Date;
  cv_Repert_Date_Finish := dtp_Date_Filt_Finish.Date;
  // --------------------------------------------------------------------------
  if (cmb_Report_Mode.Items.Count > 0) then
    cmb_Report_Mode.ItemIndex := 0;
  // --------------------------------------------------------------------------
end;

procedure Tfm_DRpAz.FormActivate(Sender: TObject);
const
  ProcName: string = 'FormActivate';
var
  OldCursor: TCursor;
  Old_Zal_Indx: Integer;
begin
  DEBUGMessEnh(1, UnitName, ProcName, '->');
  // --------------------------------------------------------------------------
  {
  if Assigned(dbcm_Zal.ListSource) then
    if Assigned(dbcm_Zal.ListSource.DataSet) then
    begin
      dbcm_Zal.ListSource.DataSet.Active := true;
      dbcm_Zal.ListSource.DataSet.Last;
      dbcm_Zal.ListSource.DataSet.First;
    end;
  }
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    with dbcm_Zal, dm_Base do
    begin
      Old_Zal_Indx := ItemIndex;
      if (Old_Zal_Indx < 0) then
        Old_Zal_Indx := 0;
      ds_Zal.Close;
      // ��������� Select-sql �� �����������, ���� �����
      ds_Zal.Prepare;
      ds_Zal.Open;
      Combo_Load_Zal(ds_Zal, Items);
      if Items.Count > 0 then
        ItemIndex := 0;
      if Old_Zal_Indx < Items.Count then
        ItemIndex := Old_Zal_Indx;
      if FNotYetActivated then
      begin
        Activate_After_Once(nil);
        FNotYetActivated := False;
      end
      else if Assigned(OnChange) then
        OnChange(Self);
      DTStatusBarClick(Sender);
    end;
    //
  finally
    Screen.Cursor := OldCursor;
  end;
  // --------------------------------------------------------------------------
  DEBUGMessEnh(-1, UnitName, ProcName, '<-');
end;

procedure Tfm_DRpAz.sb_Down_StartClick(Sender: TObject);
begin
  if dtp_Date_Filt_Start.Enabled then
  begin
    dtp_Date_Filt_Start.Date := dtp_Date_Filt_Start.Date - 1;
    dtp_Date_Filt_Start.OnChange(Self);
  end;
end;

procedure Tfm_DRpAz.sb_Down_FinishClick(Sender: TObject);
begin
  if dtp_Date_Filt_Finish.Enabled then
  begin
    dtp_Date_Filt_Finish.Date := dtp_Date_Filt_Finish.Date - 1;
    dtp_Date_Filt_Finish.OnChange(Self);
  end;
end;

procedure Tfm_DRpAz.sb_Today_StartClick(Sender: TObject);
begin
  if dtp_Date_Filt_Start.Enabled then
  begin
    dtp_Date_Filt_Start.Date := Now;
    dtp_Date_Filt_Start.OnChange(Self);
  end;
end;

procedure Tfm_DRpAz.sb_Today_FinishClick(Sender: TObject);
begin
  if dtp_Date_Filt_Finish.Enabled then
  begin
    dtp_Date_Filt_Finish.Date := Now;
    dtp_Date_Filt_Finish.OnChange(Self);
  end;
end;

procedure Tfm_DRpAz.PrepReport(Sender: TObject);
const
  ProcName: string = 'PrepReport';
var
  OldCursor: TCursor;
  Report_Mode: Integer;
  Odeum_Kod: Integer;
  str_IN_FILT_DATE_START, str_IN_FILT_DATE_FINISH: string;
  s: string;
begin
  DEBUGMessEnh(1, UnitName, ProcName, '->');
  // --------------------------------------------------------------------------
  {
  // --------------------------------------------------------------------------
  // dsrc_Master - ds_Rep_Daily_Odeums
  // --------------------------------------------------------------------------
  select
    ODM.ODEUM_KOD,
    ODM.ODEUM_NAM,
    ODM.ODEUM_CINEMA,
    ODM.CINEMA_NAM,
    ODM.ODEUM_PREFIX,
    ODM.ODEUM_CAPACITY,
    ODM.ODEUM_DESC,
    ODM.CINEMA_LOGO,
    ODM.ODEUM_LOGO,
    ODM.FOO_DATE
  from
    SP_ODEUM_RF (
      :IN_FILT_ODEUM,
      :IN_FILT_DATE,
      :IN_FILT_DATE_FINISH) ODM
  // --------------------------------------------------------------------------
  // dsrc_Detail - ds_Rep_Daily_Repert
  // --------------------------------------------------------------------------
  select
    RPT.REPERT_KOD,
    RPT.REPERT_VER,
    RPT.REPERT_DATE,
    RPT.REPERT_ODEUM_KOD,
    RPT.REPERT_ODEUM_VER,
    RPT.ODEUM_DESC,
    RPT.REPERT_SEANS_KOD,
    RPT.REPERT_SEANS_VER,
    RPT.SEANS_TIME,
    RPT.SEANS_FINISH,
    RPT.REPERT_FILM_KOD,
    RPT.REPERT_FILM_VER,
    RPT.FILM_NAM,
    RPT.FILM_DESC,
    RPT.REPERT_TARIFF_KOD,
    RPT.REPERT_TARIFF_VER,
    RPT.TARIFF_DESC,
    RPT.REPERT_DESC,
    RPT.REPERT_STAMP,
    RPT.SESSION_ID,
    RPT.DBUSER_NAM,
    RPT.SESSION_HOST
  from
    SP_REPERT_RF(
      :IN_FILT_REPERT_ODEUM,
      null,
      :IN_FILT_REPERT_DATE_START,
      :IN_FILT_REPERT_DATE_FINISH,
      null,
      :IN_SESSION_ID) RPT
  // --------------------------------------------------------------------------
  // dsrc_SubDetail - ds_Rep_Daily_Moves
  // --------------------------------------------------------------------------
  ... nothing ...
  // --------------------------------------------------------------------------
  // dsrc_Master2 - ds_Rep_Daily_Abonem
  // --------------------------------------------------------------------------
  select
    AJN.ABJNL_SALE_DATE,
    AJN.ABJNL_STATE,
    AJN.ABJNL_ABONEM_KOD,
    AJN.ABJNL_ABONEM_VER,
    AJN.ABONEM_NAM,
    AJN.PRICE_VALUE,
    AJN.ABJNL_CHEQED,
    AJN.TOTAL_ABJNL_COUNT,
    AJN.TOTAL_ABJNL_SUM
  from RP_ABJNL_C (
    :IN_REPORT_MODE,
    :IN_FILT_DATE_START,
    :IN_FILT_DATE_FINISH,
    :IN_SESSION_ID) AJN
  // --------------------------------------------------------------------------
  }
  Report_Mode := cmb_Report_Mode.ItemIndex;
  DTStatusBarClick(Sender);
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    dtp_Date_Filt_Start.Enabled := false;
    dtp_Date_Filt_Finish.Enabled := false;
    dbcm_Zal.Enabled := false;
    cmb_Report_Mode.Enabled := false;
    sb_Up_Start.Enabled := false;
    sb_Down_Start.Enabled := false;
    sb_Today_Start.Enabled := false;
    sb_Up_Finish.Enabled := false;
    sb_Down_Finish.Enabled := false;
    sb_Today_Finish.Enabled := false;
    // --------------------------------------------------------------------------
    if (dsrc_Master.DataSet is TpFIBDataSet) and (dsrc_Abonem.DataSet is TpFIBDataSet) then
    begin
      with (dsrc_Master.DataSet as TpFIBDataSet) do
      begin
        DisableControls;
        try
          try
            DEBUGMessEnh(0, UnitName, ProcName, Name + '.Close');
            Close;
          except
            on E: Exception do
            begin
              DEBUGMessEnh(0, UnitName, ProcName, 'Error is [' + E.Message + ']');
              DEBUGMessEnh(0, UnitName, ProcName, Name + '.Close failed.');
            end;
          end;
          try
            // ��������� Select-sql �� �����������, ���� �����
            Prepare;
            // ------------ Setting params ------------
            if Assigned(Params.FindParam(s_IN_REPORT_MODE)) then
            begin
              ParamByName(s_IN_REPORT_MODE).AsVariant := Null;
              case Report_Mode of
                0:
                  begin
                    ParamByName(s_IN_REPORT_MODE).AsInteger := 0;
                  end;
                1:
                  begin
                    ParamByName(s_IN_REPORT_MODE).AsInteger := 1;
                  end;
              else
                // foo
              end;
              DEBUGMessEnh(0, UnitName, ProcName, s_IN_REPORT_MODE + ' = (' +
                IntToStr(Report_Mode) + ')');
            end
            else
              DEBUGMessEnh(0, UnitName, ProcName, s_IN_REPORT_MODE + ' param not found.');
            // ------------
            if Assigned(Params.FindParam(s_IN_FILT_ODEUM)) then
            begin
              ParamByName(s_IN_FILT_ODEUM).AsVariant := Null;
              case Report_Mode of
                0:
                  begin
                    Odeum_Kod := -1;
                    try
                      if dbcm_Zal.ItemIndex > -1 then
                        Odeum_Kod := Integer(dbcm_Zal.Items.Objects[dbcm_Zal.ItemIndex]);
                    except
                      Odeum_Kod := -1;
                    end;
                    ParamByName(s_IN_FILT_ODEUM).AsInteger := Odeum_Kod;
                  end;
                1:
                  begin
                    ParamByName(s_IN_FILT_ODEUM).AsInteger := Cur_Zal_Kod;
                  end;
              else
                // foo
              end;
              s := '<null>';
              if not ParamByName(s_IN_FILT_ODEUM).IsNull then
              try
                s := ParamByName(s_IN_FILT_ODEUM).AsString;
              except
                s := '<error>';
              end;
              DEBUGMessEnh(0, UnitName, ProcName, s_IN_FILT_ODEUM + ' = (' + s + ')');
            end
            else
              DEBUGMessEnh(0, UnitName, ProcName, s_IN_FILT_ODEUM + ' param not found.');
            // ------------
            cv_Repert_Date_Start := Now;
            cv_Repert_Date_Finish := Now;
            str_IN_FILT_DATE_START := '';
            str_IN_FILT_DATE_FINISH := '';
            if Assigned(Params.FindParam(s_IN_FILT_DATE)) then
              str_IN_FILT_DATE_START := s_IN_FILT_DATE;
            if Assigned(Params.FindParam(s_IN_FILT_DATE_START)) then
              str_IN_FILT_DATE_START := s_IN_FILT_DATE_START;
            if Assigned(Params.FindParam(s_IN_FILT_DATE_FINISH)) then
              str_IN_FILT_DATE_FINISH := s_IN_FILT_DATE_FINISH;
            case Report_Mode of
              0:
                begin
                  cv_Repert_Date_Start := dtp_Date_Filt_Start.Date;
                  cv_Repert_Date_Finish := dtp_Date_Filt_Finish.Date;
                end;
              1:
                begin
                  cv_Repert_Date_Start := Cur_Date;
                  cv_Repert_Date_Finish := Cur_Date;
                end;
            else
              // foo
            end;
            if Length(str_IN_FILT_DATE_START) <> 0 then
            begin
              ParamByName(str_IN_FILT_DATE_START).AsVariant := Null;
              case Report_Mode of
                0:
                  begin
                    ParamByName(str_IN_FILT_DATE_START).AsDate := dtp_Date_Filt_Start.Date;
                  end;
                1:
                  begin
                    ParamByName(str_IN_FILT_DATE_START).AsDate := Cur_Date;
                  end;
              else
                // foo
              end;
              s := '<null>';
              if not ParamByName(str_IN_FILT_DATE_START).IsNull then
              try
                s := ParamByName(str_IN_FILT_DATE_START).AsString;
              except
                s := '<error>';
              end;
              DEBUGMessEnh(0, UnitName, ProcName, str_IN_FILT_DATE_START + ' = (' + s + ')');
            end
            else
              DEBUGMessEnh(0, UnitName, ProcName, str_IN_FILT_DATE_START + ' param not found.');
            // ------------
            if Length(str_IN_FILT_DATE_FINISH) <> 0 then
            begin
              ParamByName(str_IN_FILT_DATE_FINISH).AsVariant := Null;
              case Report_Mode of
                0:
                  begin
                    ParamByName(str_IN_FILT_DATE_FINISH).AsDate := dtp_Date_Filt_Finish.Date;
                  end;
                1:
                  begin
                    ParamByName(str_IN_FILT_DATE_FINISH).AsDate := Cur_Date;
                  end;
              else
                // foo
              end;
              s := '<null>';
              if not ParamByName(str_IN_FILT_DATE_FINISH).IsNull then
              try
                s := ParamByName(str_IN_FILT_DATE_FINISH).AsString;
              except
                s := '<error>';
              end;
              DEBUGMessEnh(0, UnitName, ProcName, str_IN_FILT_DATE_FINISH + ' = (' + s + ')');
            end
            else
              DEBUGMessEnh(0, UnitName, ProcName, str_IN_FILT_DATE_FINISH + ' param not found.');
            // ------------
            if Assigned(Params.FindParam(s_IN_SESSION_ID)) then
            begin
              ParamByName(s_IN_SESSION_ID).AsInt64 := Global_Session_ID;
              DEBUGMessEnh(0, UnitName, ProcName, s_IN_SESSION_ID + ' = (' +
                IntToStr(Global_Session_ID) + ')');
            end;
            // ------------
            {
            DEBUGMessEnh(0, UnitName, ProcName, 'Transaction.Active = ' +
              BoolYesNo[Transaction.Active]);
            // ��������� Select-sql �� �����������, ���� �����
            Prepare;
            }
            DEBUGMessEnh(0, UnitName, ProcName, 'Transaction.Active = ' +
              BoolYesNo[Transaction.Active]);
            DEBUGMessEnh(0, UnitName, ProcName, 'Transaction.TRParams = ('
              + Transaction.TRParams.CommaText + ')');
            // ------------
            DEBUGMessEnh(0, UnitName, ProcName, Name + '.Open');
            Open;
            First;
            Last;
            // ------------
            First;
          except
            on E: Exception do
            begin
              DEBUGMessEnh(0, UnitName, ProcName, 'Error is [' + E.Message + ']');
              DEBUGMessEnh(0, UnitName, ProcName, Name + '.Open failed.');
            end;
          end;
          DEBUGMessEnh(0, UnitName, ProcName, Name + '.RecordCount = ' +
            IntToStr(RecordCount));
        finally
          EnableControls;
        end; // try
      end; // with
      with (dsrc_Abonem.DataSet as TpFIBDataSet) do
      begin
        DisableControls;
        try
          try
            DEBUGMessEnh(0, UnitName, ProcName, Name + '.Close');
            Close;
          except
            on E: Exception do
            begin
              DEBUGMessEnh(0, UnitName, ProcName, 'Error is [' + E.Message + ']');
              DEBUGMessEnh(0, UnitName, ProcName, Name + '.Close failed.');
            end;
          end;
          try
            // ��������� Select-sql �� �����������, ���� �����
            Prepare;
            // ------------ Setting params ------------
            if Assigned(Params.FindParam(s_IN_REPORT_MODE)) then
            begin
              ParamByName(s_IN_REPORT_MODE).AsInteger := 1;
              DEBUGMessEnh(0, UnitName, ProcName, s_IN_REPORT_MODE + ' = (' +
                IntToStr(Report_Mode) + ')');
            end;
            // ------------
            cv_Repert_Date_Start := Now;
            cv_Repert_Date_Finish := Now;
            str_IN_FILT_DATE_START := '';
            str_IN_FILT_DATE_FINISH := '';
            if Assigned(Params.FindParam(s_IN_FILT_DATE)) then
              str_IN_FILT_DATE_START := s_IN_FILT_DATE;
            if Assigned(Params.FindParam(s_IN_FILT_DATE_START)) then
              str_IN_FILT_DATE_START := s_IN_FILT_DATE_START;
            if Assigned(Params.FindParam(s_IN_FILT_DATE_FINISH)) then
              str_IN_FILT_DATE_FINISH := s_IN_FILT_DATE_FINISH;
            case Report_Mode of
              0:
                begin
                  cv_Repert_Date_Start := dtp_Date_Filt_Start.Date;
                  cv_Repert_Date_Finish := dtp_Date_Filt_Finish.Date;
                end;
              1:
                begin
                  cv_Repert_Date_Start := Cur_Date;
                  cv_Repert_Date_Finish := Cur_Date;
                end;
            else
              // foo
            end;
            if Length(str_IN_FILT_DATE_START) <> 0 then
            begin
              ParamByName(str_IN_FILT_DATE_START).AsVariant := Null;
              case Report_Mode of
                0:
                  begin
                    ParamByName(str_IN_FILT_DATE_START).AsDate := dtp_Date_Filt_Start.Date;
                  end;
                1:
                  begin
                    ParamByName(str_IN_FILT_DATE_START).AsDate := Cur_Date;
                  end;
              else
                // foo
              end;
              s := '<null>';
              if not ParamByName(str_IN_FILT_DATE_START).IsNull then
              try
                s := ParamByName(str_IN_FILT_DATE_START).AsString;
              except
                s := '<error>';
              end;
              DEBUGMessEnh(0, UnitName, ProcName, str_IN_FILT_DATE_START + ' = (' + s + ')');
            end;
            // ------------
            if Length(str_IN_FILT_DATE_FINISH) <> 0 then
            begin
              ParamByName(str_IN_FILT_DATE_FINISH).AsVariant := Null;
              case Report_Mode of
                0:
                  begin
                    ParamByName(str_IN_FILT_DATE_FINISH).AsDate := dtp_Date_Filt_Finish.Date;
                  end;
                1:
                  begin
                    ParamByName(str_IN_FILT_DATE_FINISH).AsDate := Cur_Date;
                  end;
              else
                // foo
              end;
              s := '<null>';
              if not ParamByName(str_IN_FILT_DATE_FINISH).IsNull then
              try
                s := ParamByName(str_IN_FILT_DATE_FINISH).AsString;
              except
                s := '<error>';
              end;
              DEBUGMessEnh(0, UnitName, ProcName, str_IN_FILT_DATE_FINISH + ' = (' + s + ')');
            end
            else
              DEBUGMessEnh(0, UnitName, ProcName, str_IN_FILT_DATE_FINISH + ' param not found.');
            // ------------
            if Assigned(Params.FindParam(s_IN_SESSION_ID)) then
            begin
              ParamByName(s_IN_SESSION_ID).AsInt64 := Global_Session_ID;
              DEBUGMessEnh(0, UnitName, ProcName, s_IN_SESSION_ID + ' = (' +
                IntToStr(Global_Session_ID) + ')');
            end;
            // ------------
            {
            DEBUGMessEnh(0, UnitName, ProcName, 'Transaction.Active = ' +
              BoolYesNo[Transaction.Active]);
            // ��������� Select-sql �� �����������, ���� �����
            Prepare;
            }
            DEBUGMessEnh(0, UnitName, ProcName, 'Transaction.Active = ' +
              BoolYesNo[Transaction.Active]);
            DEBUGMessEnh(0, UnitName, ProcName, 'Transaction.TRParams = ('
              + Transaction.TRParams.CommaText + ')');
            // ------------
            DEBUGMessEnh(0, UnitName, ProcName, Name + '.Open');
            Open;
            First;
            Last;
            // ------------
            First;
          except
            on E: Exception do
            begin
              DEBUGMessEnh(0, UnitName, ProcName, 'Error is [' + E.Message + ']');
              DEBUGMessEnh(0, UnitName, ProcName, Name + '.Open failed.');
            end;
          end;
          DEBUGMessEnh(0, UnitName, ProcName, Name + '.RecordCount = ' +
            IntToStr(RecordCount));
        finally
          EnableControls;
        end; // try
      end; // with
    end; // if
  finally
    // --------------------------------------------------------------------------
    case Report_Mode of
      0:
        begin
          dtp_Date_Filt_Start.Enabled := true;
          dtp_Date_Filt_Finish.Enabled := true;
          dbcm_Zal.Enabled := true;
        end;
      1:
        begin
          dtp_Date_Filt_Start.Enabled := false;
          dtp_Date_Filt_Finish.Enabled := false;
          dbcm_Zal.Enabled := false;
        end;
    else
      // foo
    end;
    cmb_Report_Mode.Enabled := true;
    sb_Up_Start.Enabled := true;
    sb_Down_Start.Enabled := true;
    sb_Today_Start.Enabled := true;
    sb_Up_Finish.Enabled := true;
    sb_Down_Finish.Enabled := true;
    sb_Today_Finish.Enabled := true;
    DTStatusBarClick(Sender);
    Screen.Cursor := OldCursor;
  end;
  // --------------------------------------------------------------------------
  DEBUGMessEnh(-1, UnitName, ProcName, '<-');
end;

procedure Tfm_DRpAz.bt_ShowReportClick(Sender: TObject);
const
  ProcName: string = 'ShowReport';
begin
  DEBUGMessEnh(1, UnitName, ProcName, '->');
  // --------------------------------------------------------------------------
  frReport_Daily.ShowReport;
  // --------------------------------------------------------------------------
  DEBUGMessEnh(-1, UnitName, ProcName, '<-');
end;

procedure Tfm_DRpAz.FormClose(Sender: TObject; var Action: TCloseAction);
const
  ProcName: string = 'FormClose';
begin
  DEBUGMessEnh(1, UnitName, ProcName, '->');
  // --------------------------------------------------------------------------
  DEBUGMessEnh(-1, UnitName, ProcName, '<-');
end;

function Tfm_DRpAz.SetDTStatus(PanelIndex: Integer; StatusText: string): Boolean;
const
  ProcName: string = 'SetDTStatus';
begin
  Result := false;
  if (PanelIndex > -1) and (DTStatusBar.Panels.Count > PanelIndex) then
  begin
    if Length(StatusText) > 0 then
      DTStatusBar.Panels[PanelIndex].Text := StatusText
    else
      DTStatusBar.Panels[PanelIndex].Text := '---';
    Result := true;
  end;
end;

procedure Tfm_DRpAz.DTStatusBarClick(Sender: TObject);
begin
  // --------------------------------------------------------------------------
  if Assigned(dbgr_Data_Master.DataSource) and
    Assigned(dbgr_Data_Master.DataSource.DataSet) then
  begin
    if dbgr_Data_Master.DataSource.DataSet.Active then
    begin
      SetDTStatus(1, 'Active');
    end
    else
    begin
      SetDTStatus(1, 'Not active');
    end;
    SetDTStatus(3, IntToStr(dbgr_Data_Master.DataSource.DataSet.RecordCount));
  end
  else
  begin
    SetDTStatus(1, 'Unknown');
    SetDTStatus(3, '');
  end;
  // --------------------------------------------------------------------------
  if Assigned(dbgr_Data_Detail.DataSource) and
    Assigned(dbgr_Data_Detail.DataSource.DataSet) then
  begin
    if dbgr_Data_Detail.DataSource.DataSet.Active then
    begin
      SetDTStatus(5, 'Active');
    end
    else
    begin
      SetDTStatus(5, 'Not active');
    end;
    SetDTStatus(7, IntToStr(dbgr_Data_Detail.DataSource.DataSet.RecordCount));
  end
  else
  begin
    SetDTStatus(5, 'Unknown');
    SetDTStatus(7, '');
  end;
  // --------------------------------------------------------------------------
  if Assigned(dbgr_Data_SubDetail.DataSource) and
    Assigned(dbgr_Data_SubDetail.DataSource.DataSet) then
  begin
    if dbgr_Data_SubDetail.DataSource.DataSet.Active then
    begin
      SetDTStatus(9, 'Active');
    end
    else
    begin
      SetDTStatus(9, 'Not active');
    end;
    SetDTStatus(11, IntToStr(dbgr_Data_SubDetail.DataSource.DataSet.RecordCount));
  end
  else
  begin
    SetDTStatus(9, 'Unknown');
    SetDTStatus(11, '');
  end;
  // --------------------------------------------------------------------------
end;

procedure Tfm_DRpAz.Activate_After_Once(Sender: TObject);
const
  ProcName: string = 'Activate_After_Once';
var
  i, indx: Integer;
begin
  // --------------------------------------------------------------------------
  if (dsrc_Master.DataSet is TpFIBDataSet) then
    with (dsrc_Master.DataSet as TpFIBDataSet) do
    begin
      DisableControls;
      try
        try
          DEBUGMessEnh(0, UnitName, ProcName, Name + '.Close');
          Close;
        except
          on E: Exception do
          begin
            DEBUGMessEnh(0, UnitName, ProcName, 'Error is [' + E.Message + ']');
            DEBUGMessEnh(0, UnitName, ProcName, Name + '.Close failed.');
          end;
        end;
        try
          // ��������� Select-sql �� �����������, ���� �����
          DEBUGMessEnh(0, UnitName, ProcName, Name + '.Prepare');
          Prepare;
        except
          on E: Exception do
          begin
            DEBUGMessEnh(0, UnitName, ProcName, 'Error is [' + E.Message + ']');
            DEBUGMessEnh(0, UnitName, ProcName, Name + '.Prepare failed.');
          end;
        end;
      finally
        EnableControls;
      end; // try
    end; // if
  // --------------------------------------------------------------------------
  if (dsrc_Detail.DataSet is TpFIBDataSet) then
    with (dsrc_Detail.DataSet as TpFIBDataSet) do
    begin
      DisableControls;
      try
        try
          DEBUGMessEnh(0, UnitName, ProcName, Name + '.Close');
          Close;
        except
          on E: Exception do
          begin
            DEBUGMessEnh(0, UnitName, ProcName, 'Error is [' + E.Message + ']');
            DEBUGMessEnh(0, UnitName, ProcName, Name + '.Close failed.');
          end;
        end;
        try
          // ��������� Select-sql �� �����������, ���� �����
          DEBUGMessEnh(0, UnitName, ProcName, Name + '.Prepare');
          Prepare;
        except
          on E: Exception do
          begin
            DEBUGMessEnh(0, UnitName, ProcName, 'Error is [' + E.Message + ']');
            DEBUGMessEnh(0, UnitName, ProcName, Name + '.Prepare failed.');
          end;
        end;
      finally
        EnableControls;
      end; // try
    end; // if
  // --------------------------------------------------------------------------
  if (dsrc_Detail_2.DataSet is TpFIBDataSet) then
    with (dsrc_Detail_2.DataSet as TpFIBDataSet) do
    begin
      DisableControls;
      try
        try
          DEBUGMessEnh(0, UnitName, ProcName, Name + '.Close');
          Close;
        except
          on E: Exception do
          begin
            DEBUGMessEnh(0, UnitName, ProcName, 'Error is [' + E.Message + ']');
            DEBUGMessEnh(0, UnitName, ProcName, Name + '.Close failed.');
          end;
        end;
        try
          // ��������� Select-sql �� �����������, ���� �����
          DEBUGMessEnh(0, UnitName, ProcName, Name + '.Prepare');
          Prepare;
          DEBUGMessEnh(0, UnitName, ProcName, Name + '.SelectSQL.Text = ['
            + SelectSQL.Text + ']');
        except
          on E: Exception do
          begin
            DEBUGMessEnh(0, UnitName, ProcName, 'Error is [' + E.Message + ']');
            DEBUGMessEnh(0, UnitName, ProcName, Name + '.Prepare failed.');
          end;
        end;
      finally
        EnableControls;
      end; // try
    end; // if
  // --------------------------------------------------------------------------
  if (dsrc_SubDetail.DataSet is TpFIBDataSet) then
    with (dsrc_SubDetail.DataSet as TpFIBDataSet) do
    begin
      DisableControls;
      try
        try
          DEBUGMessEnh(0, UnitName, ProcName, Name + '.Close');
          Close;
        except
          on E: Exception do
          begin
            DEBUGMessEnh(0, UnitName, ProcName, 'Error is [' + E.Message + ']');
            DEBUGMessEnh(0, UnitName, ProcName, Name + '.Close failed.');
          end;
        end;
        try
          // ��������� Select-sql �� �����������, ���� �����
          DEBUGMessEnh(0, UnitName, ProcName, Name + '.Prepare');
          Prepare;
          // ������ ��������
          ParamByName(s_IN_REPORT_MODE).AsInteger := 0;
        except
          on E: Exception do
          begin
            DEBUGMessEnh(0, UnitName, ProcName, 'Error is [' + E.Message + ']');
            DEBUGMessEnh(0, UnitName, ProcName, Name + '.Prepare failed.');
          end;
        end;
      finally
        EnableControls;
      end; // try
    end; // if
  // --------------------------------------------------------------------------
  if (dsrc_Abonem.DataSet is TpFIBDataSet) then
    with (dsrc_Abonem.DataSet as TpFIBDataSet) do
    begin
      DisableControls;
      try
        try
          DEBUGMessEnh(0, UnitName, ProcName, Name + '.Close');
          Close;
        except
          on E: Exception do
          begin
            DEBUGMessEnh(0, UnitName, ProcName, 'Error is [' + E.Message + ']');
            DEBUGMessEnh(0, UnitName, ProcName, Name + '.Close failed.');
          end;
        end;
        try
          // ��������� Select-sql �� �����������, ���� �����
          DEBUGMessEnh(0, UnitName, ProcName, Name + '.Prepare');
          Prepare;
        except
          on E: Exception do
          begin
            DEBUGMessEnh(0, UnitName, ProcName, 'Error is [' + E.Message + ']');
            DEBUGMessEnh(0, UnitName, ProcName, Name + '.Prepare failed.');
          end;
        end;
      finally
        EnableControls;
      end; // try
    end; // if
  // --------------------------------------------------------------------------
  dtp_Date_Filt_Start.Date := pm_Repert_Date;
  dtp_Date_Filt_Finish.Date := pm_Repert_Date;
  with dbcm_Zal do
    if Items.Count > 0 then
    begin
      indx := 0;
      if ItemIndex > -1 then
        indx := ItemIndex;
      if pm_Repert_Odeum > 0 then
      try
        for i := 0 to Items.Count - 1 do
        begin
          if pm_Repert_Odeum = Integer(Items.Objects[i]) then
            indx := i;
        end;
      except
        indx := 0;
      end;
      ItemIndex := indx;
      if Assigned(OnChange) then
        OnChange(Self);
      DEBUGMessEnh(0, UnitName, ProcName, Name + '.OnChange done.');
    end;
  // --------------------------------------------------------------------------
end;

procedure Tfm_DRpAz.DTRefreshUpdate(Sender: TObject);
begin
  DTStatusBarClick(Sender);
end;

procedure Tfm_DRpAz.frReport_DailyGetValue(const ParName: string;
  var ParValue: Variant);
var
  s: string;
  p: Integer;
begin
  if (UpperCase(ParName) = 'REPORT_DATE') then
  begin
    ParValue := FormatDateTime('ddd, dd mmmm, yyyy �.', cv_Repert_Date_Start);
  end
  else if (UpperCase(ParName) = 'REPORT_DATE_START') then
  begin
    ParValue := FormatDateTime('ddd, dd mmmm, yyyy �.', cv_Repert_Date_Start);
  end
  else if (UpperCase(ParName) = 'REPORT_DATE_FINISH') then
  begin
    ParValue := FormatDateTime('ddd, dd mmmm, yyyy �.', cv_Repert_Date_Finish);
  end
  else if (UpperCase(ParName) = 'REPORT_CINEMA_NAM') then
  begin
    s := dbcm_Zal.Text;
    p := Pos(' - ', s);
    if (p > 0) and (Length(s) > 0) then
      ParValue := Copy(s, 1, p - 1)
    else
      ParValue := s;
  end
  else if (UpperCase(ParName) = 'DBUSER_NAM') then
  begin
    ParValue := Global_User_Nam;
  end
  else if (LowerCase(ParName) = 'void') then
  begin
    ParValue := 'null';
  end;
end;

procedure Tfm_DRpAz.frReport_DailyUserFunction(const Name: string; p1, p2,
  p3: Variant; var Val: string);
var
  ch: Boolean;
begin
  // uf_iif( [FIELD1] = 1, [FIELD2], 0)
  if (UpperCase(Name) = 'UF_IIF') then
  begin
    try
      // ��������� - ��������� !!!
      ch := frParser.Calc(p1);
      // ��������� - ��� ��������������� ������, ������� ��������� � �������
      if ch then
        Val := '''' + IntToStr(p2) + ''''
      else
        Val := '''' + IntToStr(p3) + '''';
    except
      Val := '-1';
    end;
  end
end;

end.

