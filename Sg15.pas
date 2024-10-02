unit Sg15;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Grids, DBGrids, Db, Mask, DBCtrls, Buttons,
  IBX.IBCustomDataSet, IBX.IBQuery, ComCtrls, sLabel, sEdit, sButton, sCheckBox,
  sRadioButton, sPanel, sBitBtn, sSpeedButton;

type
  TDlg_Outros = class(TForm)
    ds_pesquisa: TDataSource;
    DBGrid1: TDBGrid;
    Edit_pesquisa: TsEdit;
    OKBtn: TsButton;
    SQL_pesquisa: TIBQuery;
    RG_Tipo: TRadioGroup;
    StatusBar1: TStatusBar;
    Panel1: TsPanel;
    Label1: TsLabel;
    Image1: TImage;
    Shape3: TShape;
    Shape1: TShape;
    Bevel4: TBevel;
    Bevel1: TBevel;
    DBNavigator1: TDBNavigator;
    Shape2: TShape;
    RG_Filtrar: TRadioGroup;
    Bevel2: TBevel;
    sLabel1: TsLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit_pesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RG_TipoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SQL_pesquisaAfterOpen(DataSet: TDataSet);
    procedure Edit_pesquisaChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dlg_Outros: TDlg_Outros;

implementation

uses arquivos, Sg0015;

{$R *.DFM}

procedure TDlg_Outros.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssAlt]) and (Key = VK_F4) then Key := VK_Clear;
  if key = vk_return   then Perform(WM_NEXTDLGCTL,0,0);
  if key = vk_f4       then close;
  if key = vk_delete   then Edit_pesquisa.clear;
end;

procedure TDlg_Outros.Edit_pesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then Edit_pesquisa.SetFocus;
  if key = VK_Escape then ModalResult := mrCancel;
  if key = vk_down   then SQL_pesquisa.Next;
  if key = vk_up     then SQL_pesquisa.Prior;
end;

procedure TDlg_Outros.RG_TipoClick(Sender: TObject);
begin
  Edit_pesquisa.SetFocus;
  Edit_pesquisa.OnChange(Sender);
end;

procedure TDlg_Outros.FormShow(Sender: TObject);
begin
  if Edit_pesquisa.Text = '' then
    begin
       Edit_pesquisa.SetFocus;
       with SQL_pesquisa, SQL do
         begin
            Close;
            Clear;
            Add('select a.*, b.dt_abertura from caixa_outros a ');
            Add('left outer join caixa b on (a.cod_caixa = b.codigo) ');
            Add('where (a.flg_ent_sai = :flg_ent_sai) ');

            if (Dm.cod_caixa <> 0) and (IntToStr(Dm.cod_caixa) <> '') and (RG_Filtrar.ItemIndex = 0) then
               Add('and (a.cod_caixa = :cod_caixa) ');

            Add('order by a.observ, b.dt_abertura ');
            if RG_Tipo.ItemIndex = 0 then ParamByName('flg_ent_sai').AsString := 'E';
            if RG_Tipo.ItemIndex = 1 then ParamByName('flg_ent_sai').AsString := 'S';

            if (Dm.cod_caixa <> 0) and (IntToStr(Dm.cod_caixa) <> '') and (RG_filtrar.ItemIndex = 0) then
               ParamByName('cod_caixa').AsInteger := Dm.cod_caixa;
            Open;
         end;
    end;
end;

procedure TDlg_Outros.SQL_pesquisaAfterOpen(DataSet: TDataSet);
begin
  (SQL_pesquisa.FieldByName('CODIGO') As TIntegerfield).displayformat := '000000';
  (SQL_pesquisa.FieldByName('vlr_lancado')  As TBCDfield).displayformat     := '###,###,##0.00';
end;

procedure TDlg_Outros.Edit_pesquisaChange(Sender: TObject);
begin
  // Pesquisa
  if Length(Edit_pesquisa.Text) > 0 then
    begin
       with SQL_pesquisa, SQL do
         begin
            close;
            clear;
            Add('select a.*, b.dt_abertura from caixa_outros a ');
            Add('left outer join caixa b on (a.cod_caixa = b.codigo) ');
            Add('where (a.flg_ent_sai = :flg_ent_sai) ');

            if (dm.cod_caixa <> 0) and (inttostr(dm.cod_caixa) <> '') and (rg_filtrar.itemindex = 0) then
               Add('and (a.cod_caixa = :cod_caixa) ');

            Add('and (Upper(A.OBSERV) LIKE :PESQ) order by a.observ, b.dt_abertura ');
            if RG_Tipo.ItemIndex = 0 then ParamByName('flg_ent_sai').AsString := 'E';
            if RG_Tipo.ItemIndex = 1 then ParamByName('flg_ent_sai').AsString := 'S';
            if (dm.cod_caixa <> 0) and (IntToStr(dm.cod_caixa) <> '') and (rg_filtrar.itemindex = 0) then
               ParamByName('cod_caixa').AsInteger := dm.cod_caixa;
            Parambyname('PESQ').AsString := Edit_pesquisa.Text + '%';
            Open;
         end;
    end
  else
    begin
       with SQL_pesquisa, SQL do
         begin
            Close;
            Clear;
            Add('select a.*, b.dt_abertura from caixa_outros a ');
            Add('left outer join caixa b on (a.cod_caixa = b.codigo) ');
            Add('where (a.flg_ent_sai = :flg_ent_sai) ');

            if (Dm.cod_caixa <> 0) and (IntToStr(Dm.cod_caixa) <> '') and (RG_Filtrar.ItemIndex = 0) then
               Add('and (a.cod_caixa = :cod_caixa) ');

            Add('order by a.observ, b.dt_abertura ');
            if RG_Tipo.ItemIndex = 0 then ParamByName('flg_ent_sai').AsString := 'E';
            if RG_Tipo.ItemIndex = 1 then ParamByName('flg_ent_sai').AsString := 'S';

            if (Dm.cod_caixa <> 0) and (IntToStr(Dm.cod_caixa) <> '') and (RG_Filtrar.ItemIndex = 0) then
               ParamByName('cod_caixa').AsInteger := dm.cod_caixa;
            Open;
         end;
    end;
end;

procedure TDlg_Outros.DBGrid1DblClick(Sender: TObject);
begin
   Dlg_Outros.ModalResult := mrOk;
end;

end.
