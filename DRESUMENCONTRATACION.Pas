{
 Classe da tabela: RESUMENCONTRATACION - RESUMENCONTRATACION
}

unit DRESUMENCONTRATACION;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0016,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDRESUMENCONTRATACION = class(TTabela)
  public
    CODIGO: TDRESUMENCONTRATACION_CODIGO;
    CLICOD: TDRESUMENCONTRATACION_CLICOD;
    seq: TDRESUMENCONTRATACION_seq;
    FormPago: TDRESUMENCONTRATACION_FormPago;
    NOME: TDRESUMENCONTRATACION_NOME;
    NomeMix: TDRESUMENCONTRATACION_NomeMix;
    Observacoes: TDRESUMENCONTRATACION_Observacoes;
    QuantidadeTotal: TDRESUMENCONTRATACION_QuantidadeTotal;
    QUANTTOTALEXP: TDRESUMENCONTRATACION_QUANTTOTALEXP;
    QuantadePendente: TDRESUMENCONTRATACION_QuantadePendente;
    ValorSCCTotal: TDRESUMENCONTRATACION_ValorSCCTotal;
    ValorTotalExp: TDRESUMENCONTRATACION_ValorTotalExp;
    ValorTotalPendente: TDRESUMENCONTRATACION_ValorTotalPendente;
    Usuario: TDRESUMENCONTRATACION_Usuario;
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

constructor TDRESUMENCONTRATACION.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'RESUMENCONTRATACION';
  Titulo           := 'RESUMENCONTRATACION';
  Name             := 'DRESUMENCONTRATACION';
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
  DataSource.Name  := 'DsRESUMENCONTRATACION';
  with UpdateSql do
  begin
    Name           := 'UpdSql_RESUMENCONTRATACION';
    // Exclusão de Registro
    DeleteSQL.Add('delete from RESUMENCONTRATACION');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  CODIGO = :OLD_CODIGO');
    // Inserção de Registro
    InsertSQL.Add('insert into RESUMENCONTRATACION');
    InsertSQL.Add('  (');
    InsertSQL.Add('  CODIGO,');
    InsertSQL.Add('  CLICOD,');
    InsertSQL.Add('  seq,');
    InsertSQL.Add('  FormPago,');
    InsertSQL.Add('  NOME,');
    InsertSQL.Add('  NomeMix,');
    InsertSQL.Add('  Observacoes,');
    InsertSQL.Add('  QuantidadeTotal,');
    InsertSQL.Add('  QUANTTOTALEXP,');
    InsertSQL.Add('  QuantadePendente,');
    InsertSQL.Add('  ValorSCCTotal,');
    InsertSQL.Add('  ValorTotalExp,');
    InsertSQL.Add('  ValorTotalPendente,');
    InsertSQL.Add('  Usuario');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :CODIGO,');
    InsertSQL.Add('  :CLICOD,');
    InsertSQL.Add('  :seq,');
    InsertSQL.Add('  :FormPago,');
    InsertSQL.Add('  :NOME,');
    InsertSQL.Add('  :NomeMix,');
    InsertSQL.Add('  :Observacoes,');
    InsertSQL.Add('  :QuantidadeTotal,');
    InsertSQL.Add('  :QUANTTOTALEXP,');
    InsertSQL.Add('  :QuantadePendente,');
    InsertSQL.Add('  :ValorSCCTotal,');
    InsertSQL.Add('  :ValorTotalExp,');
    InsertSQL.Add('  :ValorTotalPendente,');
    InsertSQL.Add('  :Usuario');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update RESUMENCONTRATACION');
    ModifySQL.Add('set');
    ModifySQL.Add('  CODIGO = :CODIGO,');
    ModifySQL.Add('  CLICOD = :CLICOD,');
    ModifySQL.Add('  seq = :seq,');
    ModifySQL.Add('  FormPago = :FormPago,');
    ModifySQL.Add('  NOME = :NOME,');
    ModifySQL.Add('  NomeMix = :NomeMix,');
    ModifySQL.Add('  Observacoes = :Observacoes,');
    ModifySQL.Add('  QuantidadeTotal = :QuantidadeTotal,');
    ModifySQL.Add('  QUANTTOTALEXP = :QUANTTOTALEXP,');
    ModifySQL.Add('  QuantadePendente = :QuantadePendente,');
    ModifySQL.Add('  ValorSCCTotal = :ValorSCCTotal,');
    ModifySQL.Add('  ValorTotalExp = :ValorTotalExp,');
    ModifySQL.Add('  ValorTotalPendente = :ValorTotalPendente,');
    ModifySQL.Add('  Usuario = :Usuario');
    ModifySQL.Add('where');
    ModifySQL.Add('  CODIGO = :OLD_CODIGO');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  RESUMENCONTRATACION.CODIGO AS CODIGO,');
    RefreshSQL.Add('  RESUMENCONTRATACION.CLICOD AS CLICOD,');
    RefreshSQL.Add('  RESUMENCONTRATACION.seq AS seq,');
    RefreshSQL.Add('  RESUMENCONTRATACION.FormPago AS FormPago,');
    RefreshSQL.Add('  RESUMENCONTRATACION.NOME AS NOME,');
    RefreshSQL.Add('  RESUMENCONTRATACION.NomeMix AS NomeMix,');
    RefreshSQL.Add('  RESUMENCONTRATACION.Observacoes AS Observacoes,');
    RefreshSQL.Add('  RESUMENCONTRATACION.QuantidadeTotal AS QuantidadeTotal,');
    RefreshSQL.Add('  RESUMENCONTRATACION.QUANTTOTALEXP AS QUANTTOTALEXP,');
    RefreshSQL.Add('  RESUMENCONTRATACION.QuantadePendente AS QuantadePendente,');
    RefreshSQL.Add('  RESUMENCONTRATACION.ValorSCCTotal AS ValorSCCTotal,');
    RefreshSQL.Add('  RESUMENCONTRATACION.ValorTotalExp AS ValorTotalExp,');
    RefreshSQL.Add('  RESUMENCONTRATACION.ValorTotalPendente AS ValorTotalPendente,');
    RefreshSQL.Add('  RESUMENCONTRATACION.Usuario AS Usuario');
    RefreshSQL.Add('from RESUMENCONTRATACION');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  RESUMENCONTRATACION.CODIGO = :OLD_CODIGO');
  end;
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  RESUMENCONTRATACION.CODIGO AS CODIGO,');
  SqlPrincipal.Add('  RESUMENCONTRATACION.CLICOD AS CLICOD,');
  SqlPrincipal.Add('  RESUMENCONTRATACION.seq AS seq,');
  SqlPrincipal.Add('  RESUMENCONTRATACION.FormPago AS FormPago,');
  SqlPrincipal.Add('  RESUMENCONTRATACION.NOME AS NOME,');
  SqlPrincipal.Add('  RESUMENCONTRATACION.NomeMix AS NomeMix,');
  SqlPrincipal.Add('  RESUMENCONTRATACION.Observacoes AS Observacoes,');
  SqlPrincipal.Add('  RESUMENCONTRATACION.QuantidadeTotal AS QuantidadeTotal,');
  SqlPrincipal.Add('  RESUMENCONTRATACION.QUANTTOTALEXP AS QUANTTOTALEXP,');
  SqlPrincipal.Add('  RESUMENCONTRATACION.QuantadePendente AS QuantadePendente,');
  SqlPrincipal.Add('  RESUMENCONTRATACION.ValorSCCTotal AS ValorSCCTotal,');
  SqlPrincipal.Add('  RESUMENCONTRATACION.ValorTotalExp AS ValorTotalExp,');
  SqlPrincipal.Add('  RESUMENCONTRATACION.ValorTotalPendente AS ValorTotalPendente,');
  SqlPrincipal.Add('  RESUMENCONTRATACION.Usuario AS Usuario');
  SqlPrincipal.Add('from RESUMENCONTRATACION');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  Sql.Add('order by RESUMENCONTRATACION.CLICOD,RESUMENCONTRATACION.NOME');
  CLICOD := TDRESUMENCONTRATACION_CLICOD.Create(AOwner);
  CLICOD.Valor.DataSet := Self;
  seq := TDRESUMENCONTRATACION_seq.Create(AOwner);
  seq.Valor.DataSet := Self;
  NomeMix := TDRESUMENCONTRATACION_NomeMix.Create(AOwner);
  NomeMix.Valor.DataSet := Self;
  Observacoes := TDRESUMENCONTRATACION_Observacoes.Create(AOwner);
  Observacoes.Valor.DataSet := Self;
  CODIGO := TDRESUMENCONTRATACION_CODIGO.Create(AOwner);
  CODIGO.Valor.DataSet := Self;
  FormPago := TDRESUMENCONTRATACION_FormPago.Create(AOwner);
  FormPago.Valor.DataSet := Self;
  QuantidadeTotal := TDRESUMENCONTRATACION_QuantidadeTotal.Create(AOwner);
  QuantidadeTotal.Valor.DataSet := Self;
  QUANTTOTALEXP := TDRESUMENCONTRATACION_QUANTTOTALEXP.Create(AOwner);
  QUANTTOTALEXP.Valor.DataSet := Self;
  ValorSCCTotal := TDRESUMENCONTRATACION_ValorSCCTotal.Create(AOwner);
  ValorSCCTotal.Valor.DataSet := Self;
  QuantadePendente := TDRESUMENCONTRATACION_QuantadePendente.Create(AOwner);
  QuantadePendente.Valor.DataSet := Self;
  ValorTotalExp := TDRESUMENCONTRATACION_ValorTotalExp.Create(AOwner);
  ValorTotalExp.Valor.DataSet := Self;
  ValorTotalPendente := TDRESUMENCONTRATACION_ValorTotalPendente.Create(AOwner);
  ValorTotalPendente.Valor.DataSet := Self;
  NOME := TDRESUMENCONTRATACION_NOME.Create(AOwner);
  NOME.Valor.DataSet := Self;
  Usuario := TDRESUMENCONTRATACION_Usuario.Create(AOwner);
  Usuario.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(CODIGO);
//CRIANDO CAMPOS 
  Campos.Add(CODIGO);
  Campos.Add(CLICOD);
  Campos.Add(seq);
  Campos.Add(FormPago);
  Campos.Add(NOME);
  Campos.Add(NomeMix);
  Campos.Add(Observacoes);
  Campos.Add(QuantidadeTotal);
  Campos.Add(QUANTTOTALEXP);
  Campos.Add(QuantadePendente);
  Campos.Add(ValorSCCTotal);
  Campos.Add(ValorTotalExp);
  Campos.Add(ValorTotalPendente);
  Campos.Add(Usuario);
  TituloIndices.Add('Sequência');
  Indices.Add('RESUMENCONTRATACION.CODIGO');
  Crescente.Add('S');
  TituloPrimaria := 'Sequência';
  ChPrimaria     := 'RESUMENCONTRATACION.CODIGO';
//CRIANDO TituloIndices 
  TituloIndices.Add('PESQUISA_PROD');
  Indices.Add('RESUMENCONTRATACION.CLICOD;RESUMENCONTRATACION.seq;RESUMENCONTRATACION.FormPago;RESUMENCONTRATACION.');
  Crescente.Add('S');
  TituloIndice   := 'Cliente,Divisão';
  ChaveIndice    := 'RESUMENCONTRATACION.CLICOD,RESUMENCONTRATACION.NOME';
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

procedure TDRESUMENCONTRATACION.CriaForeignKeys;
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

function TDRESUMENCONTRATACION.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDRESUMENCONTRATACION.ExclusaoCascata;
begin
end;

function TDRESUMENCONTRATACION.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
end;

function TDRESUMENCONTRATACION.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('RESUMENCONTRATACION') then
    if PTabela(TabGlobal.DRESUMENCONTRATACION, ['CODIGO'], [CODIGO.Valor.Value]) then
      Result := True;
end;

procedure TDRESUMENCONTRATACION.CalculaCampos;
begin
end;

procedure TDRESUMENCONTRATACION.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDRESUMENCONTRATACION.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
var
  I: Integer;
begin
  Filtro.Clear;
  FiltroRelac.Clear;
  if Atribui then
  begin
    FiltroRelac.Add('RESUMENCONTRATACION.CLICOD = :Divisoes_CLICOD');
    FiltroRelac.Add(' and RESUMENCONTRATACION.seq = :Divisoes_seq');
  end
  else
    for I:=0 to Campos.Count-1 do
      TAtributo(Campos[I]).Valor.OnValidate := nil;
  CLICOD.Valor.ReadOnly := Atribui;
  seq.Valor.ReadOnly := Atribui;
  if Atualiza then
    AtualizaSql;
end;

procedure TDRESUMENCONTRATACION.AtribuiMestre(DataSet: TDataSet);
begin
  CLICOD.Valor.Value := TabGlobal.DDivisoes.CLICOD.Valor.Value;
  seq.Valor.Value := TabGlobal.DDivisoes.seq.Valor.Value;
end;

procedure TDRESUMENCONTRATACION.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDRESUMENCONTRATACION.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDRESUMENCONTRATACION.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (CODIGO.SempreAtribui) and (CODIGO.AutoIncremento > 0) then
      AutoIncremento('CODIGO', True, CODIGO.AutoIncremento);
end;

procedure TDRESUMENCONTRATACION.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDRESUMENCONTRATACION.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDRESUMENCONTRATACION.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
