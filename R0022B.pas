unit R0022B;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, IBCustomDataSet,
  IBQuery;

type
  TR_0022B = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel_parametro: TQRLabel;
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    QRBand4: TQRBand;
    QRSysData2: TQRSysData;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLbl_recebido_cli: TQRLabel;
    QRLbl_recebido: TQRLabel;
    IBQ_Pesquisa: TIBQuery;
    DS_Pesquisa: TDataSource;
    QRLabel13: TQRLabel;
    QRLbl_acres_cli: TQRLabel;
    QRLbl_desc_cli: TQRLabel;
    QRLabel3: TQRLabel;
    QRLbl_acrescimo: TQRLabel;
    QRLbl_desconto: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel7: TQRLabel;
    QRLbl_Fone1: TQRLabel;
    QRLbl_Fone2: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
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
     etot_acrescimo, etot_desconto, etot_recebido,
     eacres_cli, edesc_cli, erecebido_cli : Extended;
  public

  end;

var
  R_0022B: TR_0022B;

implementation

uses Arquivos;

{$R *.DFM}

procedure TR_0022B.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   // Inicializa Variáveis
   etot_acrescimo := 0;
   etot_desconto  := 0;
   etot_recebido  := 0;
end;

procedure TR_0022B.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   // Inicializa Variáveis
   eacres_cli     := 0;
   edesc_cli      := 0;
   erecebido_cli  := 0;

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

procedure TR_0022B.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   // Soma Totais do Cliente
   eacres_cli     := eacres_cli     + IBQ_Pesquisa.FieldByName('VLR_ACRES').AsFloat;
   edesc_cli      := edesc_cli      + IBQ_Pesquisa.FieldByName('VLR_DESC').AsFloat;
   erecebido_cli  := erecebido_cli  + IBQ_Pesquisa.FieldByName('VLR_PAGTO').AsFloat;
end;

procedure TR_0022B.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   // Mostra Totais do Clinte
   QRLbl_acres_cli.Caption    := FloatToStrF(eacres_cli    ,ffNumber,15,2);
   QRLbl_desc_cli.Caption     := FloatToStrF(edesc_cli     ,ffNumber,15,2);
   QRLbl_recebido_cli.Caption := FloatToStrF(erecebido_cli ,ffNumber,15,2);

   // Soma Totais Gerais
   etot_acrescimo := etot_acrescimo + eacres_cli;
   etot_desconto  := etot_desconto  + edesc_cli;
   etot_recebido  := etot_recebido  + erecebido_cli;
end;

procedure TR_0022B.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   // Mostra Totais Gerais
   QRLbl_acrescimo.Caption := FloatToStrF(etot_acrescimo,ffNumber,15,2);
   QRLbl_desconto.Caption  := FloatToStrF(etot_desconto ,ffNumber,15,2);
   QRLbl_recebido.Caption  := FloatToStrF(etot_recebido ,ffNumber,15,2);
end;

procedure TR_0022B.IBQ_PesquisaAfterOpen(DataSet: TDataSet);
begin
   IBQ_Pesquisa.fieldbyname('DT_PAGTO').EditMask                         := '99/99/9999;1';
  (IBQ_Pesquisa.FieldByName('COD_SOCIO') As TNumericField).DisplayFormat := '000000';
  (IBQ_Pesquisa.FieldByName('VLR_ACRES') As TNumericField).displayformat := '###,###,##0.00';
  (IBQ_Pesquisa.FieldByName('VLR_DESC')  As TNumericField).displayformat := '###,###,##0.00';
  (IBQ_Pesquisa.FieldByName('VLR_PAGTO') As TNumericField).displayformat := '###,###,##0.00';
end;

end.
