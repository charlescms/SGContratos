{
 Classe da tabela: ComplementoFatura - 
}

unit DComplementoFatura;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0003,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDComplementoFatura = class(TTabela)
  public
    NumFatura: TDComplementoFatura_NumFatura;
    Seq: TDComplementoFatura_Seq;
    Observacao: TDComplementoFatura_Observacao;
    Valor: TDComplementoFatura_Valor;
    Usuario: TDComplementoFatura_Usuario;
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

constructor TDComplementoFatura.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'ComplementoFatura';
  Titulo           := '';
  Name             := 'DComplementoFatura';
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
  DataSource.Name  := 'DsComplementoFatura';
  with UpdateSql do
  begin
    Name           := 'UpdSql_ComplementoFatura';
    // Exclusão de Registro
    DeleteSQL.Add('delete from ComplementoFatura');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  NumFatura = :OLD_NumFatura');
    DeleteSQL.Add('  and Seq = :OLD_Seq');
    // Inserção de Registro
    InsertSQL.Add('insert into ComplementoFatura');
    InsertSQL.Add('  (');
    InsertSQL.Add('  NumFatura,');
    InsertSQL.Add('  Seq,');
    InsertSQL.Add('  Observacao,');
    InsertSQL.Add('  Valor,');
    InsertSQL.Add('  Usuario');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :NumFatura,');
    InsertSQL.Add('  :Seq,');
    InsertSQL.Add('  :Observacao,');
    InsertSQL.Add('  :Valor,');
    InsertSQL.Add('  :Usuario');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update ComplementoFatura');
    ModifySQL.Add('set');
    ModifySQL.Add('  NumFatura = :NumFatura,');
    ModifySQL.Add('  Seq = :Seq,');
    ModifySQL.Add('  Observacao = :Observacao,');
    ModifySQL.Add('  Valor = :Valor,');
    ModifySQL.Add('  Usuario = :Usuario');
    ModifySQL.Add('where');
    ModifySQL.Add('  NumFatura = :OLD_NumFatura');
    ModifySQL.Add('  and Seq = :OLD_Seq');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  ComplementoFatura.NumFatura AS NumFatura,');
    RefreshSQL.Add('  ComplementoFatura.Seq AS Seq,');
    RefreshSQL.Add('  ComplementoFatura.Observacao AS Observacao,');
    RefreshSQL.Add('  ComplementoFatura.Valor AS Valor,');
    RefreshSQL.Add('  ComplementoFatura.Usuario AS Usuario');
    RefreshSQL.Add('from ComplementoFatura');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  ComplementoFatura.NumFatura = :OLD_NumFatura');
    RefreshSQL.Add('  and ComplementoFatura.Seq = :OLD_Seq');
  end;
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  ComplementoFatura.NumFatura AS NumFatura,');
  SqlPrincipal.Add('  ComplementoFatura.Seq AS Seq,');
  SqlPrincipal.Add('  ComplementoFatura.Observacao AS Observacao,');
  SqlPrincipal.Add('  ComplementoFatura.Valor AS Valor,');
  SqlPrincipal.Add('  ComplementoFatura.Usuario AS Usuario');
  SqlPrincipal.Add('from ComplementoFatura');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  Sql.Add('order by ComplementoFatura.NumFatura,ComplementoFatura.Seq');
  Seq := TDComplementoFatura_Seq.Create(AOwner);
  Seq.Valor.DataSet := Self;
  NumFatura := TDComplementoFatura_NumFatura.Create(AOwner);
  NumFatura.Valor.DataSet := Self;
  Observacao := TDComplementoFatura_Observacao.Create(AOwner);
  Observacao.Valor.DataSet := Self;
  Valor := TDComplementoFatura_Valor.Create(AOwner);
  Valor.Valor.DataSet := Self;
  Usuario := TDComplementoFatura_Usuario.Create(AOwner);
  Usuario.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(NumFatura);
  ChavePrimaria.Add(Seq);
//CRIANDO CAMPOS 
  Campos.Add(NumFatura);
  Campos.Add(Seq);
  Campos.Add(Observacao);
  Campos.Add(Valor);
  Campos.Add(Usuario);
  TituloIndices.Add('Fatura Surimpex,Seq.');
  Indices.Add('ComplementoFatura.NumFatura,ComplementoFatura.Seq');
  Crescente.Add('S');
  TituloPrimaria := 'Fatura Surimpex,Seq.';
  ChPrimaria     := 'ComplementoFatura.NumFatura,ComplementoFatura.Seq';
//CRIANDO TituloIndices 
  TituloIndice   := 'Fatura Surimpex,Seq.';
  ChaveIndice    := 'ComplementoFatura.NumFatura,ComplementoFatura.Seq';
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

procedure TDComplementoFatura.CriaForeignKeys;
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

function TDComplementoFatura.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDComplementoFatura.ExclusaoCascata;
begin
end;

function TDComplementoFatura.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
end;

function TDComplementoFatura.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('ComplementoFatura') then
    if PTabela(TabGlobal.DComplementoFatura, ['NumFatura','Seq'], [NumFatura.Valor.Value,Seq.Valor.Value]) then
      Result := True;
end;

procedure TDComplementoFatura.CalculaCampos;
begin
end;

procedure TDComplementoFatura.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDComplementoFatura.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
var
  I: Integer;
begin
  Filtro.Clear;
  FiltroRelac.Clear;
  if Atribui then
  begin
    FiltroRelac.Add('ComplementoFatura.NumFatura = :FaturaTab_NumFatura');
  end
  else
    for I:=0 to Campos.Count-1 do
      TAtributo(Campos[I]).Valor.OnValidate := nil;
  NumFatura.Valor.ReadOnly := Atribui;
  if Atualiza then
    AtualizaSql;
end;

procedure TDComplementoFatura.AtribuiMestre(DataSet: TDataSet);
begin
  NumFatura.Valor.Value := TabGlobal.DFaturaTab.NumFatura.Valor.Value;
end;

procedure TDComplementoFatura.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDComplementoFatura.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDComplementoFatura.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (NumFatura.SempreAtribui) and (NumFatura.AutoIncremento > 0) then
      AutoIncremento('NumFatura', True, NumFatura.AutoIncremento);
end;

procedure TDComplementoFatura.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDComplementoFatura.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDComplementoFatura.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
