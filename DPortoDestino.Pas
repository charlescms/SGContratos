{
 Classe da tabela: PortoDestino - Porto Destino
}

unit DPortoDestino;

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
  TDPortoDestino = class(TTabela)
  public
    CodTbPorto: TDPortoDestino_CodTbPorto;
    NomePorto: TDPortoDestino_NomePorto;
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

constructor TDPortoDestino.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'TbPorto';
  Titulo           := 'Porto Destino';
  Name             := 'DPortoDestino';
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
  DataSource.Name  := 'DsPortoDestino';
  with UpdateSql do
  begin
    Name           := 'UpdSql_PortoDestino';
    // Exclusão de Registro
    DeleteSQL.Add('delete from TbPorto');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  CodTbPorto = :OLD_CodTbPorto');
    DeleteSQL.Add('  and NomePorto = :OLD_NomePorto');
    // Inserção de Registro
    InsertSQL.Add('insert into TbPorto');
    InsertSQL.Add('  (');
    InsertSQL.Add('  CodTbPorto,');
    InsertSQL.Add('  NomePorto');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :CodTbPorto,');
    InsertSQL.Add('  :NomePorto');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update TbPorto');
    ModifySQL.Add('set');
    ModifySQL.Add('  CodTbPorto = :CodTbPorto,');
    ModifySQL.Add('  NomePorto = :NomePorto');
    ModifySQL.Add('where');
    ModifySQL.Add('  CodTbPorto = :OLD_CodTbPorto');
    ModifySQL.Add('  and NomePorto = :OLD_NomePorto');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  TbPorto.CodTbPorto AS CodTbPorto,');
    RefreshSQL.Add('  TbPorto.NomePorto AS NomePorto');
    RefreshSQL.Add('from TbPorto');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  TbPorto.CodTbPorto = :OLD_CodTbPorto');
    RefreshSQL.Add('  and TbPorto.NomePorto = :OLD_NomePorto');
  end;
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  TbPorto.CodTbPorto AS CodTbPorto,');
  SqlPrincipal.Add('  TbPorto.NomePorto AS NomePorto');
  SqlPrincipal.Add('from TbPorto');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  Sql.Add('order by ');
  CodTbPorto := TDPortoDestino_CodTbPorto.Create(AOwner);
  CodTbPorto.Valor.DataSet := Self;
  NomePorto := TDPortoDestino_NomePorto.Create(AOwner);
  NomePorto.Valor.DataSet := Self;
  Campos.Add(CodTbPorto);
  Campos.Add(NomePorto);
  TituloPrimaria := '';
  ChPrimaria     := '';
  TituloIndice   := '';
  ChaveIndice    := '';
  AfterInsert    := AtribuiMestre;
  AfterPost      := ProcessoDireto1;
  AfterCancel    := ProcessoDireto2;
  BeforePost     := AtualizaCalculados;
  BeforeEdit     := ProcessoInverso1;
  BeforeDelete   := ProcessoInverso2;
end;

procedure TDPortoDestino.CriaForeignKeys;
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

function TDPortoDestino.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDPortoDestino.ExclusaoCascata;
begin
end;

function TDPortoDestino.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
end;

function TDPortoDestino.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
end;

procedure TDPortoDestino.CalculaCampos;
begin
end;

procedure TDPortoDestino.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDPortoDestino.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
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

procedure TDPortoDestino.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDPortoDestino.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDPortoDestino.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDPortoDestino.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
end;

procedure TDPortoDestino.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDPortoDestino.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDPortoDestino.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
