unit Arquivos;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBDatabase, IBQuery, IniFiles, Dialogs,
  Forms, Controls, IBTable;

type
  TDm = class(TDataModule)
    IBD_SgEdu: TIBDatabase;
    IBT_SgEdu: TIBTransaction;
    IBQ_Pesquisa: TIBQuery;                  
    DS_Pesquisa: TDataSource;
    IBQ_PesqAux: TIBQuery;
    DS_PesqAux: TDataSource;
    IBDS_Receber: TIBDataSet;
    DS_Receber: TDataSource;
    IBDS_Socio: TIBDataSet;
    DS_Socio: TDataSource;
    IBDS_Empresa: TIBDataSet;
    DS_Empresa: TDataSource;
    IBD_Financ: TIBDatabase;
    IBT_Financ: TIBTransaction;
    IBQ_PesqFinanc: TIBQuery;
    DS_PesqFinanc: TDataSource;
    IBDS_Convenio: TIBDataSet;
    DS_Convenio: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure IBQ_PesquisaAfterDelete(DataSet: TDataSet);
    procedure IBDS_ReceberAfterDelete(DataSet: TDataSet);
    procedure IBDS_ReceberAfterOpen(DataSet: TDataSet);
    procedure IBDS_ReceberBeforeEdit(DataSet: TDataSet);
    procedure IBDS_SocioAfterDelete(DataSet: TDataSet);
    procedure IBDS_SocioAfterOpen(DataSet: TDataSet);
    procedure IBDS_SocioAfterPost(DataSet: TDataSet);
    procedure IBDS_SocioBeforeEdit(DataSet: TDataSet);
    procedure IBDS_EmpresaAfterDelete(DataSet: TDataSet);
    procedure IBDS_EmpresaAfterOpen(DataSet: TDataSet);
    procedure IBDS_EmpresaAfterPost(DataSet: TDataSet);
    procedure IBDS_ConvenioAfterOpen(DataSet: TDataSet);
    procedure IBDS_ConvenioAfterPost(DataSet: TDataSet);
    procedure IBDS_ConvenioAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    cod_func, func_acesso, nivel_acesso, cod_caixa : Integer;
    nome_caixa, data_caixa : String;
    { Public declarations }
  end;

var
  Dm: TDm;

implementation

uses Sg0000;

{$R *.dfm}


procedure TDm.DataModuleCreate(Sender: TObject);
var
  arq, arq2      : TextFile;
  slinha, ssenha, salias : String;
  data1, data2   : TDate;
begin
  // Captura Dados da Alias
  if FileExists('c:\alias.ini') then
    begin
      AssignFile(Arq,'c:\BVX\Config.ini');
      Reset(Arq);
  		while not eof(Arq) do
	    begin
        Readln(Arq,slinha);
        if UpperCase(Copy(slinha,01,07)) = '[SGEDU]' then
				 salias		   := Trim(Copy(slinha,09,Length(slinha)))
 				else if UpperCase(Copy(slinha,01,07)) = '[SENHA]' then
  			 ssenha      := Trim(Copy(slinha,09,20))
      end;
      // Fecha o arquivo
      CloseFile(Arq);
    end
  else
    begin
      showmessage ('O arquivo config.ini não foi encontrado! '+#13+ 'Entrar em contato com o Suporte Técnico: (14) 3372-9096.');
      Application.Terminate;
	  end;

      IBD_SgEdu.Connected    := False;
      		// Muda senha 'padrão'

		if Trim(ssenha) <> '' then
			begin
				IBD_SgEdu.Params.Clear;
				IBD_SgEdu.Params.Add('user_name=SYSDBA');
				IBD_SgEdu.Params.Add('password=' + ssenha);
			end;

      IBD_SgEdu.DatabaseName := salias;


  // Ativa Tabelas
  IBD_SgEdu.Open;
  IBT_SgEdu.Active := True;
  IBDS_Empresa.Open;


   /////////////////////
  // Rotina de Trava //
  if FileExists('c:\dt.ini') then
    begin
      AssignFile(Arq,'c:\dt.ini');  //
      Reset(Arq);
      Readln(Arq,slinha);
      data1 := StrToDate(Copy(slinha,01,10));
      data2 := StrToDate(Copy(slinha,12,10));
      if (date < data1) or (date > data2) or (data1 = data2) Then
        begin
           ShowMessage('Problema na Inicialização.' + #13 +
                       'Erro nº 2');
           Application.Terminate;
           Exit;
        end
      else
        begin
           if (data1 < Date) Then
             begin
                DeleteFile('c:\dt.ini');
                Rewrite(Arq); //append
                Write(Arq,DateToStr(Date) + '.' + DateToStr(Data2));  //writeln
             end;

           //fecha o arquivo
           CloseFile(Arq);
        end;
    end
  else
    begin
       ShowMessage('Problema na Inicialização.' + #13 +
                   'Erro nº 3');
       Application.Terminate;
       Exit;
    end;


   if FileExists('C:\BVX\alias2.ini') then
     begin
       AssignFile(Arq2,'C:\BVX\alias2.ini');
       Reset(Arq2);
       Readln(Arq2,salias);

       IBD_Financ.Connected    := False;
       IBD_Financ.DatabaseName := salias;

       // Fecha o arquivo
       CloseFile(Arq2);
     end
   else
     begin
        ShowMessage('Problema na Inicialização.' + #13 +
                    'erro: 4');
        Application.Terminate;
        Exit;
     end;
end;

procedure TDm.IBQ_PesquisaAfterDelete(DataSet: TDataSet);
begin
   IBT_SgEdu.CommitRetaining;
end;

procedure TDm.IBDS_ReceberAfterDelete(DataSet: TDataSet);
begin
   IBT_SgEdu.CommitRetaining;
end;

procedure TDm.IBDS_ReceberAfterOpen(DataSet: TDataSet);
begin
  (IBDS_Receber.FieldByName('CODIGO')      As TIntegerfield).DisplayFormat := '000000';
  (IBDS_Receber.FieldByName('COD_SOCIO')   As TNumericField).DisplayFormat := '000000';
  (IBDS_Receber.FieldByName('VLR_PARC')    As TNumericField).displayformat := '###,###,##0.00';
  (IBDS_Receber.FieldByName('VLR_ACRES')   As TNumericField).displayformat := '###,###,##0.00';
  (IBDS_Receber.FieldByName('VLR_DESC')    As TNumericField).displayformat := '###,###,##0.00';
  (IBDS_Receber.FieldByName('VLR_PAGTO')   As TNumericField).displayformat := '###,###,##0.00';
   IBDS_Receber.FieldByName('DT_EMISSAO').EditMask  := '99/99/9999;1';
   IBDS_Receber.FieldByName('DT_VENCTO').EditMask   := '99/99/9999;1';
end;

procedure TDm.IBDS_ReceberBeforeEdit(DataSet: TDataSet);
begin
  (IBDS_Receber.FieldByName('VLR_PARC')  As TNumericField).displayformat := '########0.00';
  (IBDS_Receber.FieldByName('VLR_ACRES') As TNumericField).displayformat := '########0.00';
  (IBDS_Receber.FieldByName('VLR_DESC')  As TNumericField).displayformat := '########0.00';
  (IBDS_Receber.FieldByName('VLR_PAGTO') As TNumericField).displayformat := '########0.00';
end;

procedure TDm.IBDS_SocioAfterDelete(DataSet: TDataSet);
begin
   IBT_SgEdu.CommitRetaining;
end;

procedure TDm.IBDS_SocioAfterOpen(DataSet: TDataSet);
begin
  (IBDS_Socio.FieldByName('CODIGO')   As TIntegerfield).DisplayFormat := '000000';
  (IBDS_Socio.FieldByName('COD_CONV') As TIntegerfield).DisplayFormat := '000000';
  (IBDS_Socio.FieldByName('VALOR')  As TNumericField).DisplayFormat := '###,###,##0.00';
   IBDS_Socio.FieldByName('FONE').EditMask    := '(99)9999-9999;1';
   IBDS_Socio.FieldByName('FONE1').EditMask   := '(99)9999-9999;1';
   IBDS_Socio.FieldByName('CELULAR').EditMask := '(99)9999-9999;1';
end;

procedure TDm.IBDS_SocioAfterPost(DataSet: TDataSet);
begin
   IBT_SgEdu.CommitRetaining;
end;

procedure TDm.IBDS_SocioBeforeEdit(DataSet: TDataSet);
begin
  (IBDS_Socio.FieldByName('VALOR') As TNumericField).displayformat := '########0.00';
end;

procedure TDm.IBDS_ConvenioAfterDelete(DataSet: TDataSet);
begin
    IBT_SgEdu.CommitRetaining;
end;

procedure TDm.IBDS_ConvenioAfterOpen(DataSet: TDataSet);
begin
  (IBDS_Convenio.FieldByName('CODIGO') As TIntegerfield).DisplayFormat := '000000';
   IBDS_Convenio.FieldByName('CEP').EditMask      := '99.999-999;1';
end;

procedure TDm.IBDS_ConvenioAfterPost(DataSet: TDataSet);
begin
   IBT_SgEdu.CommitRetaining;
end;

procedure TDm.IBDS_EmpresaAfterDelete(DataSet: TDataSet);
begin
    IBT_SgEdu.CommitRetaining;
end;

procedure TDm.IBDS_EmpresaAfterOpen(DataSet: TDataSet);
begin
  (IBDS_Empresa.FieldByName('CODIGO') As TIntegerfield).DisplayFormat := '000000';
   IBDS_Empresa.FieldByName('CEP').EditMask      := '99.999-999;1';
   IBDS_Empresa.FieldByName('FONE').EditMask     := '(99)9999-9999;1';
   IBDS_Empresa.FieldByName('FONE2').EditMask    := '(99)9999-9999;1';
   IBDS_Empresa.FieldByName('CNPJ').EditMask     := '99.999.999/9999-99;1';
   IBDS_Empresa.FieldByName('IE').EditMask       := '999.999.999.999;1';
end;

procedure TDm.IBDS_EmpresaAfterPost(DataSet: TDataSet);
begin
   IBT_SgEdu.CommitRetaining;
end;

end.
