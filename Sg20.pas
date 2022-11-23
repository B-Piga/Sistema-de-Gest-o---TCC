unit Sg20;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Grids, DBGrids, Db, {DBTables,} Mask, DBCtrls, Buttons,
  IBCustomDataSet, IBQuery, ComCtrls;

type
  TDlg_Socio = class(TForm)
    ds_pesquisa: TDataSource;
    DBGrid1: TDBGrid;
    Edit_pesquisa: TEdit;
    OKBtn: TButton;
    SQL_pesquisa: TIBQuery;
    RG_ordem: TRadioGroup;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    Image1: TImage;
    Shape3: TShape;
    Shape1: TShape;
    Bevel4: TBevel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    SB_Nova: TSpeedButton;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit_pesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RG_ordemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SQL_pesquisaAfterOpen(DataSet: TDataSet);
    procedure Edit_pesquisaChange(Sender: TObject);
    procedure SB_NovaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dlg_Socio: TDlg_Socio;

implementation

uses arquivos,Sg0020;

{$R *.DFM}

procedure TDlg_Socio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssAlt]) and (Key = VK_F4) then Key := VK_Clear;
  if key = vk_return   then Perform(WM_NEXTDLGCTL,0,0);
  if key = vk_f4       then close;
  if key = vk_delete   then Edit_pesquisa.clear;
  if key = vk_f5       then if SB_Nova.Visible = True then SB_Nova.Click;
end;

procedure TDlg_Socio.Edit_pesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then Edit_pesquisa.SetFocus;
  if key = VK_Escape then ModalResult := mrCancel;
  if key = vk_down   then SQL_pesquisa.Next;
  if key = vk_up     then SQL_pesquisa.Prior;
end;

procedure TDlg_Socio.RG_ordemClick(Sender: TObject);
begin
  Edit_pesquisa.SetFocus;
end;

procedure TDlg_Socio.FormShow(Sender: TObject);
begin
  if Edit_pesquisa.Text = '' then
    begin
       Edit_pesquisa.SetFocus;
       with SQL_pesquisa, SQL do
         begin
            Close;
            Clear;
            Add('select * from socio  where codigo = codigo order by nome');
            Open;
         end;
    end;
end;

procedure TDlg_Socio.SQL_pesquisaAfterOpen(DataSet: TDataSet);
begin
  (SQL_pesquisa.FieldByName('CODIGO') As TIntegerfield).DisplayFormat := '000000';
end;

procedure TDlg_Socio.Edit_pesquisaChange(Sender: TObject);
begin
  // Se digitar letra, muda para nome
  if Length(Edit_pesquisa.Text) = 1 then
     if (Copy(Edit_pesquisa.Text,1,1) >= '0') and (Copy(Edit_pesquisa.Text,1,1) <= '9') then
        RG_ordem.ItemIndex := 0
     else
        RG_ordem.ItemIndex := 1;

  // Pesquisa
  if Length(Edit_pesquisa.Text) > 0 then
    begin
       with SQL_pesquisa, SQL do
         begin
            close;
            clear;
            Add('select * from socio  where codigo = codigo');
            if RG_ordem.ItemIndex = 0 then add ('and codigo = :pesq  order by codigo');
            if RG_ordem.ItemIndex = 1 then add ('and nome like :pesq order by nome');
            if RG_ordem.ItemIndex = 0 then Parambyname('PESQ').AsInteger := StrToInt(Edit_pesquisa.Text)
            else Parambyname('PESQ').AsString := Edit_pesquisa.Text + '%';
            open;
         end;
    end
  else
    begin
       with SQL_pesquisa, SQL do
         begin
            Close;
            Clear;
            Add('select * from socio  where codigo = codigo order by nome');
            Open;
         end;
    end;
end;

procedure TDlg_Socio.SB_NovaClick(Sender: TObject);
begin
   SG_0020 := TSG_0020.Create(self);
   SG_0020.bDlg_Inc := True;
   SG_0020.ShowModal;
   SG_0020.Destroy;

   SQL_pesquisa.Close;
   SQL_pesquisa.Open;
   Edit_pesquisa.SetFocus;
end;

procedure TDlg_Socio.DBGrid1DblClick(Sender: TObject);
begin
   Dlg_Socio.ModalResult := mrOk;
end;

end.
