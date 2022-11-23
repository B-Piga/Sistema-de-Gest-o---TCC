unit R0022A;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, IBCustomDataSet,
  IBQuery;

type
  TR_0022A = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    QRBand4: TQRBand;
    QRSysData2: TQRSysData;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRLbl_recebido_cli: TQRLabel;
    QRLbl_recebido: TQRLabel;
    IBQ_Pesquisa: TIBQuery;
    DS_Pesquisa: TDataSource;
    QRLabel13: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLbl_valor_cli: TQRLabel;
    QRLbl_acres_cli: TQRLabel;
    QRLbl_desc_cli: TQRLabel;
    QRLabel3: TQRLabel;
    QRLbl_valorparc: TQRLabel;
    QRLbl_acrescimo: TQRLabel;
    QRLbl_desconto: TQRLabel;
    QRLabel_parametro: TQRLabel;
    QRLabel11: TQRLabel;
    QRLbl_Fone1: TQRLabel;
    QRLbl_Fone2: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure IBQ_PesquisaAfterOpen(DataSet: TDataSet);
  private
     etot_parcela, etot_acrescimo, etot_desconto, etot_recebido, etot_receber, 
     eparc_cli, eacres_cli, edesc_cli, erecebido_cli, esaldo_cli : Extended;
  public

  end;

var
  R_0022A: TR_0022A;

implementation

uses Arquivos;

{$R *.DFM}

procedure TR_0022A.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   // Inicializa Variáveis
   etot_parcela   := 0;
   etot_acrescimo := 0;
   etot_desconto  := 0;
   etot_recebido  := 0;
   etot_receber   := 0;
end;

procedure TR_0022A.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   // Inicializa Variáveis
   eparc_cli     := 0;
   eacres_cli    := 0;
   edesc_cli     := 0;
   erecebido_cli := 0;
   esaldo_cli    := 0;

   // Mostra Telefone
   QRLbl_Fone1.Caption := '';
   QRLbl_Fone2.Caption := '';
   if (IBQ_Pesquisa.FieldByName('FONE').AsString <> '') and (IBQ_Pesquisa.FieldByName('FONE').AsString <> '(  )     -') then
      QRLbl_Fone1.Caption := IBQ_Pesquisa.FieldByName('FONE').AsString;

   if (IBQ_Pesquisa.FieldByName('CELULAR').AsString <> '') and (IBQ_Pesquisa.FieldByName('CELULAR').AsString <> '(  )     -') then
      if QRLbl_Fone1.Caption = '' then
         QRLbl_Fone1.Caption := IBQ_Pesquisa.FieldByName('CELULAR').AsString
      else
         QRLbl_Fone2.Caption := IBQ_Pesquisa.FieldByName('CELULAR').AsString;
end;

procedure TR_0022A.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   // Soma Totais do Cliente
   eacres_cli    := eacres_cli    + IBQ_Pesquisa.FieldByName('VLR_ACRES').AsFloat;
   edesc_cli     := edesc_cli     + IBQ_Pesquisa.FieldByName('VLR_DESC').AsFloat;
   eparc_cli     := eparc_cli     + IBQ_Pesquisa.FieldByName('VLR_PARC').AsFloat;
   esaldo_cli    := esaldo_cli    + IBQ_Pesquisa.FieldByName('VLR_PAGTO').AsFloat;
   erecebido_cli := erecebido_cli + IBQ_Pesquisa.FieldByName('VLR_PAGTO').AsFloat;
end;

procedure TR_0022A.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   // Soma Totais Gerais
   etot_parcela   := etot_parcela   + eparc_cli;
   etot_acrescimo := etot_acrescimo + eacres_cli;
   etot_desconto  := etot_desconto  + edesc_cli;
   etot_recebido  := etot_recebido  + erecebido_cli;
   etot_receber   := etot_receber   + esaldo_cli;

   // Mostra Totais do Clinte
   QRLbl_valor_cli.Caption    := FloatToStrF(eparc_cli    ,ffNumber,15,2);
   QRLbl_acres_cli.Caption    := FloatToStrF(eacres_cli   ,ffNumber,15,2);
   QRLbl_desc_cli.Caption     := FloatToStrF(edesc_cli    ,ffNumber,15,2);
   QRLbl_recebido_cli.Caption := FloatToStrF(erecebido_cli,ffNumber,15,2);
end;

procedure TR_0022A.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   // Mostra Totais Gerais
   QRLbl_valorparc.Caption := FloatToStrF(etot_parcela  ,ffNumber,15,2);
   QRLbl_acrescimo.Caption := FloatToStrF(etot_acrescimo,ffNumber,15,2);
   QRLbl_desconto.Caption  := FloatToStrF(etot_desconto ,ffNumber,15,2);
   QRLbl_recebido.Caption  := FloatToStrF(etot_recebido ,ffNumber,15,2);
end;

procedure TR_0022A.IBQ_PesquisaAfterOpen(DataSet: TDataSet);
begin
   IBQ_Pesquisa.fieldbyname('DT_EMISSAO').EditMask                       := '99/99/9999;1';
   IBQ_Pesquisa.fieldbyname('DT_VENCTO').EditMask                        := '99/99/9999;1';
   IBQ_Pesquisa.fieldbyname('DT_PAGTO').EditMask                         := '99/99/9999;1';
  (IBQ_Pesquisa.FieldByName('COD_SOCIO') As TNumericField).DisplayFormat := '000000';
  (IBQ_Pesquisa.FieldByName('VLR_PARC')  As TNumericField).displayformat := '###,###,##0.00';
  (IBQ_Pesquisa.FieldByName('VLR_ACRES') As TNumericField).displayformat := '###,###,##0.00';
  (IBQ_Pesquisa.FieldByName('VLR_DESC')  As TNumericField).displayformat := '###,###,##0.00';
  (IBQ_Pesquisa.FieldByName('VLR_PAGTO') As TNumericField).displayformat := '###,###,##0.00';
end;

end.
