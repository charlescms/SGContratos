{
 Classe da tabela: SITUACION - SITUACION
}

unit DSITUACION;

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
  TDSITUACION = class(TTabela)
  public
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

constructor TDSITUACION.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'ContratoTransporte';
  Titulo           := 'SITUACION';
  Name             := 'DSITUACION';
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
  DataSource.Name  := 'DsSITUACION';
  with UpdateSql do
  begin
    Name           := 'UpdSql_SITUACION';
    // Exclusão de Registro
    DeleteSQL.Add('delete from ContratoTransporte');
    DeleteSQL.Add('where');
    // Inserção de Registro
    InsertSQL.Add('insert into ContratoTransporte');
    InsertSQL.Add('  (');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update ContratoTransporte');
    ModifySQL.Add('set');
    ModifySQL.Add('where');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    // CRIANDO SUB-SELECT 1 
    RefreshSQL.Add('from ( SELECT '); // inicio sub-select 
    RefreshSQL.Add('from ContratoTransporte'); // fim sub-select
    RefreshSQL.Add(' ) AS  SITUACION' );
    RefreshSQL.Add('where');
  end;
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('from ( select      ');  // inicio de sub-select
  SqlPrincipal.Add('       from  ContratoTransporte'); // fim de sub-select
  SqlPrincipal.Add('     ) as  SITUACION');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  Sql.Add('order by ');
//CRIANDO CHAVE PRIMARIA 
//CRIANDO CAMPOS 
  TituloPrimaria := '';
  ChPrimaria     := '';
//CRIANDO TituloIndices 
  TituloIndice   := '';
  ChaveIndice    := '';
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

procedure TDSITUACION.CriaForeignKeys;
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

function TDSITUACION.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDSITUACION.ExclusaoCascata;
begin
end;

function TDSITUACION.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
end;

function TDSITUACION.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
end;

procedure TDSITUACION.CalculaCampos;
begin
end;

procedure TDSITUACION.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDSITUACION.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
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

procedure TDSITUACION.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDSITUACION.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDSITUACION.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDSITUACION.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
end;

procedure TDSITUACION.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDSITUACION.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDSITUACION.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
