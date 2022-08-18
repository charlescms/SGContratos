{
 Classe da tabela: OrdemCobrancaDescont - Desconto Ordem Cobrança
}

unit DOrdemCobrancaDescont;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0010,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDOrdemCobrancaDescont = class(TTabela)
  public
    NumOrdCobranca: TDOrdemCobrancaDescont_NumOrdCobranca;
    Seq: TDOrdemCobrancaDescont_Seq;
    Observacao: TDOrdemCobrancaDescont_Observacao;
    Valor: TDOrdemCobrancaDescont_Valor;
    Usuario: TDOrdemCobrancaDescont_Usuario;
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

constructor TDOrdemCobrancaDescont.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'OrdemCobrancaDescont';
  Titulo           := 'Desconto Ordem Cobrança';
  Name             := 'DOrdemCobrancaDescont';
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
  DataSource.Name  := 'DsOrdemCobrancaDescont';
  with UpdateSql do
  begin
    Name           := 'UpdSql_OrdemCobrancaDescont';
    // Exclusão de Registro
    DeleteSQL.Add('delete from OrdemCobrancaDescont');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  NumOrdCobranca = :OLD_NumOrdCobranca');
    DeleteSQL.Add('  and Seq = :OLD_Seq');
    // Inserção de Registro
    InsertSQL.Add('insert into OrdemCobrancaDescont');
    InsertSQL.Add('  (');
    InsertSQL.Add('  NumOrdCobranca,');
    InsertSQL.Add('  Seq,');
    InsertSQL.Add('  Observacao,');
    InsertSQL.Add('  Valor,');
    InsertSQL.Add('  Usuario');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :NumOrdCobranca,');
    InsertSQL.Add('  :Seq,');
    InsertSQL.Add('  :Observacao,');
    InsertSQL.Add('  :Valor,');
    InsertSQL.Add('  :Usuario');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update OrdemCobrancaDescont');
    ModifySQL.Add('set');
    ModifySQL.Add('  NumOrdCobranca = :NumOrdCobranca,');
    ModifySQL.Add('  Seq = :Seq,');
    ModifySQL.Add('  Observacao = :Observacao,');
    ModifySQL.Add('  Valor = :Valor,');
    ModifySQL.Add('  Usuario = :Usuario');
    ModifySQL.Add('where');
    ModifySQL.Add('  NumOrdCobranca = :OLD_NumOrdCobranca');
    ModifySQL.Add('  and Seq = :OLD_Seq');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  OrdemCobrancaDescont.NumOrdCobranca AS NumOrdCobranca,');
    RefreshSQL.Add('  OrdemCobrancaDescont.Seq AS Seq,');
    RefreshSQL.Add('  OrdemCobrancaDescont.Observacao AS Observacao,');
    RefreshSQL.Add('  OrdemCobrancaDescont.Valor AS Valor,');
    RefreshSQL.Add('  OrdemCobrancaDescont.Usuario AS Usuario');
    RefreshSQL.Add('from OrdemCobrancaDescont');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  OrdemCobrancaDescont.NumOrdCobranca = :OLD_NumOrdCobranca');
    RefreshSQL.Add('  and OrdemCobrancaDescont.Seq = :OLD_Seq');
  end;
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  OrdemCobrancaDescont.NumOrdCobranca AS NumOrdCobranca,');
  SqlPrincipal.Add('  OrdemCobrancaDescont.Seq AS Seq,');
  SqlPrincipal.Add('  OrdemCobrancaDescont.Observacao AS Observacao,');
  SqlPrincipal.Add('  OrdemCobrancaDescont.Valor AS Valor,');
  SqlPrincipal.Add('  OrdemCobrancaDescont.Usuario AS Usuario');
  SqlPrincipal.Add('from OrdemCobrancaDescont');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  Sql.Add('order by OrdemCobrancaDescont.NumOrdCobranca,OrdemCobrancaDescont.Seq');
  Seq := TDOrdemCobrancaDescont_Seq.Create(AOwner);
  Seq.Valor.DataSet := Self;
  NumOrdCobranca := TDOrdemCobrancaDescont_NumOrdCobranca.Create(AOwner);
  NumOrdCobranca.Valor.DataSet := Self;
  Observacao := TDOrdemCobrancaDescont_Observacao.Create(AOwner);
  Observacao.Valor.DataSet := Self;
  Valor := TDOrdemCobrancaDescont_Valor.Create(AOwner);
  Valor.Valor.DataSet := Self;
  Usuario := TDOrdemCobrancaDescont_Usuario.Create(AOwner);
  Usuario.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(NumOrdCobranca);
  ChavePrimaria.Add(Seq);
//CRIANDO CAMPOS 
  Campos.Add(NumOrdCobranca);
  Campos.Add(Seq);
  Campos.Add(Observacao);
  Campos.Add(Valor);
  Campos.Add(Usuario);
  TituloIndices.Add('Ord. Cobrança,Seq.');
  Indices.Add('OrdemCobrancaDescont.NumOrdCobranca,OrdemCobrancaDescont.Seq');
  Crescente.Add('S');
  TituloPrimaria := 'Ord. Cobrança,Seq.';
  ChPrimaria     := 'OrdemCobrancaDescont.NumOrdCobranca,OrdemCobrancaDescont.Seq';
//CRIANDO TituloIndices 
  TituloIndice   := 'Ord. Cobrança,Seq.';
  ChaveIndice    := 'OrdemCobrancaDescont.NumOrdCobranca,OrdemCobrancaDescont.Seq';
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

procedure TDOrdemCobrancaDescont.CriaForeignKeys;
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

function TDOrdemCobrancaDescont.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDOrdemCobrancaDescont.ExclusaoCascata;
begin
end;

function TDOrdemCobrancaDescont.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
end;

function TDOrdemCobrancaDescont.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('OrdemCobrancaDescont') then
    if PTabela(TabGlobal.DOrdemCobrancaDescont, ['NumOrdCobranca','Seq'], [NumOrdCobranca.Valor.Value,Seq.Valor.Value]) then
      Result := True;
end;

procedure TDOrdemCobrancaDescont.CalculaCampos;
begin
end;

procedure TDOrdemCobrancaDescont.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDOrdemCobrancaDescont.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
var
  I: Integer;
begin
  Filtro.Clear;
  FiltroRelac.Clear;
  if Atribui then
  begin
    FiltroRelac.Add('OrdemCobrancaDescont.NumOrdCobranca = :OrdemCobranca_NumOrdCobranca');
  end
  else
    for I:=0 to Campos.Count-1 do
      TAtributo(Campos[I]).Valor.OnValidate := nil;
  NumOrdCobranca.Valor.ReadOnly := Atribui;
  if Atualiza then
    AtualizaSql;
end;

procedure TDOrdemCobrancaDescont.AtribuiMestre(DataSet: TDataSet);
begin
  NumOrdCobranca.Valor.Value := TabGlobal.DOrdemCobranca.NumOrdCobranca.Valor.Value;
end;

procedure TDOrdemCobrancaDescont.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDOrdemCobrancaDescont.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDOrdemCobrancaDescont.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (NumOrdCobranca.SempreAtribui) and (NumOrdCobranca.AutoIncremento > 0) then
      AutoIncremento('NumOrdCobranca', True, NumOrdCobranca.AutoIncremento);
end;

procedure TDOrdemCobrancaDescont.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDOrdemCobrancaDescont.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDOrdemCobrancaDescont.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
