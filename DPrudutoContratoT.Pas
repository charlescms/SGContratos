{
 Classe da tabela: PrudutoContratoT - Produto
}

unit DPrudutoContratoT;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0011,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDPrudutoContratoT = class(TTabela)
  public
    Contrato: TDPrudutoContratoT_Contrato;
    Sequencia: TDPrudutoContratoT_Sequencia;
    Produto: TDPrudutoContratoT_Produto;
    FormPago: TDPrudutoContratoT_FormPago;
    CodTbPorto: TDPrudutoContratoT_CodTbPorto;
    NomePorto: TDPrudutoContratoT_NomePorto;
    PrecoFOB: TDPrudutoContratoT_PrecoFOB;
    PrecoSCC: TDPrudutoContratoT_PrecoSCC;
    Quantidade: TDPrudutoContratoT_Quantidade;
    ValorSCC: TDPrudutoContratoT_ValorSCC;
    OBS: TDPrudutoContratoT_OBS;
    Complemento: TDPrudutoContratoT_Complemento;
    Cadastro: TDPrudutoContratoT_Cadastro;
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

constructor TDPrudutoContratoT.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'PrudutoContratoT';
  Titulo           := 'Produto';
  Name             := 'DPrudutoContratoT';
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
  DataSource.Name  := 'DsPrudutoContratoT';
  with UpdateSql do
  begin
    Name           := 'UpdSql_PrudutoContratoT';
    // Exclusão de Registro
    DeleteSQL.Add('delete from PrudutoContratoT');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  Contrato = :OLD_Contrato');
    DeleteSQL.Add('  and Sequencia = :OLD_Sequencia');
    // Inserção de Registro
    InsertSQL.Add('insert into PrudutoContratoT');
    InsertSQL.Add('  (');
    InsertSQL.Add('  Contrato,');
    InsertSQL.Add('  Sequencia,');
    InsertSQL.Add('  Produto,');
    InsertSQL.Add('  FormPago,');
    InsertSQL.Add('  CodTbPorto,');
    InsertSQL.Add('  PrecoFOB,');
    InsertSQL.Add('  PrecoSCC,');
    InsertSQL.Add('  Quantidade,');
    InsertSQL.Add('  ValorSCC,');
    InsertSQL.Add('  OBS,');
    InsertSQL.Add('  Complemento,');
    InsertSQL.Add('  Cadastro');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :Contrato,');
    InsertSQL.Add('  :Sequencia,');
    InsertSQL.Add('  :Produto,');
    InsertSQL.Add('  :FormPago,');
    InsertSQL.Add('  :CodTbPorto,');
    InsertSQL.Add('  :PrecoFOB,');
    InsertSQL.Add('  :PrecoSCC,');
    InsertSQL.Add('  :Quantidade,');
    InsertSQL.Add('  :ValorSCC,');
    InsertSQL.Add('  :OBS,');
    InsertSQL.Add('  :Complemento,');
    InsertSQL.Add('  :Cadastro');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update PrudutoContratoT');
    ModifySQL.Add('set');
    ModifySQL.Add('  Contrato = :Contrato,');
    ModifySQL.Add('  Sequencia = :Sequencia,');
    ModifySQL.Add('  Produto = :Produto,');
    ModifySQL.Add('  FormPago = :FormPago,');
    ModifySQL.Add('  CodTbPorto = :CodTbPorto,');
    ModifySQL.Add('  PrecoFOB = :PrecoFOB,');
    ModifySQL.Add('  PrecoSCC = :PrecoSCC,');
    ModifySQL.Add('  Quantidade = :Quantidade,');
    ModifySQL.Add('  ValorSCC = :ValorSCC,');
    ModifySQL.Add('  OBS = :OBS,');
    ModifySQL.Add('  Complemento = :Complemento,');
    ModifySQL.Add('  Cadastro = :Cadastro');
    ModifySQL.Add('where');
    ModifySQL.Add('  Contrato = :OLD_Contrato');
    ModifySQL.Add('  and Sequencia = :OLD_Sequencia');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  PrudutoContratoT.Contrato AS Contrato,');
    RefreshSQL.Add('  PrudutoContratoT.Sequencia AS Sequencia,');
    RefreshSQL.Add('  PrudutoContratoT.Produto AS Produto,');
    RefreshSQL.Add('  PrudutoContratoT.FormPago AS FormPago,');
    RefreshSQL.Add('  PrudutoContratoT.CodTbPorto AS CodTbPorto,');
    RefreshSQL.Add('  TbPorto.NomePorto AS NomePorto,');
    RefreshSQL.Add('  PrudutoContratoT.PrecoFOB AS PrecoFOB,');
    RefreshSQL.Add('  PrudutoContratoT.PrecoSCC AS PrecoSCC,');
    RefreshSQL.Add('  PrudutoContratoT.Quantidade AS Quantidade,');
    RefreshSQL.Add('  PrudutoContratoT.ValorSCC AS ValorSCC,');
    RefreshSQL.Add('  PrudutoContratoT.OBS AS OBS,');
    RefreshSQL.Add('  PrudutoContratoT.Complemento AS Complemento,');
    RefreshSQL.Add('  PrudutoContratoT.Cadastro AS Cadastro');
    RefreshSQL.Add('from PrudutoContratoT');
    RefreshSQL.Add('Left Outer Join ContratoTransporte on');
    RefreshSQL.Add('  PrudutoContratoT.Contrato = ContratoTransporte.Contrato');
    RefreshSQL.Add('Left Outer Join TbFormaPagamento on');
    RefreshSQL.Add('  PrudutoContratoT.FormPago = TbFormaPagamento.FormPago');
    RefreshSQL.Add('Left Outer Join TbPorto on');
    RefreshSQL.Add('  PrudutoContratoT.CodTbPorto = TbPorto.CodTbPorto');
    RefreshSQL.Add('Left Outer Join Produtos on');
    RefreshSQL.Add('  PrudutoContratoT.Produto = Produtos.Produto');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  PrudutoContratoT.Contrato = :OLD_Contrato');
    RefreshSQL.Add('  and PrudutoContratoT.Sequencia = :OLD_Sequencia');
  end;
  TabelasExtras.Add('ContratoTransporte');
  TabelasExtras.Add('TbFormaPagamento');
  TabelasExtras.Add('TbPorto');
  TabelasExtras.Add('Produtos');
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  PrudutoContratoT.Contrato AS Contrato,');
  SqlPrincipal.Add('  PrudutoContratoT.Sequencia AS Sequencia,');
  SqlPrincipal.Add('  PrudutoContratoT.Produto AS Produto,');
  SqlPrincipal.Add('  PrudutoContratoT.FormPago AS FormPago,');
  SqlPrincipal.Add('  PrudutoContratoT.CodTbPorto AS CodTbPorto,');
  SqlPrincipal.Add('  TbPorto.NomePorto AS NomePorto,');
  SqlPrincipal.Add('  PrudutoContratoT.PrecoFOB AS PrecoFOB,');
  SqlPrincipal.Add('  PrudutoContratoT.PrecoSCC AS PrecoSCC,');
  SqlPrincipal.Add('  PrudutoContratoT.Quantidade AS Quantidade,');
  SqlPrincipal.Add('  PrudutoContratoT.ValorSCC AS ValorSCC,');
  SqlPrincipal.Add('  PrudutoContratoT.OBS AS OBS,');
  SqlPrincipal.Add('  PrudutoContratoT.Complemento AS Complemento,');
  SqlPrincipal.Add('  PrudutoContratoT.Cadastro AS Cadastro');
  SqlPrincipal.Add('from PrudutoContratoT');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  FiltroExtra.Add('Left Outer Join ContratoTransporte on');
  FiltroExtra.Add('  PrudutoContratoT.Contrato = ContratoTransporte.Contrato');
  FiltroExtra.Add('Left Outer Join TbFormaPagamento on');
  FiltroExtra.Add('  PrudutoContratoT.FormPago = TbFormaPagamento.FormPago');
  FiltroExtra.Add('Left Outer Join TbPorto on');
  FiltroExtra.Add('  PrudutoContratoT.CodTbPorto = TbPorto.CodTbPorto');
  FiltroExtra.Add('Left Outer Join Produtos on');
  FiltroExtra.Add('  PrudutoContratoT.Produto = Produtos.Produto');
  Sql.Add('order by PrudutoContratoT.Contrato,PrudutoContratoT.Sequencia');
  Contrato := TDPrudutoContratoT_Contrato.Create(AOwner);
  Contrato.Valor.DataSet := Self;
  Sequencia := TDPrudutoContratoT_Sequencia.Create(AOwner);
  Sequencia.Valor.DataSet := Self;
  Produto := TDPrudutoContratoT_Produto.Create(AOwner);
  Produto.Valor.DataSet := Self;
  PrecoFOB := TDPrudutoContratoT_PrecoFOB.Create(AOwner);
  PrecoFOB.Valor.DataSet := Self;
  PrecoSCC := TDPrudutoContratoT_PrecoSCC.Create(AOwner);
  PrecoSCC.Valor.DataSet := Self;
  Quantidade := TDPrudutoContratoT_Quantidade.Create(AOwner);
  Quantidade.Valor.DataSet := Self;
  ValorSCC := TDPrudutoContratoT_ValorSCC.Create(AOwner);
  ValorSCC.Valor.DataSet := Self;
  FormPago := TDPrudutoContratoT_FormPago.Create(AOwner);
  FormPago.Valor.DataSet := Self;
  OBS := TDPrudutoContratoT_OBS.Create(AOwner);
  OBS.Valor.DataSet := Self;
  CodTbPorto := TDPrudutoContratoT_CodTbPorto.Create(AOwner);
  CodTbPorto.Valor.DataSet := Self;
  NomePorto := TDPrudutoContratoT_NomePorto.Create(AOwner);
  NomePorto.Valor.DataSet := Self;
  Complemento := TDPrudutoContratoT_Complemento.Create(AOwner);
  Complemento.Valor.DataSet := Self;
  Cadastro := TDPrudutoContratoT_Cadastro.Create(AOwner);
  Cadastro.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(Contrato);
  ChavePrimaria.Add(Sequencia);
//CRIANDO CAMPOS 
  Campos.Add(Contrato);
  Campos.Add(Sequencia);
  Campos.Add(Produto);
  Campos.Add(FormPago);
  Campos.Add(CodTbPorto);
  Campos.Add(NomePorto);
  Campos.Add(PrecoFOB);
  Campos.Add(PrecoSCC);
  Campos.Add(Quantidade);
  Campos.Add(ValorSCC);
  Campos.Add(OBS);
  Campos.Add(Complemento);
  Campos.Add(Cadastro);
  TituloIndices.Add('Contrato,Seq.');
  Indices.Add('PrudutoContratoT.Contrato,PrudutoContratoT.Sequencia');
  Crescente.Add('S');
  TituloPrimaria := 'Contrato,Seq.';
  ChPrimaria     := 'PrudutoContratoT.Contrato,PrudutoContratoT.Sequencia';
//CRIANDO TituloIndices 
  TituloIndice   := 'Contrato,Seq.';
  ChaveIndice    := 'PrudutoContratoT.Contrato,PrudutoContratoT.Sequencia';
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

procedure TDPrudutoContratoT.CriaForeignKeys;
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

function TDPrudutoContratoT.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDPrudutoContratoT.ExclusaoCascata;
begin
end;

function TDPrudutoContratoT.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('TbPorto') then
    if (UpperCase('CodTbPorto') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DTbPorto, ['CodTbPorto'], [CodTbPorto.Valor.Value], [Campo], Retorno) then
        Result := True;

end;

function TDPrudutoContratoT.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('TbPorto') then
    if PTabela(TabGlobal.DTbPorto, ['CodTbPorto'], [CodTbPorto.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('ContratoTransporte') then
    if PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('TbFormaPagamento') then
    if PTabela(TabGlobal.DTbFormaPagamento, ['FormPago'], [FormPago.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('Produtos') then
    if PTabela(TabGlobal.DProdutos, ['Produto'], [Produto.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('PrudutoContratoT') then
    if PTabela(TabGlobal.DPrudutoContratoT, ['Contrato','Sequencia'], [Contrato.Valor.Value,Sequencia.Valor.Value]) then
      Result := True;
end;

procedure TDPrudutoContratoT.CalculaCampos;
begin
  ValorSCC.Conteudo := CalculaDPrudutoContratoT_ValorSCC(Self);
end;

procedure TDPrudutoContratoT.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDPrudutoContratoT.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
var
  I: Integer;
begin
  Filtro.Clear;
  FiltroRelac.Clear;
  if Atribui then
  begin
    FiltroRelac.Add('PrudutoContratoT.Contrato = :ContratoTransporte_Contrato');
  end
  else
    for I:=0 to Campos.Count-1 do
      TAtributo(Campos[I]).Valor.OnValidate := nil;
  Contrato.Valor.ReadOnly := Atribui;
  if Atualiza then
    AtualizaSql;
end;

procedure TDPrudutoContratoT.AtribuiMestre(DataSet: TDataSet);
begin
  Contrato.Valor.Value := TabGlobal.DContratoTransporte.Contrato.Valor.Value;
end;

procedure TDPrudutoContratoT.ProcessoDireto1(DataSet: TDataSet);
var
  QueryLc: TTabela;
  EmEdicao: Boolean;
begin
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'QuantidadeTotal = (QuantidadeTotal + (:PrudutoContratoT_Quantidade))') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorSCCTotal = (ValorSCCTotal + (:PrudutoContratoT_ValorSCC))') then
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

procedure TDPrudutoContratoT.ProcessoDireto2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if Modificacao then
  begin
    EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
    if EmEdicao then
      TabGlobal.DContratoTransporte.Salva;
    if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'QuantidadeTotal = (QuantidadeTotal + (:PrudutoContratoT_Quantidade))') then
      MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
    if EmEdicao then
      TabGlobal.DContratoTransporte.Modifica;
  end;
  if Modificacao then
  begin
    EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
    if EmEdicao then
      TabGlobal.DContratoTransporte.Salva;
    if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorSCCTotal = (ValorSCCTotal + (:PrudutoContratoT_ValorSCC))') then
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

procedure TDPrudutoContratoT.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (Contrato.SempreAtribui) and (Contrato.AutoIncremento > 0) then
      AutoIncremento('Contrato', True, Contrato.AutoIncremento);
end;

procedure TDPrudutoContratoT.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'QuantidadeTotal = (QuantidadeTotal - (:PrudutoContratoT_Quantidade))') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorSCCTotal = (ValorSCCTotal - (:PrudutoContratoT_ValorSCC ))') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
end;

procedure TDPrudutoContratoT.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'QuantidadeTotal = (QuantidadeTotal - (:PrudutoContratoT_Quantidade))') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorSCCTotal = (ValorSCCTotal - (:PrudutoContratoT_ValorSCC ))') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  ExclusaoCascata;
end;

procedure TDPrudutoContratoT.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
