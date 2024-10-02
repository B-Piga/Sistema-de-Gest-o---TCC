unit Sg0007;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, DBCtrls,
  ComCtrls, DB, IBX.IBCustomDataSet, sLabel, sEdit, sButton, sCheckBox,
  sRadioButton, sPanel, sBitBtn, sSpeedButton, IBX.IBQuery;

type
  TSg_0007 = class(TForm)
    Panel1: TsPanel;
    Pan_Botao: TsPanel;
    Bbtn_Incluir: TsBitBtn;
    Bbtn_Excluir: TsBitBtn;
    Bbtn_Alterar: TsBitBtn;
    Bbtn_Gravar: TsBitBtn;
    Bbtn_Cancelar: TsBitBtn;
    Bbtn_Imprimir: TsBitBtn;
    Bbtn_Sair: TsBitBtn;
    Bbtn_Pesquisar: TsBitBtn;
    Bevel1: TBevel;
    Pan_dados: TsPanel;
    DBT_Codigo: TDBText;
    Label3: TsLabel;
    DBEdit_Nome: TDBEdit;
    sLabel5: TsLabel;
    DBEdit_DtCadastro: TDBEdit;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    Panel2: TPanel;
    DBEdit_qtd_inicial: TDBEdit;
    DBEdit_Atual: TDBEdit;
    sLabel7: TsLabel;
    Label9: TsLabel;
    sLabel6: TsLabel;
    Label5: TsLabel;
    Label11: TsLabel;
    sLabel8: TsLabel;
    sLabel9: TsLabel;
    DBEdit_custo: TDBEdit;
    DBEdit_venda: TDBEdit;
    sLabel1: TsLabel;
    DBRADIO_TIPO: TDBRadioGroup;
    procedure Manutencao(Botao: Integer; Tabela: TIBDataSet);
    procedure Bbtn_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    ComponAnt : TDBEdit;
    procedure ControlChange(Sender : TObject);
    { Private declarations }
  public
    bDlg_Inc : Boolean;
    Tela : Boolean;
    { Public declarations }
  end;

var
  Sg_0007: TSg_0007;

implementation

uses Arquivos, Sg0000, Sg07, Sg0007B;


{$R *.dfm}


procedure TSg_0007.ControlChange(Sender : TObject);
begin
   if Assigned(ComponAnt)  then ComponAnt.color  := clWhite;

   if ActiveControl is TDBEdit then
     begin
        TDBEdit(ActiveControl).Color := $0080FFFF;
        ComponAnt := TDBEdit(ActiveControl);
     end
   else
     ComponAnt := nil;
end;

procedure TSg_0007.Manutencao(Botao: Integer; Tabela: TIBDataSet);
var
  cod : integer;
begin
  case Botao of
    // Incluir
    1 : begin
        if dm.nivel_acesso > 2 then
        ShowMessage('Você não tem permissão para isso!')
        else
        begin
          Tabela.Open;
          Tabela.Append;
          Tabela.FieldByName('CODIGO').AsInteger    := 0;
          Tabela.FieldByName('NOME').AsString   := '';
          Tabela.FieldByName('DT_CADASTRO').AsDateTime         := date;
          Tabela.FieldByName('QTD_INICIAL').Asfloat        := 0;
          Tabela.FieldByName('QTD_ATUAL').AsFloat := 0;
          Tabela.FieldByName('PRECO_CUSTO').AsFloat     := 0;
          Tabela.FieldByName('PRECO_VENDA').AsFloat     := 0;
          Tabela.FieldByName('TIPO').AsInteger  := 0;
          if bDlg_Inc = True then
             Tabela.FieldByName('NOME').AsString    := Dlg_produto.Edit_pesquisa.Text;

          DBEdit_Nome.SetFocus;
        end;
    end;

    // Alterar
    3 : begin
       if dm.nivel_acesso > 2 then
        ShowMessage('Você não tem permissão para isso!')
        else
        begin
          if Tabela.RecordCount > 0 then
            begin
               Tabela.Edit;
               DBEdit_Nome.SetFocus;
            end;
        end;
    end;

    //  Gravar
    4 : begin
         cod := StrToInt(DBT_Codigo.Caption);
          Tabela.Post;
          Tabela.Close;
          if cod <> 0 then
             Tabela.ParamByName('CODIGO').AsInteger := cod
          else
            begin
               with Dm.IBQ_Pesquisa, sql do
               begin
                 close;
                 clear;
                 add('select max(codigo) cod from sub_grupo ');
                 open;
               end;
               Tabela.ParamByName('CODIGO').AsInteger := Dm.IBQ_Pesquisa.FieldByName('COD').AsInteger;
            end;
            Tabela.Open;

          // Verifica se entrou através da DLG
          if bDlg_Inc = False then
             Bbtn_Pesquisar.SetFocus
          else
             Bbtn_Sair.Click;
        end;

    // Cancelar
    5 : begin
          Tabela.Cancel;
          Tabela.Close;

          // Verifica se entrou através da DLG
          if bDlg_Inc = False then
             Bbtn_Pesquisar.SetFocus
          else
             Bbtn_Sair.Click;
        end;
    // Imprimir
    6 : begin
          SG_0007B := TSG_0007B.Create(Self);
          SG_0007B.ShowModal;
          SG_0007B.Destroy;
        end;
    // Pesquisa Categorias
    7 : begin
          Dlg_produto.Edit_pesquisa.Clear;
          if Dlg_produto.ShowModal = mrOk then
            begin
               Dm.IBDS_produto.Close;
               Dm.IBDS_produto.ParamByName('CODIGO').AsInteger   := Dlg_produto.SQL_Pesquisa.FieldByName('CODIGO').AsInteger;
               Dm.IBDS_produto.Open;
            end;
        end;

    // Finaliza Pesquisa
    8 : begin
          //99
        end;

    9 : Close;
  end;
end;

procedure TSg_0007.Bbtn_IncluirClick(Sender: TObject);
begin
  Manutencao((Sender as TsBitBtn).Tag, Dm.IBDS_produto);
end;

procedure TSg_0007.FormShow(Sender: TObject);
begin
   Dm.DS_produto.OnStateChange := StateChange;
   Screen.OnActiveControlChange    := ControlChange;
  // Verifica se entrou através da DLG
  if bDlg_Inc = False then
     Bbtn_Pesquisar.SetFocus
  else
     Bbtn_Incluir.Click;
end;

procedure TSg_0007.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (Dm.DS_produto.State <> DsBrowse) and
     (Dm.IBDS_produto.Active = True)   then
     CanClose := False;
end;

procedure TSg_0007.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssAlt]) and (Key = VK_F4) then Key := VK_Clear;
  if key = vk_return   then Perform(wm_NextDlgCtl,0,0);
  if key = vk_escape   then Perform(wm_NextDlgCtl,1,0);
end;

procedure TSg_0007.StateChange(Sender: TObject);
begin
  Pan_dados.Enabled      :=     (Dm.DS_produto.State in [DSEDIT,DSINSERT]);
  BBtn_Incluir.Enabled   := not (Dm.DS_produto.State in [DSINSERT,DSEDIT]);
  BBtn_Excluir.Enabled   :=     (Dm.DS_produto.State in [DSBROWSE]);
  BBtn_Alterar.Enabled   :=     (Dm.DS_produto.State in [DSBROWSE]);
  BBtn_Gravar.Enabled    :=      Dm.DS_produto.State in [DSINSERT,DSEDIT];
  BBtn_Cancelar.Enabled  :=      Dm.DS_produto.State in [DSINSERT,DSEDIT];

  BBtn_imprimir.Enabled  := not (Dm.DS_produto.State in [DSINSERT,DSEDIT]);
  BBtn_pesquisar.Enabled := not (Dm.DS_produto.State in [DSINSERT,DSEDIT]);
  BBtn_sair.Enabled      := not (Dm.DS_produto.State in [DSINSERT,DSEDIT]);
end;

procedure TSg_0007.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Dm.DS_produto.OnStateChange := nil;
  Dm.IBDS_produto.close;
end;

procedure TSg_0007.FormDestroy(Sender: TObject);
begin
   Screen.OnActiveControlChange := Nil;
end;

end.
