unit Sgf0003p;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Grids, DBGrids, Db, {DBTables,} Mask, DBCtrls, Buttons,
  IBCustomDataSet, IBQuery, ComCtrls;

type
  TDlg_ccusto = class(TForm)
    ds_pesquisa: TDataSource;
    Edit_pesquisa: TEdit;
    OKBtn: TButton;
    SQL_pesquisa: TIBQuery;
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
    procedure Edit_pesquisaChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    e_s : string;
    { Public declarations }
  end;

var
  Dlg_ccusto: TDlg_ccusto;

implementation

uses Arquivos;

{$R *.DFM}

procedure TDlg_ccusto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssAlt]) and (Key = VK_F4) then Key := VK_Clear;

  if key=VK_RETURN then Perform(WM_NEXTDLGCTL,0,0);

  if key=vk_f4 then close;

  if key=vk_delete then Edit_pesquisa.clear;
end;

procedure TDlg_ccusto.Edit_pesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then Edit_pesquisa.SetFocus;
  if key = VK_Escape then ModalResult := mrCancel;
  if key = vk_down then SQL_pesquisa.Next;
  if key = vk_up   then SQL_pesquisa.Prior;
end;

procedure TDlg_ccusto.RG_ordemClick(Sender: TObject);
begin
  Edit_pesquisa.SetFocus;
end;

procedure TDlg_ccusto.FormShow(Sender: TObject);
begin
  Edit_pesquisa.Clear;
  Edit_pesquisa.SetFocus;

  if e_s = 'E' Then
    Dlg_ccusto.Caption := Dlg_ccusto.Caption + ' - Entrada';
  if e_s = 'S' Then
    Dlg_ccusto.Caption := Dlg_ccusto.Caption + ' - Saída';
  
  with SQL_pesquisa, SQL do
  begin
    Close;
    Clear;
    Add ('select codigo, nome, cod_ccusto, flg_e_s from ccusto ');

    if e_s <> '' then
      Add ('where flg_e_s = :e_s ');

    Add ('order by cod_ini, cod_fim ');

    if e_s <> '' then
      ParamByName('E_S').AsString := e_s;

    Open;
  end;
end;

procedure TDlg_ccusto.Edit_pesquisaChange(Sender: TObject);
begin
  if Length(Edit_pesquisa.Text) > 0 then
    begin
      with SQL_pesquisa, SQL do
      begin
        Close;
        Clear;
        Add ('select codigo, nome, cod_ccusto, flg_e_s from ccusto ');
        Add ('where (nome like :edit) and (cod_ccusto is not null) ');

        if e_s <> '' then
          Add ('and (flg_e_s = :e_s) ');

        Add ('order by cod_ini, cod_fim ');

        if e_s <> '' then
          ParamByName('E_S').AsString  := e_s;

        ParamByName('EDIT').AsString := '%'+ Edit_pesquisa.Text + '%';
        Open;
      end;
    end
  else
    Begin
      with SQL_pesquisa, SQL do
      begin
        Close;
        Clear;
        Add ('select codigo, nome, cod_ccusto, flg_e_s from ccusto ');

        if e_s <> '' then
          Add ('where (flg_e_s = :e_s) ');

        Add ('order by cod_ini, cod_fim ');

        if e_s <> '' then
          ParamByName('E_S').AsString := e_s;
        Open;
      end;
    end;
end;

procedure TDlg_ccusto.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if SQL_pesquisa.FieldByName('COD_CCUSTO').AsString = '' then
     begin
        DBGrid1.Canvas.Font.Color := clRed;
        DBGrid1.Canvas.Font.Size  := 10;
        DBGrid1.Canvas.Font.Style := [fsBold];
     end;

   DBGrid1.Canvas.FillRect(Rect);
   DBGrid1.Canvas.TextOut(Rect.Left + 2, Rect.Top, Column.Field.Text);
end;

end.
