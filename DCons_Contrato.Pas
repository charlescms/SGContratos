{
 Classe da tabela: Cons_Contrato - Cons_Contrato
}

unit DCons_Contrato;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0002,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDCons_Contrato = class(TTabela)
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

constructor TDCons_Contrato.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'ContratoTransporte';
  Titulo           := 'Cons_Contrato';
  Name             := 'DCons_Contrato';
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
  DataSource.Name  := 'DsCons_Contrato';
  with UpdateSql do
  begin
    Name           := 'UpdSql_Cons_Contrato';
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
    RefreshSQL.Add(' ) AS  Cons_Contrato' );
    RefreshSQL.Add('where');
  end;
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('from ( select      ');  // inicio de sub-select
  SqlPrincipal.Add('       from  ContratoTransporte'); // fim de sub-select
  SqlPrincipal.Add('     ) as  Cons_Contrato');
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

procedure TDCons_Contrato.CriaForeignKeys;
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

function TDCons_Contrato.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDCons_Contrato.ExclusaoCascata;
begin
end;

function TDCons_Contrato.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
end;

function TDCons_Contrato.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
end;

procedure TDCons_Contrato.CalculaCampos;
begin
end;

procedure TDCons_Contrato.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDCons_Contrato.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
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

procedure TDCons_Contrato.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDCons_Contrato.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDCons_Contrato.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDCons_Contrato.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
end;

procedure TDCons_Contrato.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDCons_Contrato.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDCons_Contrato.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
