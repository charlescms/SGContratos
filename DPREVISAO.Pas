{
 Classe da tabela: PREVISAO - Tabela de Previsao 
}

unit DPREVISAO;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0012,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDPREVISAO = class(TTabela)
  public
    Produto: TDPREVISAO_Produto;
    ANO_PREVISAO: TDPREVISAO_ANO_PREVISAO;
    QUANT_PREVISTA: TDPREVISAO_QUANT_PREVISTA;
    VALOR_PREVISTO: TDPREVISAO_VALOR_PREVISTO;
    Usuario: TDPREVISAO_Usuario;
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

constructor TDPREVISAO.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'PREVISAO';
  Titulo           := 'Tabela de Previsao ';
  Name             := 'DPREVISAO';
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
  DataSource.Name  := 'DsPREVISAO';
  with UpdateSql do
  begin
    Name           := 'UpdSql_PREVISAO';
    // Exclusão de Registro
    DeleteSQL.Add('delete from PREVISAO');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  Produto = :OLD_Produto');
    DeleteSQL.Add('  and ANO_PREVISAO = :OLD_ANO_PREVISAO');
    // Inserção de Registro
    InsertSQL.Add('insert into PREVISAO');
    InsertSQL.Add('  (');
    InsertSQL.Add('  Produto,');
    InsertSQL.Add('  ANO_PREVISAO,');
    InsertSQL.Add('  QUANT_PREVISTA,');
    InsertSQL.Add('  VALOR_PREVISTO,');
    InsertSQL.Add('  Usuario');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :Produto,');
    InsertSQL.Add('  :ANO_PREVISAO,');
    InsertSQL.Add('  :QUANT_PREVISTA,');
    InsertSQL.Add('  :VALOR_PREVISTO,');
    InsertSQL.Add('  :Usuario');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update PREVISAO');
    ModifySQL.Add('set');
    ModifySQL.Add('  Produto = :Produto,');
    ModifySQL.Add('  ANO_PREVISAO = :ANO_PREVISAO,');
    ModifySQL.Add('  QUANT_PREVISTA = :QUANT_PREVISTA,');
    ModifySQL.Add('  VALOR_PREVISTO = :VALOR_PREVISTO,');
    ModifySQL.Add('  Usuario = :Usuario');
    ModifySQL.Add('where');
    ModifySQL.Add('  Produto = :OLD_Produto');
    ModifySQL.Add('  and ANO_PREVISAO = :OLD_ANO_PREVISAO');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  PREVISAO.Produto AS Produto,');
    RefreshSQL.Add('  PREVISAO.ANO_PREVISAO AS ANO_PREVISAO,');
    RefreshSQL.Add('  PREVISAO.QUANT_PREVISTA AS QUANT_PREVISTA,');
    RefreshSQL.Add('  PREVISAO.VALOR_PREVISTO AS VALOR_PREVISTO,');
    RefreshSQL.Add('  PREVISAO.Usuario AS Usuario');
    RefreshSQL.Add('from PREVISAO');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  PREVISAO.Produto = :OLD_Produto');
    RefreshSQL.Add('  and PREVISAO.ANO_PREVISAO = :OLD_ANO_PREVISAO');
  end;
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  PREVISAO.Produto AS Produto,');
  SqlPrincipal.Add('  PREVISAO.ANO_PREVISAO AS ANO_PREVISAO,');
  SqlPrincipal.Add('  PREVISAO.QUANT_PREVISTA AS QUANT_PREVISTA,');
  SqlPrincipal.Add('  PREVISAO.VALOR_PREVISTO AS VALOR_PREVISTO,');
  SqlPrincipal.Add('  PREVISAO.Usuario AS Usuario');
  SqlPrincipal.Add('from PREVISAO');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  Sql.Add('order by PREVISAO.Produto,PREVISAO.ANO_PREVISAO');
  QUANT_PREVISTA := TDPREVISAO_QUANT_PREVISTA.Create(AOwner);
  QUANT_PREVISTA.Valor.DataSet := Self;
  VALOR_PREVISTO := TDPREVISAO_VALOR_PREVISTO.Create(AOwner);
  VALOR_PREVISTO.Valor.DataSet := Self;
  ANO_PREVISAO := TDPREVISAO_ANO_PREVISAO.Create(AOwner);
  ANO_PREVISAO.Valor.DataSet := Self;
  Usuario := TDPREVISAO_Usuario.Create(AOwner);
  Usuario.Valor.DataSet := Self;
  Produto := TDPREVISAO_Produto.Create(AOwner);
  Produto.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(Produto);
  ChavePrimaria.Add(ANO_PREVISAO);
//CRIANDO CAMPOS 
  Campos.Add(Produto);
  Campos.Add(ANO_PREVISAO);
  Campos.Add(QUANT_PREVISTA);
  Campos.Add(VALOR_PREVISTO);
  Campos.Add(Usuario);
  TituloIndices.Add('Produto,Ano Previsão');
  Indices.Add('PREVISAO.Produto,PREVISAO.ANO_PREVISAO');
  Crescente.Add('S');
  TituloPrimaria := 'Produto,Ano Previsão';
  ChPrimaria     := 'PREVISAO.Produto,PREVISAO.ANO_PREVISAO';
//CRIANDO TituloIndices 
  TituloIndice   := 'Produto,Ano Previsão';
  ChaveIndice    := 'PREVISAO.Produto,PREVISAO.ANO_PREVISAO';
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

procedure TDPREVISAO.CriaForeignKeys;
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

function TDPREVISAO.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDPREVISAO.ExclusaoCascata;
begin
end;

function TDPREVISAO.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
end;

function TDPREVISAO.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('PREVISAO') then
    if PTabela(TabGlobal.DPREVISAO, ['Produto','ANO_PREVISAO'], [Produto.Valor.Value,ANO_PREVISAO.Valor.Value]) then
      Result := True;
end;

procedure TDPREVISAO.CalculaCampos;
begin
end;

procedure TDPREVISAO.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDPREVISAO.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
var
  I: Integer;
begin
  Filtro.Clear;
  FiltroRelac.Clear;
  if Atribui then
  begin
    FiltroRelac.Add('PREVISAO.Produto = :Produtos_Produto');
  end
  else
    for I:=0 to Campos.Count-1 do
      TAtributo(Campos[I]).Valor.OnValidate := nil;
  Produto.Valor.ReadOnly := Atribui;
  if Atualiza then
    AtualizaSql;
end;

procedure TDPREVISAO.AtribuiMestre(DataSet: TDataSet);
begin
  Produto.Valor.Value := TabGlobal.DProdutos.Produto.Valor.Value;
end;

procedure TDPREVISAO.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDPREVISAO.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDPREVISAO.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (Produto.SempreAtribui) and (Produto.AutoIncremento > 0) then
      AutoIncremento('Produto', True, Produto.AutoIncremento);
end;

procedure TDPREVISAO.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDPREVISAO.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDPREVISAO.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
