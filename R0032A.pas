unit R0032A;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, IBX.IBCustomDataSet,
  IBX.IBQuery, QRExport, Midas, MidasLib, acPNG, Vcl.Imaging.jpeg, grimgctrl;

type
  TR_0032A = class(TQuickRep)
    QRBand1: TQRBand;
    QRLbl_Titulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand2: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText9: TQRDBText;
    QRBand3: TQRBand;
    QRSysData2: TQRSysData;
    IBQ_Pesquisa: TIBQuery;
    QRDBText6: TQRDBText;
    QRDBT_Estoque: TQRDBText;
    DS_Pesquisa: TDataSource;
    QRTextFilter1: TQRTextFilter;
    QRLabel17: TQRLabel;
    QRLbl_EstT: TQRLabel;
    QRLbl_PraT: TQRLabel;
    QRLbl_Total: TQRLabel;
    QRLabel28: TQRLabel;
    QRBand4: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand5: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel7: TQRLabel;
    QRHRule1: TQRHRule;
    procedure IBQ_PesquisaAfterOpen(DataSet: TDataSet);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    eest_tot, epra_tot : Extended;

  public

  end;

var
  R_0032A: TR_0032A;

implementation

uses Arquivos;

{$R *.DFM}

procedure TR_0032A.IBQ_PesquisaAfterOpen(DataSet: TDataSet);
begin
  (IBQ_Pesquisa.fieldbyname('CODIGO')   As TIntegerfield).displayformat := '000000';
  (IBQ_Pesquisa.fieldbyname('PRECO_CUSTO') As TBCDfield).displayformat     := '#,###,###,##0.00';
end;

procedure TR_0032A.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var codEmpresa : integer;
begin
   eest_tot := 0;
   epra_tot := 0;
end;

procedure TR_0032A.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   eest_tot := eest_tot +  IBQ_Pesquisa.FieldByName('QTD_ATUAL').AsFloat;
   epra_tot := epra_tot + (IBQ_Pesquisa.FieldByName('QTD_ATUAL').AsFloat * IBQ_Pesquisa.FieldByName('PRECO_CUSTO').AsFloat);

   QRLbl_Total.Caption := FloatToStrF(IBQ_Pesquisa.FieldByName('QTD_ATUAL').AsFloat * IBQ_Pesquisa.FieldByName('PRECO_CUSTO').AsFloat,ffNumber,13,2);
end;

procedure TR_0032A.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   QRLbl_EstT.Caption := FloatToStrF(eest_tot,ffNumber,13,0);
   QRLbl_PraT.Caption := FloatToStrF(epra_tot,ffNumber,13,2);
end;

end.
