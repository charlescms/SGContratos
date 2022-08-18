{
 Classe da tabela: OrdemCobranca - Ordem Cobrança
}

unit DOrdemCobranca;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0009,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDOrdemCobranca = class(TTabela)
  public
    NumOrdCobranca: TDOrdemCobranca_NumOrdCobranca;
    FORCOD: TDOrdemCobranca_FORCOD;
    Cadastro: TDOrdemCobranca_Cadastro;
    FATURA: TDOrdemCobranca_FATURA;
    DataFatura: TDOrdemCobranca_DataFatura;
    Status: TDOrdemCobranca_Status;
    CTTO: TDOrdemCobranca_CTTO;
    MOEDACOMISSAO: TDOrdemCobranca_MOEDACOMISSAO;
    Valor: TDOrdemCobranca_Valor;
    ValorDesconto: TDOrdemCobranca_ValorDesconto;
    VALOR_LIQ: TDOrdemCobranca_VALOR_LIQ;
    NumNFEmit: TDOrdemCobranca_NumNFEmit;
    DataNF: TDOrdemCobranca_DataNF;
    Comentario: TDOrdemCobranca_Comentario;
    VALOR_NF: TDOrdemCobranca_VALOR_NF;
    VALOR_IRRF: TDOrdemCobranca_VALOR_IRRF;
    VALOR_PIS_COF: TDOrdemCobranca_VALOR_PIS_COF;
    VALOR_NF_LIQ: TDOrdemCobranca_VALOR_NF_LIQ;
    DataLiq: TDOrdemCobranca_DataLiq;
    DataProtesto: TDOrdemCobranca_DataProtesto;
    Recebimento: TDOrdemCobranca_Recebimento;
    VALORRECEBIDO: TDOrdemCobranca_VALORRECEBIDO;
    RAZAO: TDOrdemCobranca_RAZAO;
    NOME: TDOrdemCobranca_NOME;
    TEXTO_PADRAO: TDOrdemCobranca_TEXTO_PADRAO;
    Usuario: TDOrdemCobranca_Usuario;
    ID: TDOrdemCobranca_ID;
    TextoDsconto: TDOrdemCobranca_TextoDsconto;
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

constructor TDOrdemCobranca.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'OrdemCobranca';
  Titulo           := 'Ordem Cobrança';
  Name             := 'DOrdemCobranca';
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
  DataSource.Name  := 'DsOrdemCobranca';
  with UpdateSql do
  begin
    Name           := 'UpdSql_OrdemCobranca';
    // Exclusão de Registro
    DeleteSQL.Add('delete from OrdemCobranca');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  NumOrdCobranca = :OLD_NumOrdCobranca');
    // Inserção de Registro
    InsertSQL.Add('insert into OrdemCobranca');
    InsertSQL.Add('  (');
    InsertSQL.Add('  NumOrdCobranca,');
    InsertSQL.Add('  FORCOD,');
    InsertSQL.Add('  Cadastro,');
    InsertSQL.Add('  FATURA,');
    InsertSQL.Add('  DataFatura,');
    InsertSQL.Add('  Status,');
    InsertSQL.Add('  CTTO,');
    InsertSQL.Add('  MOEDACOMISSAO,');
    InsertSQL.Add('  Valor,');
    InsertSQL.Add('  ValorDesconto,');
    InsertSQL.Add('  VALOR_LIQ,');
    InsertSQL.Add('  NumNFEmit,');
    InsertSQL.Add('  DataNF,');
    InsertSQL.Add('  Comentario,');
    InsertSQL.Add('  VALOR_NF,');
    InsertSQL.Add('  VALOR_IRRF,');
    InsertSQL.Add('  VALOR_PIS_COF,');
    InsertSQL.Add('  VALOR_NF_LIQ,');
    InsertSQL.Add('  DataLiq,');
    InsertSQL.Add('  DataProtesto,');
    InsertSQL.Add('  Recebimento,');
    InsertSQL.Add('  VALORRECEBIDO,');
    InsertSQL.Add('  TEXTO_PADRAO,');
    InsertSQL.Add('  Usuario,');
    InsertSQL.Add('  TextoDsconto');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :NumOrdCobranca,');
    InsertSQL.Add('  :FORCOD,');
    InsertSQL.Add('  :Cadastro,');
    InsertSQL.Add('  :FATURA,');
    InsertSQL.Add('  :DataFatura,');
    InsertSQL.Add('  :Status,');
    InsertSQL.Add('  :CTTO,');
    InsertSQL.Add('  :MOEDACOMISSAO,');
    InsertSQL.Add('  :Valor,');
    InsertSQL.Add('  :ValorDesconto,');
    InsertSQL.Add('  :VALOR_LIQ,');
    InsertSQL.Add('  :NumNFEmit,');
    InsertSQL.Add('  :DataNF,');
    InsertSQL.Add('  :Comentario,');
    InsertSQL.Add('  :VALOR_NF,');
    InsertSQL.Add('  :VALOR_IRRF,');
    InsertSQL.Add('  :VALOR_PIS_COF,');
    InsertSQL.Add('  :VALOR_NF_LIQ,');
    InsertSQL.Add('  :DataLiq,');
    InsertSQL.Add('  :DataProtesto,');
    InsertSQL.Add('  :Recebimento,');
    InsertSQL.Add('  :VALORRECEBIDO,');
    InsertSQL.Add('  :TEXTO_PADRAO,');
    InsertSQL.Add('  :Usuario,');
    InsertSQL.Add('  :TextoDsconto');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update OrdemCobranca');
    ModifySQL.Add('set');
    ModifySQL.Add('  NumOrdCobranca = :NumOrdCobranca,');
    ModifySQL.Add('  FORCOD = :FORCOD,');
    ModifySQL.Add('  Cadastro = :Cadastro,');
    ModifySQL.Add('  FATURA = :FATURA,');
    ModifySQL.Add('  DataFatura = :DataFatura,');
    ModifySQL.Add('  Status = :Status,');
    ModifySQL.Add('  CTTO = :CTTO,');
    ModifySQL.Add('  MOEDACOMISSAO = :MOEDACOMISSAO,');
    ModifySQL.Add('  Valor = :Valor,');
    ModifySQL.Add('  ValorDesconto = :ValorDesconto,');
    ModifySQL.Add('  VALOR_LIQ = :VALOR_LIQ,');
    ModifySQL.Add('  NumNFEmit = :NumNFEmit,');
    ModifySQL.Add('  DataNF = :DataNF,');
    ModifySQL.Add('  Comentario = :Comentario,');
    ModifySQL.Add('  VALOR_NF = :VALOR_NF,');
    ModifySQL.Add('  VALOR_IRRF = :VALOR_IRRF,');
    ModifySQL.Add('  VALOR_PIS_COF = :VALOR_PIS_COF,');
    ModifySQL.Add('  VALOR_NF_LIQ = :VALOR_NF_LIQ,');
    ModifySQL.Add('  DataLiq = :DataLiq,');
    ModifySQL.Add('  DataProtesto = :DataProtesto,');
    ModifySQL.Add('  Recebimento = :Recebimento,');
    ModifySQL.Add('  VALORRECEBIDO = :VALORRECEBIDO,');
    ModifySQL.Add('  TEXTO_PADRAO = :TEXTO_PADRAO,');
    ModifySQL.Add('  Usuario = :Usuario,');
    ModifySQL.Add('  TextoDsconto = :TextoDsconto');
    ModifySQL.Add('where');
    ModifySQL.Add('  NumOrdCobranca = :OLD_NumOrdCobranca');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  OrdemCobranca.NumOrdCobranca AS NumOrdCobranca,');
    RefreshSQL.Add('  OrdemCobranca.FORCOD AS FORCOD,');
    RefreshSQL.Add('  OrdemCobranca.Cadastro AS Cadastro,');
    RefreshSQL.Add('  OrdemCobranca.FATURA AS FATURA,');
    RefreshSQL.Add('  OrdemCobranca.DataFatura AS DataFatura,');
    RefreshSQL.Add('  OrdemCobranca.Status AS Status,');
    RefreshSQL.Add('  OrdemCobranca.CTTO AS CTTO,');
    RefreshSQL.Add('  OrdemCobranca.MOEDACOMISSAO AS MOEDACOMISSAO,');
    RefreshSQL.Add('  OrdemCobranca.Valor AS Valor,');
    RefreshSQL.Add('  OrdemCobranca.ValorDesconto AS ValorDesconto,');
    RefreshSQL.Add('  OrdemCobranca.VALOR_LIQ AS VALOR_LIQ,');
    RefreshSQL.Add('  OrdemCobranca.NumNFEmit AS NumNFEmit,');
    RefreshSQL.Add('  OrdemCobranca.DataNF AS DataNF,');
    RefreshSQL.Add('  OrdemCobranca.Comentario AS Comentario,');
    RefreshSQL.Add('  OrdemCobranca.VALOR_NF AS VALOR_NF,');
    RefreshSQL.Add('  OrdemCobranca.VALOR_IRRF AS VALOR_IRRF,');
    RefreshSQL.Add('  OrdemCobranca.VALOR_PIS_COF AS VALOR_PIS_COF,');
    RefreshSQL.Add('  OrdemCobranca.VALOR_NF_LIQ AS VALOR_NF_LIQ,');
    RefreshSQL.Add('  OrdemCobranca.DataLiq AS DataLiq,');
    RefreshSQL.Add('  OrdemCobranca.DataProtesto AS DataProtesto,');
    RefreshSQL.Add('  OrdemCobranca.Recebimento AS Recebimento,');
    RefreshSQL.Add('  OrdemCobranca.VALORRECEBIDO AS VALORRECEBIDO,');
    RefreshSQL.Add('  Fornecedores.RAZAO AS RAZAO,');
    RefreshSQL.Add('  Tab_pais.NOME AS NOME,');
    RefreshSQL.Add('  OrdemCobranca.TEXTO_PADRAO AS TEXTO_PADRAO,');
    RefreshSQL.Add('  OrdemCobranca.Usuario AS Usuario,');
    RefreshSQL.Add('  Fornecedores.ID AS ID,');
    RefreshSQL.Add('  OrdemCobranca.TextoDsconto AS TextoDsconto');
    RefreshSQL.Add('from OrdemCobranca');
    RefreshSQL.Add('Left Outer Join Fornecedores on');
    RefreshSQL.Add('  OrdemCobranca.FORCOD = Fornecedores.FORCOD');
    RefreshSQL.Add('Left Outer Join Tab_pais on');
    RefreshSQL.Add('  Fornecedores.ID = Tab_pais.ID');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  OrdemCobranca.NumOrdCobranca = :OLD_NumOrdCobranca');
  end;
  TabelasExtras.Add('Fornecedores');
  TabelasExtras.Add('Tab_pais');
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  OrdemCobranca.NumOrdCobranca AS NumOrdCobranca,');
  SqlPrincipal.Add('  OrdemCobranca.FORCOD AS FORCOD,');
  SqlPrincipal.Add('  OrdemCobranca.Cadastro AS Cadastro,');
  SqlPrincipal.Add('  OrdemCobranca.FATURA AS FATURA,');
  SqlPrincipal.Add('  OrdemCobranca.DataFatura AS DataFatura,');
  SqlPrincipal.Add('  OrdemCobranca.Status AS Status,');
  SqlPrincipal.Add('  OrdemCobranca.CTTO AS CTTO,');
  SqlPrincipal.Add('  OrdemCobranca.MOEDACOMISSAO AS MOEDACOMISSAO,');
  SqlPrincipal.Add('  OrdemCobranca.Valor AS Valor,');
  SqlPrincipal.Add('  OrdemCobranca.ValorDesconto AS ValorDesconto,');
  SqlPrincipal.Add('  OrdemCobranca.VALOR_LIQ AS VALOR_LIQ,');
  SqlPrincipal.Add('  OrdemCobranca.NumNFEmit AS NumNFEmit,');
  SqlPrincipal.Add('  OrdemCobranca.DataNF AS DataNF,');
  SqlPrincipal.Add('  OrdemCobranca.Comentario AS Comentario,');
  SqlPrincipal.Add('  OrdemCobranca.VALOR_NF AS VALOR_NF,');
  SqlPrincipal.Add('  OrdemCobranca.VALOR_IRRF AS VALOR_IRRF,');
  SqlPrincipal.Add('  OrdemCobranca.VALOR_PIS_COF AS VALOR_PIS_COF,');
  SqlPrincipal.Add('  OrdemCobranca.VALOR_NF_LIQ AS VALOR_NF_LIQ,');
  SqlPrincipal.Add('  OrdemCobranca.DataLiq AS DataLiq,');
  SqlPrincipal.Add('  OrdemCobranca.DataProtesto AS DataProtesto,');
  SqlPrincipal.Add('  OrdemCobranca.Recebimento AS Recebimento,');
  SqlPrincipal.Add('  OrdemCobranca.VALORRECEBIDO AS VALORRECEBIDO,');
  SqlPrincipal.Add('  Fornecedores.RAZAO AS RAZAO,');
  SqlPrincipal.Add('  Tab_pais.NOME AS NOME,');
  SqlPrincipal.Add('  OrdemCobranca.TEXTO_PADRAO AS TEXTO_PADRAO,');
  SqlPrincipal.Add('  OrdemCobranca.Usuario AS Usuario,');
  SqlPrincipal.Add('  Fornecedores.ID AS ID,');
  SqlPrincipal.Add('  OrdemCobranca.TextoDsconto AS TextoDsconto');
  SqlPrincipal.Add('from OrdemCobranca');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  FiltroExtra.Add('Left Outer Join Fornecedores on');
  FiltroExtra.Add('  OrdemCobranca.FORCOD = Fornecedores.FORCOD');
  FiltroExtra.Add('Left Outer Join Tab_pais on');
  FiltroExtra.Add('  Fornecedores.ID = Tab_pais.ID');
  Sql.Add('order by OrdemCobranca.NumOrdCobranca DESC');
  NumOrdCobranca := TDOrdemCobranca_NumOrdCobranca.Create(AOwner);
  NumOrdCobranca.Valor.DataSet := Self;
  DataLiq := TDOrdemCobranca_DataLiq.Create(AOwner);
  DataLiq.Valor.DataSet := Self;
  DataFatura := TDOrdemCobranca_DataFatura.Create(AOwner);
  DataFatura.Valor.DataSet := Self;
  FATURA := TDOrdemCobranca_FATURA.Create(AOwner);
  FATURA.Valor.DataSet := Self;
  Cadastro := TDOrdemCobranca_Cadastro.Create(AOwner);
  Cadastro.Valor.DataSet := Self;
  NumNFEmit := TDOrdemCobranca_NumNFEmit.Create(AOwner);
  NumNFEmit.Valor.DataSet := Self;
  DataNF := TDOrdemCobranca_DataNF.Create(AOwner);
  DataNF.Valor.DataSet := Self;
  Valor := TDOrdemCobranca_Valor.Create(AOwner);
  Valor.Valor.DataSet := Self;
  ValorDesconto := TDOrdemCobranca_ValorDesconto.Create(AOwner);
  ValorDesconto.Valor.DataSet := Self;
  CTTO := TDOrdemCobranca_CTTO.Create(AOwner);
  CTTO.Valor.DataSet := Self;
  VALOR_NF := TDOrdemCobranca_VALOR_NF.Create(AOwner);
  VALOR_NF.Valor.DataSet := Self;
  VALOR_IRRF := TDOrdemCobranca_VALOR_IRRF.Create(AOwner);
  VALOR_IRRF.Valor.DataSet := Self;
  VALOR_LIQ := TDOrdemCobranca_VALOR_LIQ.Create(AOwner);
  VALOR_LIQ.Valor.DataSet := Self;
  RAZAO := TDOrdemCobranca_RAZAO.Create(AOwner);
  RAZAO.Valor.DataSet := Self;
  VALOR_NF_LIQ := TDOrdemCobranca_VALOR_NF_LIQ.Create(AOwner);
  VALOR_NF_LIQ.Valor.DataSet := Self;
  VALOR_PIS_COF := TDOrdemCobranca_VALOR_PIS_COF.Create(AOwner);
  VALOR_PIS_COF.Valor.DataSet := Self;
  DataProtesto := TDOrdemCobranca_DataProtesto.Create(AOwner);
  DataProtesto.Valor.DataSet := Self;
  Recebimento := TDOrdemCobranca_Recebimento.Create(AOwner);
  Recebimento.Valor.DataSet := Self;
  VALORRECEBIDO := TDOrdemCobranca_VALORRECEBIDO.Create(AOwner);
  VALORRECEBIDO.Valor.DataSet := Self;
  NOME := TDOrdemCobranca_NOME.Create(AOwner);
  NOME.Valor.DataSet := Self;
  Status := TDOrdemCobranca_Status.Create(AOwner);
  Status.Valor.DataSet := Self;
  FORCOD := TDOrdemCobranca_FORCOD.Create(AOwner);
  FORCOD.Valor.DataSet := Self;
  MOEDACOMISSAO := TDOrdemCobranca_MOEDACOMISSAO.Create(AOwner);
  MOEDACOMISSAO.Valor.DataSet := Self;
  Comentario := TDOrdemCobranca_Comentario.Create(AOwner);
  Comentario.Valor.DataSet := Self;
  TEXTO_PADRAO := TDOrdemCobranca_TEXTO_PADRAO.Create(AOwner);
  TEXTO_PADRAO.Valor.DataSet := Self;
  Usuario := TDOrdemCobranca_Usuario.Create(AOwner);
  Usuario.Valor.DataSet := Self;
  TextoDsconto := TDOrdemCobranca_TextoDsconto.Create(AOwner);
  TextoDsconto.Valor.DataSet := Self;
  ID := TDOrdemCobranca_ID.Create(AOwner);
  ID.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(NumOrdCobranca);
//CRIANDO CAMPOS 
  Campos.Add(NumOrdCobranca);
  Campos.Add(FORCOD);
  Campos.Add(Cadastro);
  Campos.Add(FATURA);
  Campos.Add(DataFatura);
  Campos.Add(Status);
  Campos.Add(CTTO);
  Campos.Add(MOEDACOMISSAO);
  Campos.Add(Valor);
  Campos.Add(ValorDesconto);
  Campos.Add(VALOR_LIQ);
  Campos.Add(NumNFEmit);
  Campos.Add(DataNF);
  Campos.Add(Comentario);
  Campos.Add(VALOR_NF);
  Campos.Add(VALOR_IRRF);
  Campos.Add(VALOR_PIS_COF);
  Campos.Add(VALOR_NF_LIQ);
  Campos.Add(DataLiq);
  Campos.Add(DataProtesto);
  Campos.Add(Recebimento);
  Campos.Add(VALORRECEBIDO);
  Campos.Add(RAZAO);
  Campos.Add(NOME);
  Campos.Add(TEXTO_PADRAO);
  Campos.Add(Usuario);
  Campos.Add(ID);
  Campos.Add(TextoDsconto);
  TituloIndices.Add('Ord. Cobrnça');
  Indices.Add('OrdemCobranca.NumOrdCobranca');
  Crescente.Add('S');
  TituloPrimaria := 'Ord. Cobrnça';
  ChPrimaria     := 'OrdemCobranca.NumOrdCobranca';
//CRIANDO TituloIndices 
  TituloIndice   := 'Ord. Cobrnça';
  ChaveIndice    := 'OrdemCobranca.NumOrdCobranca DESC';
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

procedure TDOrdemCobranca.CriaForeignKeys;
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

function TDOrdemCobranca.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDOrdemCobranca.ExclusaoCascata;
begin
  // Exclusão em Cascata Tabela: DOrdemCobrancaProdExp
  TabGlobal.DOrdemCobrancaProdExp.Filtro.Clear;
  TabGlobal.DOrdemCobrancaProdExp.Filtro.Add('OrdemCobrancaProdExp.NumOrdCobranca = :OrdemCobranca_NumOrdCobranca');
  TabGlobal.DOrdemCobrancaProdExp.AtualizaSql;
  while not TabGlobal.DOrdemCobrancaProdExp.Eof do
    if not TabGlobal.DOrdemCobrancaProdExp.Exclui then
      TabGlobal.DOrdemCobrancaProdExp.Next;
  // Exclusão em Cascata Tabela: DOrdemCobrancaDescont
  TabGlobal.DOrdemCobrancaDescont.Filtro.Clear;
  TabGlobal.DOrdemCobrancaDescont.Filtro.Add('OrdemCobrancaDescont.NumOrdCobranca = :OrdemCobranca_NumOrdCobranca');
  TabGlobal.DOrdemCobrancaDescont.AtualizaSql;
  while not TabGlobal.DOrdemCobrancaDescont.Eof do
    if not TabGlobal.DOrdemCobrancaDescont.Exclui then
      TabGlobal.DOrdemCobrancaDescont.Next;
end;

function TDOrdemCobranca.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('Fornecedores') then
    if (UpperCase('FORCOD') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DFornecedores, ['FORCOD'], [FORCOD.Valor.Value], [Campo], Retorno) then
        Result := True;

  if UpperCase(Tabela) = UpperCase('Tab_pais') then
    if (UpperCase('ID') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DTab_pais, ['ID'], [ID.Valor.Value], [Campo], Retorno) then
        Result := True;

end;

function TDOrdemCobranca.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('Fornecedores') then
    if PTabela(TabGlobal.DFornecedores, ['FORCOD'], [FORCOD.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('Tab_pais') then
    if PTabela(TabGlobal.DTab_pais, ['ID'], [ID.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('OrdemCobranca') then
    if PTabela(TabGlobal.DOrdemCobranca, ['NumOrdCobranca'], [NumOrdCobranca.Valor.Value]) then
      Result := True;
end;

procedure TDOrdemCobranca.CalculaCampos;
begin
  Valor.Conteudo := CalculaDOrdemCobranca_Valor(Self);
  ValorDesconto.Conteudo := CalculaDOrdemCobranca_ValorDesconto(Self);
  VALOR_LIQ.Conteudo := CalculaDOrdemCobranca_VALOR_LIQ(Self);
  VALOR_NF_LIQ.Conteudo := CalculaDOrdemCobranca_VALOR_NF_LIQ(Self);
end;

procedure TDOrdemCobranca.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
  TabGlobal.DOrdemCobrancaProdExp.AtribuiFiltroMestre(Atribui);
  TabGlobal.DOrdemCobrancaDescont.AtribuiFiltroMestre(Atribui);
end;

procedure TDOrdemCobranca.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
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

procedure TDOrdemCobranca.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDOrdemCobranca.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDOrdemCobranca.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDOrdemCobranca.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (NumOrdCobranca.SempreAtribui) and (NumOrdCobranca.AutoIncremento > 0) then
      AutoIncremento('NumOrdCobranca', True, NumOrdCobranca.AutoIncremento);
end;

procedure TDOrdemCobranca.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDOrdemCobranca.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDOrdemCobranca.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
