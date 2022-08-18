{
 Classe da tabela: CERBO - CERBO
}

unit DCERBO;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0001,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDCERBO = class(TTabela)
  public
    Contrato: TDCERBO_Contrato;
    RAZAO: TDCERBO_RAZAO;
    Navio: TDCERBO_Navio;
    DataEmbarque: TDCERBO_DataEmbarque;
    QuantidadeExp: TDCERBO_QuantidadeExp;
    Fatura: TDCERBO_Fatura;
    Comissao: TDCERBO_Comissao;
    FormComissao: TDCERBO_FormComissao;
    ComisaoSFatura: TDCERBO_ComisaoSFatura;
    NumNFEmit: TDCERBO_NumNFEmit;
    NumOrdCobranca: TDCERBO_NumOrdCobranca;
    Status: TDCERBO_Status;
    FORCOD: TDCERBO_FORCOD;
    CLICOD: TDCERBO_CLICOD;
    RAZAO_CLIENTE: TDCERBO_RAZAO_CLIENTE;
    NOME: TDCERBO_NOME;
    StatusCT: TDCERBO_StatusCT;
    Cadastro: TDCERBO_Cadastro;
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

constructor TDCERBO.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'ExportadoTransito';
  Titulo           := 'CERBO';
  Name             := 'DCERBO';
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
  Open_begin       := False;
  Versao           := 6;
  UsarGenerator    := True;
  TableType        := ttTable;
  DataSource.Name  := 'DsCERBO';
  with UpdateSql do
  begin
    Name           := 'UpdSql_CERBO';
    // Exclusão de Registro
    DeleteSQL.Add('delete from ExportadoTransito');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  Contrato = :OLD_Contrato');
    // Inserção de Registro
    InsertSQL.Add('insert into ExportadoTransito');
    InsertSQL.Add('  (');
    InsertSQL.Add('  Contrato,');
    InsertSQL.Add('  Navio,');
    InsertSQL.Add('  DataEmbarque,');
    InsertSQL.Add('  QuantidadeExp,');
    InsertSQL.Add('  Fatura,');
    InsertSQL.Add('  ComisaoSFatura,');
    InsertSQL.Add('  NumNFEmit,');
    InsertSQL.Add('  NumOrdCobranca,');
    InsertSQL.Add('  Status,');
    InsertSQL.Add('  Cadastro');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :Contrato,');
    InsertSQL.Add('  :Navio,');
    InsertSQL.Add('  :DataEmbarque,');
    InsertSQL.Add('  :QuantidadeExp,');
    InsertSQL.Add('  :Fatura,');
    InsertSQL.Add('  :ComisaoSFatura,');
    InsertSQL.Add('  :NumNFEmit,');
    InsertSQL.Add('  :NumOrdCobranca,');
    InsertSQL.Add('  :Status,');
    InsertSQL.Add('  :Cadastro');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update ExportadoTransito');
    ModifySQL.Add('set');
    ModifySQL.Add('  Contrato = :Contrato,');
    ModifySQL.Add('  Navio = :Navio,');
    ModifySQL.Add('  DataEmbarque = :DataEmbarque,');
    ModifySQL.Add('  QuantidadeExp = :QuantidadeExp,');
    ModifySQL.Add('  Fatura = :Fatura,');
    ModifySQL.Add('  ComisaoSFatura = :ComisaoSFatura,');
    ModifySQL.Add('  NumNFEmit = :NumNFEmit,');
    ModifySQL.Add('  NumOrdCobranca = :NumOrdCobranca,');
    ModifySQL.Add('  Status = :Status,');
    ModifySQL.Add('  Cadastro = :Cadastro');
    ModifySQL.Add('where');
    ModifySQL.Add('  Contrato = :OLD_Contrato');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  CERBO.Contrato AS Contrato,');
    RefreshSQL.Add('  Fornecedores.RAZAO AS RAZAO,');
    RefreshSQL.Add('  CERBO.Navio AS Navio,');
    RefreshSQL.Add('  CERBO.DataEmbarque AS DataEmbarque,');
    RefreshSQL.Add('  CERBO.QuantidadeExp AS QuantidadeExp,');
    RefreshSQL.Add('  CERBO.Fatura AS Fatura,');
    RefreshSQL.Add('  ContratoTransporte.Comissao AS Comissao,');
    RefreshSQL.Add('  ContratoTransporte.FormComissao AS FormComissao,');
    RefreshSQL.Add('  CERBO.ComisaoSFatura AS ComisaoSFatura,');
    RefreshSQL.Add('  CERBO.NumNFEmit AS NumNFEmit,');
    RefreshSQL.Add('  CERBO.NumOrdCobranca AS NumOrdCobranca,');
    RefreshSQL.Add('  CERBO.Status AS Status,');
    RefreshSQL.Add('  ContratoTransporte.FORCOD AS FORCOD,');
    RefreshSQL.Add('  ContratoTransporte.CLICOD AS CLICOD,');
    RefreshSQL.Add('  Clientes.RAZAO AS RAZAO_CLIENTE,');
    RefreshSQL.Add('  Divisoes.NOME AS NOME,');
    RefreshSQL.Add('  ContratoTransporte.StatusCT AS StatusCT,');
    RefreshSQL.Add('  CERBO.Cadastro AS Cadastro');
    // CRIANDO SUB-SELECT 1 
    RefreshSQL.Add('from ( SELECT '); // inicio sub-select 
    RefreshSQL.Add('  ExportadoTransito.Contrato AS Contrato,');
    RefreshSQL.Add('  ExportadoTransito.Navio AS Navio,');
    RefreshSQL.Add('  ExportadoTransito.DataEmbarque AS DataEmbarque,');
    RefreshSQL.Add('  ExportadoTransito.QuantidadeExp AS QuantidadeExp,');
    RefreshSQL.Add('  ExportadoTransito.Fatura AS Fatura,');
    RefreshSQL.Add('  ExportadoTransito.ComisaoSFatura AS ComisaoSFatura,');
    RefreshSQL.Add('  ExportadoTransito.NumNFEmit AS NumNFEmit,');
    RefreshSQL.Add('  ExportadoTransito.NumOrdCobranca AS NumOrdCobranca,');
    RefreshSQL.Add('  ExportadoTransito.Status AS Status,');
    RefreshSQL.Add('  ExportadoTransito.Cadastro AS Cadastro');
    RefreshSQL.Add('from ExportadoTransito'); // fim sub-select
    RefreshSQL.Add(' ) AS  CERBO' );
    RefreshSQL.Add('Left Outer Join ContratoTransporte on');
    RefreshSQL.Add('  CERBO.Contrato = ContratoTransporte.Contrato');
    RefreshSQL.Add('Left Outer Join Fornecedores on');
    RefreshSQL.Add('  ContratoTransporte.FORCOD = Fornecedores.FORCOD');
    RefreshSQL.Add('Left Outer Join Clientes on');
    RefreshSQL.Add('  ContratoTransporte.CLICOD = Clientes.CLICOD');
    RefreshSQL.Add('Left Outer Join Divisoes on');
    RefreshSQL.Add('  ContratoTransporte.CLICOD = Divisoes.CLICOD');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  CERBO.Contrato = :OLD_Contrato');
  end;
  TabelasExtras.Add('ContratoTransporte');
  TabelasExtras.Add('Fornecedores');
  TabelasExtras.Add('Clientes');
  TabelasExtras.Add('Divisoes');
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  CERBO.Contrato AS Contrato,');
  SqlPrincipal.Add('  Fornecedores.RAZAO AS RAZAO,');
  SqlPrincipal.Add('  CERBO.Navio AS Navio,');
  SqlPrincipal.Add('  CERBO.DataEmbarque AS DataEmbarque,');
  SqlPrincipal.Add('  CERBO.QuantidadeExp AS QuantidadeExp,');
  SqlPrincipal.Add('  CERBO.Fatura AS Fatura,');
  SqlPrincipal.Add('  ContratoTransporte.Comissao AS Comissao,');
  SqlPrincipal.Add('  ContratoTransporte.FormComissao AS FormComissao,');
  SqlPrincipal.Add('  CERBO.ComisaoSFatura AS ComisaoSFatura,');
  SqlPrincipal.Add('  CERBO.NumNFEmit AS NumNFEmit,');
  SqlPrincipal.Add('  CERBO.NumOrdCobranca AS NumOrdCobranca,');
  SqlPrincipal.Add('  CERBO.Status AS Status,');
  SqlPrincipal.Add('  ContratoTransporte.FORCOD AS FORCOD,');
  SqlPrincipal.Add('  ContratoTransporte.CLICOD AS CLICOD,');
  SqlPrincipal.Add('  Clientes.RAZAO AS RAZAO_CLIENTE,');
  SqlPrincipal.Add('  Divisoes.NOME AS NOME,');
  SqlPrincipal.Add('  ContratoTransporte.StatusCT AS StatusCT,');
  SqlPrincipal.Add('  CERBO.Cadastro AS Cadastro');
  SqlPrincipal.Add('from ( select      ');  // inicio de sub-select
  SqlPrincipal.Add('       ExportadoTransito.Contrato AS Contrato,');
  SqlPrincipal.Add('       ExportadoTransito.Navio AS Navio,');
  SqlPrincipal.Add('       ExportadoTransito.DataEmbarque AS DataEmbarque,');
  SqlPrincipal.Add('       ExportadoTransito.QuantidadeExp AS QuantidadeExp,');
  SqlPrincipal.Add('       ExportadoTransito.Fatura AS Fatura,');
  SqlPrincipal.Add('       ExportadoTransito.ComisaoSFatura AS ComisaoSFatura,');
  SqlPrincipal.Add('       ExportadoTransito.NumNFEmit AS NumNFEmit,');
  SqlPrincipal.Add('       ExportadoTransito.NumOrdCobranca AS NumOrdCobranca,');
  SqlPrincipal.Add('       ExportadoTransito.Status AS Status,');
  SqlPrincipal.Add('       ExportadoTransito.Cadastro AS Cadastro');
  SqlPrincipal.Add('       from  ExportadoTransito'); // fim de sub-select
  SqlPrincipal.Add('     ) as  CERBO');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  FiltroExtra.Add('Left Outer Join ContratoTransporte on');
  FiltroExtra.Add('  CERBO.Contrato = ContratoTransporte.Contrato');
  FiltroExtra.Add('Left Outer Join Fornecedores on');
  FiltroExtra.Add('  ContratoTransporte.FORCOD = Fornecedores.FORCOD');
  FiltroExtra.Add('Left Outer Join Clientes on');
  FiltroExtra.Add('  ContratoTransporte.CLICOD = Clientes.CLICOD');
  FiltroExtra.Add('Left Outer Join Divisoes on');
  FiltroExtra.Add('  ContratoTransporte.CLICOD = Divisoes.CLICOD');
  Sql.Add('order by ContratoTransporte.CLICOD,CERBO.Contrato');
  Contrato := TDCERBO_Contrato.Create(AOwner);
  Contrato.Valor.DataSet := Self;
  RAZAO := TDCERBO_RAZAO.Create(AOwner);
  RAZAO.Valor.DataSet := Self;
  Navio := TDCERBO_Navio.Create(AOwner);
  Navio.Valor.DataSet := Self;
  DataEmbarque := TDCERBO_DataEmbarque.Create(AOwner);
  DataEmbarque.Valor.DataSet := Self;
  QuantidadeExp := TDCERBO_QuantidadeExp.Create(AOwner);
  QuantidadeExp.Valor.DataSet := Self;
  Fatura := TDCERBO_Fatura.Create(AOwner);
  Fatura.Valor.DataSet := Self;
  Comissao := TDCERBO_Comissao.Create(AOwner);
  Comissao.Valor.DataSet := Self;
  FormComissao := TDCERBO_FormComissao.Create(AOwner);
  FormComissao.Valor.DataSet := Self;
  ComisaoSFatura := TDCERBO_ComisaoSFatura.Create(AOwner);
  ComisaoSFatura.Valor.DataSet := Self;
  NumNFEmit := TDCERBO_NumNFEmit.Create(AOwner);
  NumNFEmit.Valor.DataSet := Self;
  FORCOD := TDCERBO_FORCOD.Create(AOwner);
  FORCOD.Valor.DataSet := Self;
  CLICOD := TDCERBO_CLICOD.Create(AOwner);
  CLICOD.Valor.DataSet := Self;
  RAZAO_CLIENTE := TDCERBO_RAZAO_CLIENTE.Create(AOwner);
  RAZAO_CLIENTE.Valor.DataSet := Self;
  NOME := TDCERBO_NOME.Create(AOwner);
  NOME.Valor.DataSet := Self;
  StatusCT := TDCERBO_StatusCT.Create(AOwner);
  StatusCT.Valor.DataSet := Self;
  Cadastro := TDCERBO_Cadastro.Create(AOwner);
  Cadastro.Valor.DataSet := Self;
  NumOrdCobranca := TDCERBO_NumOrdCobranca.Create(AOwner);
  NumOrdCobranca.Valor.DataSet := Self;
  Status := TDCERBO_Status.Create(AOwner);
  Status.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(Contrato);
//CRIANDO CAMPOS 
  Campos.Add(Contrato);
  Campos.Add(RAZAO);
  Campos.Add(Navio);
  Campos.Add(DataEmbarque);
  Campos.Add(QuantidadeExp);
  Campos.Add(Fatura);
  Campos.Add(Comissao);
  Campos.Add(FormComissao);
  Campos.Add(ComisaoSFatura);
  Campos.Add(NumNFEmit);
  Campos.Add(NumOrdCobranca);
  Campos.Add(Status);
  Campos.Add(FORCOD);
  Campos.Add(CLICOD);
  Campos.Add(RAZAO_CLIENTE);
  Campos.Add(NOME);
  Campos.Add(StatusCT);
  Campos.Add(Cadastro);
  TituloIndices.Add('Contrato');
  Indices.Add('CERBO.Contrato');
  Crescente.Add('S');
  TituloPrimaria := 'Contrato';
  ChPrimaria     := 'CERBO.Contrato';
//CRIANDO TituloIndices 
  TituloIndice   := 'Cliente,Contrato';
  ChaveIndice    := 'ContratoTransporte.CLICOD,CERBO.Contrato';
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

procedure TDCERBO.CriaForeignKeys;
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

function TDCERBO.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDCERBO.ExclusaoCascata;
begin
end;

function TDCERBO.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('Fornecedores') then
    if (UpperCase('FORCOD') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DFornecedores, ['FORCOD'], [FORCOD.Valor.Value], [Campo], Retorno) then
        Result := True;

  if UpperCase(Tabela) = UpperCase('ContratoTransporte') then
    if (UpperCase('Contrato') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], [Campo], Retorno) then
        Result := True;

  if UpperCase(Tabela) = UpperCase('Clientes') then
    if (UpperCase('CLICOD') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DClientes, ['CLICOD'], [CLICOD.Valor.Value], [Campo], Retorno) then
        Result := True;

  if UpperCase(Tabela) = UpperCase('Divisoes') then
    if (UpperCase('CLICOD') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DDivisoes, ['CLICOD'], [CLICOD.Valor.Value], [Campo], Retorno) then
        Result := True;

end;

function TDCERBO.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('Fornecedores') then
    if PTabela(TabGlobal.DFornecedores, ['FORCOD'], [FORCOD.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('ContratoTransporte') then
    if PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('Clientes') then
    if PTabela(TabGlobal.DClientes, ['CLICOD'], [CLICOD.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('Divisoes') then
    if PTabela(TabGlobal.DDivisoes, ['CLICOD'], [CLICOD.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('ExportadoTransito') then
    if PTabela(TabGlobal.DCERBO, ['Contrato'], [Contrato.Valor.Value]) then
      Result := True;
end;

procedure TDCERBO.CalculaCampos;
begin
end;

procedure TDCERBO.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDCERBO.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
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

procedure TDCERBO.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDCERBO.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDCERBO.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDCERBO.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (Contrato.SempreAtribui) and (Contrato.AutoIncremento > 0) then
      AutoIncremento('Contrato', True, Contrato.AutoIncremento);
end;

procedure TDCERBO.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDCERBO.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDCERBO.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
