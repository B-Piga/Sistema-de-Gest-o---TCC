unit Sg0013;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, DBCtrls,
  ComCtrls, DB, RDprint, sSpeedButton, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TSg_0013 = class(TForm)
    Panel1: TPanel;
    Pan_Botao: TPanel;
    bbtn_fechar: TBitBtn;
    bbtn_imprimir: TBitBtn;
    bbtn_sair: TBitBtn;
    bbtn_pesquisar: TBitBtn;
    Bevel1: TBevel;
    Pan_Dados: TPanel;
    Label1: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    Pan_Valores: TPanel;
    Bevel2: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Pan_Saldo: TPanel;
    Bevel3: TBevel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    GB_Entrada: TGroupBox;
    GB_Saida: TGroupBox;
    Label11: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Lbl_Codigo: TLabel;
    RDprint1: TRDprint;
    Bevel5: TBevel;
    bbtn_atualizar: TBitBtn;
    DBEdit_DTAbertura: TDBEdit;
    DBEdit_HrAbertura: TDBEdit;
    DBEdit_DTFechamento: TDBEdit;
    DBEdit_HRFechamento: TDBEdit;
    DBEdit_func: TDBEdit;
    DBEdit_codfunc: TDBEdit;
    SB_Func: TsSpeedButton;
    DBEdit_vendas: TDBEdit;
    DBEdit_Oentrada: TDBEdit;
    DBEdit_Receb: TDBEdit;
    DBEdit_compras: TDBEdit;
    DBEdit_oSaidas: TDBEdit;
    DBEdit_pagamentos: TDBEdit;
    DBEdit_SaldoI: TDBEdit;
    DBEdit_SaldoF: TDBEdit;
    DBEdit_SaldoC: TDBEdit;
    DBEdit_Diferen: TDBEdit;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    DBEdit_Doces: TDBEdit;
    IBQ_PesqDoce: TIBQuery;
    procedure Cabecalho;
    procedure Ver_Linha;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtn_sairClick(Sender: TObject);
    procedure bbtn_pesquisarClick(Sender: TObject);
    procedure calcula;
    procedure FormActivate(Sender: TObject);
    procedure bbtn_fecharClick(Sender: TObject);
    procedure bbtn_imprimirClick(Sender: TObject);
    procedure bbtn_atualizarClick(Sender: TObject);
  private
    icod_caixa, ilinha : Integer;
    spag, straco1, straco2, sdata_cx, scod_func, snome_func : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Sg_0013: TSg_0013;

implementation

uses Arquivos, Sg0000, Sg03, Sg12, Sg06, Sg04, SgSenAx; //Sgf0002p, Sgf0003p,
  //SGF0012P,

{$R *.dfm}

procedure TSg_0013.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssAlt]) and (Key = VK_F4) then Key := VK_Clear;
  if key = vk_return   then Perform(wm_NextDlgCtl,0,0);
  if key = vk_escape   then Perform(wm_NextDlgCtl,1,0);
end;

procedure TSg_0013.bbtn_sairClick(Sender: TObject);
begin
   // Fecha
   Close;
end;

procedure TSg_0013.bbtn_pesquisarClick(Sender: TObject);
var sgaveta : String;
   // Mostra Tela de Pesquisa de Caixas
begin
   Dlg_Caixa.RG_Visualizar.ItemIndex := 0; // Mostra todos os Caixa
   if Dlg_Caixa.ShowModal = mrOk then
     begin
        if Dlg_Caixa.SQL_Pesquisa.RecordCount > 0 then
          begin
             icod_caixa := Dlg_Caixa.SQL_Pesquisa.FieldByName('CODIGO').AsInteger;
             // Verifica se o Caixa está Aberto
             sgaveta := FloatToStrF(Dlg_Caixa.SQL_Pesquisa.FieldByName('VLR_GAVETA').AsFloat,ffFixed,13,2);
             if Dlg_Caixa.SQL_Pesquisa.FieldByName('DT_FECHAMENTO').AsString = '' then
               begin
                  // Dinheiro da Gaveta
                  if InputQuery('Saldo da Gaveta','Digite o Valor da Gaveta: ',sgaveta) = True then
                    begin
                       // Atualiza o Valor em Dinheiro
                       with Dm.IBQ_Pesquisa, Sql do
                         begin
                            Close;
                            Clear;
                            Add('update caixa set vlr_gaveta = :gaveta where (codigo = :codigo) ');
                            ParamByName('GAVETA').AsFloat   := StrToFloat(sgaveta);
                            ParamByName('CODIGO').AsInteger := Dlg_Caixa.SQL_Pesquisa.FieldByName('CODIGO').AsInteger;
                            Open;
                         end;
                    end;
               end;
             // Calcula Valores
             Calcula;
          end;
     end;

   bbtn_pesquisar.SetFocus;
end;

procedure TSg_0013.Calcula;
begin

   with Dm.IBQ_Pesquisa,SQL do
     begin
        close;
        clear;
        Add('select a.*, b.nome from caixa a, funcionario b ');
        Add('where (a.cod_func = b.codigo) and (a.codigo = :cod_caixa) ');
        ParamByName('cod_caixa').AsInteger := icod_caixa;
        Open;
     end;

   Lbl_codigo.Caption  := FormatFloat('000000',icod_caixa);
   DBEdit_DTAbertura.Text       := Dm.IBQ_Pesquisa.FieldByName('DT_ABERTURA').AsString;
   DBEdit_HRAbertura.Text       := Dm.IBQ_Pesquisa.FieldByName('HR_ABERTURA').AsString;
   DBEdit_DTFechamento.Text     := Dm.IBQ_Pesquisa.FieldByName('DT_FECHAMENTO').AsString;
   DBEdit_HRFechamento.Text     := Dm.IBQ_Pesquisa.FieldByName('HR_FECHAMENTO').AsString;
   DBEdit_CodFunc.Text          := FormatFloat('000000',Dm.IBQ_Pesquisa.FieldByName('COD_FUNC').AsInteger);
   DBEdit_Func.Text             := Dm.IBQ_Pesquisa.FieldByName('NOME').AsString;

   DBEdit_SaldoI.Text           := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('SALDO_INICIO').AsFloat ,ffFixed,13,2);
   DBEdit_SaldoF.Text           := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('SALDO_FIM').AsFloat    ,ffFixed,13,2);
   DBEdit_SaldoC.Text           := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('VLR_GAVETA').AsFloat   ,ffFixed,13,2);
   DBEdit_Diferen.Text          := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('VLR_DIFERENCA').AsFloat,ffFixed,13,2);

   // Verifica se Caixa está Fechado
   if Dm.IBQ_Pesquisa.FieldByName('DT_FECHAMENTO').AsString <> '' then
     begin
        bbtn_fechar.Caption     := '&Reabrir      ';
        DBEdit_Vendas.Text      := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('VENDAS').AsFloat         ,ffFixed,15,2);
        DBEdit_Doces.Text       := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('VENDAS_DOCE').AsFloat         ,ffFixed,13,2);
        DBEdit_oentrada.Text    := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('OUTRAS_ENTRADAS').AsFloat,ffFixed,15,2);
        DBEdit_receb.Text       := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('RECEBIMENTOS').AsFloat   ,ffFixed,15,2);

        DBEdit_compras.Text     := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('COMPRAS').AsFloat        ,ffFixed,15,2);
        DBEdit_osaidas.Text     := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('OUTRAS_SAIDAS').AsFloat  ,ffFixed,15,2);
        DBEdit_pagamentos.Text  := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('PAGAMENTOS').AsFloat     ,ffFixed,15,2);
     end
   else
     begin
        bbtn_fechar.Caption  := '&Fechar     ';

         /////////////////////////////////
        // Vendas
        with Dm.IBQ_PesqAux, Sql do
          begin
             Close;
             Clear;
             Add('select sum(vlr_total) resultado from movto ');
             Add('where (cod_caixa = :cod_caixa) ');
             Add('and (flg_codmov = 1) '); // Venda
             Add('and (tipo_receb = 0) '); // Vista
             ParamByName('cod_caixa').AsInteger := icod_caixa;
             Open;
          end;

        if Dm.IBQ_PesqAux.RecordCount > 0 then
           DBEdit_vendas.Text := FloatToStrF(Dm.IBQ_PesqAux.FieldByName('RESULTADO').AsFloat,ffFixed,15,2)
        else
           DBEdit_vendas.Text := '0,00';

         /////////////////////////////////
        // Vendas Doces...
        with IBQ_PesqDoce, Sql do
          begin
             Close;
             Clear;
             Add('select sum(cast(vlr_total as float)) resultado from movto ');
             Add('where (cod_caixa = :cod_caixa) ');
             Add('and (flg_codmov = 3) '); // Venda
             Add('and (flg_doce = ''S'')'); // Vista
             ParamByName('cod_caixa').AsInteger := icod_caixa;
             Open;
          end;

        if IBQ_PesqDoce.RecordCount > 0 then
           DBEdit_Doces.Text := FloatToStrF(IBQ_PesqDoce.FieldByName('RESULTADO').AsFloat,ffFixed,15,2)
        else
           DBEdit_Doces.Text := '0,00';


        // Recebimento Venda Prazo
        with Dm.IBQ_PesqAux, Sql do
          begin
             Close;
             Clear;
             Add('select sum(vlr_liquido) resultado from pag_rec ');
             Add('where (cod_caixa_pagto = :cod_caixa) ');
             ParamByName('cod_caixa').AsInteger := icod_caixa;
             Open;
          end;
        if Dm.IBQ_PesqAux.RecordCount > 0 then
           DBEdit_vendas.Text := FloatToStrF(StrToFloat(DBEdit_vendas.Text) + Dm.IBQ_PesqAux.FieldByName('RESULTADO').AsFloat,ffFixed,15,2);



         /////////////////////////////////
        // Outras Entradas
        with Dm.IBQ_PesqAux, Sql do
          begin
             Close;
             Clear;
             Add('select sum(vlr_lancado) resultado from caixa_outros ');
             Add('where (cod_caixa = :cod_caixa) ');
             Add('and (flg_ent_sai = :flg_ent_sai) ');
             ParamByName('cod_caixa').AsInteger := icod_caixa;
             ParamByName('flg_ent_sai').AsString    := 'E';
             Open;
          end;

        if Dm.IBQ_PesqAux.RecordCount > 0 then
           DBEdit_oentrada.Text := FloatToStrF(Dm.IBQ_PesqAux.FieldByName('RESULTADO').AsFloat,ffFixed,15,2)
        else
           DBEdit_oentrada.Text := '0,00';


         /////////////////////////////////
        // Recebimentos
        with Dm.IBQ_PesqAux, Sql do
          begin
             Close;
             Clear;
             Add('select sum(vlr_liquido) resultado from mensalidade where (cod_caixa = :cod_caixa) ');
             ParamByName('cod_caixa').AsInteger := icod_caixa;
             Open;
          end;

        if Dm.IBQ_PesqAux.RecordCount > 0 then
           DBEdit_receb.Text := FloatToStrF(Dm.IBQ_PesqAux.FieldByName('RESULTADO').AsFloat,ffFixed,15,2)
        else
           DBEdit_receb.Text := '0,00';



         /////////////////////////////////
        // Compras a Vista
        with Dm.IBQ_PesqAux, Sql do
          begin
             Close;
             Clear;
             Add('select sum(vlr_total) resultado from movto ');
             Add('where (cod_caixa = :cod_caixa) ');
             Add('and (flg_codmov = 2) '); // Compra
             Add('and (tipo_receb = 0) '); // Vista
             ParamByName('cod_caixa').AsInteger := icod_caixa;
             Open;
          end;

        if Dm.IBQ_PesqAux.RecordCount > 0 then
           DBEdit_compras.Text := FloatToStrF(Dm.IBQ_PesqAux.FieldByName('RESULTADO').AsFloat,ffFixed,15,2)
        else
           DBEdit_compras.Text := '0,00';


         /////////////////////////////////
        // Outras Saidas
        with Dm.IBQ_PesqAux, Sql do
          begin
             Close;
             Clear;
             Add('select sum(vlr_lancado) resultado from caixa_outros ');
             Add('where (cod_caixa = :cod_caixa) ');
             Add('and (flg_ent_sai = :flg_ent_sai) ');
             ParamByName('cod_caixa').AsInteger := icod_caixa;
             ParamByName('flg_ent_sai').AsString    := 'S';
             Open;
          end;

        if Dm.IBQ_PesqAux.RecordCount > 0 then
           DBEdit_osaidas.Text := FloatToStrF(Dm.IBQ_PesqAux.FieldByName('RESULTADO').AsFloat,ffFixed,15,2)
        else
           DBEdit_osaidas.Text := '0,00';


         /////////////////////////////////
        // Pagamentos
        with Dm.IBQ_PesqAux, Sql do
          begin
             Close;
             Clear;
             Add('select sum(vlr_pagto) resultado from pag_pagar ');
             Add('where (cod_caixa_pagto = :cod_caixa) ');
             ParamByName('cod_caixa').AsInteger := icod_caixa;
             Open;
          end;
        if Dm.IBQ_PesqAux.RecordCount > 0 then
           DBEdit_pagamentos.Text := FloatToStrF(Dm.IBQ_PesqAux.FieldByName('RESULTADO').AsFloat,ffFixed,15,2)
        else
           DBEdit_pagamentos.Text := '0,00';



         /////////////////////////////////
        // Totais
        DBEdit_saldof.Text     := FloatToStrF((StrToFloat(DBEdit_vendas.Text)  + StrToFloat(DBEdit_oentrada.Text) + StrToFloat(DBEdit_receb.Text)) -
                                           (StrToFloat(DBEdit_compras.Text) + StrToFloat(DBEdit_osaidas.Text)   + StrToFloat(DBEdit_pagamentos.Text))  + (StrToFloat(DBEdit_saldoi.Text)),ffFixed,15,2);
        DBEdit_diferen.Text := FloatToStrF((StrToFloat(DBEdit_saldoc.Text)     - StrToFloat(DBEdit_saldof.Text))  ,ffFixed,15,2);
     end;


   // Formata Campos
   while Length(DBEdit_vendas.Text)     < 25 do DBEdit_vendas.Text      := ' ' + DBEdit_vendas.Text;
   while Length(DBEdit_Doces.Text)      < 25 do DBEdit_Doces.Text       := ' ' + DBEdit_Doces.Text;
   while Length(DBEdit_oentrada.Text)   < 25 do DBEdit_oentrada.Text    := ' ' + DBEdit_oentrada.Text;
   while Length(DBEdit_receb.Text)      < 25 do DBEdit_receb.Text       := ' ' + DBEdit_receb.Text;
   while Length(DBEdit_compras.Text)    < 25 do DBEdit_compras.Text     := ' ' + DBEdit_compras.Text;
   while Length(DBEdit_osaidas.Text)    < 25 do DBEdit_osaidas.Text     := ' ' + DBEdit_osaidas.Text;
   while Length(DBEdit_pagamentos.Text) < 25 do DBEdit_pagamentos.Text  := ' ' + DBEdit_pagamentos.Text;
   while Length(DBEdit_saldoi.Text)     < 23 do DBEdit_saldoi.Text      := ' ' + DBEdit_saldoi.Text;
   while Length(DBEdit_saldof.Text)     < 23 do DBEdit_saldof.Text      := ' ' + DBEdit_saldof.Text;
   while Length(DBEdit_saldoc.Text)     < 23 do DBEdit_saldoc.Text      := ' ' + DBEdit_saldoc.Text;
   while Length(DBEdit_diferen.Text)    < 23 do DBEdit_diferen.Text     := ' ' + DBEdit_diferen.Text;
end;

procedure TSg_0013.FormActivate(Sender: TObject);
begin
   bbtn_pesquisar.Click;
end;

procedure TSg_0013.bbtn_fecharClick(Sender: TObject);
var
    semissao, svencto, sconcil : String;
begin
      if (dm.nivel_acesso <> 1) then
      begin
        if (dm.nivel_acesso <> 3) then
        ShowMessage('Você não tem permissão para isso!')
      end
        else
 begin
   if Lbl_Codigo.Caption = '' then
     begin
        ShowMessage('Nenhum Caixa foi Selecionado!');
        bbtn_pesquisar.SetFocus;
        exit;
     end;

   if DBEdit_dtfechamento.Text <> '' then
     Begin
        ShowMessage('Caixa já foi Fechado!');
        if Application.MessageBox('Deseja Reabrir o Caixa ?','Atenção',4) = MrYes then
          begin
             // Reabrir Caixa
             with dm.IBQ_Pesquisa,SQL do
             begin
               close;
               clear;
               Add('update caixa set ');
               Add('DT_FECHAMENTO = null, HR_FECHAMENTO = null ');
               Add('where codigo = :codigo ');
               ParamByName('codigo').AsInteger := StrToInt(Lbl_Codigo.Caption);
               Open;
             end;
          end;
             calcula;
             exit;
     end;
  

   if Application.MessageBox('Deseja realmente Fechar o Caixa ?','Atenção',4) = MrNo then
      Exit
   else
     begin
        with Dm.IBQ_Pesquisa, Sql do
          begin
             Close;
             Clear;
             Add('update caixa set DT_FECHAMENTO = :DT_FECHAMENTO, HR_FECHAMENTO = :HR_FECHAMENTO, vendas = :vendas, recebimentos = :recebimentos, ');
             Add('outras_entradas = :outras_entradas, compras = :compras, pagamentos = :pagamentos, outras_saidas = :outras_saidas, ');
             Add('saldo_fim = :saldo_fim, vlr_diferenca = :vlr_diferenca where codigo = :codigo ');

             ParamByName('DT_FECHAMENTO').AsDateTime  := Date;
             ParamByName('HR_FECHAMENTO').AsTime      := Time;
             ParamByName('vendas').AsFloat            := StrToFloat(FloatToStrF(StrToFloat(DBEdit_vendas.Text)    ,ffFixed,15,2));
             ParamByName('recebimentos').AsFloat      := StrToFloat(FloatToStrF(StrToFloat(DBEdit_receb.Text)     ,ffFixed,15,2));
             ParamByName('outras_entradas').AsFloat   := StrToFloat(FloatToStrF(StrToFloat(DBEdit_oentrada.Text)  ,ffFixed,15,2));
             ParamByName('compras').AsFloat           := StrToFloat(FloatToStrF(StrToFloat(DBEdit_compras.Text)   ,ffFixed,15,2));
             ParamByName('pagamentos').AsFloat        := StrToFloat(FloatToStrF(StrToFloat(DBEdit_pagamentos.Text),ffFixed,15,2));
             ParamByName('outras_saidas').AsFloat     := StrToFloat(FloatToStrF(StrToFloat(DBEdit_osaidas.Text)   ,ffFixed,15,2));
             ParamByName('saldo_fim').AsFloat         := StrToFloat(FloatToStrF(StrToFloat(DBEdit_saldof.Text)    ,ffFixed,15,2));
             ParamByName('vlr_diferenca').AsFloat     := StrToFloat(FloatToStrF(StrToFloat(DBEdit_diferen.Text)   ,ffFixed,15,2));
             ParamByName('codigo').AsInteger          := StrToInt(Lbl_Codigo.Caption);
             Open;
          end;

        Calcula;


        // Verifica se Caixa Fechado é o 'Caixa Atual'
        if Dm.cod_caixa = StrToInt(DBEdit_codfunc.Text) then
          begin
             // Zera Caixa
             Dm.cod_caixa  := 0;
             Dm.cod_func   := 0;
             Dm.nome_caixa := '';
             Dm.data_caixa := '';
             Sg_0000.StatusBar1.Panels.Items[4].Text := 'Caixa: NENHUM CAIXA';
          end;
     end;
end;
end;

procedure TSg_0013.bbtn_imprimirClick(Sender: TObject);
var bFim, bFim2, bFim3 : Boolean;
    slinha, svalor, ssaldo, sentradas, ssaidas, stipo, scodigo, snome, sdocum,
    svlr_oentr, svlr_osaid, sjuros, sdesc, svlr_despe, sparc,
    svlr_juros, svlr_desc, svlr_pagto, sdifer, svlrliq, svlr_liq : String;
begin
      if (dm.nivel_acesso <> 1) then
      begin
        if (dm.nivel_acesso <> 3) then
        ShowMessage('Você não tem permissão para isso!')
      end
        else
  begin
   // Inicializa as Variáveis
   bFim       := False;
   spag       := '0';
   svalor     := '0';
   ssaldo     := '0';
   sentradas  := '0';
   ssaidas    := '0';
   svlr_oentr := '0';
   svlr_osaid := '0';
   svlr_despe := '0';
   svlr_juros := '0';
   svlr_desc  := '0';
   svlr_pagto := '0';
   while Length(straco1) < 80 do straco1 := straco1 + '=';
   while Length(straco2) < 80 do straco2 := straco2 + '-';

   // Captura Dados
   sdata_cx   := DBEdit_dtabertura.Text;
   scod_func  := FormatFloat('000000',StrToInt(DBEdit_codfunc.Text));
   snome_func := Copy(DBEdit_func.Text,1,30);

   // Rotina de Impressão
   rdprint1.TamanhoQteColunas     := 80;
   rdprint1.TamanhoQteLinhas      := 66;
   rdprint1.OpcoesPreview.Preview := True;
   rdprint1.abrir;
   rdprint1.setup;

   while bFim = False do
     begin
        // Imprime Cabeçalho
        Cabecalho;

        bFim2  := False;
        while bFim2 = False do
          begin
              ////////
             // CAIXA
             rdprint1.impF(ilinha,26, 'Resumo do Movimento do Caixa', [negrito]);
             ver_linha;
             rdprint1.imp (ilinha,01, straco1);
             ver_linha;
             rdprint1.imp (ilinha,01, 'Caixa                            Recebimentos     Pagamentos          Saldo (R$)');
             ver_linha;
             rdprint1.imp (ilinha,01, straco2);
             ver_linha;


             // MOSTRA O RESUMO DA MOVIMENTAÇÃO DO CAIXA
             svalor    := FloatToStrF(StrToFloat(DBEdit_saldoi.Text) ,ffFixed,10,2);
             ssaldo    := FloatToStrF(StrToFloat(ssaldo) + StrToFloat(svalor),ffFixed,13,2);
             while Length(svalor) < 10 do svalor := ' ' + svalor;
             while Length(ssaldo) < 13 do ssaldo := ' ' + ssaldo;
             rdprint1.imp (ilinha,01, 'SALDO INICIAL DO CAIXA                   --             --         '+ ssaldo);
             ver_linha;
             rdprint1.imp (ilinha,01, straco2);
             ver_linha;
             sentradas := FloatToStrF(StrToFloat(sentradas) + StrToFloat(svalor),ffFixed,10,2);

             svalor    := FloatToStrF(StrToFloat(DBEdit_vendas.Text) ,ffFixed,10,2);
             ssaldo    := FloatToStrF(StrToFloat(ssaldo) + StrToFloat(svalor),ffFixed,13,2);
             while Length(svalor) < 10 do svalor := ' ' + svalor;
             while Length(ssaldo) < 13 do ssaldo := ' ' + ssaldo;
             rdprint1.imp (ilinha,01, 'VENDAS DO TURNO                    '+ svalor +' +         --         '+ ssaldo);
             ver_linha;
             sentradas := FloatToStrF(StrToFloat(sentradas) + StrToFloat(svalor),ffFixed,10,2);

             svalor    := FloatToStrF(StrToFloat(DBEdit_oentrada.Text) ,ffFixed,10,2);
             ssaldo    := FloatToStrF(StrToFloat(ssaldo) + StrToFloat(svalor),ffFixed,13,2);
             while Length(svalor) < 10 do svalor := ' ' + svalor;
             while Length(ssaldo) < 13 do ssaldo := ' ' + ssaldo;
             rdprint1.imp (ilinha,01, 'OUTRAS ENTRADAS                    '+ svalor +' +         --         '+ ssaldo);
             ver_linha;
             sentradas := FloatToStrF(StrToFloat(sentradas) + StrToFloat(svalor),ffFixed,10,2);

             svalor    := FloatToStrF(StrToFloat(DBEdit_receb.Text) ,ffFixed,10,2);
             ssaldo    := FloatToStrF(StrToFloat(ssaldo) + StrToFloat(svalor),ffFixed,13,2);
             while Length(svalor) < 10 do svalor := ' ' + svalor;
             while Length(ssaldo) < 13 do ssaldo := ' ' + ssaldo;
             rdprint1.imp (ilinha,01, 'RECEBIMENTOS MENSALIDADES          '+ svalor +' +         --         '+ ssaldo);
             ver_linha;
             sentradas := FloatToStrF(StrToFloat(sentradas) + StrToFloat(svalor),ffFixed,10,2);

             svalor    := FloatToStrF(StrToFloat(sentradas) ,ffFixed,10,2);
             while Length(svalor) < 10 do svalor    := ' ' + svalor;
             while Length(ssaldo) < 13 do ssaldo := ' ' + ssaldo;
             rdprint1.imp (ilinha,01, 'TOTAL DAS ENTRADAS                 '+ svalor +' =         --                  --');
             ver_linha;
             rdprint1.imp (ilinha,01, straco2);
             ver_linha;


             svalor  := FloatToStrF(StrToFloat(DBEdit_compras.Text),ffFixed,10,2);
             ssaldo  := FloatToStrF(StrToFloat(ssaldo) - StrToFloat(svalor),ffFixed,13,2);
             while Length(svalor) < 10 do svalor := ' ' + svalor;
             while Length(ssaldo) < 13 do ssaldo := ' ' + ssaldo;
             rdprint1.imp (ilinha,01, 'COMPRAS DO TURNO                         --       '+ svalor +' +     '+ ssaldo);
             ver_linha;
             ssaidas := FloatToStrF(StrToFloat(ssaidas) + StrToFloat(svalor),ffFixed,10,2);

             svalor  := FloatToStrF(StrToFloat(DBEdit_osaidas.Text),ffFixed,10,2);
             ssaldo  := FloatToStrF(StrToFloat(ssaldo) - StrToFloat(svalor),ffFixed,13,2);
             while Length(svalor) < 10 do svalor := ' ' + svalor;
             while Length(ssaldo) < 13 do ssaldo := ' ' + ssaldo;
             rdprint1.imp (ilinha,01, 'OUTRAS SAIDAS                            --       '+ svalor +' +     '+ ssaldo);
             ver_linha;
             ssaidas := FloatToStrF(StrToFloat(ssaidas) + StrToFloat(svalor),ffFixed,10,2);

             svalor  := FloatToStrF(StrToFloat(DBEdit_pagamentos.Text),ffFixed,10,2);
             ssaldo  := FloatToStrF(StrToFloat(ssaldo) - StrToFloat(svalor),ffFixed,13,2);
             while Length(svalor) < 10 do svalor := ' ' + svalor;
             while Length(ssaldo) < 13 do ssaldo := ' ' + ssaldo;
             rdprint1.imp (ilinha,01, 'PAGAMENTOS                               --       '+ svalor +' +     '+ ssaldo);
             ver_linha;
             ssaidas := FloatToStrF(StrToFloat(ssaidas) + StrToFloat(svalor),ffFixed,10,2);

             svalor  := FloatToStrF(StrToFloat(ssaidas),ffFixed,10,2);
             while Length(svalor) < 10 do svalor := ' ' + svalor;
             while Length(ssaldo) < 13 do ssaldo := ' ' + ssaldo;
             rdprint1.imp (ilinha,01, 'TOTAL DAS SAIDAS                         --       '+ svalor +' =              --');
             ver_linha;
             rdprint1.imp (ilinha,01, straco2);
             ver_linha;

             while Length(ssaldo) < 13 do ssaldo := ' ' + ssaldo;
             rdprint1.imp (ilinha,01, 'SALDO FINAL DO CAIXA                     --             --         '+ ssaldo);
             ver_linha;
             rdprint1.imp (ilinha,01, straco2);
             ver_linha;

             sdifer  := FloatToStrF(StrToFloat(DBEdit_diferen.Text),ffFixed,10,2);
             while Length(sdifer) < 13 do sdifer := ' ' + sdifer;
             rdprint1.imp (ilinha,01, 'DIFERENÇA FINAL DO CAIXA                 --             --         '+ sdifer);
             ver_linha;
             rdprint1.imp (ilinha,01, straco1);
             ver_linha;


              /////////////////////////////////
             // OUTROS LANÇAMENTOS DESTE CAIXA
             // Seleciona Outras Entradas/Saídas
             with Dm.IBQ_Pesquisa, SQL do
               begin
                  Close;
                  Clear;
                  Add('select * from caixa_outros where cod_caixa = :caixa');
                  ParamByName('caixa').AsInteger := icod_caixa;
                  Open;
               end;

             if Dm.IBQ_Pesquisa.RecordCount > 0 then
               begin
                  ver_linha;
                  rdprint1.impF(ilinha,25, 'Outros Lancamentos deste Caixa', [negrito]);
                  ver_linha;
                  rdprint1.imp (ilinha,01, straco1);
                  ver_linha;
                  rdprint1.imp (ilinha,01, 'Codigo     Descricao                                                       Valor');
                  ver_linha;
                  rdprint1.imp (ilinha,01, straco2);
                  ver_linha;

                  stipo := 'S';
                  bFim3 := False;
                  while bFim3 = False do
                    begin
                       Dm.IBQ_Pesquisa.First;
                       while not Dm.IBQ_Pesquisa.Eof do
                         begin
                            if Dm.IBQ_Pesquisa.FieldByName('flg_ent_sai').AsString = stipo then
                              begin
                                 scodigo := Dm.IBQ_Pesquisa.FieldByName('CODIGO').AsString;
                                 snome   := Copy(Dm.IBQ_Pesquisa.FieldByName('observ').AsString,1,50);
                                 svalor  := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('vlr_lancado').AsFloat,ffFixed,09,2);
                                 while Length(scodigo) < 06 do scodigo := '0'   + scodigo;
                                 while Length(snome)   < 50 do snome   := snome + ' ';
                                 while Length(svalor)  < 09 do svalor  := ' '   + svalor;
                                 slinha := scodigo +'     '+ snome +'          '+ svalor;
                                 rdprint1.imp (ilinha,01, slinha);
                                 ver_linha;
                                 if stipo = 'S' then svlr_osaid := FloatToStrF(StrToFloat(svlr_osaid) + Dm.IBQ_Pesquisa.FieldByName('vlr_lancado').AsFloat,ffFixed,09,2);
                                 if stipo = 'E' then svlr_oentr := FloatToStrF(StrToFloat(svlr_oentr) + Dm.IBQ_Pesquisa.FieldByName('vlr_lancado').AsFloat,ffFixed,09,2);
                                 if stipo = 'D' then svlr_despe := FloatToStrF(StrToFloat(svlr_despe) + Dm.IBQ_Pesquisa.FieldByName('vlr_lancado').AsFloat,ffFixed,09,2);
                              end;
                            Dm.IBQ_Pesquisa.Next;
                         end;
                       svlr_oentr := FloatToStrF(StrToFloat(svlr_oentr),ffFixed,09,2);
                       svlr_osaid := FloatToStrF(StrToFloat(svlr_osaid),ffFixed,09,2);
                       svlr_despe := FloatToStrF(StrToFloat(svlr_despe),ffFixed,09,2);
                       while Length(svlr_oentr) < 09 do svlr_oentr := ' ' + svlr_oentr;
                       while Length(svlr_osaid) < 09 do svlr_osaid := ' ' + svlr_osaid;
                       while Length(svlr_despe) < 09 do svlr_despe := ' ' + svlr_despe;
                       if (stipo = 'S') and (StrToFloat(svlr_osaid) > 0) then
                         begin
                            rdprint1.imp(ilinha,40, '  Total de Outras Saidas >>     ' + svlr_osaid);
                            ver_linha;
                            rdprint1.imp(ilinha,01, straco2);
                            ver_linha;
                         end;
                       if (stipo = 'E') and (StrToFloat(svlr_oentr) > 0) then
                         begin
                            rdprint1.imp(ilinha,40, 'Total de Outras Entradas >>     ' + svlr_oentr);
                            ver_linha;
                            rdprint1.imp(ilinha,01, straco2);
                            ver_linha;
                         end;
                       if (stipo = 'D') and (StrToFloat(svlr_despe) > 0) then
                         begin
                            rdprint1.imp(ilinha,40, '       Total de Despesas >>     ' + svlr_despe);
                            ver_linha;
                            rdprint1.imp(ilinha,01, straco1);
                            ver_linha;
                         end;

                       if stipo = 'S' then
                          stipo := 'E'
                       else
                          if stipo = 'E' then
                             stipo := 'D'
                          else
                             bFim3 := True;
                    end;
               end;



              ///////////////
             // RECEBIMENTOS
             // Seleciona Recebimentos
             with Dm.IBQ_Pesquisa, SQL do
               begin
                  Close;
                  Clear;
                  Add('select a.cod_socio, b.nome nome_socio, sum(a.vlr_acres) vlr_acres, sum(a.vlr_desc) vlr_desc, sum(a.vlr_pagto) vlr_pagto, sum(a.vlr_liquido) vlr_liquido');
                  Add('from mensalidade a, socio b ');
                  Add('where (a.cod_socio = b.codigo) and (a.cod_caixa = :cod_caixa) ');
                  Add('group by a.cod_socio, b.nome order by b.nome ');
                  ParamByName('cod_caixa').AsInteger := icod_caixa;
                  Open;
               end;

             if Dm.IBQ_Pesquisa.RecordCount > 0 then
               begin
                  ver_linha;
                  rdprint1.impF(ilinha,34, 'Recebimentos', [negrito]);
                  ver_linha;
                  rdprint1.imp (ilinha,01, straco1);
                  ver_linha;
                  rdprint1.imp (ilinha,01, 'Socio                                      Juros  Desconto   Vlr Pago  Vlr Liq');
                  ver_linha;
                  rdprint1.imp (ilinha,01, straco2);
                  ver_linha;


                  // MOSTRA OS RECEBIMENTOS
                  svlr_juros := '0';
                  svlr_desc  := '0';
                  svlr_pagto := '0';
                  svlr_liq   := '0';
                  Dm.IBQ_Pesquisa.First;
                  while not Dm.IBQ_Pesquisa.Eof do
                    begin
                       scodigo := Dm.IBQ_Pesquisa.FieldByName('cod_socio').AsString;
                       snome   := Copy(Dm.IBQ_Pesquisa.FieldByName('nome_socio').AsString,1,40);
                       sjuros  := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('VLR_ACRES').AsFloat,ffFixed,08,2);
                       sdesc   := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('VLR_DESC').AsFloat ,ffFixed,08,2);
                       svalor  := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('VLR_PAGTO').AsFloat,ffFixed,09,2);
                       svlrliq := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('VLR_LIQUIDO').AsFloat,ffFixed,09,2);
                       while Length(scodigo) < 06 do scodigo   := '0'   + scodigo;
                       while Length(snome)   < 31 do snome     := snome + ' ';
                       while Length(sjuros)  < 08 do sjuros    := ' '   + sjuros;
                       while Length(sdesc)   < 08 do sdesc     := ' '   + sdesc;
                       while Length(svalor)  < 09 do svalor    := ' '   + svalor;
                       while Length(svlrliq) < 09 do svlrliq   := ' '   + svlrliq;
                       slinha := scodigo +'-'+ snome +'  '+ sjuros +'  '+ sdesc +'  '+ svalor+'  '+svlrliq;
                       rdprint1.imp (ilinha,01, slinha);
                       ver_linha;
                       svlr_juros := FloatToStrF(StrToFloat(svlr_juros) + Dm.IBQ_Pesquisa.FieldByName('VLR_ACRES').AsFloat,ffFixed,08,2);
                       svlr_desc  := FloatToStrF(StrToFloat(svlr_desc)  + Dm.IBQ_Pesquisa.FieldByName('VLR_DESC').AsFloat ,ffFixed,08,2);
                       svlr_pagto := FloatToStrF(StrToFloat(svlr_pagto) + Dm.IBQ_Pesquisa.FieldByName('VLR_PAGTO').AsFloat,ffFixed,09,2);
                       svlr_liq   := FloatToStrF(StrToFloat(svlr_liq)   + Dm.IBQ_Pesquisa.FieldByName('VLR_LIQUIDO').AsFloat,ffFixed,09,2);
                       Dm.IBQ_Pesquisa.Next;
                    end;
                  svlr_juros := FloatToStrF(StrToFloat(svlr_juros),ffFixed,08,2);
                  svlr_desc  := FloatToStrF(StrToFloat(svlr_desc) ,ffFixed,08,2);
                  svlr_pagto := FloatToStrF(StrToFloat(svlr_pagto),ffFixed,09,2);
                  svlr_liq   := FloatToStrF(StrToFloat(svlr_liq),ffFixed,09,2);
                  while Length(svlr_juros) < 08 do svlr_juros := ' ' + svlr_juros;
                  while Length(svlr_desc)  < 08 do svlr_desc  := ' ' + svlr_desc;
                  while Length(svlr_pagto) < 09 do svlr_pagto := ' ' + svlr_pagto;
                  while Length(svlr_liq)   < 09 do svlr_liq   := ' ' + svlr_liq;
                  rdprint1.imp (ilinha,14, 'Total dos Recebimentos >>  ' + svlr_juros +'  '+ svlr_desc +'  '+ svlr_pagto+'  '+svlr_liq);
                  ver_linha;
                  rdprint1.imp (ilinha,01, straco1);
                  ver_linha;
               end;



              /////////////////
             // VENDAS A VISTA
             svlr_juros := FloatToStrF(0,ffFixed,08,2);
             svlr_desc  := FloatToStrF(0,ffFixed,08,2);
             svlr_pagto := FloatToStrF(0,ffFixed,09,2);
             // Seleciona Vendas
             with Dm.IBQ_Pesquisa, SQL do
               begin
                  Close;
                  Clear;
                  Add('select a.*, b.nome nome_socio from movto a, socio b      ');
                  Add('where (a.cod_socio = b.codigo) and (a.cod_caixa = :caixa)  ');
                  Add('and (a.flg_codmov = :codmov) and (a.tipo_receb = :receb) ');
                  Add('order by b.nome, a.nota_fiscal ');
                  ParamByName('caixa').AsInteger  := icod_caixa;
                  ParamByName('codmov').AsInteger := 1;   // a.flg_codmov = 1 = Venda
                  ParamByName('receb').AsInteger  := 0;   // a.tipo_receb = 0 = Vista
                  Open;
               end;

             if Dm.IBQ_Pesquisa.RecordCount > 0 then
               begin
                  ver_linha;
                  rdprint1.impF(ilinha,33, 'Vendas a Vista', [negrito]);
                  ver_linha;
                  rdprint1.imp (ilinha,01, straco1);
                  ver_linha;
                  rdprint1.imp (ilinha,01, 'Documento  Cliente                                Acrescimo  Desconto   Vlr Pago');
                  ver_linha;
                  rdprint1.imp (ilinha,01, straco2);
                  ver_linha;

                  // MOSTRA OS PAGAMENTOS
                  Dm.IBQ_Pesquisa.First;
                  while not Dm.IBQ_Pesquisa.Eof do
                    begin
                       sdocum  := Dm.IBQ_Pesquisa.FieldByName('NOTA_FISCAL').AsString;
                       scodigo := Dm.IBQ_Pesquisa.FieldByName('cod_socio').AsString;
                       snome   := Copy(Dm.IBQ_Pesquisa.FieldByName('NOME_SOCIO').AsString,1,31);
                       sjuros  := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('VLR_ACRES').AsFloat,ffFixed,08,2);
                       sdesc   := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('VLR_DESC').AsFloat ,ffFixed,08,2);
                       svalor  := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('VLR_TOTAL').AsFloat,ffFixed,09,2);
                       while Length(sdocum)  < 06 do sdocum  := '0'   + sdocum;
                       while Length(scodigo) < 06 do scodigo := '0'   + scodigo;
                       while Length(snome)   < 31 do snome   := snome + ' ';
                       while Length(sjuros)  < 08 do sjuros  := ' '   + sjuros;
                       while Length(sdesc)   < 08 do sdesc   := ' '   + sdesc;
                       while Length(svalor)  < 09 do svalor  := ' '   + svalor;
                       slinha := sdocum +'    '+ scodigo +'-'+ snome +'  '+ sjuros +'  '+ sdesc +'  '+ svalor;
                       rdprint1.imp (ilinha,02, slinha);
                       ver_linha;
                       if Trim(Dm.IBQ_Pesquisa.FieldByName('OBSERV1').AsString) <> '' then
                         begin
                            rdprint1.imp (ilinha,19, Copy(Dm.IBQ_Pesquisa.FieldByName('OBSERV1').AsString,1,60));
                            ver_linha;
                         end;
                       svlr_juros := FloatToStrF(StrToFloat(svlr_juros) + Dm.IBQ_Pesquisa.FieldByName('VLR_ACRES').AsFloat,ffFixed,08,2);
                       svlr_desc  := FloatToStrF(StrToFloat(svlr_desc)  + Dm.IBQ_Pesquisa.FieldByName('VLR_DESC').AsFloat ,ffFixed,08,2);
                       svlr_pagto := FloatToStrF(StrToFloat(svlr_pagto) + Dm.IBQ_Pesquisa.FieldByName('VLR_TOTAL').AsFloat,ffFixed,09,2);
                       Dm.IBQ_Pesquisa.Next;
                    end;
                  svlr_juros := FloatToStrF(StrToFloat(svlr_juros),ffFixed,08,2);
                  svlr_desc  := FloatToStrF(StrToFloat(svlr_desc) ,ffFixed,08,2);
                  svlr_pagto := FloatToStrF(StrToFloat(svlr_pagto),ffFixed,09,2);
                  while Length(svlr_juros) < 08 do svlr_juros := ' ' + svlr_juros;
                  while Length(svlr_desc)  < 08 do svlr_desc  := ' ' + svlr_desc;
                  while Length(svlr_pagto) < 09 do svlr_pagto := ' ' + svlr_pagto;
                  rdprint1.imp (ilinha,23, 'Total das Vendas a Vista >>  ' + svlr_juros +'  '+ svlr_desc +'  '+ svlr_pagto);
                  ver_linha;
                  rdprint1.imp (ilinha,01, straco1);
                  ver_linha;
               end;



              /////////////////
             // COMPRAS A VISTA
             svlr_juros := FloatToStrF(0,ffFixed,08,2);
             svlr_desc  := FloatToStrF(0,ffFixed,08,2);
             svlr_pagto := FloatToStrF(0,ffFixed,09,2);
             // Seleciona Compras
             with Dm.IBQ_Pesquisa, SQL do
               begin
                  Close;
                  Clear;
                  Add('select a.* from movto a    ');
                  Add('where (a.cod_caixa = :caixa)    ');
                  Add('and (a.flg_codmov = :codmov) and (a.tipo_receb = :tiporec) ');
                  Add('order by a.nota_fiscal ');
                  ParamByName('caixa').AsInteger   := icod_caixa;
                  ParamByName('codmov').AsInteger  := 2; // a.flg_codmov = 2 = Compra
                  ParamByName('tiporec').AsInteger := 0; // a.tipo_receb = 0 = Vista
                  Open;
               end;

             if Dm.IBQ_Pesquisa.RecordCount > 0 then
               begin
                  ver_linha;
                  rdprint1.impF(ilinha,33, 'Compras a Vista', [negrito]);
                  ver_linha;
                  rdprint1.imp (ilinha,01, straco1);
                  ver_linha;
                  rdprint1.imp (ilinha,01, 'Documento  Fornecedor                                 Juros  Desconto   Vlr Pago');
                  ver_linha;
                  rdprint1.imp (ilinha,01, straco2);
                  ver_linha;

                  // MOSTRA OS PAGAMENTOS
                  Dm.IBQ_Pesquisa.First;
                  while not Dm.IBQ_Pesquisa.Eof do
                    begin
                       sdocum  := Dm.IBQ_Pesquisa.FieldByName('NOTA_FISCAL').AsString;
                       snome   := Copy(Dm.IBQ_Pesquisa.FieldByName('NOME_FOR').AsString,1,31);
                       sjuros  := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('VLR_ACRES').AsFloat,ffFixed,08,2);
                       sdesc   := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('VLR_DESC').AsFloat ,ffFixed,08,2);
                       svalor  := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('VLR_TOTAL').AsFloat,ffFixed,09,2);
                       while Length(sdocum)  < 06 do sdocum  := '0'   + sdocum;
                       while Length(snome)   < 31 do snome   := snome + ' ';
                       while Length(sjuros)  < 08 do sjuros  := ' '   + sjuros;
                       while Length(sdesc)   < 08 do sdesc   := ' '   + sdesc;
                       while Length(svalor)  < 09 do svalor  := ' '   + svalor;
                       slinha := sdocum +'    '+ scodigo +'-'+ snome +'  '+ sjuros +'  '+ sdesc +'  '+ svalor;
                       rdprint1.imp (ilinha,02, slinha);
                       ver_linha;
                       if Trim(Dm.IBQ_Pesquisa.FieldByName('OBSERV1').AsString) <> '' then
                         begin
                            rdprint1.imp (ilinha,19, Copy(Dm.IBQ_Pesquisa.FieldByName('OBSERV1').AsString,1,60));
                            ver_linha;
                         end;
                       svlr_juros := FloatToStrF(StrToFloat(svlr_juros) + Dm.IBQ_Pesquisa.FieldByName('VLR_ACRES').AsFloat,ffFixed,08,2);
                       svlr_desc  := FloatToStrF(StrToFloat(svlr_desc)  + Dm.IBQ_Pesquisa.FieldByName('VLR_DESC').AsFloat ,ffFixed,08,2);
                       svlr_pagto := FloatToStrF(StrToFloat(svlr_pagto) + Dm.IBQ_Pesquisa.FieldByName('VLR_TOTAL').AsFloat,ffFixed,09,2);
                       Dm.IBQ_Pesquisa.Next;
                    end;
                  svlr_juros := FloatToStrF(StrToFloat(svlr_juros),ffFixed,08,2);
                  svlr_desc  := FloatToStrF(StrToFloat(svlr_desc) ,ffFixed,08,2);
                  svlr_pagto := FloatToStrF(StrToFloat(svlr_pagto),ffFixed,09,2);
                  while Length(svlr_juros) < 08 do svlr_juros := ' ' + svlr_juros;
                  while Length(svlr_desc)  < 08 do svlr_desc  := ' ' + svlr_desc;
                  while Length(svlr_pagto) < 09 do svlr_pagto := ' ' + svlr_pagto;
                  rdprint1.imp (ilinha,22, 'Total das Compras a Vista >>  ' + svlr_juros +'  '+ svlr_desc +'  '+ svlr_pagto);
                  ver_linha;
                  rdprint1.imp (ilinha,01, straco1);
                  ver_linha;
               end;



              //////////////
             // RECEBIMENTOS
             // Seleciona Recebimentos
             svlr_juros := '0';
             svlr_desc  := '0';
             svlr_pagto := '0';
             svlr_liq   := '0';
             with Dm.IBQ_Pesquisa, SQL do
               begin
                  Close;
                  Clear;
                  Add('select a.vlr_acres, a.vlr_desc, a.vlr_pagto, a.vlr_liquido, b.documento, b.parcela, ');
                  Add('b.cod_socio, c.nome, b.historico from pag_rec a, receber b, socio c ');
                  Add('where (a.codrec = b.codigo) and (b.cod_socio = c.codigo) and (a.cred_deb = :cred_deb) ');
                  Add('and (a.cod_caixa_pagto = :cod_caixa) and (a.tipo_receb <= :tipo_receb) ');
                  ParamByName('cred_deb').AsString    := 'C';
                  ParamByName('cod_caixa').AsInteger  := icod_caixa;
                  ParamByName('tipo_receb').AsInteger := 3; // 0=Dinheiro, 1=Ch.Vista, 2=Ch.Pré
                  Open;
               end;

             if Dm.IBQ_Pesquisa.RecordCount > 0 then
               begin
                  ver_linha;
                  rdprint1.impF(ilinha,25, 'Recebimentos de Vendas a Prazo', [negrito]);
                  ver_linha;
                  rdprint1.imp (ilinha,01, straco1);
                  ver_linha;
                  rdprint1.imp (ilinha,01, 'Doc  Parc  Cliente                           Juros  Desconto   Vlr Pago  Vlr Liq');
                  ver_linha;
                  rdprint1.imp (ilinha,01, straco2);
                  ver_linha;

                  // MOSTRA OS PAGAMENTOS
                  Dm.IBQ_Pesquisa.First;
                  while not Dm.IBQ_Pesquisa.Eof do
                    begin
                       sdocum  := Dm.IBQ_Pesquisa.FieldByName('DOCUMENTO').AsString;
                       sparc   := Dm.IBQ_Pesquisa.FieldByName('PARCELA').AsString;
                       scodigo := Dm.IBQ_Pesquisa.FieldByName('COD_socio').AsString;
                       snome   := Copy(Dm.IBQ_Pesquisa.FieldByName('NOME').AsString,1,25);
                       sjuros  := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('VLR_ACRES').AsFloat,ffFixed,08,2);
                       sdesc   := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('VLR_DESC').AsFloat ,ffFixed,08,2);
                       svalor  := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('VLR_PAGTO').AsFloat,ffFixed,09,2);
                       svlrliq := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('VLR_LIQUIDO').AsFloat,ffFixed,09,2);
                       while Length(sdocum)  < 04 do sdocum  := '0'   + sdocum;
                       while Length(sparc)   < 02 do sparc   := '0'   + sparc;
                       while Length(scodigo) < 06 do scodigo := '0'   + scodigo;
                       while Length(snome)   < 20 do snome   := snome + ' ';
                       while Length(sjuros)  < 08 do sjuros  := ' '   + sjuros;
                       while Length(sdesc)   < 08 do sdesc   := ' '   + sdesc;
                       while Length(svalor)  < 09 do svalor  := ' '   + svalor;
                       while Length(svlrliq) < 09 do svlrliq := ' '   + svlrliq;
                       slinha := sdocum +'  '+ sparc +'  '+ scodigo +'-'+ snome +' '+ sjuros +' '+ sdesc +' '+ svalor +' '+svlrliq;
                       rdprint1.imp (ilinha,01, slinha);
                       ver_linha;
                       if Trim(Dm.IBQ_Pesquisa.FieldByName('HISTORICO').AsString) <> '' then
                         begin
                            rdprint1.imp (ilinha,18, Copy(Dm.IBQ_Pesquisa.FieldByName('HISTORICO').AsString,1,60));
                            ver_linha;
                         end;
                       svlr_juros := FloatToStrF(StrToFloat(svlr_juros) + Dm.IBQ_Pesquisa.FieldByName('VLR_ACRES').AsFloat,ffFixed,08,2);
                       svlr_desc  := FloatToStrF(StrToFloat(svlr_desc)  + Dm.IBQ_Pesquisa.FieldByName('VLR_DESC').AsFloat ,ffFixed,08,2);
                       svlr_pagto := FloatToStrF(StrToFloat(svlr_pagto) + Dm.IBQ_Pesquisa.FieldByName('VLR_PAGTO').AsFloat,ffFixed,09,2);
                       svlr_liq   := FloatToStrF(StrToFloat(svlr_liq)   + Dm.IBQ_Pesquisa.FieldByName('VLR_LIQUIDO').AsFloat,ffFixed,09,2);
                       Dm.IBQ_Pesquisa.Next;
                    end;

                  svlr_juros := FloatToStrF(StrToFloat(svlr_juros),ffFixed,08,2);
                  svlr_desc  := FloatToStrF(StrToFloat(svlr_desc) ,ffFixed,08,2);
                  svlr_pagto := FloatToStrF(StrToFloat(svlr_pagto),ffFixed,09,2);
                  svlr_liq   := FloatToStrF(StrToFloat(svlr_liq),ffFixed,09,2);
                  while Length(svlr_juros) < 08 do svlr_juros := ' ' + svlr_juros;
                  while Length(svlr_desc)  < 08 do svlr_desc  := ' ' + svlr_desc;
                  while Length(svlr_pagto) < 09 do svlr_pagto := ' ' + svlr_pagto;
                  while Length(svlr_liq)   < 09 do svlr_liq   := ' ' + svlr_liq;
                  rdprint1.imp (ilinha,17, 'Total dos Recebimentos >>  ' + svlr_juros +' '+ svlr_desc +' '+ svlr_pagto+' '+svlr_liq);
                  ver_linha;
                  rdprint1.imp (ilinha,01, straco1);
                  ver_linha;
               end;



              /////////////
             // PAGAMENTOS
             // Seleciona Pagamentos
             svlr_juros := '0';
             svlr_desc  := '0';
             svlr_pagto := '0';
             with Dm.IBQ_Pesquisa, SQL do
               begin
                  Close;
                  Clear;
                  Add('select a.vlr_acres, a.vlr_desc, a.vlr_pagto, b.documento, b.parcela, ');
                  Add(' b.historico from pag_pagar a, pagar b ');
                  Add('where (a.codpag = b.codigo) ');
                  Add('and (a.cod_caixa_pagto = :cod_caixa) ');
                  ParamByName('cod_caixa').AsInteger := icod_caixa;
                  Open;
               end;

             if Dm.IBQ_Pesquisa.RecordCount > 0 then
               begin
                  ver_linha;
                  rdprint1.impF(ilinha,25, 'Pagamentos de Compras a Prazo', [negrito]);
                  ver_linha;
                  rdprint1.imp (ilinha,01, straco1);
                  ver_linha;
                  rdprint1.imp (ilinha,01, 'Documento  Parc  Fornecedor                           Juros  Desconto   Vlr Pago');
                  ver_linha;
                  rdprint1.imp (ilinha,01, straco2);
                  ver_linha;

                  // MOSTRA OS PAGAMENTOS
                  Dm.IBQ_Pesquisa.First;
                  while not Dm.IBQ_Pesquisa.Eof do
                    begin
                       sdocum  := Dm.IBQ_Pesquisa.FieldByName('DOCUMENTO').AsString;
                       sparc   := Dm.IBQ_Pesquisa.FieldByName('PARCELA').AsString;
                       sjuros  := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('VLR_ACRES').AsFloat,ffFixed,08,2);
                       sdesc   := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('VLR_DESC').AsFloat ,ffFixed,08,2);
                       svalor  := FloatToStrF(Dm.IBQ_Pesquisa.FieldByName('VLR_PAGTO').AsFloat,ffFixed,09,2);
                       while Length(sdocum)  < 06 do sdocum  := '0'   + sdocum;
                       while Length(sparc)   < 02 do sparc   := '0'   + sparc;
                       while Length(sjuros)  < 08 do sjuros  := ' '   + sjuros;
                       while Length(sdesc)   < 08 do sdesc   := ' '   + sdesc;
                       while Length(svalor)  < 09 do svalor  := ' '   + svalor;
                       slinha := sdocum +'     '+ sparc +'   '+ sjuros +'  '+ sdesc +'  '+ svalor;
                       rdprint1.imp (ilinha,02, slinha);
                       ver_linha;
                       if Trim(Dm.IBQ_Pesquisa.FieldByName('HISTORICO').AsString) <> '' then
                         begin
                            rdprint1.imp (ilinha,18, Copy(Dm.IBQ_Pesquisa.FieldByName('HISTORICO').AsString,1,60));
                            ver_linha;
                         end;
                       svlr_juros := FloatToStrF(StrToFloat(svlr_juros) + Dm.IBQ_Pesquisa.FieldByName('VLR_ACRES').AsFloat,ffFixed,08,2);
                       svlr_desc  := FloatToStrF(StrToFloat(svlr_desc)  + Dm.IBQ_Pesquisa.FieldByName('VLR_DESC').AsFloat ,ffFixed,08,2);
                       svlr_pagto := FloatToStrF(StrToFloat(svlr_pagto) + Dm.IBQ_Pesquisa.FieldByName('VLR_PAGTO').AsFloat,ffFixed,09,2);
                       Dm.IBQ_Pesquisa.Next;
                    end;

                  svlr_juros := FloatToStrF(StrToFloat(svlr_juros),ffFixed,08,2);
                  svlr_desc  := FloatToStrF(StrToFloat(svlr_desc) ,ffFixed,08,2);
                  svlr_pagto := FloatToStrF(StrToFloat(svlr_pagto),ffFixed,09,2);
                  while Length(svlr_juros) < 08 do svlr_juros := ' ' + svlr_juros;
                  while Length(svlr_desc)  < 08 do svlr_desc  := ' ' + svlr_desc;
                  while Length(svlr_pagto) < 09 do svlr_pagto := ' ' + svlr_pagto;
                  rdprint1.imp (ilinha,27, 'Total dos Pagamentos >>  ' + svlr_juros +'  '+ svlr_desc +'  '+ svlr_pagto);
                  ver_linha;
                  rdprint1.imp (ilinha,01, straco1);
                  ver_linha;
               end;



              /////////////////////////////////
             // ADMISSAO DE SOCIOS
             with Dm.IBQ_Pesquisa, SQL do
               begin
                  Close;
                  Clear;
                  Add('select codigo, nome, telefone from socio where data_admissao = :data ');
                  ParamByName('data').AsDateTime := StrToDate(DBEdit_dtabertura.Text);
                  Open;
               end;

             if Dm.IBQ_Pesquisa.RecordCount > 0 then
               begin
                  ver_linha;
                  rdprint1.impF(ilinha,24, 'socios Admitidos neste Caixa', [negrito]);
                  ver_linha;
                  rdprint1.imp (ilinha,01, straco1);
                  ver_linha;
                  rdprint1.imp (ilinha,01, 'Codigo  Nome                                                Telefone');
                                          //999999  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  xxxxxxxxxxxxxxxxxxxx
                  ver_linha;
                  rdprint1.imp (ilinha,01, straco2);
                  ver_linha;

                  Dm.IBQ_Pesquisa.First;
                  while not Dm.IBQ_Pesquisa.Eof do
                    begin
                       scodigo := Dm.IBQ_Pesquisa.FieldByName('CODIGO').AsString;
                       snome   := Copy(Dm.IBQ_Pesquisa.FieldByName('NOME').AsString,1,50);
                       svalor  := Copy(Dm.IBQ_Pesquisa.FieldByName('TELEFONE').AsString,1,20);
                       while Length(scodigo) < 06 do scodigo := '0'    + scodigo;
                       while Length(snome)   < 50 do snome   := snome  + ' ';
                       while Length(svalor)  < 20 do svalor  := svalor + ' ';
                       slinha := scodigo +'  '+ snome +'  '+ svalor;
                       rdprint1.imp (ilinha,01, slinha);
                       ver_linha;
                       Dm.IBQ_Pesquisa.Next;
                    end;
               end;



              /////////////////////////////////
             // CANCELAMENTO DE SOCIOS
             with Dm.IBQ_Pesquisa, SQL do
               begin
                  Close;
                  Clear;
                  Add('select codigo, nome, telefone, data_admissao from socio where data_cancelamento = :data ');
                  ParamByName('data').AsDateTime := StrToDate(DBEdit_dtabertura.Text);
                  Open;
               end;

             if Dm.IBQ_Pesquisa.RecordCount > 0 then
               begin
                  ver_linha;
                  rdprint1.impF(ilinha,24, 'socios Cancelados neste Caixa', [negrito]);
                  ver_linha;
                  rdprint1.imp (ilinha,01, straco1);
                  ver_linha;
                  rdprint1.imp (ilinha,01, 'Codigo  Nome                                      Telefone            Admissão');
                                          //999999  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  xxxxxxxxxxxxxxxxxx  xxxxxxxxxx
                  ver_linha;
                  rdprint1.imp (ilinha,01, straco2);
                  ver_linha;

                  Dm.IBQ_Pesquisa.First;
                  while not Dm.IBQ_Pesquisa.Eof do
                    begin
                       scodigo := Dm.IBQ_Pesquisa.FieldByName('CODIGO').AsString;
                       snome   := Copy(Dm.IBQ_Pesquisa.FieldByName('NOME').AsString,1,40);
                       svalor  := Copy(Dm.IBQ_Pesquisa.FieldByName('TELEFONE').AsString,1,18);
                       sdocum  := Copy(Dm.IBQ_Pesquisa.FieldByName('DATA_ADMISSAO').AsString,1,10);
                       while Length(scodigo) < 06 do scodigo := '0'    + scodigo;
                       while Length(snome)   < 50 do snome   := snome  + ' ';
                       while Length(svalor)  < 20 do svalor  := svalor + ' ';
                       slinha := scodigo +'  '+ snome +'  '+ svalor +'  '+ sdocum;
                       rdprint1.imp (ilinha,01, slinha);
                       ver_linha;
                       Dm.IBQ_Pesquisa.Next;
                    end;
               end;


             bFim2 := True;
          end;

        bFim := True;
     end;

   rdprint1.Fechar;
  end;
end;

procedure TSg_0013.Cabecalho;
var ic : Integer;
begin
   // Soma 1 ao nro. da página
   spag := IntToStr(StrToInt(spag) + 1);
   while Length(spag) < 04 do spag := '0' + spag;

   // Cabeçalho
   ic := Round((70 - Length(Dm.IBDS_Empresa.FieldByName('FANTASIA').AsString)) / 2);
   rdprint1.imp (01,01, DateToStr(Date));
   rdprint1.impF(01,ic, '>>>  '  + Dm.IBDS_Empresa.FieldByName('FANTASIA').AsString + '  <<<', [negrito]);
   rdprint1.imp (01,71, 'Pag.: ' + spag);
   rdprint1.impF(03,25, 'R E S U M O   D O   C A I X A', [negrito]);
   rdprint1.imp (05,01, 'Data: ' +sdata_cx+ '      Caixa: ' +scod_func+' - '+Copy(snome_func,1,27));

   rdprint1.imp (06,01, straco1);

   ilinha := 8;
end;

procedure TSg_0013.Ver_Linha;
begin
   inc(ilinha);

   if ilinha > 62 then
     begin
        rdprint1.imp (ilinha,01, straco2);
        rdprint1.Novapagina;
        Cabecalho;
     end;
end;

procedure TSg_0013.bbtn_atualizarClick(Sender: TObject);
begin
  if (dm.nivel_acesso <> 1) then
  begin
    if (dm.nivel_acesso <> 3) then
    ShowMessage('Você não tem permissão para isso!')
  end
    else
   begin
   if Lbl_Codigo.Caption = '' then
     begin
        ShowMessage('Nenhum Caixa foi Selecionado!');
        bbtn_pesquisar.SetFocus;
        exit;
     end;

   if (DBEdit_dtfechamento.Text = '') or (DBEdit_dtfechamento.Text = '  /  /    ') then
     Begin
        ShowMessage('Caixa não foi Fechado!');
        bbtn_pesquisar.SetFocus;
        exit;
     end;

   if Application.MessageBox('Deseja realmente Atualizar o Caixa ?','Atenção',4) = MrNo then
      Exit
   else
     begin
        // Inicializa Campos
        DBEdit_vendas.Text  := '0,00';
        DBEdit_oentrada.Text    := '0,00';
        DBEdit_receb.Text      := '0,00';
        DBEdit_compras.Text := '0,00';
        DBEdit_osaidas.Text      := '0,00';
        DBEdit_pagamentos.Text       := '0,00';


        // Outras Entradas
        with Dm.IBQ_PesqAux, Sql do
          begin
             Close;
             Clear;
             Add('select sum(vlr_lancado) resultado from caixa_outros ');
             Add('where (cod_caixa = :cod_caixa) ');
             Add('and (flg_ent_sai = :flg_ent_sai) ');
             ParamByName('cod_caixa').AsInteger := icod_caixa;
             ParamByName('flg_ent_sai').AsString    := 'E';
             Open;
          end;
        if Dm.IBQ_PesqAux.RecordCount > 0 then DBEdit_oentrada.Text := FloatToStrF(Dm.IBQ_PesqAux.FieldByName('RESULTADO').AsFloat,ffFixed,15,2);

        // Recebimentos
        with Dm.IBQ_PesqAux, Sql do
          begin
             Close;
             Clear;
             Add('select sum(vlr_pagto) resultado from mensalidade where (cod_caixa = :cod_caixa) ');
             ParamByName('cod_caixa').AsInteger := icod_caixa;
             Open;
          end;
        if Dm.IBQ_PesqAux.RecordCount > 0 then DBEdit_receb.Text := FloatToStrF(Dm.IBQ_PesqAux.FieldByName('RESULTADO').AsFloat,ffFixed,15,2);


        // Outras Saidas
        with Dm.IBQ_PesqAux, Sql do
          begin
             Close;
             Clear;
             Add('select sum(vlr_lancado) resultado from caixa_outros ');
             Add('where (cod_caixa = :cod_caixa) ');
             Add('and (flg_ent_sai = :flg_ent_sai) ');
             ParamByName('cod_caixa').AsInteger := icod_caixa;
             ParamByName('flg_ent_sai').AsString    := 'S';
             Open;
          end;
        if Dm.IBQ_PesqAux.RecordCount > 0 then DBEdit_osaidas.Text := FloatToStrF(Dm.IBQ_PesqAux.FieldByName('RESULTADO').AsFloat,ffFixed,15,2);


        // Totais
        DBEdit_saldof.Text     := FloatToStrF((StrToFloat(DBEdit_vendas.Text)  + StrToFloat(DBEdit_oentrada.Text) + StrToFloat(DBEdit_receb.Text)) -
                                           (StrToFloat(DBEdit_compras.Text) + StrToFloat(DBEdit_osaidas.Text)   + StrToFloat(DBEdit_pagamentos.Text))  + (StrToFloat(DBEdit_saldoi.Text)),ffFixed,15,2);
        DBEdit_diferen.Text := FloatToStrF((StrToFloat(DBEdit_saldoc.Text)     - StrToFloat(DBEdit_saldof.Text))  ,ffFixed,15,2);

        // Formata Campos
        while Length(DBEdit_vendas.Text)      < 15 do DBEdit_vendas.Text      := ' ' + DBEdit_vendas.Text;
        while Length(DBEdit_oentrada.Text)    < 15 do DBEdit_oentrada.Text    := ' ' + DBEdit_oentrada.Text;
        while Length(DBEdit_receb.Text)       < 15 do DBEdit_receb.Text       := ' ' + DBEdit_receb.Text;
        while Length(DBEdit_compras.Text)     < 15 do DBEdit_compras.Text     := ' ' + DBEdit_compras.Text;
        while Length(DBEdit_osaidas.Text)     < 15 do DBEdit_osaidas.Text     := ' ' + DBEdit_osaidas.Text;
        while Length(DBEdit_pagamentos.Text)  < 15 do DBEdit_pagamentos.Text  := ' ' + DBEdit_pagamentos.Text;
        while Length(DBEdit_saldoi.Text)      < 13 do DBEdit_saldoi.Text      := ' ' + DBEdit_saldoi.Text;
        while Length(DBEdit_saldof.Text)      < 13 do DBEdit_saldof.Text      := ' ' + DBEdit_saldof.Text;
        while Length(DBEdit_saldoc.Text)      < 13 do DBEdit_saldoc.Text      := ' ' + DBEdit_saldoc.Text;
        while Length(DBEdit_diferen.Text)     < 13 do DBEdit_diferen.Text     := ' ' + DBEdit_diferen.Text;


        // Atualiza Valores
        with Dm.IBQ_Pesquisa, Sql do
          begin
             Close;
             Clear;
             Add('update caixa set vendas = :vendas, recebimentos = :recebimentos, outras_entradas = :outras_entradas, ');
             Add('compras = :compras, pagamentos = :pagamentos, outras_saidas = :outras_saidas, ');
             Add('saldo_fim = :saldo_fim, vlr_diferenca = :vlr_diferenca where codigo = :codigo ');

             ParamByName('vendas').AsFloat          := StrToFloat(FloatToStrF(StrToFloat(DBEdit_vendas.Text) ,ffFixed,15,2));
             ParamByName('recebimentos').AsFloat    := StrToFloat(FloatToStrF(StrToFloat(DBEdit_receb.Text)     ,ffFixed,15,2));
             ParamByName('outras_entradas').AsFloat := StrToFloat(FloatToStrF(StrToFloat(DBEdit_oentrada.Text)   ,ffFixed,15,2));
             ParamByName('compras').AsFloat         := StrToFloat(FloatToStrF(StrToFloat(DBEdit_compras.Text),ffFixed,15,2));
             ParamByName('pagamentos').AsFloat      := StrToFloat(FloatToStrF(StrToFloat(DBEdit_pagamentos.Text)      ,ffFixed,15,2));
             ParamByName('outras_saidas').AsFloat   := StrToFloat(FloatToStrF(StrToFloat(DBEdit_osaidas.Text)     ,ffFixed,15,2));
             ParamByName('saldo_fim').AsFloat       := StrToFloat(FloatToStrF(StrToFloat(DBEdit_saldof.Text)     ,ffFixed,15,2));
             ParamByName('vlr_diferenca').AsFloat   := StrToFloat(FloatToStrF(StrToFloat(DBEdit_diferen.Text) ,ffFixed,15,2));
             ParamByName('codigo').AsInteger        := StrToInt(Lbl_Codigo.Caption);
             Open;
          end;
     end;
end;
end;

end.
