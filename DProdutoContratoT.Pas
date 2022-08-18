{
 Classe da tabela: ProdutoContratoT - Produto Contratado
}

unit DProdutoContratoT;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0014,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDProdutoContratoT = class(TTabela)
  public
    Contrato: TDProdutoContratoT_Contrato;
    Sequencia: TDProdutoContratoT_Sequencia;
    Produto: TDProdutoContratoT_Produto;
    FormPago: TDProdutoContratoT_FormPago;
    CodTbPorto: TDProdutoContratoT_CodTbPorto;
    NomePorto: TDProdutoContratoT_NomePorto;
    PrecoFOB: TDProdutoContratoT_PrecoFOB;
    PrecoSCC: TDProdutoContratoT_PrecoSCC;
    Quantidade: TDProdutoContratoT_Quantidade;
    ValorSCC: TDProdutoContratoT_ValorSCC;
    ComisaoSFatura: TDProdutoContratoT_ComisaoSFatura;
    OBS: TDProdutoContratoT_OBS;
    Complemento: TDProdutoContratoT_Complemento;
    Cadastro: TDProdutoContratoT_Cadastro;
    FormComissao: TDProdutoContratoT_FormComissao;
    Comissao: TDProdutoContratoT_Comissao;
    Usuario: TDProdutoContratoT_Usuario;
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

constructor TDProdutoContratoT.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'ProdutoContratoT';
  Titulo           := 'Produto Contratado';
  Name             := 'DProdutoContratoT';
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
  DataSource.Name  := 'DsProdutoContratoT';
  with UpdateSql do
  begin
    Name           := 'UpdSql_ProdutoContratoT';
    // Exclusão de Registro
    DeleteSQL.Add('delete from ProdutoContratoT');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  Contrato = :OLD_Contrato');
    DeleteSQL.Add('  and Sequencia = :OLD_Sequencia');
    // Inserção de Registro
    InsertSQL.Add('insert into ProdutoContratoT');
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
    InsertSQL.Add('  ComisaoSFatura,');
    InsertSQL.Add('  OBS,');
    InsertSQL.Add('  Complemento,');
    InsertSQL.Add('  Cadastro,');
    InsertSQL.Add('  Usuario');
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
    InsertSQL.Add('  :ComisaoSFatura,');
    InsertSQL.Add('  :OBS,');
    InsertSQL.Add('  :Complemento,');
    InsertSQL.Add('  :Cadastro,');
    InsertSQL.Add('  :Usuario');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update ProdutoContratoT');
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
    ModifySQL.Add('  ComisaoSFatura = :ComisaoSFatura,');
    ModifySQL.Add('  OBS = :OBS,');
    ModifySQL.Add('  Complemento = :Complemento,');
    ModifySQL.Add('  Cadastro = :Cadastro,');
    ModifySQL.Add('  Usuario = :Usuario');
    ModifySQL.Add('where');
    ModifySQL.Add('  Contrato = :OLD_Contrato');
    ModifySQL.Add('  and Sequencia = :OLD_Sequencia');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  ProdutoContratoT.Contrato AS Contrato,');
    RefreshSQL.Add('  ProdutoContratoT.Sequencia AS Sequencia,');
    RefreshSQL.Add('  ProdutoContratoT.Produto AS Produto,');
    RefreshSQL.Add('  ProdutoContratoT.FormPago AS FormPago,');
    RefreshSQL.Add('  ProdutoContratoT.CodTbPorto AS CodTbPorto,');
    RefreshSQL.Add('  TbPorto.NomePorto AS NomePorto,');
    RefreshSQL.Add('  ProdutoContratoT.PrecoFOB AS PrecoFOB,');
    RefreshSQL.Add('  ProdutoContratoT.PrecoSCC AS PrecoSCC,');
    RefreshSQL.Add('  ProdutoContratoT.Quantidade AS Quantidade,');
    RefreshSQL.Add('  ProdutoContratoT.ValorSCC AS ValorSCC,');
    RefreshSQL.Add('  ProdutoContratoT.ComisaoSFatura AS ComisaoSFatura,');
    RefreshSQL.Add('  ProdutoContratoT.OBS AS OBS,');
    RefreshSQL.Add('  ProdutoContratoT.Complemento AS Complemento,');
    RefreshSQL.Add('  ProdutoContratoT.Cadastro AS Cadastro,');
    RefreshSQL.Add('  ContratoTransporte.FormComissao AS FormComissao,');
    RefreshSQL.Add('  ContratoTransporte.Comissao AS Comissao,');
    RefreshSQL.Add('  ProdutoContratoT.Usuario AS Usuario');
    RefreshSQL.Add('from ProdutoContratoT');
    RefreshSQL.Add('Left Outer Join ContratoTransporte on');
    RefreshSQL.Add('  ProdutoContratoT.Contrato = ContratoTransporte.Contrato');
    RefreshSQL.Add('Left Outer Join TbFormaPagamento on');
    RefreshSQL.Add('  ProdutoContratoT.FormPago = TbFormaPagamento.FormPago');
    RefreshSQL.Add('Left Outer Join TbPorto on');
    RefreshSQL.Add('  ProdutoContratoT.CodTbPorto = TbPorto.CodTbPorto');
    RefreshSQL.Add('Left Outer Join Produtos on');
    RefreshSQL.Add('  ProdutoContratoT.Produto = Produtos.Produto');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  ProdutoContratoT.Contrato = :OLD_Contrato');
    RefreshSQL.Add('  and ProdutoContratoT.Sequencia = :OLD_Sequencia');
  end;
  TabelasExtras.Add('ContratoTransporte');
  TabelasExtras.Add('TbFormaPagamento');
  TabelasExtras.Add('TbPorto');
  TabelasExtras.Add('Produtos');
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  ProdutoContratoT.Contrato AS Contrato,');
  SqlPrincipal.Add('  ProdutoContratoT.Sequencia AS Sequencia,');
  SqlPrincipal.Add('  ProdutoContratoT.Produto AS Produto,');
  SqlPrincipal.Add('  ProdutoContratoT.FormPago AS FormPago,');
  SqlPrincipal.Add('  ProdutoContratoT.CodTbPorto AS CodTbPorto,');
  SqlPrincipal.Add('  TbPorto.NomePorto AS NomePorto,');
  SqlPrincipal.Add('  ProdutoContratoT.PrecoFOB AS PrecoFOB,');
  SqlPrincipal.Add('  ProdutoContratoT.PrecoSCC AS PrecoSCC,');
  SqlPrincipal.Add('  ProdutoContratoT.Quantidade AS Quantidade,');
  SqlPrincipal.Add('  ProdutoContratoT.ValorSCC AS ValorSCC,');
  SqlPrincipal.Add('  ProdutoContratoT.ComisaoSFatura AS ComisaoSFatura,');
  SqlPrincipal.Add('  ProdutoContratoT.OBS AS OBS,');
  SqlPrincipal.Add('  ProdutoContratoT.Complemento AS Complemento,');
  SqlPrincipal.Add('  ProdutoContratoT.Cadastro AS Cadastro,');
  SqlPrincipal.Add('  ContratoTransporte.FormComissao AS FormComissao,');
  SqlPrincipal.Add('  ContratoTransporte.Comissao AS Comissao,');
  SqlPrincipal.Add('  ProdutoContratoT.Usuario AS Usuario');
  SqlPrincipal.Add('from ProdutoContratoT');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  FiltroExtra.Add('Left Outer Join ContratoTransporte on');
  FiltroExtra.Add('  ProdutoContratoT.Contrato = ContratoTransporte.Contrato');
  FiltroExtra.Add('Left Outer Join TbFormaPagamento on');
  FiltroExtra.Add('  ProdutoContratoT.FormPago = TbFormaPagamento.FormPago');
  FiltroExtra.Add('Left Outer Join TbPorto on');
  FiltroExtra.Add('  ProdutoContratoT.CodTbPorto = TbPorto.CodTbPorto');
  FiltroExtra.Add('Left Outer Join Produtos on');
  FiltroExtra.Add('  ProdutoContratoT.Produto = Produtos.Produto');
  Sql.Add('order by ProdutoContratoT.Contrato,ProdutoContratoT.Sequencia');
  Contrato := TDProdutoContratoT_Contrato.Create(AOwner);
  Contrato.Valor.DataSet := Self;
  Sequencia := TDProdutoContratoT_Sequencia.Create(AOwner);
  Sequencia.Valor.DataSet := Self;
  Produto := TDProdutoContratoT_Produto.Create(AOwner);
  Produto.Valor.DataSet := Self;
  PrecoFOB := TDProdutoContratoT_PrecoFOB.Create(AOwner);
  PrecoFOB.Valor.DataSet := Self;
  PrecoSCC := TDProdutoContratoT_PrecoSCC.Create(AOwner);
  PrecoSCC.Valor.DataSet := Self;
  Quantidade := TDProdutoContratoT_Quantidade.Create(AOwner);
  Quantidade.Valor.DataSet := Self;
  ValorSCC := TDProdutoContratoT_ValorSCC.Create(AOwner);
  ValorSCC.Valor.DataSet := Self;
  ComisaoSFatura := TDProdutoContratoT_ComisaoSFatura.Create(AOwner);
  ComisaoSFatura.Valor.DataSet := Self;
  FormPago := TDProdutoContratoT_FormPago.Create(AOwner);
  FormPago.Valor.DataSet := Self;
  CodTbPorto := TDProdutoContratoT_CodTbPorto.Create(AOwner);
  CodTbPorto.Valor.DataSet := Self;
  NomePorto := TDProdutoContratoT_NomePorto.Create(AOwner);
  NomePorto.Valor.DataSet := Self;
  Complemento := TDProdutoContratoT_Complemento.Create(AOwner);
  Complemento.Valor.DataSet := Self;
  Cadastro := TDProdutoContratoT_Cadastro.Create(AOwner);
  Cadastro.Valor.DataSet := Self;
  OBS := TDProdutoContratoT_OBS.Create(AOwner);
  OBS.Valor.DataSet := Self;
  FormComissao := TDProdutoContratoT_FormComissao.Create(AOwner);
  FormComissao.Valor.DataSet := Self;
  Comissao := TDProdutoContratoT_Comissao.Create(AOwner);
  Comissao.Valor.DataSet := Self;
  Usuario := TDProdutoContratoT_Usuario.Create(AOwner);
  Usuario.Valor.DataSet := Self;
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
  Campos.Add(ComisaoSFatura);
  Campos.Add(OBS);
  Campos.Add(Complemento);
  Campos.Add(Cadastro);
  Campos.Add(FormComissao);
  Campos.Add(Comissao);
  Campos.Add(Usuario);
  TituloIndices.Add('Contrato,Seq.');
  Indices.Add('ProdutoContratoT.Contrato,ProdutoContratoT.Sequencia');
  Crescente.Add('S');
  TituloPrimaria := 'Contrato,Seq.';
  ChPrimaria     := 'ProdutoContratoT.Contrato,ProdutoContratoT.Sequencia';
//CRIANDO TituloIndices 
  TituloIndice   := 'Contrato,Seq.';
  ChaveIndice    := 'ProdutoContratoT.Contrato,ProdutoContratoT.Sequencia';
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

procedure TDProdutoContratoT.CriaForeignKeys;
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

function TDProdutoContratoT.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDProdutoContratoT.ExclusaoCascata;
begin
end;

function TDProdutoContratoT.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('TbPorto') then
    if (UpperCase('CodTbPorto') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DTbPorto, ['CodTbPorto'], [CodTbPorto.Valor.Value], [Campo], Retorno) then
        Result := True;

  if UpperCase(Tabela) = UpperCase('ContratoTransporte') then
    if (UpperCase('Contrato') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], [Campo], Retorno) then
        Result := True;

end;

function TDProdutoContratoT.PesquisaRelacionados(Tabela: String): Boolean;
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

  if UpperCase(Tabela) = UpperCase('ProdutoContratoT') then
    if PTabela(TabGlobal.DProdutoContratoT, ['Contrato','Sequencia'], [Contrato.Valor.Value,Sequencia.Valor.Value]) then
      Result := True;
end;

procedure TDProdutoContratoT.CalculaCampos;
begin
  ValorSCC.Conteudo := CalculaDProdutoContratoT_ValorSCC(Self);
  ComisaoSFatura.Conteudo := CalculaDProdutoContratoT_ComisaoSFatura(Self);
end;

procedure TDProdutoContratoT.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDProdutoContratoT.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
var
  I: Integer;
begin
  Filtro.Clear;
  FiltroRelac.Clear;
  if Atribui then
  begin
    FiltroRelac.Add('ProdutoContratoT.Contrato = :ContratoTransporte_Contrato');
  end
  else
    for I:=0 to Campos.Count-1 do
      TAtributo(Campos[I]).Valor.OnValidate := nil;
  Contrato.Valor.ReadOnly := Atribui;
  if Atualiza then
    AtualizaSql;
end;

procedure TDProdutoContratoT.AtribuiMestre(DataSet: TDataSet);
begin
  Contrato.Valor.Value := TabGlobal.DContratoTransporte.Contrato.Valor.Value;
end;

procedure TDProdutoContratoT.ProcessoDireto1(DataSet: TDataSet);
var
  QueryLc: TTabela;
  EmEdicao: Boolean;
begin
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'QuantidadeTotal = (QuantidadeTotal + (:ProdutoContratoT_Quantidade))') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorSCCTotal = (ValorSCCTotal + (:ProdutoContratoT_ValorSCC))') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorTotalComissao = ( ValorTotalComissao + ( :ProdutoContratoT_ComisaoSFatura  ))') then
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

procedure TDProdutoContratoT.ProcessoDireto2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if Modificacao then
  begin
    EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
    if EmEdicao then
      TabGlobal.DContratoTransporte.Salva;
    if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'QuantidadeTotal = (QuantidadeTotal + (:ProdutoContratoT_Quantidade))') then
      MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
    if EmEdicao then
      TabGlobal.DContratoTransporte.Modifica;
  end;
  if Modificacao then
  begin
    EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
    if EmEdicao then
      TabGlobal.DContratoTransporte.Salva;
    if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorSCCTotal = (ValorSCCTotal + (:ProdutoContratoT_ValorSCC))') then
      MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
    if EmEdicao then
      TabGlobal.DContratoTransporte.Modifica;
  end;
  if Modificacao then
  begin
    EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
    if EmEdicao then
      TabGlobal.DContratoTransporte.Salva;
    if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorTotalComissao = ( ValorTotalComissao + ( :ProdutoContratoT_ComisaoSFatura  ))') then
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

procedure TDProdutoContratoT.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (Contrato.SempreAtribui) and (Contrato.AutoIncremento > 0) then
      AutoIncremento('Contrato', True, Contrato.AutoIncremento);
end;

procedure TDProdutoContratoT.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'QuantidadeTotal = (QuantidadeTotal - (:ProdutoContratoT_Quantidade))') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorSCCTotal = (ValorSCCTotal - (:ProdutoContratoT_ValorSCC ))') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorTotalComissao = ( ValorTotalComissao - ( :ProdutoContratoT_ComisaoSFatura  ))') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
end;

procedure TDProdutoContratoT.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'QuantidadeTotal = (QuantidadeTotal - (:ProdutoContratoT_Quantidade))') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorSCCTotal = (ValorSCCTotal - (:ProdutoContratoT_ValorSCC ))') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorTotalComissao = ( ValorTotalComissao - ( :ProdutoContratoT_ComisaoSFatura  ))') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  ExclusaoCascata;
end;

procedure TDProdutoContratoT.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
