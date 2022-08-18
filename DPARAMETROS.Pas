{
 Classe da tabela: PARAMETROS - Tabela de Parametros do Sistema
}

unit DPARAMETROS;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0007,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDPARAMETROS = class(TTabela)
  public
    TEXTOFATURA: TDPARAMETROS_TEXTOFATURA;
    NumNFEmit: TDPARAMETROS_NumNFEmit;
    NumFatura: TDPARAMETROS_NumFatura;
    ENDERECOEMPRESA: TDPARAMETROS_ENDERECOEMPRESA;
    constructor Create(AOwner: TComponent); override;
    procedure CriaForeignKeys; override;
    function PodeExcluir: Boolean; override;
    procedure ExclusaoCascata; override;
    function PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean; overload; override;
    function PesquisaRelacionados(Tabela: String): Boolean; overload; override;
    procedure CalculaCampos; override;
    procedure Parametros(Tabela: TTabela); override;
    procedure AtribuiRelacionamentos(Atribui: Boolean = True); override;
    procedure AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True); override;
    procedure AtribuiMestre(DataSet: TDataSet); override;
    procedure ProcessoDireto1(DataSet: TDataSet);
    procedure ProcessoDireto2(DataSet: TDataSet);
    procedure AtualizaCalculados(DataSet: TDataSet);
    procedure ProcessoInverso1(DataSet: TDataSet);
    procedure ProcessoInverso2(DataSet: TDataSet);
  end;

implementation

uses Publicas, Validar, Rotinas, Abertura, Calculos, RotinaEd;

constructor TDPARAMETROS.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'PARAMETROS';
  Titulo           := 'Tabela de Parametros do Sistema';
  Name             := 'DPARAMETROS';
  Database         := BaseDados.BD_Base_Dados;
  {$IFDEF IBX}
  Transaction      := BaseDados.TRS_BD_Base_Dados;
  UpdateSql        := TIBUpdateSQL.Create(AOwner);
  {$ELSE}
  RequestLive      := True;
  AutoRefresh      := True;
  CachedUpdates    := True;
  UpdateSql        := TXSQLUpdateSQL.Create(AOwner);
  DatabaseName     := BaseDados.BD_Base_Dados.DatabaseName;
  {$ENDIF}
  Local            := False;
  Open_begin       := True;
  Versao           := 6;
  UsarGenerator    := True;
  TableType        := ttTable;
  DataSource.Name  := 'DsPARAMETROS';
  with UpdateSql do
  begin
    Name           := 'UpdSql_PARAMETROS';
    // Exclusão de Registro
    DeleteSQL.Add('delete from PARAMETROS');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  NumNFEmit = :OLD_NumNFEmit');
    DeleteSQL.Add('  and NumFatura = :OLD_NumFatura');
    // Inserção de Registro
    InsertSQL.Add('insert into PARAMETROS');
    InsertSQL.Add('  (');
    InsertSQL.Add('  TEXTOFATURA,');
    InsertSQL.Add('  NumNFEmit,');
    InsertSQL.Add('  NumFatura,');
    InsertSQL.Add('  ENDERECOEMPRESA');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :TEXTOFATURA,');
    InsertSQL.Add('  :NumNFEmit,');
    InsertSQL.Add('  :NumFatura,');
    InsertSQL.Add('  :ENDERECOEMPRESA');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update PARAMETROS');
    ModifySQL.Add('set');
    ModifySQL.Add('  TEXTOFATURA = :TEXTOFATURA,');
    ModifySQL.Add('  NumNFEmit = :NumNFEmit,');
    ModifySQL.Add('  NumFatura = :NumFatura,');
    ModifySQL.Add('  ENDERECOEMPRESA = :ENDERECOEMPRESA');
    ModifySQL.Add('where');
    ModifySQL.Add('  NumNFEmit = :OLD_NumNFEmit');
    ModifySQL.Add('  and NumFatura = :OLD_NumFatura');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  PARAMETROS.TEXTOFATURA AS TEXTOFATURA,');
    RefreshSQL.Add('  PARAMETROS.NumNFEmit AS NumNFEmit,');
    RefreshSQL.Add('  PARAMETROS.NumFatura AS NumFatura,');
    RefreshSQL.Add('  PARAMETROS.ENDERECOEMPRESA AS ENDERECOEMPRESA');
    RefreshSQL.Add('from PARAMETROS');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  PARAMETROS.NumNFEmit = :OLD_NumNFEmit');
    RefreshSQL.Add('  and PARAMETROS.NumFatura = :OLD_NumFatura');
  end;
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  PARAMETROS.TEXTOFATURA AS TEXTOFATURA,');
  SqlPrincipal.Add('  PARAMETROS.NumNFEmit AS NumNFEmit,');
  SqlPrincipal.Add('  PARAMETROS.NumFatura AS NumFatura,');
  SqlPrincipal.Add('  PARAMETROS.ENDERECOEMPRESA AS ENDERECOEMPRESA');
  SqlPrincipal.Add('from PARAMETROS');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  Sql.Add('order by ');
  TEXTOFATURA := TDPARAMETROS_TEXTOFATURA.Create(AOwner);
  TEXTOFATURA.Valor.DataSet := Self;
  NumNFEmit := TDPARAMETROS_NumNFEmit.Create(AOwner);
  NumNFEmit.Valor.DataSet := Self;
  ENDERECOEMPRESA := TDPARAMETROS_ENDERECOEMPRESA.Create(AOwner);
  ENDERECOEMPRESA.Valor.DataSet := Self;
  NumFatura := TDPARAMETROS_NumFatura.Create(AOwner);
  NumFatura.Valor.DataSet := Self;
  Campos.Add(TEXTOFATURA);
  Campos.Add(NumNFEmit);
  Campos.Add(NumFatura);
  Campos.Add(ENDERECOEMPRESA);
  TituloPrimaria := '';
  ChPrimaria     := '';
  TituloIndice   := '';
  ChaveIndice    := '';
  AfterInsert    := AtribuiMestre;
  AfterPost      := ProcessoDireto1;
  AfterCancel    := ProcessoDireto2;
  BeforePost     := AtualizaCalculados;
  BeforeEdit     := ProcessoInverso1;
  BeforeDelete   := ProcessoInverso2;
end;

procedure TDPARAMETROS.CriaForeignKeys;
var
  Script_ForeignKeys: TSQLScript;
begin
  if ForeignKeys.Count > 0 then
  begin
    Script_ForeignKeys := TSQLScript.Create(Self);
    with Script_ForeignKeys do
    begin
      Database         := BaseDados.BD_Base_Dados;
      {$IFDEF IBX}
      Transaction      := BaseDados.TRS_BD_Base_Dados;
      with Script do
      {$ELSE}
      DatabaseName     := BaseDados.BD_Base_Dados.DatabaseName;
      with SQL do
      {$ENDIF}
      AddStrings(ForeignKeys);
      Executar;
      Free;
    end;
  end;
end;

function TDPARAMETROS.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDPARAMETROS.ExclusaoCascata;
begin
end;

function TDPARAMETROS.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
end;

function TDPARAMETROS.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
end;

procedure TDPARAMETROS.CalculaCampos;
begin
end;

procedure TDPARAMETROS.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDPARAMETROS.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
var
  I: Integer;
begin
  Filtro.Clear;
  FiltroRelac.Clear;
  if Atribui then
  begin
  end
  else
    for I:=0 to Campos.Count-1 do
      TAtributo(Campos[I]).Valor.OnValidate := nil;
  if Atualiza then
    AtualizaSql;
end;

procedure TDPARAMETROS.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDPARAMETROS.ProcessoDireto1(DataSet: TDataSet);
var
  QueryLc: TTabela;
  EmEdicao: Boolean;
begin
  {$IFDEF IBX}
  Transaction.CommitRetaining;
  {$ELSE}
  {$ENDIF}
  Inclusao    := False;
  Modificacao := False;
end;

procedure TDPARAMETROS.ProcessoDireto2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  {$IFDEF IBX}
  Transaction.CommitRetaining;
  {$ELSE}
  {$ENDIF}
  Inclusao    := False;
  Modificacao := False;
end;

procedure TDPARAMETROS.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
end;

procedure TDPARAMETROS.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDPARAMETROS.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDPARAMETROS.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
