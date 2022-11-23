unit SGF0012P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Grids, DBGrids, Db, {DBTables,} Mask, DBCtrls, Buttons,
  IBCustomDataSet, IBQuery, ComCtrls;

type
  TDlg_Filiais = class(TForm)
    ds_pesquisa: TDataSource;
    Edit_pesquisa: TEdit;
    OKBtn: TButton;
    SQL_pesquisa: TIBQuery;
    RG_ordem: TRadioGroup;
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Shape1: TShape;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit_pesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RG_ordemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SQL_pesquisaAfterOpen(DataSet: TDataSet);
    procedure Edit_pesquisaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dlg_Filiais: TDlg_Filiais;

implementation

uses Arquivos;

{$R *.DFM}

procedure TDlg_Filiais.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssAlt]) and (Key = VK_F4) then Key := VK_Clear;

  if key=VK_RETURN then Perform(WM_NEXTDLGCTL,0,0);

  if key=vk_f4 then close;

  if key=vk_delete then Edit_pesquisa.clear;
end;

procedure TDlg_Filiais.Edit_pesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then Edit_pesquisa.SetFocus;
  if key = VK_Escape then ModalResult := mrCancel;
  if key = vk_down then SQL_pesquisa.Next;
  if key = vk_up   then SQL_pesquisa.Prior;
end;

procedure TDlg_Filiais.RG_ordemClick(Sender: TObject);
begin
  Edit_pesquisa.SetFocus;
end;

procedure TDlg_Filiais.FormShow(Sender: TObject);
begin
  Edit_pesquisa.Clear;
  Edit_pesquisa.SetFocus;
  with SQL_pesquisa, SQL do
  begin
    Close;
    Clear;
    Add ('SELECT * FROM FILIAIS ORDER BY NOME');
    Open;
  end;
end;

procedure TDlg_Filiais.SQL_pesquisaAfterOpen(DataSet: TDataSet);
begin
  (SQL_pesquisa.fieldbyname('CODIGO') As TIntegerfield).displayformat := '000000';
end;

procedure TDlg_Filiais.Edit_pesquisaChange(Sender: TObject);
begin
  if Length(Edit_pesquisa.Text) > 0 then
  begin
    with SQL_pesquisa, SQL do
    begin
      close;
      clear;
      add ('SELECT * FROM FILIAIS ');
      if RG_ordem.ItemIndex = 0 then add ('WHERE CODIGO LIKE :PESQ ORDER BY CODIGO ');
      if RG_ordem.ItemIndex = 1 then add ('WHERE NOME   LIKE :PESQ ORDER BY NOME   ');
      Parambyname('PESQ').AsString := Edit_pesquisa.Text+'%';
      open;
    end;
  end
  else
  begin
    with SQL_pesquisa, SQL do
    begin
      Close;
      Clear;
      Add ('SELECT * FROM FILIAIS ORDER BY NOME');
      Open;
    end;
  end;
end;

end.
