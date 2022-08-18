{
 Classe da tabela: Divisoes - Tabela de Divisões
}

unit DDivisoes;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0004,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDDivisoes = class(TTabela)
  public
    CLICOD: TDDivisoes_CLICOD;
    seq: TDDivisoes_seq;
    NOME: TDDivisoes_NOME;
    Usuario: TDDivisoes_Usuario;
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

constructor TDDivisoes.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'Divisoes';
  Titulo           := 'Tabela de Divisões';
  Name             := 'DDivisoes';
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
  DataSource.Name  := 'DsDivisoes';
  with UpdateSql do
  begin
    Name           := 'UpdSql_Divisoes';
    // Exclusão de Registro
    DeleteSQL.Add('delete from Divisoes');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  CLICOD = :OLD_CLICOD');
    DeleteSQL.Add('  and seq = :OLD_seq');
    // Inserção de Registro
    InsertSQL.Add('insert into Divisoes');
    InsertSQL.Add('  (');
    InsertSQL.Add('  CLICOD,');
    InsertSQL.Add('  seq,');
    InsertSQL.Add('  NOME,');
    InsertSQL.Add('  Usuario');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :CLICOD,');
    InsertSQL.Add('  :seq,');
    InsertSQL.Add('  :NOME,');
    InsertSQL.Add('  :Usuario');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update Divisoes');
    ModifySQL.Add('set');
    ModifySQL.Add('  CLICOD = :CLICOD,');
    ModifySQL.Add('  seq = :seq,');
    ModifySQL.Add('  NOME = :NOME,');
    ModifySQL.Add('  Usuario = :Usuario');
    ModifySQL.Add('where');
    ModifySQL.Add('  CLICOD = :OLD_CLICOD');
    ModifySQL.Add('  and seq = :OLD_seq');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  Divisoes.CLICOD AS CLICOD,');
    RefreshSQL.Add('  Divisoes.seq AS seq,');
    RefreshSQL.Add('  Divisoes.NOME AS NOME,');
    RefreshSQL.Add('  Divisoes.Usuario AS Usuario');
    RefreshSQL.Add('from Divisoes');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  Divisoes.CLICOD = :OLD_CLICOD');
    RefreshSQL.Add('  and Divisoes.seq = :OLD_seq');
  end;
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  Divisoes.CLICOD AS CLICOD,');
  SqlPrincipal.Add('  Divisoes.seq AS seq,');
  SqlPrincipal.Add('  Divisoes.NOME AS NOME,');
  SqlPrincipal.Add('  Divisoes.Usuario AS Usuario');
  SqlPrincipal.Add('from Divisoes');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  Sql.Add('order by Divisoes.CLICOD,Divisoes.seq');
  seq := TDDivisoes_seq.Create(AOwner);
  seq.Valor.DataSet := Self;
  CLICOD := TDDivisoes_CLICOD.Create(AOwner);
  CLICOD.Valor.DataSet := Self;
  NOME := TDDivisoes_NOME.Create(AOwner);
  NOME.Valor.DataSet := Self;
  Usuario := TDDivisoes_Usuario.Create(AOwner);
  Usuario.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(CLICOD);
  ChavePrimaria.Add(seq);
//CRIANDO CAMPOS 
  Campos.Add(CLICOD);
  Campos.Add(seq);
  Campos.Add(NOME);
  Campos.Add(Usuario);
  TituloIndices.Add('Cliente,Seq');
  Indices.Add('Divisoes.CLICOD,Divisoes.seq');
  Crescente.Add('S');
  TituloPrimaria := 'Cliente,Seq';
  ChPrimaria     := 'Divisoes.CLICOD,Divisoes.seq';
//CRIANDO TituloIndices 
  TituloIndice   := 'Cliente,Seq';
  ChaveIndice    := 'Divisoes.CLICOD,Divisoes.seq';
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

procedure TDDivisoes.CriaForeignKeys;
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

function TDDivisoes.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDDivisoes.ExclusaoCascata;
begin
  // Exclusão em Cascata Tabela: DRESUMENCONTRATACION
  TabGlobal.DRESUMENCONTRATACION.Filtro.Clear;
  TabGlobal.DRESUMENCONTRATACION.Filtro.Add('RESUMENCONTRATACION.CLICOD = :Divisoes_CLICOD');
  TabGlobal.DRESUMENCONTRATACION.Filtro.Add('AND RESUMENCONTRATACION.seq = :Divisoes_seq');
  TabGlobal.DRESUMENCONTRATACION.AtualizaSql;
  while not TabGlobal.DRESUMENCONTRATACION.Eof do
    if not TabGlobal.DRESUMENCONTRATACION.Exclui then
      TabGlobal.DRESUMENCONTRATACION.Next;
end;

function TDDivisoes.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
end;

function TDDivisoes.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('Divisoes') then
    if PTabela(TabGlobal.DDivisoes, ['CLICOD','seq'], [CLICOD.Valor.Value,seq.Valor.Value]) then
      Result := True;
end;

procedure TDDivisoes.CalculaCampos;
begin
end;

procedure TDDivisoes.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
  TabGlobal.DRESUMENCONTRATACION.AtribuiFiltroMestre(Atribui);
end;

procedure TDDivisoes.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
var
  I: Integer;
begin
  Filtro.Clear;
  FiltroRelac.Clear;
  if Atribui then
  begin
    FiltroRelac.Add('Divisoes.CLICOD = :Clientes_CLICOD');
  end
  else
    for I:=0 to Campos.Count-1 do
      TAtributo(Campos[I]).Valor.OnValidate := nil;
  CLICOD.Valor.ReadOnly := Atribui;
  if Atualiza then
    AtualizaSql;
end;

procedure TDDivisoes.AtribuiMestre(DataSet: TDataSet);
begin
  CLICOD.Valor.Value := TabGlobal.DClientes.CLICOD.Valor.Value;
end;

procedure TDDivisoes.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDDivisoes.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDDivisoes.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (CLICOD.SempreAtribui) and (CLICOD.AutoIncremento > 0) then
      AutoIncremento('CLICOD', True, CLICOD.AutoIncremento);
end;

procedure TDDivisoes.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDDivisoes.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDDivisoes.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
