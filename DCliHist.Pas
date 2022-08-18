{
 Classe da tabela: CliHist - Ocorrências de Clientes
}

unit DCliHist;

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
  TDCliHist = class(TTabela)
  public
    CLICOD: TDCliHist_CLICOD;
    HISDAT: TDCliHist_HISDAT;
    HISSEQ: TDCliHist_HISSEQ;
    FUNCOD: TDCliHist_FUNCOD;
    NOME: TDCliHist_NOME;
    AGEDAT: TDCliHist_AGEDAT;
    AGEHOR: TDCliHist_AGEHOR;
    HISTORICO: TDCliHist_HISTORICO;
    HISDET: TDCliHist_HISDET;
    AGENDAR: TDCliHist_AGENDAR;
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

constructor TDCliHist.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'CliHist';
  Titulo           := 'Ocorrências de Clientes';
  Name             := 'DCliHist';
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
  DataSource.Name  := 'DsCliHist';
  with UpdateSql do
  begin
    Name           := 'UpdSql_CliHist';
    // Exclusão de Registro
    DeleteSQL.Add('delete from CliHist');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  CLICOD = :OLD_CLICOD');
    DeleteSQL.Add('  and HISDAT = :OLD_HISDAT');
    DeleteSQL.Add('  and HISSEQ = :OLD_HISSEQ');
    // Inserção de Registro
    InsertSQL.Add('insert into CliHist');
    InsertSQL.Add('  (');
    InsertSQL.Add('  CLICOD,');
    InsertSQL.Add('  HISDAT,');
    InsertSQL.Add('  HISSEQ,');
    InsertSQL.Add('  FUNCOD,');
    InsertSQL.Add('  AGEDAT,');
    InsertSQL.Add('  AGEHOR,');
    InsertSQL.Add('  HISTORICO,');
    InsertSQL.Add('  HISDET,');
    InsertSQL.Add('  AGENDAR');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :CLICOD,');
    InsertSQL.Add('  :HISDAT,');
    InsertSQL.Add('  :HISSEQ,');
    InsertSQL.Add('  :FUNCOD,');
    InsertSQL.Add('  :AGEDAT,');
    InsertSQL.Add('  :AGEHOR,');
    InsertSQL.Add('  :HISTORICO,');
    InsertSQL.Add('  :HISDET,');
    InsertSQL.Add('  :AGENDAR');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update CliHist');
    ModifySQL.Add('set');
    ModifySQL.Add('  CLICOD = :CLICOD,');
    ModifySQL.Add('  HISDAT = :HISDAT,');
    ModifySQL.Add('  HISSEQ = :HISSEQ,');
    ModifySQL.Add('  FUNCOD = :FUNCOD,');
    ModifySQL.Add('  AGEDAT = :AGEDAT,');
    ModifySQL.Add('  AGEHOR = :AGEHOR,');
    ModifySQL.Add('  HISTORICO = :HISTORICO,');
    ModifySQL.Add('  HISDET = :HISDET,');
    ModifySQL.Add('  AGENDAR = :AGENDAR');
    ModifySQL.Add('where');
    ModifySQL.Add('  CLICOD = :OLD_CLICOD');
    ModifySQL.Add('  and HISDAT = :OLD_HISDAT');
    ModifySQL.Add('  and HISSEQ = :OLD_HISSEQ');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  CliHist.CLICOD AS CLICOD,');
    RefreshSQL.Add('  CliHist.HISDAT AS HISDAT,');
    RefreshSQL.Add('  CliHist.HISSEQ AS HISSEQ,');
    RefreshSQL.Add('  CliHist.FUNCOD AS FUNCOD,');
    RefreshSQL.Add('  Funcionarios.NOME AS NOME,');
    RefreshSQL.Add('  CliHist.AGEDAT AS AGEDAT,');
    RefreshSQL.Add('  CliHist.AGEHOR AS AGEHOR,');
    RefreshSQL.Add('  CliHist.HISTORICO AS HISTORICO,');
    RefreshSQL.Add('  CliHist.HISDET AS HISDET,');
    RefreshSQL.Add('  CliHist.AGENDAR AS AGENDAR');
    RefreshSQL.Add('from CliHist');
    RefreshSQL.Add('Left Outer Join Funcionarios on');
    RefreshSQL.Add('  CliHist.FUNCOD = Funcionarios.FUNCOD');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  CliHist.CLICOD = :OLD_CLICOD');
    RefreshSQL.Add('  and CliHist.HISDAT = :OLD_HISDAT');
    RefreshSQL.Add('  and CliHist.HISSEQ = :OLD_HISSEQ');
  end;
  TabelasExtras.Add('Funcionarios');
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  CliHist.CLICOD AS CLICOD,');
  SqlPrincipal.Add('  CliHist.HISDAT AS HISDAT,');
  SqlPrincipal.Add('  CliHist.HISSEQ AS HISSEQ,');
  SqlPrincipal.Add('  CliHist.FUNCOD AS FUNCOD,');
  SqlPrincipal.Add('  Funcionarios.NOME AS NOME,');
  SqlPrincipal.Add('  CliHist.AGEDAT AS AGEDAT,');
  SqlPrincipal.Add('  CliHist.AGEHOR AS AGEHOR,');
  SqlPrincipal.Add('  CliHist.HISTORICO AS HISTORICO,');
  SqlPrincipal.Add('  CliHist.HISDET AS HISDET,');
  SqlPrincipal.Add('  CliHist.AGENDAR AS AGENDAR');
  SqlPrincipal.Add('from CliHist');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  FiltroExtra.Add('Left Outer Join ContratoTransporte Funcionarios on');
  FiltroExtra.Add('  CliHist.FUNCOD = Funcionarios.FUNCOD');
  Sql.Add('order by CliHist.CLICOD,CliHist.HISDAT,CliHist.HISSEQ');
  CLICOD := TDCliHist_CLICOD.Create(AOwner);
  CLICOD.Valor.DataSet := Self;
  HISDAT := TDCliHist_HISDAT.Create(AOwner);
  HISDAT.Valor.DataSet := Self;
  HISSEQ := TDCliHist_HISSEQ.Create(AOwner);
  HISSEQ.Valor.DataSet := Self;
  HISTORICO := TDCliHist_HISTORICO.Create(AOwner);
  HISTORICO.Valor.DataSet := Self;
  HISDET := TDCliHist_HISDET.Create(AOwner);
  HISDET.Valor.DataSet := Self;
  FUNCOD := TDCliHist_FUNCOD.Create(AOwner);
  FUNCOD.Valor.DataSet := Self;
  AGENDAR := TDCliHist_AGENDAR.Create(AOwner);
  AGENDAR.Valor.DataSet := Self;
  AGEDAT := TDCliHist_AGEDAT.Create(AOwner);
  AGEDAT.Valor.DataSet := Self;
  AGEHOR := TDCliHist_AGEHOR.Create(AOwner);
  AGEHOR.Valor.DataSet := Self;
  NOME := TDCliHist_NOME.Create(AOwner);
  NOME.Valor.DataSet := Self;
  ChavePrimaria.Add(CLICOD);
  ChavePrimaria.Add(HISDAT);
  ChavePrimaria.Add(HISSEQ);
  Campos.Add(CLICOD);
  Campos.Add(HISDAT);
  Campos.Add(HISSEQ);
  Campos.Add(FUNCOD);
  Campos.Add(NOME);
  Campos.Add(AGEDAT);
  Campos.Add(AGEHOR);
  Campos.Add(HISTORICO);
  Campos.Add(HISDET);
  Campos.Add(AGENDAR);
  TituloIndices.Add('Cliente,Data,Sequência');
  Indices.Add('CliHist.CLICOD,CliHist.HISDAT,CliHist.HISSEQ');
  Crescente.Add('S');
  TituloPrimaria := 'Cliente,Data,Sequência';
  ChPrimaria     := 'CliHist.CLICOD,CliHist.HISDAT,CliHist.HISSEQ';
  TituloIndices.Add('Por Ocorrência');
  Indices.Add('HISTORICO');
  Crescente.Add('S');
  TituloIndice   := 'Cliente,Data,Sequência';
  ChaveIndice    := 'CliHist.CLICOD,CliHist.HISDAT,CliHist.HISSEQ';
  AfterInsert    := AtribuiMestre;
  AfterPost      := ProcessoDireto1;
  AfterCancel    := ProcessoDireto2;
  BeforePost     := AtualizaCalculados;
  BeforeEdit     := ProcessoInverso1;
  BeforeDelete   := ProcessoInverso2;
end;

procedure TDCliHist.CriaForeignKeys;
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

function TDCliHist.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDCliHist.ExclusaoCascata;
begin
end;

function TDCliHist.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('Funcionarios') then
    if (UpperCase('FUNCOD') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DFuncionarios, ['FUNCOD'], [FUNCOD.Valor.Value], [Campo], Retorno) then
        Result := True;

end;

function TDCliHist.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('Funcionarios') then
    if PTabela(TabGlobal.DFuncionarios, ['FUNCOD'], [FUNCOD.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('CliHist') then
    if PTabela(TabGlobal.DCliHist, ['CLICOD','HISDAT','HISSEQ'], [CLICOD.Valor.Value,HISDAT.Valor.Value,HISSEQ.Valor.Value]) then
      Result := True;
end;

procedure TDCliHist.CalculaCampos;
begin
end;

procedure TDCliHist.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDCliHist.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
var
  I: Integer;
begin
  Filtro.Clear;
  FiltroRelac.Clear;
  if Atribui then
  begin
    FiltroRelac.Add('CliHist.CLICOD = :Clientes_CLICOD');
  end
  else
    for I:=0 to Campos.Count-1 do
      TAtributo(Campos[I]).Valor.OnValidate := nil;
  CLICOD.Valor.ReadOnly := Atribui;
  if Atualiza then
    AtualizaSql;
end;

procedure TDCliHist.AtribuiMestre(DataSet: TDataSet);
begin
  CLICOD.Valor.Value := TabGlobal.DClientes.CLICOD.Valor.Value;
end;

procedure TDCliHist.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDCliHist.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDCliHist.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (CLICOD.SempreAtribui) and (CLICOD.AutoIncremento > 0) then
      AutoIncremento('CLICOD', True, CLICOD.AutoIncremento);
end;

procedure TDCliHist.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDCliHist.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDCliHist.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
