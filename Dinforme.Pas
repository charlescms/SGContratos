{
 Classe da tabela: Informe - Informe
}

unit DInforme;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0008,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDInforme = class(TTabela)
  public
    Contrato: TDInforme_Contrato;
    RAZAO: TDInforme_RAZAO;
    NOME: TDInforme_NOME;
    NomeMix: TDInforme_NomeMix;
    C_C: TDInforme_C_C;
    QUANTIDADETOTAL: TDInforme_QUANTIDADETOTAL;
    SDataEmbarque: TDInforme_SDataEmbarque;
    PRECOFOBTOTAL: TDInforme_PRECOFOBTOTAL;
    VALORSCCTOTAL: TDInforme_VALORSCCTOTAL;
    FORCOD: TDInforme_FORCOD;
    ID: TDInforme_ID;
    FormPago: TDInforme_FormPago;
    PrecoFOB: TDInforme_PrecoFOB;
    PrecoSCC: TDInforme_PrecoSCC;
    Quantidade: TDInforme_Quantidade;
    Navio: TDInforme_Navio;
    NAVIO_BOOCK: TDInforme_NAVIO_BOOCK;
    ETADestino: TDInforme_ETADestino;
    Fatura: TDInforme_Fatura;
    QuantidadeExp: TDInforme_QuantidadeExp;
    Valor: TDInforme_Valor;
    OBS: TDInforme_OBS;
    DataEmbarque: TDInforme_DataEmbarque;
    StatusCT: TDInforme_StatusCT;
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

constructor TDInforme.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'ContratoTransporte';
  Titulo           := 'Informe';
  Name             := 'DInforme';
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
  DataSource.Name  := 'DsInforme';
  with UpdateSql do
  begin
    Name           := 'UpdSql_Informe';
    // Exclusão de Registro
    DeleteSQL.Add('delete from ContratoTransporte');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  Contrato = :OLD_Contrato');
    // Inserção de Registro
    InsertSQL.Add('insert into ContratoTransporte');
    InsertSQL.Add('  (');
    InsertSQL.Add('  Contrato,');
    InsertSQL.Add('  NomeMix,');
    InsertSQL.Add('  C_C,');
    InsertSQL.Add('  QUANTIDADETOTAL,');
    InsertSQL.Add('  SDataEmbarque,');
    InsertSQL.Add('  PRECOFOBTOTAL,');
    InsertSQL.Add('  VALORSCCTOTAL,');
    InsertSQL.Add('  FORCOD,');
    InsertSQL.Add('  ID,');
    InsertSQL.Add('  StatusCT');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :Contrato,');
    InsertSQL.Add('  :NomeMix,');
    InsertSQL.Add('  :C_C,');
    InsertSQL.Add('  :QUANTIDADETOTAL,');
    InsertSQL.Add('  :SDataEmbarque,');
    InsertSQL.Add('  :PRECOFOBTOTAL,');
    InsertSQL.Add('  :VALORSCCTOTAL,');
    InsertSQL.Add('  :FORCOD,');
    InsertSQL.Add('  :ID,');
    InsertSQL.Add('  :StatusCT');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update ContratoTransporte');
    ModifySQL.Add('set');
    ModifySQL.Add('  Contrato = :Contrato,');
    ModifySQL.Add('  NomeMix = :NomeMix,');
    ModifySQL.Add('  C_C = :C_C,');
    ModifySQL.Add('  QUANTIDADETOTAL = :QUANTIDADETOTAL,');
    ModifySQL.Add('  SDataEmbarque = :SDataEmbarque,');
    ModifySQL.Add('  PRECOFOBTOTAL = :PRECOFOBTOTAL,');
    ModifySQL.Add('  VALORSCCTOTAL = :VALORSCCTOTAL,');
    ModifySQL.Add('  FORCOD = :FORCOD,');
    ModifySQL.Add('  ID = :ID,');
    ModifySQL.Add('  StatusCT = :StatusCT');
    ModifySQL.Add('where');
    ModifySQL.Add('  Contrato = :OLD_Contrato');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  Informe.Contrato AS Contrato,');
    RefreshSQL.Add('  Fornecedores.RAZAO AS RAZAO,');
    RefreshSQL.Add('  Tab_pais.NOME AS NOME,');
    RefreshSQL.Add('  Informe.NomeMix AS NomeMix,');
    RefreshSQL.Add('  Informe.C_C AS C_C,');
    RefreshSQL.Add('  Informe.QUANTIDADETOTAL AS QUANTIDADETOTAL,');
    RefreshSQL.Add('  Informe.SDataEmbarque AS SDataEmbarque,');
    RefreshSQL.Add('  Informe.PRECOFOBTOTAL AS PRECOFOBTOTAL,');
    RefreshSQL.Add('  Informe.VALORSCCTOTAL AS VALORSCCTOTAL,');
    RefreshSQL.Add('  Informe.FORCOD AS FORCOD,');
    RefreshSQL.Add('  Informe.ID AS ID,');
    RefreshSQL.Add('  ProdutoContratoT.FormPago AS FormPago,');
    RefreshSQL.Add('  ProdutoContratoT.PrecoFOB AS PrecoFOB,');
    RefreshSQL.Add('  ProdutoContratoT.PrecoSCC AS PrecoSCC,');
    RefreshSQL.Add('  Boocking.Quantidade AS Quantidade,');
    RefreshSQL.Add('  ExportadoTransito.Navio AS Navio,');
    RefreshSQL.Add('  Boocking.Navio AS NAVIO_BOOCK,');
    RefreshSQL.Add('  ExportadoTransito.ETADestino AS ETADestino,');
    RefreshSQL.Add('  ExportadoTransito.Fatura AS Fatura,');
    RefreshSQL.Add('  ExportadoTransito.QuantidadeExp AS QuantidadeExp,');
    RefreshSQL.Add('  ExportadoTransito.Valor AS Valor,');
    RefreshSQL.Add('  ExportadoTransito.OBS AS OBS,');
    RefreshSQL.Add('  ExportadoTransito.DataEmbarque AS DataEmbarque,');
    RefreshSQL.Add('  Informe.StatusCT AS StatusCT');
    // CRIANDO SUB-SELECT 1 
    RefreshSQL.Add('from ( SELECT '); // inicio sub-select 
    RefreshSQL.Add('  ContratoTransporte.Contrato AS Contrato,');
    RefreshSQL.Add('  ContratoTransporte.NomeMix AS NomeMix,');
    RefreshSQL.Add('  ContratoTransporte.C_C AS C_C,');
    RefreshSQL.Add('  ContratoTransporte.QUANTIDADETOTAL AS QUANTIDADETOTAL,');
    RefreshSQL.Add('  ContratoTransporte.SDataEmbarque AS SDataEmbarque,');
    RefreshSQL.Add('  ContratoTransporte.PRECOFOBTOTAL AS PRECOFOBTOTAL,');
    RefreshSQL.Add('  ContratoTransporte.VALORSCCTOTAL AS VALORSCCTOTAL,');
    RefreshSQL.Add('  ContratoTransporte.FORCOD AS FORCOD,');
    RefreshSQL.Add('  ContratoTransporte.ID AS ID,');
    RefreshSQL.Add('  ContratoTransporte.StatusCT AS StatusCT');
    RefreshSQL.Add('from ContratoTransporte'); // fim sub-select
    RefreshSQL.Add(' ) AS  Informe' );
    RefreshSQL.Add('Left Outer Join ExportadoTransito on');
    RefreshSQL.Add('  Informe.Contrato = ExportadoTransito.Contrato');
    RefreshSQL.Add('Left Outer Join Boocking on');
    RefreshSQL.Add('  Informe.Contrato = Boocking.Contrato');
    RefreshSQL.Add('Left Outer Join Fornecedores on');
    RefreshSQL.Add('  Informe.FORCOD = Fornecedores.FORCOD');
    RefreshSQL.Add('Left Outer Join Tab_pais on');
    RefreshSQL.Add('  Informe.ID = Tab_pais.ID');
    RefreshSQL.Add('Left Outer Join ProdutoContratoT on');
    RefreshSQL.Add('  Informe.Contrato = ProdutoContratoT.Contrato');
    RefreshSQL.Add('Left Outer Join Produtos on');
    RefreshSQL.Add('  Informe.NomeMix = Produtos.Produto');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  Informe.Contrato = :OLD_Contrato');
  end;
  TabelasExtras.Add('ExportadoTransito');
  TabelasExtras.Add('Boocking');
  TabelasExtras.Add('Fornecedores');
  TabelasExtras.Add('Tab_pais');
  TabelasExtras.Add('ProdutoContratoT');
  TabelasExtras.Add('Produtos');
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  Informe.Contrato AS Contrato,');
  SqlPrincipal.Add('  Fornecedores.RAZAO AS RAZAO,');
  SqlPrincipal.Add('  Tab_pais.NOME AS NOME,');
  SqlPrincipal.Add('  Informe.NomeMix AS NomeMix,');
  SqlPrincipal.Add('  Informe.C_C AS C_C,');
  SqlPrincipal.Add('  Informe.QUANTIDADETOTAL AS QUANTIDADETOTAL,');
  SqlPrincipal.Add('  Informe.SDataEmbarque AS SDataEmbarque,');
  SqlPrincipal.Add('  Informe.PRECOFOBTOTAL AS PRECOFOBTOTAL,');
  SqlPrincipal.Add('  Informe.VALORSCCTOTAL AS VALORSCCTOTAL,');
  SqlPrincipal.Add('  Informe.FORCOD AS FORCOD,');
  SqlPrincipal.Add('  Informe.ID AS ID,');
  SqlPrincipal.Add('  ProdutoContratoT.FormPago AS FormPago,');
  SqlPrincipal.Add('  ProdutoContratoT.PrecoFOB AS PrecoFOB,');
  SqlPrincipal.Add('  ProdutoContratoT.PrecoSCC AS PrecoSCC,');
  SqlPrincipal.Add('  Boocking.Quantidade AS Quantidade,');
  SqlPrincipal.Add('  ExportadoTransito.Navio AS Navio,');
  SqlPrincipal.Add('  Boocking.Navio AS NAVIO_BOOCK,');
  SqlPrincipal.Add('  ExportadoTransito.ETADestino AS ETADestino,');
  SqlPrincipal.Add('  ExportadoTransito.Fatura AS Fatura,');
  SqlPrincipal.Add('  ExportadoTransito.QuantidadeExp AS QuantidadeExp,');
  SqlPrincipal.Add('  ExportadoTransito.Valor AS Valor,');
  SqlPrincipal.Add('  ExportadoTransito.OBS AS OBS,');
  SqlPrincipal.Add('  ExportadoTransito.DataEmbarque AS DataEmbarque,');
  SqlPrincipal.Add('  Informe.StatusCT AS StatusCT');
  SqlPrincipal.Add('from ( select      ');  // inicio de sub-select
  SqlPrincipal.Add('       ContratoTransporte.Contrato AS Contrato,');
  SqlPrincipal.Add('       ContratoTransporte.NomeMix AS NomeMix,');
  SqlPrincipal.Add('       ContratoTransporte.C_C AS C_C,');
  SqlPrincipal.Add('       ContratoTransporte.QUANTIDADETOTAL AS QUANTIDADETOTAL,');
  SqlPrincipal.Add('       ContratoTransporte.SDataEmbarque AS SDataEmbarque,');
  SqlPrincipal.Add('       ContratoTransporte.PRECOFOBTOTAL AS PRECOFOBTOTAL,');
  SqlPrincipal.Add('       ContratoTransporte.VALORSCCTOTAL AS VALORSCCTOTAL,');
  SqlPrincipal.Add('       ContratoTransporte.FORCOD AS FORCOD,');
  SqlPrincipal.Add('       ContratoTransporte.ID AS ID,');
  SqlPrincipal.Add('       ContratoTransporte.StatusCT AS StatusCT');
  SqlPrincipal.Add('       from  ContratoTransporte'); // fim de sub-select
  SqlPrincipal.Add('     ) as  Informe');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  FiltroExtra.Add('Left Outer Join ExportadoTransito on');
  FiltroExtra.Add('  Informe.Contrato = ExportadoTransito.Contrato');
  FiltroExtra.Add('Left Outer Join Boocking on');
  FiltroExtra.Add('  Informe.Contrato = Boocking.Contrato');
  FiltroExtra.Add('Left Outer Join Fornecedores on');
  FiltroExtra.Add('  Informe.FORCOD = Fornecedores.FORCOD');
  FiltroExtra.Add('Left Outer Join Tab_pais on');
  FiltroExtra.Add('  Informe.ID = Tab_pais.ID');
  FiltroExtra.Add('Left Outer Join ProdutoContratoT on');
  FiltroExtra.Add('  Informe.Contrato = ProdutoContratoT.Contrato');
  FiltroExtra.Add('Left Outer Join Produtos on');
  FiltroExtra.Add('  Informe.NomeMix = Produtos.Produto');
  Sql.Add('order by Informe.Contrato');
  Contrato := TDInforme_Contrato.Create(AOwner);
  Contrato.Valor.DataSet := Self;
  NomeMix := TDInforme_NomeMix.Create(AOwner);
  NomeMix.Valor.DataSet := Self;
  C_C := TDInforme_C_C.Create(AOwner);
  C_C.Valor.DataSet := Self;
  QUANTIDADETOTAL := TDInforme_QUANTIDADETOTAL.Create(AOwner);
  QUANTIDADETOTAL.Valor.DataSet := Self;
  PRECOFOBTOTAL := TDInforme_PRECOFOBTOTAL.Create(AOwner);
  PRECOFOBTOTAL.Valor.DataSet := Self;
  NOME := TDInforme_NOME.Create(AOwner);
  NOME.Valor.DataSet := Self;
  VALORSCCTOTAL := TDInforme_VALORSCCTOTAL.Create(AOwner);
  VALORSCCTOTAL.Valor.DataSet := Self;
  FormPago := TDInforme_FormPago.Create(AOwner);
  FormPago.Valor.DataSet := Self;
  PrecoFOB := TDInforme_PrecoFOB.Create(AOwner);
  PrecoFOB.Valor.DataSet := Self;
  PrecoSCC := TDInforme_PrecoSCC.Create(AOwner);
  PrecoSCC.Valor.DataSet := Self;
  Quantidade := TDInforme_Quantidade.Create(AOwner);
  Quantidade.Valor.DataSet := Self;
  Navio := TDInforme_Navio.Create(AOwner);
  Navio.Valor.DataSet := Self;
  NAVIO_BOOCK := TDInforme_NAVIO_BOOCK.Create(AOwner);
  NAVIO_BOOCK.Valor.DataSet := Self;
  ETADestino := TDInforme_ETADestino.Create(AOwner);
  ETADestino.Valor.DataSet := Self;
  Fatura := TDInforme_Fatura.Create(AOwner);
  Fatura.Valor.DataSet := Self;
  FORCOD := TDInforme_FORCOD.Create(AOwner);
  FORCOD.Valor.DataSet := Self;
  QuantidadeExp := TDInforme_QuantidadeExp.Create(AOwner);
  QuantidadeExp.Valor.DataSet := Self;
  ID := TDInforme_ID.Create(AOwner);
  ID.Valor.DataSet := Self;
  Valor := TDInforme_Valor.Create(AOwner);
  Valor.Valor.DataSet := Self;
  OBS := TDInforme_OBS.Create(AOwner);
  OBS.Valor.DataSet := Self;
  DataEmbarque := TDInforme_DataEmbarque.Create(AOwner);
  DataEmbarque.Valor.DataSet := Self;
  RAZAO := TDInforme_RAZAO.Create(AOwner);
  RAZAO.Valor.DataSet := Self;
  StatusCT := TDInforme_StatusCT.Create(AOwner);
  StatusCT.Valor.DataSet := Self;
  SDataEmbarque := TDInforme_SDataEmbarque.Create(AOwner);
  SDataEmbarque.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(Contrato);
//CRIANDO CAMPOS 
  Campos.Add(Contrato);
  Campos.Add(RAZAO);
  Campos.Add(NOME);
  Campos.Add(NomeMix);
  Campos.Add(C_C);
  Campos.Add(QUANTIDADETOTAL);
  Campos.Add(SDataEmbarque);
  Campos.Add(PRECOFOBTOTAL);
  Campos.Add(VALORSCCTOTAL);
  Campos.Add(FORCOD);
  Campos.Add(ID);
  Campos.Add(FormPago);
  Campos.Add(PrecoFOB);
  Campos.Add(PrecoSCC);
  Campos.Add(Quantidade);
  Campos.Add(Navio);
  Campos.Add(NAVIO_BOOCK);
  Campos.Add(ETADestino);
  Campos.Add(Fatura);
  Campos.Add(QuantidadeExp);
  Campos.Add(Valor);
  Campos.Add(OBS);
  Campos.Add(DataEmbarque);
  Campos.Add(StatusCT);
  TituloIndices.Add('Contrato');
  Indices.Add('Informe.Contrato');
  Crescente.Add('S');
  TituloPrimaria := 'Contrato';
  ChPrimaria     := 'Informe.Contrato';
//CRIANDO TituloIndices 
  TituloIndice   := 'Contrato';
  ChaveIndice    := 'Informe.Contrato';
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

procedure TDInforme.CriaForeignKeys;
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

function TDInforme.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDInforme.ExclusaoCascata;
begin
end;

function TDInforme.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
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

  if UpperCase(Tabela) = UpperCase('ProdutoContratoT') then
    if (UpperCase('Contrato') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DProdutoContratoT, ['Contrato'], [Contrato.Valor.Value], [Campo], Retorno) then
        Result := True;

  if UpperCase(Tabela) = UpperCase('Boocking') then
    if (UpperCase('Contrato') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DBoocking, ['Contrato'], [Contrato.Valor.Value], [Campo], Retorno) then
        Result := True;

  if UpperCase(Tabela) = UpperCase('ExportadoTransito') then
    if (UpperCase('Contrato') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DExportadoTransito, ['Contrato'], [Contrato.Valor.Value], [Campo], Retorno) then
        Result := True;

end;

function TDInforme.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('Fornecedores') then
    if PTabela(TabGlobal.DFornecedores, ['FORCOD'], [FORCOD.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('Tab_pais') then
    if PTabela(TabGlobal.DTab_pais, ['ID'], [ID.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('ProdutoContratoT') then
    if PTabela(TabGlobal.DProdutoContratoT, ['Contrato'], [Contrato.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('Boocking') then
    if PTabela(TabGlobal.DBoocking, ['Contrato'], [Contrato.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('ExportadoTransito') then
    if PTabela(TabGlobal.DExportadoTransito, ['Contrato'], [Contrato.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('Produtos') then
    if PTabela(TabGlobal.DProdutos, ['Produto'], [NomeMix.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('ContratoTransporte') then
    if PTabela(TabGlobal.DInforme, ['Contrato'], [Contrato.Valor.Value]) then
      Result := True;
end;

procedure TDInforme.CalculaCampos;
begin
end;

procedure TDInforme.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDInforme.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
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

procedure TDInforme.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDInforme.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDInforme.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDInforme.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (Contrato.SempreAtribui) and (Contrato.AutoIncremento > 0) then
      AutoIncremento('Contrato', True, Contrato.AutoIncremento);
end;

procedure TDInforme.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDInforme.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDInforme.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
