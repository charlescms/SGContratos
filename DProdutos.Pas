{
 Classe da tabela: Produtos - Tabela de Produtos
}

unit DProdutos;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0015,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDProdutos = class(TTabela)
  public
    Produto: TDProdutos_Produto;
    QUANT_PREVISTA: TDProdutos_QUANT_PREVISTA;
    VALOR_PREVISTO: TDProdutos_VALOR_PREVISTO;
    Usuario: TDProdutos_Usuario;
    Observacoes: TDProdutos_Observacoes;
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

constructor TDProdutos.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'Produtos';
  Titulo           := 'Tabela de Produtos';
  Name             := 'DProdutos';
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
  DataSource.Name  := 'DsProdutos';
  with UpdateSql do
  begin
    Name           := 'UpdSql_Produtos';
    // Exclusão de Registro
    DeleteSQL.Add('delete from Produtos');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  Produto = :OLD_Produto');
    // Inserção de Registro
    InsertSQL.Add('insert into Produtos');
    InsertSQL.Add('  (');
    InsertSQL.Add('  Produto,');
    InsertSQL.Add('  QUANT_PREVISTA,');
    InsertSQL.Add('  VALOR_PREVISTO,');
    InsertSQL.Add('  Usuario,');
    InsertSQL.Add('  Observacoes');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :Produto,');
    InsertSQL.Add('  :QUANT_PREVISTA,');
    InsertSQL.Add('  :VALOR_PREVISTO,');
    InsertSQL.Add('  :Usuario,');
    InsertSQL.Add('  :Observacoes');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update Produtos');
    ModifySQL.Add('set');
    ModifySQL.Add('  Produto = :Produto,');
    ModifySQL.Add('  QUANT_PREVISTA = :QUANT_PREVISTA,');
    ModifySQL.Add('  VALOR_PREVISTO = :VALOR_PREVISTO,');
    ModifySQL.Add('  Usuario = :Usuario,');
    ModifySQL.Add('  Observacoes = :Observacoes');
    ModifySQL.Add('where');
    ModifySQL.Add('  Produto = :OLD_Produto');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  Produtos.Produto AS Produto,');
    RefreshSQL.Add('  Produtos.QUANT_PREVISTA AS QUANT_PREVISTA,');
    RefreshSQL.Add('  Produtos.VALOR_PREVISTO AS VALOR_PREVISTO,');
    RefreshSQL.Add('  Produtos.Usuario AS Usuario,');
    RefreshSQL.Add('  Produtos.Observacoes AS Observacoes');
    RefreshSQL.Add('from Produtos');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  Produtos.Produto = :OLD_Produto');
  end;
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  Produtos.Produto AS Produto,');
  SqlPrincipal.Add('  Produtos.QUANT_PREVISTA AS QUANT_PREVISTA,');
  SqlPrincipal.Add('  Produtos.VALOR_PREVISTO AS VALOR_PREVISTO,');
  SqlPrincipal.Add('  Produtos.Usuario AS Usuario,');
  SqlPrincipal.Add('  Produtos.Observacoes AS Observacoes');
  SqlPrincipal.Add('from Produtos');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  Sql.Add('order by Produtos.Produto');
  Produto := TDProdutos_Produto.Create(AOwner);
  Produto.Valor.DataSet := Self;
  QUANT_PREVISTA := TDProdutos_QUANT_PREVISTA.Create(AOwner);
  QUANT_PREVISTA.Valor.DataSet := Self;
  VALOR_PREVISTO := TDProdutos_VALOR_PREVISTO.Create(AOwner);
  VALOR_PREVISTO.Valor.DataSet := Self;
  Usuario := TDProdutos_Usuario.Create(AOwner);
  Usuario.Valor.DataSet := Self;
  Observacoes := TDProdutos_Observacoes.Create(AOwner);
  Observacoes.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(Produto);
//CRIANDO CAMPOS 
  Campos.Add(Produto);
  Campos.Add(QUANT_PREVISTA);
  Campos.Add(VALOR_PREVISTO);
  Campos.Add(Usuario);
  Campos.Add(Observacoes);
  TituloIndices.Add('Produto');
  Indices.Add('Produtos.Produto');
  Crescente.Add('S');
  TituloPrimaria := 'Produto';
  ChPrimaria     := 'Produtos.Produto';
//CRIANDO TituloIndices 
  TituloIndice   := 'Produto';
  ChaveIndice    := 'Produtos.Produto';
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

procedure TDProdutos.CriaForeignKeys;
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

function TDProdutos.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDProdutos.ExclusaoCascata;
begin
  // Exclusão em Cascata Tabela: DPREVISAO
  TabGlobal.DPREVISAO.Filtro.Clear;
  TabGlobal.DPREVISAO.Filtro.Add('PREVISAO.Produto = :Produtos_Produto');
  TabGlobal.DPREVISAO.AtualizaSql;
  while not TabGlobal.DPREVISAO.Eof do
    if not TabGlobal.DPREVISAO.Exclui then
      TabGlobal.DPREVISAO.Next;
end;

function TDProdutos.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
end;

function TDProdutos.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('Produtos') then
    if PTabela(TabGlobal.DProdutos, ['Produto'], [Produto.Valor.Value]) then
      Result := True;
end;

procedure TDProdutos.CalculaCampos;
begin
end;

procedure TDProdutos.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
  TabGlobal.DPREVISAO.AtribuiFiltroMestre(Atribui);
end;

procedure TDProdutos.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
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

procedure TDProdutos.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDProdutos.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDProdutos.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDProdutos.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (Produto.SempreAtribui) and (Produto.AutoIncremento > 0) then
      AutoIncremento('Produto', True, Produto.AutoIncremento);
end;

procedure TDProdutos.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDProdutos.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDProdutos.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
