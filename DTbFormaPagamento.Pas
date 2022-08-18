{
 Classe da tabela: TbFormaPagamento - Forma de Pagamento
}

unit DTbFormaPagamento;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0022,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDTbFormaPagamento = class(TTabela)
  public
    FormPago: TDTbFormaPagamento_FormPago;
    Usuario: TDTbFormaPagamento_Usuario;
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

constructor TDTbFormaPagamento.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'TbFormaPagamento';
  Titulo           := 'Forma de Pagamento';
  Name             := 'DTbFormaPagamento';
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
  DataSource.Name  := 'DsTbFormaPagamento';
  with UpdateSql do
  begin
    Name           := 'UpdSql_TbFormaPagamento';
    // Exclusão de Registro
    DeleteSQL.Add('delete from TbFormaPagamento');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  FormPago = :OLD_FormPago');
    // Inserção de Registro
    InsertSQL.Add('insert into TbFormaPagamento');
    InsertSQL.Add('  (');
    InsertSQL.Add('  FormPago,');
    InsertSQL.Add('  Usuario');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :FormPago,');
    InsertSQL.Add('  :Usuario');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update TbFormaPagamento');
    ModifySQL.Add('set');
    ModifySQL.Add('  FormPago = :FormPago,');
    ModifySQL.Add('  Usuario = :Usuario');
    ModifySQL.Add('where');
    ModifySQL.Add('  FormPago = :OLD_FormPago');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  TbFormaPagamento.FormPago AS FormPago,');
    RefreshSQL.Add('  TbFormaPagamento.Usuario AS Usuario');
    RefreshSQL.Add('from TbFormaPagamento');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  TbFormaPagamento.FormPago = :OLD_FormPago');
  end;
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  TbFormaPagamento.FormPago AS FormPago,');
  SqlPrincipal.Add('  TbFormaPagamento.Usuario AS Usuario');
  SqlPrincipal.Add('from TbFormaPagamento');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  Sql.Add('order by TbFormaPagamento.FormPago');
  FormPago := TDTbFormaPagamento_FormPago.Create(AOwner);
  FormPago.Valor.DataSet := Self;
  Usuario := TDTbFormaPagamento_Usuario.Create(AOwner);
  Usuario.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(FormPago);
//CRIANDO CAMPOS 
  Campos.Add(FormPago);
  Campos.Add(Usuario);
  TituloIndices.Add('Forma de Pago');
  Indices.Add('TbFormaPagamento.FormPago');
  Crescente.Add('S');
  TituloPrimaria := 'Forma de Pago';
  ChPrimaria     := 'TbFormaPagamento.FormPago';
//CRIANDO TituloIndices 
  TituloIndice   := 'Forma de Pago';
  ChaveIndice    := 'TbFormaPagamento.FormPago';
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

procedure TDTbFormaPagamento.CriaForeignKeys;
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

function TDTbFormaPagamento.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDTbFormaPagamento.ExclusaoCascata;
begin
end;

function TDTbFormaPagamento.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
end;

function TDTbFormaPagamento.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('TbFormaPagamento') then
    if PTabela(TabGlobal.DTbFormaPagamento, ['FormPago'], [FormPago.Valor.Value]) then
      Result := True;
end;

procedure TDTbFormaPagamento.CalculaCampos;
begin
end;

procedure TDTbFormaPagamento.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDTbFormaPagamento.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
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

procedure TDTbFormaPagamento.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDTbFormaPagamento.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDTbFormaPagamento.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDTbFormaPagamento.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (FormPago.SempreAtribui) and (FormPago.AutoIncremento > 0) then
      AutoIncremento('FormPago', True, FormPago.AutoIncremento);
end;

procedure TDTbFormaPagamento.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDTbFormaPagamento.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDTbFormaPagamento.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
