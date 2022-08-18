{
 Classe da tabela: Fatura - Cadastro de Faturas
}

unit DFatura;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0005,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDFatura = class(TTabela)
  public
    Contrato: TDFatura_Contrato;
    Seq: TDFatura_Seq;
    StDocumento: TDFatura_StDocumento;
    NomeMix: TDFatura_NomeMix;
    Navio: TDFatura_Navio;
    DataEmbarque: TDFatura_DataEmbarque;
    QuantidadeExp: TDFatura_QuantidadeExp;
    Fatura: TDFatura_Fatura;
    FormComissao: TDFatura_FormComissao;
    Comissao: TDFatura_Comissao;
    Valor: TDFatura_Valor;
    ValorDesconto: TDFatura_ValorDesconto;
    Cadastro: TDFatura_Cadastro;
    ETADestino: TDFatura_ETADestino;
    FormPago: TDFatura_FormPago;
    PrecoFOB: TDFatura_PrecoFOB;
    ComisaoSFatura: TDFatura_ComisaoSFatura;
    DataFatura: TDFatura_DataFatura;
    Rate: TDFatura_Rate;
    ValorConvertido: TDFatura_ValorConvertido;
    NumNFEmit: TDFatura_NumNFEmit;
    NumFatura: TDFatura_NumFatura;
    DataNF: TDFatura_DataNF;
    OBS: TDFatura_OBS;
    Comentario: TDFatura_Comentario;
    DataLiq: TDFatura_DataLiq;
    Status: TDFatura_Status;
    FORCOD: TDFatura_FORCOD;
    MOEDACOMISSAO: TDFatura_MOEDACOMISSAO;
    RAZAO: TDFatura_RAZAO;
    Recebimento: TDFatura_Recebimento;
    Valor_NF: TDFatura_Valor_NF;
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

constructor TDFatura.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'ExpotadoTransito';
  Titulo           := 'Cadastro de Faturas';
  Name             := 'DFatura';
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
  DataSource.Name  := 'DsFatura';
  with UpdateSql do
  begin
    Name           := 'UpdSql_Fatura';
    // Exclusão de Registro
    DeleteSQL.Add('delete from ExpotadoTransito');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  Contrato = :OLD_Contrato');
    DeleteSQL.Add('  and Seq = :OLD_Seq');
    // Inserção de Registro
    InsertSQL.Add('insert into ExpotadoTransito');
    InsertSQL.Add('  (');
    InsertSQL.Add('  Contrato,');
    InsertSQL.Add('  Seq,');
    InsertSQL.Add('  StDocumento,');
    InsertSQL.Add('  Navio,');
    InsertSQL.Add('  DataEmbarque,');
    InsertSQL.Add('  QuantidadeExp,');
    InsertSQL.Add('  Fatura,');
    InsertSQL.Add('  Valor,');
    InsertSQL.Add('  ValorDesconto,');
    InsertSQL.Add('  Cadastro,');
    InsertSQL.Add('  ETADestino,');
    InsertSQL.Add('  FormPago,');
    InsertSQL.Add('  PrecoFOB,');
    InsertSQL.Add('  ComisaoSFatura,');
    InsertSQL.Add('  DataFatura,');
    InsertSQL.Add('  Rate,');
    InsertSQL.Add('  ValorConvertido,');
    InsertSQL.Add('  NumNFEmit,');
    InsertSQL.Add('  NumFatura,');
    InsertSQL.Add('  DataNF,');
    InsertSQL.Add('  OBS,');
    InsertSQL.Add('  Comentario,');
    InsertSQL.Add('  DataLiq,');
    InsertSQL.Add('  Status,');
    InsertSQL.Add('  Recebimento,');
    InsertSQL.Add('  Valor_NF');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :Contrato,');
    InsertSQL.Add('  :Seq,');
    InsertSQL.Add('  :StDocumento,');
    InsertSQL.Add('  :Navio,');
    InsertSQL.Add('  :DataEmbarque,');
    InsertSQL.Add('  :QuantidadeExp,');
    InsertSQL.Add('  :Fatura,');
    InsertSQL.Add('  :Valor,');
    InsertSQL.Add('  :ValorDesconto,');
    InsertSQL.Add('  :Cadastro,');
    InsertSQL.Add('  :ETADestino,');
    InsertSQL.Add('  :FormPago,');
    InsertSQL.Add('  :PrecoFOB,');
    InsertSQL.Add('  :ComisaoSFatura,');
    InsertSQL.Add('  :DataFatura,');
    InsertSQL.Add('  :Rate,');
    InsertSQL.Add('  :ValorConvertido,');
    InsertSQL.Add('  :NumNFEmit,');
    InsertSQL.Add('  :NumFatura,');
    InsertSQL.Add('  :DataNF,');
    InsertSQL.Add('  :OBS,');
    InsertSQL.Add('  :Comentario,');
    InsertSQL.Add('  :DataLiq,');
    InsertSQL.Add('  :Status,');
    InsertSQL.Add('  :Recebimento,');
    InsertSQL.Add('  :Valor_NF');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update ExpotadoTransito');
    ModifySQL.Add('set');
    ModifySQL.Add('  Contrato = :Contrato,');
    ModifySQL.Add('  Seq = :Seq,');
    ModifySQL.Add('  StDocumento = :StDocumento,');
    ModifySQL.Add('  Navio = :Navio,');
    ModifySQL.Add('  DataEmbarque = :DataEmbarque,');
    ModifySQL.Add('  QuantidadeExp = :QuantidadeExp,');
    ModifySQL.Add('  Fatura = :Fatura,');
    ModifySQL.Add('  Valor = :Valor,');
    ModifySQL.Add('  ValorDesconto = :ValorDesconto,');
    ModifySQL.Add('  Cadastro = :Cadastro,');
    ModifySQL.Add('  ETADestino = :ETADestino,');
    ModifySQL.Add('  FormPago = :FormPago,');
    ModifySQL.Add('  PrecoFOB = :PrecoFOB,');
    ModifySQL.Add('  ComisaoSFatura = :ComisaoSFatura,');
    ModifySQL.Add('  DataFatura = :DataFatura,');
    ModifySQL.Add('  Rate = :Rate,');
    ModifySQL.Add('  ValorConvertido = :ValorConvertido,');
    ModifySQL.Add('  NumNFEmit = :NumNFEmit,');
    ModifySQL.Add('  NumFatura = :NumFatura,');
    ModifySQL.Add('  DataNF = :DataNF,');
    ModifySQL.Add('  OBS = :OBS,');
    ModifySQL.Add('  Comentario = :Comentario,');
    ModifySQL.Add('  DataLiq = :DataLiq,');
    ModifySQL.Add('  Status = :Status,');
    ModifySQL.Add('  Recebimento = :Recebimento,');
    ModifySQL.Add('  Valor_NF = :Valor_NF');
    ModifySQL.Add('where');
    ModifySQL.Add('  Contrato = :OLD_Contrato');
    ModifySQL.Add('  and Seq = :OLD_Seq');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  ExpotadoTransito.Contrato AS Contrato,');
    RefreshSQL.Add('  ExpotadoTransito.Seq AS Seq,');
    RefreshSQL.Add('  ExpotadoTransito.StDocumento AS StDocumento,');
    RefreshSQL.Add('  ContratoTransporte.NomeMix AS NomeMix,');
    RefreshSQL.Add('  ExpotadoTransito.Navio AS Navio,');
    RefreshSQL.Add('  ExpotadoTransito.DataEmbarque AS DataEmbarque,');
    RefreshSQL.Add('  ExpotadoTransito.QuantidadeExp AS QuantidadeExp,');
    RefreshSQL.Add('  ExpotadoTransito.Fatura AS Fatura,');
    RefreshSQL.Add('  ContratoTransporte.FormComissao AS FormComissao,');
    RefreshSQL.Add('  ContratoTransporte.Comissao AS Comissao,');
    RefreshSQL.Add('  ExpotadoTransito.Valor AS Valor,');
    RefreshSQL.Add('  ExpotadoTransito.ValorDesconto AS ValorDesconto,');
    RefreshSQL.Add('  ExpotadoTransito.Cadastro AS Cadastro,');
    RefreshSQL.Add('  ExpotadoTransito.ETADestino AS ETADestino,');
    RefreshSQL.Add('  ExpotadoTransito.FormPago AS FormPago,');
    RefreshSQL.Add('  ExpotadoTransito.PrecoFOB AS PrecoFOB,');
    RefreshSQL.Add('  ExpotadoTransito.ComisaoSFatura AS ComisaoSFatura,');
    RefreshSQL.Add('  ExpotadoTransito.DataFatura AS DataFatura,');
    RefreshSQL.Add('  ExpotadoTransito.Rate AS Rate,');
    RefreshSQL.Add('  ExpotadoTransito.ValorConvertido AS ValorConvertido,');
    RefreshSQL.Add('  ExpotadoTransito.NumNFEmit AS NumNFEmit,');
    RefreshSQL.Add('  ExpotadoTransito.NumFatura AS NumFatura,');
    RefreshSQL.Add('  ExpotadoTransito.DataNF AS DataNF,');
    RefreshSQL.Add('  ExpotadoTransito.OBS AS OBS,');
    RefreshSQL.Add('  ExpotadoTransito.Comentario AS Comentario,');
    RefreshSQL.Add('  ExpotadoTransito.DataLiq AS DataLiq,');
    RefreshSQL.Add('  ExpotadoTransito.Status AS Status,');
    RefreshSQL.Add('  ContratoTransporte.FORCOD AS FORCOD,');
    RefreshSQL.Add('  Fornecedores.MOEDACOMISSAO AS MOEDACOMISSAO,');
    RefreshSQL.Add('  Fornecedores.RAZAO AS RAZAO,');
    RefreshSQL.Add('  ExpotadoTransito.Recebimento AS Recebimento,');
    RefreshSQL.Add('  ExpotadoTransito.Valor_NF AS Valor_NF');
    RefreshSQL.Add('from ExpotadoTransito');
    RefreshSQL.Add('Left Outer Join ContratoTransporte on');
    RefreshSQL.Add('  ExpotadoTransito.Contrato = ContratoTransporte.Contrato');
    RefreshSQL.Add('Left Outer Join Fornecedores on');
    RefreshSQL.Add('  ContratoTransporte.FORCOD = Fornecedores.FORCOD');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  ExpotadoTransito.Contrato = :OLD_Contrato');
    RefreshSQL.Add('  and ExpotadoTransito.Seq = :OLD_Seq');
  end;
  TabelasExtras.Add('ContratoTransporte');
  TabelasExtras.Add('Fornecedores');
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  ExpotadoTransito.Contrato AS Contrato,');
  SqlPrincipal.Add('  ExpotadoTransito.Seq AS Seq,');
  SqlPrincipal.Add('  ExpotadoTransito.StDocumento AS StDocumento,');
  SqlPrincipal.Add('  ContratoTransporte.NomeMix AS NomeMix,');
  SqlPrincipal.Add('  ExpotadoTransito.Navio AS Navio,');
  SqlPrincipal.Add('  ExpotadoTransito.DataEmbarque AS DataEmbarque,');
  SqlPrincipal.Add('  ExpotadoTransito.QuantidadeExp AS QuantidadeExp,');
  SqlPrincipal.Add('  ExpotadoTransito.Fatura AS Fatura,');
  SqlPrincipal.Add('  ContratoTransporte.FormComissao AS FormComissao,');
  SqlPrincipal.Add('  ContratoTransporte.Comissao AS Comissao,');
  SqlPrincipal.Add('  ExpotadoTransito.Valor AS Valor,');
  SqlPrincipal.Add('  ExpotadoTransito.ValorDesconto AS ValorDesconto,');
  SqlPrincipal.Add('  ExpotadoTransito.Cadastro AS Cadastro,');
  SqlPrincipal.Add('  ExpotadoTransito.ETADestino AS ETADestino,');
  SqlPrincipal.Add('  ExpotadoTransito.FormPago AS FormPago,');
  SqlPrincipal.Add('  ExpotadoTransito.PrecoFOB AS PrecoFOB,');
  SqlPrincipal.Add('  ExpotadoTransito.ComisaoSFatura AS ComisaoSFatura,');
  SqlPrincipal.Add('  ExpotadoTransito.DataFatura AS DataFatura,');
  SqlPrincipal.Add('  ExpotadoTransito.Rate AS Rate,');
  SqlPrincipal.Add('  ExpotadoTransito.ValorConvertido AS ValorConvertido,');
  SqlPrincipal.Add('  ExpotadoTransito.NumNFEmit AS NumNFEmit,');
  SqlPrincipal.Add('  ExpotadoTransito.NumFatura AS NumFatura,');
  SqlPrincipal.Add('  ExpotadoTransito.DataNF AS DataNF,');
  SqlPrincipal.Add('  ExpotadoTransito.OBS AS OBS,');
  SqlPrincipal.Add('  ExpotadoTransito.Comentario AS Comentario,');
  SqlPrincipal.Add('  ExpotadoTransito.DataLiq AS DataLiq,');
  SqlPrincipal.Add('  ExpotadoTransito.Status AS Status,');
  SqlPrincipal.Add('  ContratoTransporte.FORCOD AS FORCOD,');
  SqlPrincipal.Add('  Fornecedores.MOEDACOMISSAO AS MOEDACOMISSAO,');
  SqlPrincipal.Add('  Fornecedores.RAZAO AS RAZAO,');
  SqlPrincipal.Add('  ExpotadoTransito.Recebimento AS Recebimento,');
  SqlPrincipal.Add('  ExpotadoTransito.Valor_NF AS Valor_NF');
  SqlPrincipal.Add('from ExpotadoTransito');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  FiltroExtra.Add('Left Outer Join ContratoTransporte on');
  FiltroExtra.Add('  ExpotadoTransito.Contrato = ContratoTransporte.Contrato');
  FiltroExtra.Add('Left Outer Join Fornecedores on');
  FiltroExtra.Add('  ContratoTransporte.FORCOD = Fornecedores.FORCOD');
  Sql.Add('order by ExpotadoTransito.Contrato,ExpotadoTransito.Seq');
  Contrato := TDFatura_Contrato.Create(AOwner);
  Contrato.Valor.DataSet := Self;
  Seq := TDFatura_Seq.Create(AOwner);
  Seq.Valor.DataSet := Self;
  StDocumento := TDFatura_StDocumento.Create(AOwner);
  StDocumento.Valor.DataSet := Self;
  NomeMix := TDFatura_NomeMix.Create(AOwner);
  NomeMix.Valor.DataSet := Self;
  Navio := TDFatura_Navio.Create(AOwner);
  Navio.Valor.DataSet := Self;
  DataEmbarque := TDFatura_DataEmbarque.Create(AOwner);
  DataEmbarque.Valor.DataSet := Self;
  QuantidadeExp := TDFatura_QuantidadeExp.Create(AOwner);
  QuantidadeExp.Valor.DataSet := Self;
  Fatura := TDFatura_Fatura.Create(AOwner);
  Fatura.Valor.DataSet := Self;
  FormComissao := TDFatura_FormComissao.Create(AOwner);
  FormComissao.Valor.DataSet := Self;
  Comissao := TDFatura_Comissao.Create(AOwner);
  Comissao.Valor.DataSet := Self;
  Valor := TDFatura_Valor.Create(AOwner);
  Valor.Valor.DataSet := Self;
  ValorDesconto := TDFatura_ValorDesconto.Create(AOwner);
  ValorDesconto.Valor.DataSet := Self;
  Cadastro := TDFatura_Cadastro.Create(AOwner);
  Cadastro.Valor.DataSet := Self;
  ETADestino := TDFatura_ETADestino.Create(AOwner);
  ETADestino.Valor.DataSet := Self;
  FormPago := TDFatura_FormPago.Create(AOwner);
  FormPago.Valor.DataSet := Self;
  PrecoFOB := TDFatura_PrecoFOB.Create(AOwner);
  PrecoFOB.Valor.DataSet := Self;
  ComisaoSFatura := TDFatura_ComisaoSFatura.Create(AOwner);
  ComisaoSFatura.Valor.DataSet := Self;
  DataFatura := TDFatura_DataFatura.Create(AOwner);
  DataFatura.Valor.DataSet := Self;
  Rate := TDFatura_Rate.Create(AOwner);
  Rate.Valor.DataSet := Self;
  ValorConvertido := TDFatura_ValorConvertido.Create(AOwner);
  ValorConvertido.Valor.DataSet := Self;
  NumNFEmit := TDFatura_NumNFEmit.Create(AOwner);
  NumNFEmit.Valor.DataSet := Self;
  NumFatura := TDFatura_NumFatura.Create(AOwner);
  NumFatura.Valor.DataSet := Self;
  DataNF := TDFatura_DataNF.Create(AOwner);
  DataNF.Valor.DataSet := Self;
  OBS := TDFatura_OBS.Create(AOwner);
  OBS.Valor.DataSet := Self;
  Comentario := TDFatura_Comentario.Create(AOwner);
  Comentario.Valor.DataSet := Self;
  DataLiq := TDFatura_DataLiq.Create(AOwner);
  DataLiq.Valor.DataSet := Self;
  Status := TDFatura_Status.Create(AOwner);
  Status.Valor.DataSet := Self;
  FORCOD := TDFatura_FORCOD.Create(AOwner);
  FORCOD.Valor.DataSet := Self;
  MOEDACOMISSAO := TDFatura_MOEDACOMISSAO.Create(AOwner);
  MOEDACOMISSAO.Valor.DataSet := Self;
  RAZAO := TDFatura_RAZAO.Create(AOwner);
  RAZAO.Valor.DataSet := Self;
  Recebimento := TDFatura_Recebimento.Create(AOwner);
  Recebimento.Valor.DataSet := Self;
  Valor_NF := TDFatura_Valor_NF.Create(AOwner);
  Valor_NF.Valor.DataSet := Self;
  ChavePrimaria.Add(Contrato);
  ChavePrimaria.Add(Seq);
  Campos.Add(Contrato);
  Campos.Add(Seq);
  Campos.Add(StDocumento);
  Campos.Add(NomeMix);
  Campos.Add(Navio);
  Campos.Add(DataEmbarque);
  Campos.Add(QuantidadeExp);
  Campos.Add(Fatura);
  Campos.Add(FormComissao);
  Campos.Add(Comissao);
  Campos.Add(Valor);
  Campos.Add(ValorDesconto);
  Campos.Add(Cadastro);
  Campos.Add(ETADestino);
  Campos.Add(FormPago);
  Campos.Add(PrecoFOB);
  Campos.Add(ComisaoSFatura);
  Campos.Add(DataFatura);
  Campos.Add(Rate);
  Campos.Add(ValorConvertido);
  Campos.Add(NumNFEmit);
  Campos.Add(NumFatura);
  Campos.Add(DataNF);
  Campos.Add(OBS);
  Campos.Add(Comentario);
  Campos.Add(DataLiq);
  Campos.Add(Status);
  Campos.Add(FORCOD);
  Campos.Add(MOEDACOMISSAO);
  Campos.Add(RAZAO);
  Campos.Add(Recebimento);
  Campos.Add(Valor_NF);
  TituloIndices.Add('Contrato,Seq.');
  Indices.Add('ExpotadoTransito.Contrato,ExpotadoTransito.Seq');
  Crescente.Add('S');
  TituloPrimaria := 'Contrato,Seq.';
  ChPrimaria     := 'ExpotadoTransito.Contrato,ExpotadoTransito.Seq';
  TituloIndice   := 'Contrato,Seq.';
  ChaveIndice    := 'ExpotadoTransito.Contrato,ExpotadoTransito.Seq';
  AfterInsert    := AtribuiMestre;
  AfterPost      := ProcessoDireto1;
  AfterCancel    := ProcessoDireto2;
  BeforePost     := AtualizaCalculados;
  BeforeEdit     := ProcessoInverso1;
  BeforeDelete   := ProcessoInverso2;
end;

procedure TDFatura.CriaForeignKeys;
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

function TDFatura.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDFatura.ExclusaoCascata;
begin
end;

function TDFatura.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('ContratoTransporte') then
    if (UpperCase('Contrato') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], [Campo], Retorno) then
        Result := True;

  if UpperCase(Tabela) = UpperCase('Fornecedores') then
    if (UpperCase('FORCOD') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DFornecedores, ['FORCOD'], [FORCOD.Valor.Value], [Campo], Retorno) then
        Result := True;

end;

function TDFatura.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('ContratoTransporte') then
    if PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('Fornecedores') then
    if PTabela(TabGlobal.DFornecedores, ['FORCOD'], [FORCOD.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('ExpotadoTransito') then
    if PTabela(TabGlobal.DFatura, ['Contrato','Seq'], [Contrato.Valor.Value,Seq.Valor.Value]) then
      Result := True;
end;

procedure TDFatura.CalculaCampos;
begin
  ComisaoSFatura.Conteudo := CalculaDFatura_ComisaoSFatura(Self);
  ValorConvertido.Conteudo := CalculaDFatura_ValorConvertido(Self);
end;

procedure TDFatura.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDFatura.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
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

procedure TDFatura.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDFatura.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDFatura.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDFatura.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (Contrato.SempreAtribui) and (Contrato.AutoIncremento > 0) then
      AutoIncremento('Contrato', True, Contrato.AutoIncremento);
end;

procedure TDFatura.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDFatura.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDFatura.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
