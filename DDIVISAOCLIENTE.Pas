{
 Classe da tabela: DIVISAOCLIENTE - DIVISAO CLIENTE
}

unit DDIVISAOCLIENTE;

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
  TDDIVISAOCLIENTE = class(TTabela)
  public
    CLICOD: TDDIVISAOCLIENTE_CLICOD;
    seq: TDDIVISAOCLIENTE_seq;
    NOME: TDDIVISAOCLIENTE_NOME;
    CLICODCLIENTE: TDDIVISAOCLIENTE_CLICODCLIENTE;
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

constructor TDDIVISAOCLIENTE.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'DIVISOES';
  Titulo           := 'DIVISAO CLIENTE';
  Name             := 'DDIVISAOCLIENTE';
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
  DataSource.Name  := 'DsDIVISAOCLIENTE';
  with UpdateSql do
  begin
    Name           := 'UpdSql_DIVISAOCLIENTE';
    // Exclusão de Registro
    DeleteSQL.Add('delete from DIVISOES');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  CLICOD = :OLD_CLICOD');
    DeleteSQL.Add('  and seq = :OLD_seq');
    // Inserção de Registro
    InsertSQL.Add('insert into DIVISOES');
    InsertSQL.Add('  (');
    InsertSQL.Add('  CLICOD,');
    InsertSQL.Add('  seq,');
    InsertSQL.Add('  NOME');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :CLICOD,');
    InsertSQL.Add('  :seq,');
    InsertSQL.Add('  :NOME');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update DIVISOES');
    ModifySQL.Add('set');
    ModifySQL.Add('  CLICOD = :CLICOD,');
    ModifySQL.Add('  seq = :seq,');
    ModifySQL.Add('  NOME = :NOME');
    ModifySQL.Add('where');
    ModifySQL.Add('  CLICOD = :OLD_CLICOD');
    ModifySQL.Add('  and seq = :OLD_seq');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  DIVISOES.CLICOD AS CLICOD,');
    RefreshSQL.Add('  DIVISOES.seq AS seq,');
    RefreshSQL.Add('  DIVISOES.NOME AS NOME,');
    RefreshSQL.Add('  Clientes.CLICOD AS CLICODCLIENTE');
    RefreshSQL.Add('from DIVISOES');
    RefreshSQL.Add('Left Outer Join Clientes on');
    RefreshSQL.Add('  DIVISOES.CLICOD = Clientes.CLICOD');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  DIVISOES.CLICOD = :OLD_CLICOD');
    RefreshSQL.Add('  and DIVISOES.seq = :OLD_seq');
  end;
  TabelasExtras.Add('Clientes');
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  DIVISOES.CLICOD AS CLICOD,');
  SqlPrincipal.Add('  DIVISOES.seq AS seq,');
  SqlPrincipal.Add('  DIVISOES.NOME AS NOME,');
  SqlPrincipal.Add('  Clientes.CLICOD AS CLICODCLIENTE');
  SqlPrincipal.Add('from DIVISOES');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  FiltroExtra.Add('Left Outer Join Clientes on');
  FiltroExtra.Add('  DIVISOES.CLICOD = Clientes.CLICOD');
  Sql.Add('order by DIVISOES.CLICOD,DIVISOES.seq');
  CLICOD := TDDIVISAOCLIENTE_CLICOD.Create(AOwner);
  CLICOD.Valor.DataSet := Self;
  seq := TDDIVISAOCLIENTE_seq.Create(AOwner);
  seq.Valor.DataSet := Self;
  NOME := TDDIVISAOCLIENTE_NOME.Create(AOwner);
  NOME.Valor.DataSet := Self;
  CLICODCLIENTE := TDDIVISAOCLIENTE_CLICODCLIENTE.Create(AOwner);
  CLICODCLIENTE.Valor.DataSet := Self;
  ChavePrimaria.Add(CLICOD);
  ChavePrimaria.Add(seq);
  Campos.Add(CLICOD);
  Campos.Add(seq);
  Campos.Add(NOME);
  Campos.Add(CLICODCLIENTE);
  TituloIndices.Add('Cliente,Seq');
  Indices.Add('DIVISOES.CLICOD,DIVISOES.seq');
  Crescente.Add('S');
  TituloPrimaria := 'Cliente,Seq';
  ChPrimaria     := 'DIVISOES.CLICOD,DIVISOES.seq';
  TituloIndice   := 'Cliente,Seq';
  ChaveIndice    := 'DIVISOES.CLICOD,DIVISOES.seq';
  AfterInsert    := AtribuiMestre;
  AfterPost      := ProcessoDireto1;
  AfterCancel    := ProcessoDireto2;
  BeforePost     := AtualizaCalculados;
  BeforeEdit     := ProcessoInverso1;
  BeforeDelete   := ProcessoInverso2;
end;

procedure TDDIVISAOCLIENTE.CriaForeignKeys;
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

function TDDIVISAOCLIENTE.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDDIVISAOCLIENTE.ExclusaoCascata;
begin
end;

function TDDIVISAOCLIENTE.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('Clientes') then
    if (UpperCase('CLICOD') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DClientes, ['CLICOD'], [CLICOD.Valor.Value], [Campo], Retorno) then
        Result := True;

end;

function TDDIVISAOCLIENTE.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('Clientes') then
    if PTabela(TabGlobal.DClientes, ['CLICOD'], [CLICOD.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('DIVISOES') then
    if PTabela(TabGlobal.DDIVISAOCLIENTE, ['CLICOD','seq'], [CLICOD.Valor.Value,seq.Valor.Value]) then
      Result := True;
end;

procedure TDDIVISAOCLIENTE.CalculaCampos;
begin
end;

procedure TDDIVISAOCLIENTE.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDDIVISAOCLIENTE.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
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

procedure TDDIVISAOCLIENTE.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDDIVISAOCLIENTE.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDDIVISAOCLIENTE.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDDIVISAOCLIENTE.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (CLICOD.SempreAtribui) and (CLICOD.AutoIncremento > 0) then
      AutoIncremento('CLICOD', True, CLICOD.AutoIncremento);
end;

procedure TDDIVISAOCLIENTE.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDDIVISAOCLIENTE.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDDIVISAOCLIENTE.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
