{
 Classe da tabela: FaturaTab - Tabela de Fatura
}

unit DFaturaTab;

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
  TDFaturaTab = class(TTabela)
  public
    NumFatura: TDFaturaTab_NumFatura;
    FORCOD: TDFaturaTab_FORCOD;
    Cadastro: TDFaturaTab_Cadastro;
    Status: TDFaturaTab_Status;
    DataFatura: TDFaturaTab_DataFatura;
    CTTO: TDFaturaTab_CTTO;
    Valor: TDFaturaTab_Valor;
    ValorDesconto: TDFaturaTab_ValorDesconto;
    VALOR_LIQ: TDFaturaTab_VALOR_LIQ;
    NumNFEmit: TDFaturaTab_NumNFEmit;
    DataNF: TDFaturaTab_DataNF;
    Comentario: TDFaturaTab_Comentario;
    VALOR_NF: TDFaturaTab_VALOR_NF;
    VALOR_IRRF: TDFaturaTab_VALOR_IRRF;
    VALOR_PIS_COF: TDFaturaTab_VALOR_PIS_COF;
    VALOR_NF_LIQ: TDFaturaTab_VALOR_NF_LIQ;
    DataLiq: TDFaturaTab_DataLiq;
    DataProtesto: TDFaturaTab_DataProtesto;
    Recebimento: TDFaturaTab_Recebimento;
    RAZAO: TDFaturaTab_RAZAO;
    CDPAIS: TDFaturaTab_CDPAIS;
    ENDERECO: TDFaturaTab_ENDERECO;
    BAI: TDFaturaTab_BAI;
    CEP: TDFaturaTab_CEP;
    CID: TDFaturaTab_CID;
    UF: TDFaturaTab_UF;
    NOME: TDFaturaTab_NOME;
    TEXTO_PADRAO: TDFaturaTab_TEXTO_PADRAO;
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

constructor TDFaturaTab.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'FaturaTab';
  Titulo           := 'Tabela de Fatura';
  Name             := 'DFaturaTab';
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
  DataSource.Name  := 'DsFaturaTab';
  with UpdateSql do
  begin
    Name           := 'UpdSql_FaturaTab';
    // Exclusão de Registro
    DeleteSQL.Add('delete from FaturaTab');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  NumFatura = :OLD_NumFatura');
    // Inserção de Registro
    InsertSQL.Add('insert into FaturaTab');
    InsertSQL.Add('  (');
    InsertSQL.Add('  NumFatura,');
    InsertSQL.Add('  FORCOD,');
    InsertSQL.Add('  Cadastro,');
    InsertSQL.Add('  Status,');
    InsertSQL.Add('  DataFatura,');
    InsertSQL.Add('  CTTO,');
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
    InsertSQL.Add('  TEXTO_PADRAO');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :NumFatura,');
    InsertSQL.Add('  :FORCOD,');
    InsertSQL.Add('  :Cadastro,');
    InsertSQL.Add('  :Status,');
    InsertSQL.Add('  :DataFatura,');
    InsertSQL.Add('  :CTTO,');
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
    InsertSQL.Add('  :TEXTO_PADRAO');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update FaturaTab');
    ModifySQL.Add('set');
    ModifySQL.Add('  NumFatura = :NumFatura,');
    ModifySQL.Add('  FORCOD = :FORCOD,');
    ModifySQL.Add('  Cadastro = :Cadastro,');
    ModifySQL.Add('  Status = :Status,');
    ModifySQL.Add('  DataFatura = :DataFatura,');
    ModifySQL.Add('  CTTO = :CTTO,');
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
    ModifySQL.Add('  TEXTO_PADRAO = :TEXTO_PADRAO');
    ModifySQL.Add('where');
    ModifySQL.Add('  NumFatura = :OLD_NumFatura');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  FaturaTab.NumFatura AS NumFatura,');
    RefreshSQL.Add('  FaturaTab.FORCOD AS FORCOD,');
    RefreshSQL.Add('  FaturaTab.Cadastro AS Cadastro,');
    RefreshSQL.Add('  FaturaTab.Status AS Status,');
    RefreshSQL.Add('  FaturaTab.DataFatura AS DataFatura,');
    RefreshSQL.Add('  FaturaTab.CTTO AS CTTO,');
    RefreshSQL.Add('  FaturaTab.Valor AS Valor,');
    RefreshSQL.Add('  FaturaTab.ValorDesconto AS ValorDesconto,');
    RefreshSQL.Add('  FaturaTab.VALOR_LIQ AS VALOR_LIQ,');
    RefreshSQL.Add('  FaturaTab.NumNFEmit AS NumNFEmit,');
    RefreshSQL.Add('  FaturaTab.DataNF AS DataNF,');
    RefreshSQL.Add('  FaturaTab.Comentario AS Comentario,');
    RefreshSQL.Add('  FaturaTab.VALOR_NF AS VALOR_NF,');
    RefreshSQL.Add('  FaturaTab.VALOR_IRRF AS VALOR_IRRF,');
    RefreshSQL.Add('  FaturaTab.VALOR_PIS_COF AS VALOR_PIS_COF,');
    RefreshSQL.Add('  FaturaTab.VALOR_NF_LIQ AS VALOR_NF_LIQ,');
    RefreshSQL.Add('  FaturaTab.DataLiq AS DataLiq,');
    RefreshSQL.Add('  FaturaTab.DataProtesto AS DataProtesto,');
    RefreshSQL.Add('  FaturaTab.Recebimento AS Recebimento,');
    RefreshSQL.Add('  Fornecedores.RAZAO AS RAZAO,');
    RefreshSQL.Add('  Fornecedores.CDPAIS AS CDPAIS,');
    RefreshSQL.Add('  Fornecedores.ENDERECO AS ENDERECO,');
    RefreshSQL.Add('  Fornecedores.BAI AS BAI,');
    RefreshSQL.Add('  Fornecedores.CEP AS CEP,');
    RefreshSQL.Add('  Fornecedores.CID AS CID,');
    RefreshSQL.Add('  Fornecedores.UF AS UF,');
    RefreshSQL.Add('  Tab_pais.NOME AS NOME,');
    RefreshSQL.Add('  FaturaTab.TEXTO_PADRAO AS TEXTO_PADRAO');
    RefreshSQL.Add('from FaturaTab');
    RefreshSQL.Add('Left Outer Join Fornecedores on');
    RefreshSQL.Add('  FaturaTab.FORCOD = Fornecedores.FORCOD');
    RefreshSQL.Add('Left Outer Join Tab_pais on');
    RefreshSQL.Add('  Fornecedores.CDPAIS = Tab_pais.ID');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  FaturaTab.NumFatura = :OLD_NumFatura');
  end;
  TabelasExtras.Add('Fornecedores');
  TabelasExtras.Add('Tab_pais');
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  FaturaTab.NumFatura AS NumFatura,');
  SqlPrincipal.Add('  FaturaTab.FORCOD AS FORCOD,');
  SqlPrincipal.Add('  FaturaTab.Cadastro AS Cadastro,');
  SqlPrincipal.Add('  FaturaTab.Status AS Status,');
  SqlPrincipal.Add('  FaturaTab.DataFatura AS DataFatura,');
  SqlPrincipal.Add('  FaturaTab.CTTO AS CTTO,');
  SqlPrincipal.Add('  FaturaTab.Valor AS Valor,');
  SqlPrincipal.Add('  FaturaTab.ValorDesconto AS ValorDesconto,');
  SqlPrincipal.Add('  FaturaTab.VALOR_LIQ AS VALOR_LIQ,');
  SqlPrincipal.Add('  FaturaTab.NumNFEmit AS NumNFEmit,');
  SqlPrincipal.Add('  FaturaTab.DataNF AS DataNF,');
  SqlPrincipal.Add('  FaturaTab.Comentario AS Comentario,');
  SqlPrincipal.Add('  FaturaTab.VALOR_NF AS VALOR_NF,');
  SqlPrincipal.Add('  FaturaTab.VALOR_IRRF AS VALOR_IRRF,');
  SqlPrincipal.Add('  FaturaTab.VALOR_PIS_COF AS VALOR_PIS_COF,');
  SqlPrincipal.Add('  FaturaTab.VALOR_NF_LIQ AS VALOR_NF_LIQ,');
  SqlPrincipal.Add('  FaturaTab.DataLiq AS DataLiq,');
  SqlPrincipal.Add('  FaturaTab.DataProtesto AS DataProtesto,');
  SqlPrincipal.Add('  FaturaTab.Recebimento AS Recebimento,');
  SqlPrincipal.Add('  Fornecedores.RAZAO AS RAZAO,');
  SqlPrincipal.Add('  Fornecedores.CDPAIS AS CDPAIS,');
  SqlPrincipal.Add('  Fornecedores.ENDERECO AS ENDERECO,');
  SqlPrincipal.Add('  Fornecedores.BAI AS BAI,');
  SqlPrincipal.Add('  Fornecedores.CEP AS CEP,');
  SqlPrincipal.Add('  Fornecedores.CID AS CID,');
  SqlPrincipal.Add('  Fornecedores.UF AS UF,');
  SqlPrincipal.Add('  Tab_pais.NOME AS NOME,');
  SqlPrincipal.Add('  FaturaTab.TEXTO_PADRAO AS TEXTO_PADRAO');
  SqlPrincipal.Add('from FaturaTab');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  FiltroExtra.Add('Left Outer Join Fornecedores on');
  FiltroExtra.Add('  FaturaTab.FORCOD = Fornecedores.FORCOD');
  FiltroExtra.Add('Left Outer Join Tab_pais on');
  FiltroExtra.Add('  Fornecedores.CDPAIS = Tab_pais.ID');
  Sql.Add('order by FaturaTab.NumFatura DESC');
  NumFatura := TDFaturaTab_NumFatura.Create(AOwner);
  NumFatura.Valor.DataSet := Self;
  DataLiq := TDFaturaTab_DataLiq.Create(AOwner);
  DataLiq.Valor.DataSet := Self;
  DataFatura := TDFaturaTab_DataFatura.Create(AOwner);
  DataFatura.Valor.DataSet := Self;
  Status := TDFaturaTab_Status.Create(AOwner);
  Status.Valor.DataSet := Self;
  Cadastro := TDFaturaTab_Cadastro.Create(AOwner);
  Cadastro.Valor.DataSet := Self;
  NumNFEmit := TDFaturaTab_NumNFEmit.Create(AOwner);
  NumNFEmit.Valor.DataSet := Self;
  DataNF := TDFaturaTab_DataNF.Create(AOwner);
  DataNF.Valor.DataSet := Self;
  Valor := TDFaturaTab_Valor.Create(AOwner);
  Valor.Valor.DataSet := Self;
  ValorDesconto := TDFaturaTab_ValorDesconto.Create(AOwner);
  ValorDesconto.Valor.DataSet := Self;
  CTTO := TDFaturaTab_CTTO.Create(AOwner);
  CTTO.Valor.DataSet := Self;
  VALOR_NF := TDFaturaTab_VALOR_NF.Create(AOwner);
  VALOR_NF.Valor.DataSet := Self;
  VALOR_IRRF := TDFaturaTab_VALOR_IRRF.Create(AOwner);
  VALOR_IRRF.Valor.DataSet := Self;
  VALOR_LIQ := TDFaturaTab_VALOR_LIQ.Create(AOwner);
  VALOR_LIQ.Valor.DataSet := Self;
  VALOR_NF_LIQ := TDFaturaTab_VALOR_NF_LIQ.Create(AOwner);
  VALOR_NF_LIQ.Valor.DataSet := Self;
  VALOR_PIS_COF := TDFaturaTab_VALOR_PIS_COF.Create(AOwner);
  VALOR_PIS_COF.Valor.DataSet := Self;
  DataProtesto := TDFaturaTab_DataProtesto.Create(AOwner);
  DataProtesto.Valor.DataSet := Self;
  Comentario := TDFaturaTab_Comentario.Create(AOwner);
  Comentario.Valor.DataSet := Self;
  Recebimento := TDFaturaTab_Recebimento.Create(AOwner);
  Recebimento.Valor.DataSet := Self;
  FORCOD := TDFaturaTab_FORCOD.Create(AOwner);
  FORCOD.Valor.DataSet := Self;
  RAZAO := TDFaturaTab_RAZAO.Create(AOwner);
  RAZAO.Valor.DataSet := Self;
  CDPAIS := TDFaturaTab_CDPAIS.Create(AOwner);
  CDPAIS.Valor.DataSet := Self;
  ENDERECO := TDFaturaTab_ENDERECO.Create(AOwner);
  ENDERECO.Valor.DataSet := Self;
  BAI := TDFaturaTab_BAI.Create(AOwner);
  BAI.Valor.DataSet := Self;
  CEP := TDFaturaTab_CEP.Create(AOwner);
  CEP.Valor.DataSet := Self;
  CID := TDFaturaTab_CID.Create(AOwner);
  CID.Valor.DataSet := Self;
  UF := TDFaturaTab_UF.Create(AOwner);
  UF.Valor.DataSet := Self;
  NOME := TDFaturaTab_NOME.Create(AOwner);
  NOME.Valor.DataSet := Self;
  TEXTO_PADRAO := TDFaturaTab_TEXTO_PADRAO.Create(AOwner);
  TEXTO_PADRAO.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(NumFatura);
//CRIANDO CAMPOS 
  Campos.Add(NumFatura);
  Campos.Add(FORCOD);
  Campos.Add(Cadastro);
  Campos.Add(Status);
  Campos.Add(DataFatura);
  Campos.Add(CTTO);
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
  Campos.Add(RAZAO);
  Campos.Add(CDPAIS);
  Campos.Add(ENDERECO);
  Campos.Add(BAI);
  Campos.Add(CEP);
  Campos.Add(CID);
  Campos.Add(UF);
  Campos.Add(NOME);
  Campos.Add(TEXTO_PADRAO);
  TituloIndices.Add('Fatura Surimpex');
  Indices.Add('FaturaTab.NumFatura');
  Crescente.Add('S');
  TituloPrimaria := 'Fatura Surimpex';
  ChPrimaria     := 'FaturaTab.NumFatura';
//CRIANDO TituloIndices 
  TituloIndice   := 'Fatura Surimpex';
  ChaveIndice    := 'FaturaTab.NumFatura DESC';
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

procedure TDFaturaTab.CriaForeignKeys;
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

function TDFaturaTab.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDFaturaTab.ExclusaoCascata;
begin
  // Exclusão em Cascata Tabela: DFaturaProdExp
  TabGlobal.DFaturaProdExp.Filtro.Clear;
  TabGlobal.DFaturaProdExp.Filtro.Add('FaturaProdExp.NumFatura = :FaturaTab_NumFatura');
  TabGlobal.DFaturaProdExp.AtualizaSql;
  while not TabGlobal.DFaturaProdExp.Eof do
    if not TabGlobal.DFaturaProdExp.Exclui then
      TabGlobal.DFaturaProdExp.Next;
  // Exclusão em Cascata Tabela: DComplementoFatura
  TabGlobal.DComplementoFatura.Filtro.Clear;
  TabGlobal.DComplementoFatura.Filtro.Add('ComplementoFatura.NumFatura = :FaturaTab_NumFatura');
  TabGlobal.DComplementoFatura.AtualizaSql;
  while not TabGlobal.DComplementoFatura.Eof do
    if not TabGlobal.DComplementoFatura.Exclui then
      TabGlobal.DComplementoFatura.Next;
end;

function TDFaturaTab.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('Fornecedores') then
    if (UpperCase('FORCOD') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DFornecedores, ['FORCOD'], [FORCOD.Valor.Value], [Campo], Retorno) then
        Result := True;

  if UpperCase(Tabela) = UpperCase('Tab_pais') then
    if (UpperCase('CDPAIS') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DTab_pais, ['ID'], [CDPAIS.Valor.Value], [Campo], Retorno) then
        Result := True;

end;

function TDFaturaTab.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('Fornecedores') then
    if PTabela(TabGlobal.DFornecedores, ['FORCOD'], [FORCOD.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('Tab_pais') then
    if PTabela(TabGlobal.DTab_pais, ['ID'], [CDPAIS.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('FaturaTab') then
    if PTabela(TabGlobal.DFaturaTab, ['NumFatura'], [NumFatura.Valor.Value]) then
      Result := True;
end;

procedure TDFaturaTab.CalculaCampos;
begin
  Valor.Conteudo := CalculaDFaturaTab_Valor(Self);
  ValorDesconto.Conteudo := CalculaDFaturaTab_ValorDesconto(Self);
  VALOR_LIQ.Conteudo := CalculaDFaturaTab_VALOR_LIQ(Self);
  VALOR_IRRF.Conteudo := CalculaDFaturaTab_VALOR_IRRF(Self);
  VALOR_PIS_COF.Conteudo := CalculaDFaturaTab_VALOR_PIS_COF(Self);
  VALOR_NF_LIQ.Conteudo := CalculaDFaturaTab_VALOR_NF_LIQ(Self);
end;

procedure TDFaturaTab.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
  TabGlobal.DFaturaProdExp.AtribuiFiltroMestre(Atribui);
  TabGlobal.DComplementoFatura.AtribuiFiltroMestre(Atribui);
end;

procedure TDFaturaTab.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
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

procedure TDFaturaTab.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDFaturaTab.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDFaturaTab.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDFaturaTab.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (NumFatura.SempreAtribui) and (NumFatura.AutoIncremento > 0) then
      AutoIncremento('NumFatura', True, NumFatura.AutoIncremento);
end;

procedure TDFaturaTab.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDFaturaTab.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDFaturaTab.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
