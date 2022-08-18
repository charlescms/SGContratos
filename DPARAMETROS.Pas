{
 Classe da tabela: Parametros - Tabela de Parametros do Sistema
}

unit DParametros;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0013,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDParametros = class(TTabela)
  public
    SeqPara: TDParametros_SeqPara;
    NumFatura: TDParametros_NumFatura;
    NumNFEmit: TDParametros_NumNFEmit;
    NumOrdCobranca: TDParametros_NumOrdCobranca;
    IRRF: TDParametros_IRRF;
    PIS_COF_CSSL: TDParametros_PIS_COF_CSSL;
    TEXTOFATURA: TDParametros_TEXTOFATURA;
    ENDERECOEMPRESA: TDParametros_ENDERECOEMPRESA;
    Usuario: TDParametros_Usuario;
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

constructor TDParametros.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'Parametros';
  Titulo           := 'Tabela de Parametros do Sistema';
  Name             := 'DParametros';
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
  DataSource.Name  := 'DsParametros';
  with UpdateSql do
  begin
    Name           := 'UpdSql_Parametros';
    // Exclusão de Registro
    DeleteSQL.Add('delete from Parametros');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  SeqPara = :OLD_SeqPara');
    // Inserção de Registro
    InsertSQL.Add('insert into Parametros');
    InsertSQL.Add('  (');
    InsertSQL.Add('  SeqPara,');
    InsertSQL.Add('  NumFatura,');
    InsertSQL.Add('  NumNFEmit,');
    InsertSQL.Add('  NumOrdCobranca,');
    InsertSQL.Add('  IRRF,');
    InsertSQL.Add('  PIS_COF_CSSL,');
    InsertSQL.Add('  TEXTOFATURA,');
    InsertSQL.Add('  ENDERECOEMPRESA,');
    InsertSQL.Add('  Usuario');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :SeqPara,');
    InsertSQL.Add('  :NumFatura,');
    InsertSQL.Add('  :NumNFEmit,');
    InsertSQL.Add('  :NumOrdCobranca,');
    InsertSQL.Add('  :IRRF,');
    InsertSQL.Add('  :PIS_COF_CSSL,');
    InsertSQL.Add('  :TEXTOFATURA,');
    InsertSQL.Add('  :ENDERECOEMPRESA,');
    InsertSQL.Add('  :Usuario');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update Parametros');
    ModifySQL.Add('set');
    ModifySQL.Add('  SeqPara = :SeqPara,');
    ModifySQL.Add('  NumFatura = :NumFatura,');
    ModifySQL.Add('  NumNFEmit = :NumNFEmit,');
    ModifySQL.Add('  NumOrdCobranca = :NumOrdCobranca,');
    ModifySQL.Add('  IRRF = :IRRF,');
    ModifySQL.Add('  PIS_COF_CSSL = :PIS_COF_CSSL,');
    ModifySQL.Add('  TEXTOFATURA = :TEXTOFATURA,');
    ModifySQL.Add('  ENDERECOEMPRESA = :ENDERECOEMPRESA,');
    ModifySQL.Add('  Usuario = :Usuario');
    ModifySQL.Add('where');
    ModifySQL.Add('  SeqPara = :OLD_SeqPara');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  Parametros.SeqPara AS SeqPara,');
    RefreshSQL.Add('  Parametros.NumFatura AS NumFatura,');
    RefreshSQL.Add('  Parametros.NumNFEmit AS NumNFEmit,');
    RefreshSQL.Add('  Parametros.NumOrdCobranca AS NumOrdCobranca,');
    RefreshSQL.Add('  Parametros.IRRF AS IRRF,');
    RefreshSQL.Add('  Parametros.PIS_COF_CSSL AS PIS_COF_CSSL,');
    RefreshSQL.Add('  Parametros.TEXTOFATURA AS TEXTOFATURA,');
    RefreshSQL.Add('  Parametros.ENDERECOEMPRESA AS ENDERECOEMPRESA,');
    RefreshSQL.Add('  Parametros.Usuario AS Usuario');
    RefreshSQL.Add('from Parametros');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  Parametros.SeqPara = :OLD_SeqPara');
  end;
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  Parametros.SeqPara AS SeqPara,');
  SqlPrincipal.Add('  Parametros.NumFatura AS NumFatura,');
  SqlPrincipal.Add('  Parametros.NumNFEmit AS NumNFEmit,');
  SqlPrincipal.Add('  Parametros.NumOrdCobranca AS NumOrdCobranca,');
  SqlPrincipal.Add('  Parametros.IRRF AS IRRF,');
  SqlPrincipal.Add('  Parametros.PIS_COF_CSSL AS PIS_COF_CSSL,');
  SqlPrincipal.Add('  Parametros.TEXTOFATURA AS TEXTOFATURA,');
  SqlPrincipal.Add('  Parametros.ENDERECOEMPRESA AS ENDERECOEMPRESA,');
  SqlPrincipal.Add('  Parametros.Usuario AS Usuario');
  SqlPrincipal.Add('from Parametros');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  Sql.Add('order by Parametros.SeqPara');
  SeqPara := TDParametros_SeqPara.Create(AOwner);
  SeqPara.Valor.DataSet := Self;
  TEXTOFATURA := TDParametros_TEXTOFATURA.Create(AOwner);
  TEXTOFATURA.Valor.DataSet := Self;
  NumNFEmit := TDParametros_NumNFEmit.Create(AOwner);
  NumNFEmit.Valor.DataSet := Self;
  ENDERECOEMPRESA := TDParametros_ENDERECOEMPRESA.Create(AOwner);
  ENDERECOEMPRESA.Valor.DataSet := Self;
  NumFatura := TDParametros_NumFatura.Create(AOwner);
  NumFatura.Valor.DataSet := Self;
  IRRF := TDParametros_IRRF.Create(AOwner);
  IRRF.Valor.DataSet := Self;
  PIS_COF_CSSL := TDParametros_PIS_COF_CSSL.Create(AOwner);
  PIS_COF_CSSL.Valor.DataSet := Self;
  Usuario := TDParametros_Usuario.Create(AOwner);
  Usuario.Valor.DataSet := Self;
  NumOrdCobranca := TDParametros_NumOrdCobranca.Create(AOwner);
  NumOrdCobranca.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(SeqPara);
//CRIANDO CAMPOS 
  Campos.Add(SeqPara);
  Campos.Add(NumFatura);
  Campos.Add(NumNFEmit);
  Campos.Add(NumOrdCobranca);
  Campos.Add(IRRF);
  Campos.Add(PIS_COF_CSSL);
  Campos.Add(TEXTOFATURA);
  Campos.Add(ENDERECOEMPRESA);
  Campos.Add(Usuario);
  TituloIndices.Add('Identificador');
  Indices.Add('Parametros.SeqPara');
  Crescente.Add('S');
  TituloPrimaria := 'Identificador';
  ChPrimaria     := 'Parametros.SeqPara';
//CRIANDO TituloIndices 
  TituloIndice   := 'Identificador';
  ChaveIndice    := 'Parametros.SeqPara';
  AfterInsert    := AtribuiMestre;
  AfterPost      := ProcessoDireto1;
  AfterCancel    := ProcessoDireto2;
  BeforePost     := AtualizaCalculados;
  BeforeEdit     := ProcessoInverso1;
  BeforeDelete   := ProcessoInverso2;
end;
////////////////////////////////
//   CRIANDO PROCEDIMENTOS    //
////////////////////////////////

procedure TDParametros.CriaForeignKeys;
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

function TDParametros.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDParametros.ExclusaoCascata;
begin
end;

function TDParametros.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
end;

function TDParametros.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('Parametros') then
    if PTabela(TabGlobal.DParametros, ['SeqPara'], [SeqPara.Valor.Value]) then
      Result := True;
end;

procedure TDParametros.CalculaCampos;
begin
end;

procedure TDParametros.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDParametros.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
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

procedure TDParametros.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDParametros.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDParametros.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDParametros.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (SeqPara.SempreAtribui) and (SeqPara.AutoIncremento > 0) then
      AutoIncremento('SeqPara', True, SeqPara.AutoIncremento);
end;

procedure TDParametros.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDParametros.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDParametros.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
