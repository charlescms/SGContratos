{
 Classe da tabela: TbCondicaoCompra - Condicao de Compra
}

unit DTbCondicaoCompra;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0013,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDTbCondicaoCompra = class(TTabela)
  public
    C_C: TDTbCondicaoCompra_C_C;
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

constructor TDTbCondicaoCompra.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'TbCondicaoCompra';
  Titulo           := 'Condicao de Compra';
  Name             := 'DTbCondicaoCompra';
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
  DataSource.Name  := 'DsTbCondicaoCompra';
  with UpdateSql do
  begin
    Name           := 'UpdSql_TbCondicaoCompra';
    // Exclusão de Registro
    DeleteSQL.Add('delete from TbCondicaoCompra');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  C_C = :OLD_C_C');
    // Inserção de Registro
    InsertSQL.Add('insert into TbCondicaoCompra');
    InsertSQL.Add('  (');
    InsertSQL.Add('  C_C');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :C_C');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update TbCondicaoCompra');
    ModifySQL.Add('set');
    ModifySQL.Add('  C_C = :C_C');
    ModifySQL.Add('where');
    ModifySQL.Add('  C_C = :OLD_C_C');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  TbCondicaoCompra.C_C AS C_C');
    RefreshSQL.Add('from TbCondicaoCompra');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  TbCondicaoCompra.C_C = :OLD_C_C');
  end;
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  TbCondicaoCompra.C_C AS C_C');
  SqlPrincipal.Add('from TbCondicaoCompra');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  Sql.Add('order by TbCondicaoCompra.C_C');
  C_C := TDTbCondicaoCompra_C_C.Create(AOwner);
  C_C.Valor.DataSet := Self;
  ChavePrimaria.Add(C_C);
  Campos.Add(C_C);
  TituloIndices.Add('C/C');
  Indices.Add('TbCondicaoCompra.C_C');
  Crescente.Add('S');
  TituloPrimaria := 'C/C';
  ChPrimaria     := 'TbCondicaoCompra.C_C';
  TituloIndice   := 'C/C';
  ChaveIndice    := 'TbCondicaoCompra.C_C';
  AfterInsert    := AtribuiMestre;
  AfterPost      := ProcessoDireto1;
  AfterCancel    := ProcessoDireto2;
  BeforePost     := AtualizaCalculados;
  BeforeEdit     := ProcessoInverso1;
  BeforeDelete   := ProcessoInverso2;
end;

procedure TDTbCondicaoCompra.CriaForeignKeys;
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

function TDTbCondicaoCompra.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDTbCondicaoCompra.ExclusaoCascata;
begin
end;

function TDTbCondicaoCompra.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
end;

function TDTbCondicaoCompra.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('TbCondicaoCompra') then
    if PTabela(TabGlobal.DTbCondicaoCompra, ['C_C'], [C_C.Valor.Value]) then
      Result := True;
end;

procedure TDTbCondicaoCompra.CalculaCampos;
begin
end;

procedure TDTbCondicaoCompra.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDTbCondicaoCompra.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
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

procedure TDTbCondicaoCompra.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDTbCondicaoCompra.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDTbCondicaoCompra.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDTbCondicaoCompra.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (C_C.SempreAtribui) and (C_C.AutoIncremento > 0) then
      AutoIncremento('C_C', True, C_C.AutoIncremento);
end;

procedure TDTbCondicaoCompra.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDTbCondicaoCompra.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDTbCondicaoCompra.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
