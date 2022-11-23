unit R0022C;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, IBCustomDataSet,
  IBQuery;

type
  TR_0022C = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel_parametro: TQRLabel;
    QRSysData2: TQRSysData;
    IBQ_Pesquisa: TIBQuery;
    DS_Pesquisa: TDataSource;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRLbl_Saldo_Cli: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRBand3: TQRBand;
    QRLabel10: TQRLabel;
    QRLbl_Saldo_tot: TQRLabel;
    QRLbl_Vencer_cli: TQRLabel;
    QRLbl_Vencido_cli: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLbl_Vencer_tot: TQRLabel;
    QRLbl_Vencido_tot: TQRLabel;
    QRLbl_Fone1: TQRLabel;
    QRLabel6: TQRLabel;
    QRLbl_Fone2: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure IBQ_PesquisaAfterOpen(DataSet: TDataSet);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
     evencido_cli, evencido_tot, evencer_cli, evencer_tot, esaldo_cli, esaldo_tot : Extended;
  public

  end;

var
  R_0022C: TR_0022C;

implementation

uses Arquivos, Sg0022A;

{$R *.DFM}

procedure TR_0022C.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   evencido_cli := 0;
   evencido_tot := 0;
   evencer_cli  := 0;
   evencer_tot  := 0;
   esaldo_cli   := 0;
   esaldo_tot   := 0;
end;

procedure TR_0022C.IBQ_PesquisaAfterOpen(DataSet: TDataSet);
begin
  (IBQ_Pesquisa.fieldbyname('COD_SOCIO') As TIntegerfield).displayformat := '000000';
end;

procedure TR_0022C.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   evencido_cli := 0;
   evencer_cli  := 0;
   esaldo_cli   := 0;

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


    // Pesquisa Débitos do Cliente (Atual)
    with Dm.IBQ_PesqAux, Sql do
      begin
         Close;
         Clear;
         Add('select sum(vlr_parc) saldo from receber ');
         Add('where (cod_socio = :cli) and (dt_vencto < :data) ');
         if Sg_0022A.RG_Tipo.ItemIndex    = 1 then Add('and (dt_pagto is null) ');
         if Sg_0022A.RG_Periodo.ItemIndex = 0 then Add('and (dt_emissao between :dt1 and :dt2) ');
         if Sg_0022A.RG_Periodo.ItemIndex = 1 then Add('and (dt_vencto  between :dt1 and :dt2) ');

         ParamByName('CLI').AsInteger   := IBQ_Pesquisa.FieldByName('COD_SOCIO').AsInteger;
         ParamByName('DT1').AsDateTime  := StrToDate(Sg_0022A.MEdit_Data1.Text);
         ParamByName('DT2').AsDateTime  := StrToDate(Sg_0022A.MEdit_Data2.Text);
         ParamByName('DATA').AsDateTime := Date;
         Open;
      end;
    evencido_cli := Dm.IBQ_PesqAux.FieldByName('SALDO').AsFloat;

    with Dm.IBQ_PesqAux, Sql do
      begin
         Close;
         Clear;
         Add('select sum(vlr_parc) saldo from receber ');
         Add('where (cod_socio = :cli) and (dt_vencto >= :data) ');
         if Sg_0022A.RG_Tipo.ItemIndex    = 1 then Add('and (dt_pagto is null) ');
         if Sg_0022A.RG_Periodo.ItemIndex = 0 then Add('and (dt_emissao between :dt1 and :dt2) ');
         if Sg_0022A.RG_Periodo.ItemIndex = 1 then Add('and (dt_vencto  between :dt1 and :dt2) ');

         ParamByName('CLI').AsInteger   := IBQ_Pesquisa.FieldByName('COD_SOCIO').AsInteger;
         ParamByName('DT1').AsDateTime  := StrToDate(Sg_0022A.MEdit_Data1.Text);
         ParamByName('DT2').AsDateTime  := StrToDate(Sg_0022A.MEdit_Data2.Text);
         ParamByName('DATA').AsDateTime := Date;
         Open;
      end;
    evencer_cli := Dm.IBQ_PesqAux.FieldByName('SALDO').AsFloat;

    with Dm.IBQ_PesqAux, Sql do
      begin
         Close;
         Clear;
         Add('select sum(vlr_parc) saldo from receber ');
         Add('where (cod_socio = :cli) ');
         if Sg_0022A.RG_Tipo.ItemIndex    = 1 then Add('and (dt_pagto is null) ');
         if Sg_0022A.RG_Periodo.ItemIndex = 0 then Add('and (dt_emissao between :dt1 and :dt2) ');
         if Sg_0022A.RG_Periodo.ItemIndex = 1 then Add('and (dt_vencto  between :dt1 and :dt2) ');
         if Sg_0022A.RG_Filtrar.ItemIndex = 1 then Add('and (dt_vencto >= :data) ');
         if Sg_0022A.RG_Filtrar.ItemIndex = 2 then Add('and (dt_vencto <  :data) ');

         ParamByName('CLI').AsInteger  := IBQ_Pesquisa.FieldByName('COD_SOCIO').AsInteger;
         ParamByName('DT1').AsDateTime := StrToDate(Sg_0022A.MEdit_Data1.Text);
         ParamByName('DT2').AsDateTime := StrToDate(Sg_0022A.MEdit_Data2.Text);
         if Sg_0022A.RG_Filtrar.ItemIndex > 0 then ParamByName('DATA').AsDateTime := Date;
         Open;
      end;
    esaldo_cli := Dm.IBQ_PesqAux.FieldByName('SALDO').AsFloat;


   // Mostra Saldo do Cliente
   evencido_tot := evencido_tot + evencido_cli;
   evencer_tot  := evencer_tot  + evencer_cli;
   esaldo_tot   := esaldo_tot   + esaldo_cli;

   QRLbl_Vencido_Cli.Caption := FloatToStrF(0,ffNumber,13,2);
   QRLbl_Vencer_Cli.Caption  := FloatToStrF(0,ffNumber,13,2);
   if Sg_0022A.RG_Filtrar.ItemIndex <> 1 then QRLbl_Vencido_Cli.Caption := FloatToStrF(evencido_cli,ffNumber,13,2);
   if Sg_0022A.RG_Filtrar.ItemIndex <> 2 then QRLbl_Vencer_Cli.Caption  := FloatToStrF(evencer_cli ,ffNumber,13,2);
   QRLbl_Saldo_Cli.Caption   := FloatToStrF(esaldo_cli  ,ffNumber,13,2);
end;

procedure TR_0022C.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   QRLbl_Vencido_Tot.Caption := FloatToStrF(0,ffNumber,13,2);
   QRLbl_Vencer_Tot.Caption  := FloatToStrF(0,ffNumber,13,2);

   if Sg_0022A.RG_Filtrar.ItemIndex <> 1 then QRLbl_Vencido_Tot.Caption := FloatToStrF(evencido_tot,ffNumber,13,2);
   if Sg_0022A.RG_Filtrar.ItemIndex <> 2 then QRLbl_Vencer_Tot.Caption  := FloatToStrF(evencer_tot ,ffNumber,13,2);
   QRLbl_Saldo_Tot.Caption   := FloatToStrF(esaldo_tot  ,ffNumber,13,2);
end;

end.
