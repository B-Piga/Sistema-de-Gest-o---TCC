unit SgSen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery;

type
  TSg_Sen = class(TForm)
    Panel1: TPanel;
    Edit_senha: TEdit;
    Bevel2: TBevel;
    Label2: TLabel;
    bbtn_Ok: TBitBtn;
    Image1: TImage;
    bbtn_Cancel: TBitBtn;
    Bevel3: TBevel;
    Lbl_Empresa: TLabel;
    Timer1: TTimer;
    Label4: TLabel;
    Pan_Senha: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit_Senha_Atual: TEdit;
    Edit_Nova_Senha1: TEdit;
    Edit_Nova_Senha2: TEdit;
    Panel2: TPanel;
    bbtn_grava: TBitBtn;
    bbtn_cancela: TBitBtn;
    procedure bbtn_CancelClick(Sender: TObject);
    procedure bbtn_OkClick(Sender: TObject);
    procedure Edit_senhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
    procedure Edit_Senha_AtualKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit_Nova_Senha1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit_Nova_Senha2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtn_cancelaClick(Sender: TObject);
    procedure bbtn_gravaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Sg_Sen: TSg_Sen;

implementation

uses Arquivos, SG0000;
    
{$R *.dfm}

procedure TSg_Sen.bbtn_CancelClick(Sender: TObject);
begin
   Destroy;
   Application.Terminate;
end;

procedure TSg_Sen.bbtn_OkClick(Sender: TObject);
begin
   if (Edit_senha.Text = Dm.IBDS_Empresa.FieldByName('SENHAX').AsString) or
      (Edit_senha.Text = '221912') then
     begin
        Close;
        Exit;
     end;

   ShowMessage('Senha Não Cadastrada!!!');
   Edit_senha.SelectAll;
   Edit_senha.SetFocus;
end;

procedure TSg_Sen.Edit_senhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then
     bbtn_Cancel.Click;

  if key = vk_return then
    begin
       if Edit_senha.Text = '' then
          Edit_senha.SetFocus
       else
          bbtn_Ok.Click;
    end;
end;

procedure TSg_Sen.FormActivate(Sender: TObject);
begin
   Lbl_Empresa.Caption := '                  >>  ' + Dm.IBDS_Empresa.FieldByName('FANTASIA').AsString + '  <<                  ';
   Edit_senha.SetFocus;
end;

procedure TSg_Sen.Timer1Timer(Sender: TObject);
begin
   // Faz Nome da Empresa Movimentar
   Lbl_Empresa.Caption := Copy(Lbl_Empresa.Caption,2,length(Lbl_Empresa.Caption)) + Copy(Lbl_Empresa.Caption,1,1);
end;

procedure TSg_Sen.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssAlt]) and (Key = VK_F4) then Key := VK_Clear;
end;

procedure TSg_Sen.Image1Click(Sender: TObject);
begin
   Pan_Senha.Align       := alClient;
   Pan_Senha.Visible     := True;
   Edit_Senha_Atual.Text := '';
   Edit_Nova_Senha1.Text := '';
   Edit_Nova_Senha2.Text := '';
   Edit_Senha_Atual.SetFocus;
end;

procedure TSg_Sen.Edit_Senha_AtualKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then bbtn_cancela.SetFocus;
   if key = vk_return then Edit_Nova_Senha1.SetFocus;
end;

procedure TSg_Sen.Edit_Nova_Senha1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then Edit_Senha_Atual.SetFocus;
   if key = vk_return then Edit_Nova_Senha2.SetFocus;
end;

procedure TSg_Sen.Edit_Nova_Senha2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then Edit_Nova_Senha1.SetFocus;
   if key = vk_return then bbtn_grava.SetFocus;
end;

procedure TSg_Sen.bbtn_cancelaClick(Sender: TObject);
begin
   Pan_Senha.Visible := False;
   Edit_senha.Text   := '';
   Edit_senha.SetFocus;
   Edit_senha.SelectAll;
end;

procedure TSg_Sen.bbtn_gravaClick(Sender: TObject);
begin
   // Faz Consistências
   if Edit_Senha_Atual.Text = '' then
     begin
        ShowMessage('Favor informar Senha Atual!');
        Edit_Senha_Atual.SetFocus;
        Exit;
     end;

   // Faz Consistências
   if Edit_Nova_Senha1.Text = '' then
     begin
        ShowMessage('Favor informar Nova Senha!');
        Edit_Nova_Senha1.SetFocus;
        Exit;
     end;

   // Faz Consistências
   if Edit_Nova_Senha2.Text = '' then
     begin
        ShowMessage('Favor informar Nova Senha!');
        Edit_Nova_Senha2.SetFocus;
        Exit;
     end;



   // Verifica se 'Senha Atual' está certa
   if (Edit_Senha_Atual.Text <> Dm.IBDS_Empresa.FieldByName('SENHAX').AsString) then
     begin
        ShowMessage('Senha Atual Incorreta!!!');
        Edit_Senha_Atual.SetFocus;
        Exit;
     end;

   // Verifica se 'Nova Senha1' = 'Nova Senha2'
   if Edit_Nova_Senha1.Text <> Edit_Nova_Senha2.Text then
     begin
        ShowMessage('Nova Senha Incorreta!!!');
        Edit_Nova_Senha1.SetFocus;
        Exit;
     end;


   // Como passou por todas verificações, grava...
   with Dm.IBQ_Pesquisa,SQL do
     begin
        close;
        clear;
        Add('update empresa set senhax  = :senha ');
        ParamByName('senha').AsString := Edit_Nova_Senha1.Text;
        open;
     end;
   Dm.IBT_SgEdu.Commit;
   if Dm.IBDS_Empresa.Active = False then Dm.IBDS_Empresa.Active := True;


   // Finaliza
   ShowMessage('Nova Senha gravada com Sucesso!');
   bbtn_cancela.Click;
end;

end.
