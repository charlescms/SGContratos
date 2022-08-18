{
 Classe da tabela: Boocking - Boocking
}

unit DBoocking;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0000,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDBoocking = class(TTabela)
  public
    Contrato: TDBoocking_Contrato;
    Seq: TDBoocking_Seq;
    Navio: TDBoocking_Navio;
    Cadastro: TDBoocking_Cadastro;
    DataPrevista: TDBoocking_DataPrevista;
    StatusBK: TDBoocking_StatusBK;
    Quantidade: TDBoocking_Quantidade;
    QuntTransp: TDBoocking_QuntTransp;
    SALDO: TDBoocking_SALDO;
    Usuario: TDBoocking_Usuario;
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

constructor TDBoocking.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'Boocking';
  Titulo           := 'Boocking';
  Name             := 'DBoocking';
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
  DataSource.Name  := 'DsBoocking';
  with UpdateSql do
  begin
    Name           := 'UpdSql_Boocking';
    // Exclusão de Registro
    DeleteSQL.Add('delete from Boocking');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  Contrato = :OLD_Contrato');
    DeleteSQL.Add('  and Seq = :OLD_Seq');
    // Inserção de Registro
    InsertSQL.Add('insert into Boocking');
    InsertSQL.Add('  (');
    InsertSQL.Add('  Contrato,');
    InsertSQL.Add('  Seq,');
    InsertSQL.Add('  Navio,');
    InsertSQL.Add('  Cadastro,');
    InsertSQL.Add('  DataPrevista,');
    InsertSQL.Add('  StatusBK,');
    InsertSQL.Add('  Quantidade,');
    InsertSQL.Add('  QuntTransp,');
    InsertSQL.Add('  Usuario');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :Contrato,');
    InsertSQL.Add('  :Seq,');
    InsertSQL.Add('  :Navio,');
    InsertSQL.Add('  :Cadastro,');
    InsertSQL.Add('  :DataPrevista,');
    InsertSQL.Add('  :StatusBK,');
    InsertSQL.Add('  :Quantidade,');
    InsertSQL.Add('  :QuntTransp,');
    InsertSQL.Add('  :Usuario');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update Boocking');
    ModifySQL.Add('set');
    ModifySQL.Add('  Contrato = :Contrato,');
    ModifySQL.Add('  Seq = :Seq,');
    ModifySQL.Add('  Navio = :Navio,');
    ModifySQL.Add('  Cadastro = :Cadastro,');
    ModifySQL.Add('  DataPrevista = :DataPrevista,');
    ModifySQL.Add('  StatusBK = :StatusBK,');
    ModifySQL.Add('  Quantidade = :Quantidade,');
    ModifySQL.Add('  QuntTransp = :QuntTransp,');
    ModifySQL.Add('  Usuario = :Usuario');
    ModifySQL.Add('where');
    ModifySQL.Add('  Contrato = :OLD_Contrato');
    ModifySQL.Add('  and Seq = :OLD_Seq');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  Boocking.Contrato AS Contrato,');
    RefreshSQL.Add('  Boocking.Seq AS Seq,');
    RefreshSQL.Add('  Boocking.Navio AS Navio,');
    RefreshSQL.Add('  Boocking.Cadastro AS Cadastro,');
    RefreshSQL.Add('  Boocking.DataPrevista AS DataPrevista,');
    RefreshSQL.Add('  Boocking.StatusBK AS StatusBK,');
    RefreshSQL.Add('  Boocking.Quantidade AS Quantidade,');
    RefreshSQL.Add('  Boocking.QuntTransp AS QuntTransp,');
    RefreshSQL.Add('  Boocking.Usuario AS Usuario');
    RefreshSQL.Add('from Boocking');
    RefreshSQL.Add('Left Outer Join ContratoTransporte on');
    RefreshSQL.Add('  Boocking.Contrato = ContratoTransporte.Contrato');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  Boocking.Contrato = :OLD_Contrato');
    RefreshSQL.Add('  and Boocking.Seq = :OLD_Seq');
  end;
  TabelasExtras.Add('ContratoTransporte');
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  Boocking.Contrato AS Contrato,');
  SqlPrincipal.Add('  Boocking.Seq AS Seq,');
  SqlPrincipal.Add('  Boocking.Navio AS Navio,');
  SqlPrincipal.Add('  Boocking.Cadastro AS Cadastro,');
  SqlPrincipal.Add('  Boocking.DataPrevista AS DataPrevista,');
  SqlPrincipal.Add('  Boocking.StatusBK AS StatusBK,');
  SqlPrincipal.Add('  Boocking.Quantidade AS Quantidade,');
  SqlPrincipal.Add('  Boocking.QuntTransp AS QuntTransp,');
  SqlPrincipal.Add('  Boocking.Usuario AS Usuario');
  SqlPrincipal.Add('from Boocking');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  FiltroExtra.Add('Left Outer Join ContratoTransporte on');
  FiltroExtra.Add('  Boocking.Contrato = ContratoTransporte.Contrato');
  Sql.Add('order by Boocking.Contrato,Boocking.Seq');
  Contrato := TDBoocking_Contrato.Create(AOwner);
  Contrato.Valor.DataSet := Self;
  Seq := TDBoocking_Seq.Create(AOwner);
  Seq.Valor.DataSet := Self;
  Navio := TDBoocking_Navio.Create(AOwner);
  Navio.Valor.DataSet := Self;
  Cadastro := TDBoocking_Cadastro.Create(AOwner);
  Cadastro.Valor.DataSet := Self;
  DataPrevista := TDBoocking_DataPrevista.Create(AOwner);
  DataPrevista.Valor.DataSet := Self;
  StatusBK := TDBoocking_StatusBK.Create(AOwner);
  StatusBK.Valor.DataSet := Self;
  Quantidade := TDBoocking_Quantidade.Create(AOwner);
  Quantidade.Valor.DataSet := Self;
  QuntTransp := TDBoocking_QuntTransp.Create(AOwner);
  QuntTransp.Valor.DataSet := Self;
  SALDO := TDBoocking_SALDO.Create(AOwner);
  SALDO.Valor.DataSet := Self;
  Usuario := TDBoocking_Usuario.Create(AOwner);
  Usuario.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(Contrato);
  ChavePrimaria.Add(Seq);
//CRIANDO CAMPOS 
  Campos.Add(Contrato);
  Campos.Add(Seq);
  Campos.Add(Navio);
  Campos.Add(Cadastro);
  Campos.Add(DataPrevista);
  Campos.Add(StatusBK);
  Campos.Add(Quantidade);
  Campos.Add(QuntTransp);
  Campos.Add(SALDO);
  Campos.Add(Usuario);
  TituloIndices.Add('Contrato,Seq.');
  Indices.Add('Boocking.Contrato,Boocking.Seq');
  Crescente.Add('S');
  TituloPrimaria := 'Contrato,Seq.';
  ChPrimaria     := 'Boocking.Contrato,Boocking.Seq';
//CRIANDO TituloIndices 
  TituloIndice   := 'Contrato,Seq.';
  ChaveIndice    := 'Boocking.Contrato,Boocking.Seq';
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

procedure TDBoocking.CriaForeignKeys;
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

function TDBoocking.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDBoocking.ExclusaoCascata;
begin
end;

function TDBoocking.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
end;

function TDBoocking.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('ContratoTransporte') then
    if PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('Boocking') then
    if PTabela(TabGlobal.DBoocking, ['Contrato','Seq'], [Contrato.Valor.Value,Seq.Valor.Value]) then
      Result := True;
end;

procedure TDBoocking.CalculaCampos;
begin
end;

procedure TDBoocking.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDBoocking.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
var
  I: Integer;
begin
  Filtro.Clear;
  FiltroRelac.Clear;
  if Atribui then
  begin
    FiltroRelac.Add('Boocking.Contrato = :ContratoTransporte_Contrato');
  end
  else
    for I:=0 to Campos.Count-1 do
      TAtributo(Campos[I]).Valor.OnValidate := nil;
  Contrato.Valor.ReadOnly := Atribui;
  if Atualiza then
    AtualizaSql;
end;

procedure TDBoocking.AtribuiMestre(DataSet: TDataSet);
begin
  Contrato.Valor.Value := TabGlobal.DContratoTransporte.Contrato.Valor.Value;
end;

procedure TDBoocking.ProcessoDireto1(DataSet: TDataSet);
var
  QueryLc: TTabela;
  EmEdicao: Boolean;
begin
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if ( ( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'AB')  Or ( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'BO') ) then
    if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'StatusCT = ''BO''') then
      MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  {$IFDEF IBX}
  Transaction.CommitRetaining;
  {$ELSE}
  {$ENDIF}
  Inclusao    := False;
  Modificacao := False;
end;

procedure TDBoocking.ProcessoDireto2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if Modificacao then
  begin
    EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
    if EmEdicao then
      TabGlobal.DContratoTransporte.Salva;
    if ( ( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'AB')  Or ( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'BO') ) then
      if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'StatusCT = ''BO''') then
        MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
    if EmEdicao then
      TabGlobal.DContratoTransporte.Modifica;
  end;
  {$IFDEF IBX}
  Transaction.CommitRetaining;
  {$ELSE}
  {$ENDIF}
  Inclusao    := False;
  Modificacao := False;
end;

procedure TDBoocking.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (Contrato.SempreAtribui) and (Contrato.AutoIncremento > 0) then
      AutoIncremento('Contrato', True, Contrato.AutoIncremento);
end;

procedure TDBoocking.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if ( ( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'AB')  Or ( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'BO') ) then
    if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'StatusCT = ''BO''') then
      MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
end;

procedure TDBoocking.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if ( ( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'AB')  Or ( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'BO') ) then
    if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'StatusCT = ''BO''') then
      MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  ExclusaoCascata;
end;

procedure TDBoocking.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
