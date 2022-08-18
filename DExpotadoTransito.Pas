{
 Classe da tabela: ExpotadoTransito - Exportado Transito
}

unit DExpotadoTransito;

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
  TDExpotadoTransito = class(TTabela)
  public
    Contrato: TDExpotadoTransito_Contrato;
    Seq: TDExpotadoTransito_Seq;
    Navio: TDExpotadoTransito_Navio;
    Cadastro: TDExpotadoTransito_Cadastro;
    DataEmbarque: TDExpotadoTransito_DataEmbarque;
    ETADestino: TDExpotadoTransito_ETADestino;
    Fatura: TDExpotadoTransito_Fatura;
    QuantidadeExp: TDExpotadoTransito_QuantidadeExp;
    Valor: TDExpotadoTransito_Valor;
    ValorDesconto: TDExpotadoTransito_ValorDesconto;
    FormPago: TDExpotadoTransito_FormPago;
    PrecoFOB: TDExpotadoTransito_PrecoFOB;
    FormComissao: TDExpotadoTransito_FormComissao;
    Comissao: TDExpotadoTransito_Comissao;
    ComisaoSFatura: TDExpotadoTransito_ComisaoSFatura;
    StDocumento: TDExpotadoTransito_StDocumento;
    OBS: TDExpotadoTransito_OBS;
    Comentario: TDExpotadoTransito_Comentario;
    Rate: TDExpotadoTransito_Rate;
    DataLiq: TDExpotadoTransito_DataLiq;
    NumNFEmit: TDExpotadoTransito_NumNFEmit;
    NumFatura: TDExpotadoTransito_NumFatura;
    DataFatura: TDExpotadoTransito_DataFatura;
    DataNF: TDExpotadoTransito_DataNF;
    Status: TDExpotadoTransito_Status;
    MOEDACOMISSAO: TDExpotadoTransito_MOEDACOMISSAO;
    ValorConvertido: TDExpotadoTransito_ValorConvertido;
    FORCOD: TDExpotadoTransito_FORCOD;
    NomeMix: TDExpotadoTransito_NomeMix;
    RAZAO: TDExpotadoTransito_RAZAO;
    Recebimento: TDExpotadoTransito_Recebimento;
    Valor_NF: TDExpotadoTransito_Valor_NF;
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

constructor TDExpotadoTransito.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'ExpotadoTransito';
  Titulo           := 'Exportado Transito';
  Name             := 'DExpotadoTransito';
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
  DataSource.Name  := 'DsExpotadoTransito';
  with UpdateSql do
  begin
    Name           := 'UpdSql_ExpotadoTransito';
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
    InsertSQL.Add('  Navio,');
    InsertSQL.Add('  Cadastro,');
    InsertSQL.Add('  DataEmbarque,');
    InsertSQL.Add('  ETADestino,');
    InsertSQL.Add('  Fatura,');
    InsertSQL.Add('  QuantidadeExp,');
    InsertSQL.Add('  Valor,');
    InsertSQL.Add('  ValorDesconto,');
    InsertSQL.Add('  FormPago,');
    InsertSQL.Add('  PrecoFOB,');
    InsertSQL.Add('  ComisaoSFatura,');
    InsertSQL.Add('  StDocumento,');
    InsertSQL.Add('  OBS,');
    InsertSQL.Add('  Comentario,');
    InsertSQL.Add('  Rate,');
    InsertSQL.Add('  DataLiq,');
    InsertSQL.Add('  NumNFEmit,');
    InsertSQL.Add('  NumFatura,');
    InsertSQL.Add('  DataFatura,');
    InsertSQL.Add('  DataNF,');
    InsertSQL.Add('  Status,');
    InsertSQL.Add('  ValorConvertido,');
    InsertSQL.Add('  Recebimento,');
    InsertSQL.Add('  Valor_NF');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :Contrato,');
    InsertSQL.Add('  :Seq,');
    InsertSQL.Add('  :Navio,');
    InsertSQL.Add('  :Cadastro,');
    InsertSQL.Add('  :DataEmbarque,');
    InsertSQL.Add('  :ETADestino,');
    InsertSQL.Add('  :Fatura,');
    InsertSQL.Add('  :QuantidadeExp,');
    InsertSQL.Add('  :Valor,');
    InsertSQL.Add('  :ValorDesconto,');
    InsertSQL.Add('  :FormPago,');
    InsertSQL.Add('  :PrecoFOB,');
    InsertSQL.Add('  :ComisaoSFatura,');
    InsertSQL.Add('  :StDocumento,');
    InsertSQL.Add('  :OBS,');
    InsertSQL.Add('  :Comentario,');
    InsertSQL.Add('  :Rate,');
    InsertSQL.Add('  :DataLiq,');
    InsertSQL.Add('  :NumNFEmit,');
    InsertSQL.Add('  :NumFatura,');
    InsertSQL.Add('  :DataFatura,');
    InsertSQL.Add('  :DataNF,');
    InsertSQL.Add('  :Status,');
    InsertSQL.Add('  :ValorConvertido,');
    InsertSQL.Add('  :Recebimento,');
    InsertSQL.Add('  :Valor_NF');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update ExpotadoTransito');
    ModifySQL.Add('set');
    ModifySQL.Add('  Contrato = :Contrato,');
    ModifySQL.Add('  Seq = :Seq,');
    ModifySQL.Add('  Navio = :Navio,');
    ModifySQL.Add('  Cadastro = :Cadastro,');
    ModifySQL.Add('  DataEmbarque = :DataEmbarque,');
    ModifySQL.Add('  ETADestino = :ETADestino,');
    ModifySQL.Add('  Fatura = :Fatura,');
    ModifySQL.Add('  QuantidadeExp = :QuantidadeExp,');
    ModifySQL.Add('  Valor = :Valor,');
    ModifySQL.Add('  ValorDesconto = :ValorDesconto,');
    ModifySQL.Add('  FormPago = :FormPago,');
    ModifySQL.Add('  PrecoFOB = :PrecoFOB,');
    ModifySQL.Add('  ComisaoSFatura = :ComisaoSFatura,');
    ModifySQL.Add('  StDocumento = :StDocumento,');
    ModifySQL.Add('  OBS = :OBS,');
    ModifySQL.Add('  Comentario = :Comentario,');
    ModifySQL.Add('  Rate = :Rate,');
    ModifySQL.Add('  DataLiq = :DataLiq,');
    ModifySQL.Add('  NumNFEmit = :NumNFEmit,');
    ModifySQL.Add('  NumFatura = :NumFatura,');
    ModifySQL.Add('  DataFatura = :DataFatura,');
    ModifySQL.Add('  DataNF = :DataNF,');
    ModifySQL.Add('  Status = :Status,');
    ModifySQL.Add('  ValorConvertido = :ValorConvertido,');
    ModifySQL.Add('  Recebimento = :Recebimento,');
    ModifySQL.Add('  Valor_NF = :Valor_NF');
    ModifySQL.Add('where');
    ModifySQL.Add('  Contrato = :OLD_Contrato');
    ModifySQL.Add('  and Seq = :OLD_Seq');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  ExpotadoTransito.Contrato AS Contrato,');
    RefreshSQL.Add('  ExpotadoTransito.Seq AS Seq,');
    RefreshSQL.Add('  ExpotadoTransito.Navio AS Navio,');
    RefreshSQL.Add('  ExpotadoTransito.Cadastro AS Cadastro,');
    RefreshSQL.Add('  ExpotadoTransito.DataEmbarque AS DataEmbarque,');
    RefreshSQL.Add('  ExpotadoTransito.ETADestino AS ETADestino,');
    RefreshSQL.Add('  ExpotadoTransito.Fatura AS Fatura,');
    RefreshSQL.Add('  ExpotadoTransito.QuantidadeExp AS QuantidadeExp,');
    RefreshSQL.Add('  ExpotadoTransito.Valor AS Valor,');
    RefreshSQL.Add('  ExpotadoTransito.ValorDesconto AS ValorDesconto,');
    RefreshSQL.Add('  ExpotadoTransito.FormPago AS FormPago,');
    RefreshSQL.Add('  ExpotadoTransito.PrecoFOB AS PrecoFOB,');
    RefreshSQL.Add('  ContratoTransporte.FormComissao AS FormComissao,');
    RefreshSQL.Add('  ContratoTransporte.Comissao AS Comissao,');
    RefreshSQL.Add('  ExpotadoTransito.ComisaoSFatura AS ComisaoSFatura,');
    RefreshSQL.Add('  ExpotadoTransito.StDocumento AS StDocumento,');
    RefreshSQL.Add('  ExpotadoTransito.OBS AS OBS,');
    RefreshSQL.Add('  ExpotadoTransito.Comentario AS Comentario,');
    RefreshSQL.Add('  ExpotadoTransito.Rate AS Rate,');
    RefreshSQL.Add('  ExpotadoTransito.DataLiq AS DataLiq,');
    RefreshSQL.Add('  ExpotadoTransito.NumNFEmit AS NumNFEmit,');
    RefreshSQL.Add('  ExpotadoTransito.NumFatura AS NumFatura,');
    RefreshSQL.Add('  ExpotadoTransito.DataFatura AS DataFatura,');
    RefreshSQL.Add('  ExpotadoTransito.DataNF AS DataNF,');
    RefreshSQL.Add('  ExpotadoTransito.Status AS Status,');
    RefreshSQL.Add('  Fornecedores.MOEDACOMISSAO AS MOEDACOMISSAO,');
    RefreshSQL.Add('  ExpotadoTransito.ValorConvertido AS ValorConvertido,');
    RefreshSQL.Add('  ContratoTransporte.FORCOD AS FORCOD,');
    RefreshSQL.Add('  ContratoTransporte.NomeMix AS NomeMix,');
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
  SqlPrincipal.Add('  ExpotadoTransito.Navio AS Navio,');
  SqlPrincipal.Add('  ExpotadoTransito.Cadastro AS Cadastro,');
  SqlPrincipal.Add('  ExpotadoTransito.DataEmbarque AS DataEmbarque,');
  SqlPrincipal.Add('  ExpotadoTransito.ETADestino AS ETADestino,');
  SqlPrincipal.Add('  ExpotadoTransito.Fatura AS Fatura,');
  SqlPrincipal.Add('  ExpotadoTransito.QuantidadeExp AS QuantidadeExp,');
  SqlPrincipal.Add('  ExpotadoTransito.Valor AS Valor,');
  SqlPrincipal.Add('  ExpotadoTransito.ValorDesconto AS ValorDesconto,');
  SqlPrincipal.Add('  ExpotadoTransito.FormPago AS FormPago,');
  SqlPrincipal.Add('  ExpotadoTransito.PrecoFOB AS PrecoFOB,');
  SqlPrincipal.Add('  ContratoTransporte.FormComissao AS FormComissao,');
  SqlPrincipal.Add('  ContratoTransporte.Comissao AS Comissao,');
  SqlPrincipal.Add('  ExpotadoTransito.ComisaoSFatura AS ComisaoSFatura,');
  SqlPrincipal.Add('  ExpotadoTransito.StDocumento AS StDocumento,');
  SqlPrincipal.Add('  ExpotadoTransito.OBS AS OBS,');
  SqlPrincipal.Add('  ExpotadoTransito.Comentario AS Comentario,');
  SqlPrincipal.Add('  ExpotadoTransito.Rate AS Rate,');
  SqlPrincipal.Add('  ExpotadoTransito.DataLiq AS DataLiq,');
  SqlPrincipal.Add('  ExpotadoTransito.NumNFEmit AS NumNFEmit,');
  SqlPrincipal.Add('  ExpotadoTransito.NumFatura AS NumFatura,');
  SqlPrincipal.Add('  ExpotadoTransito.DataFatura AS DataFatura,');
  SqlPrincipal.Add('  ExpotadoTransito.DataNF AS DataNF,');
  SqlPrincipal.Add('  ExpotadoTransito.Status AS Status,');
  SqlPrincipal.Add('  Fornecedores.MOEDACOMISSAO AS MOEDACOMISSAO,');
  SqlPrincipal.Add('  ExpotadoTransito.ValorConvertido AS ValorConvertido,');
  SqlPrincipal.Add('  ContratoTransporte.FORCOD AS FORCOD,');
  SqlPrincipal.Add('  ContratoTransporte.NomeMix AS NomeMix,');
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
  Contrato := TDExpotadoTransito_Contrato.Create(AOwner);
  Contrato.Valor.DataSet := Self;
  Seq := TDExpotadoTransito_Seq.Create(AOwner);
  Seq.Valor.DataSet := Self;
  Navio := TDExpotadoTransito_Navio.Create(AOwner);
  Navio.Valor.DataSet := Self;
  Cadastro := TDExpotadoTransito_Cadastro.Create(AOwner);
  Cadastro.Valor.DataSet := Self;
  DataEmbarque := TDExpotadoTransito_DataEmbarque.Create(AOwner);
  DataEmbarque.Valor.DataSet := Self;
  ETADestino := TDExpotadoTransito_ETADestino.Create(AOwner);
  ETADestino.Valor.DataSet := Self;
  Fatura := TDExpotadoTransito_Fatura.Create(AOwner);
  Fatura.Valor.DataSet := Self;
  QuantidadeExp := TDExpotadoTransito_QuantidadeExp.Create(AOwner);
  QuantidadeExp.Valor.DataSet := Self;
  Valor := TDExpotadoTransito_Valor.Create(AOwner);
  Valor.Valor.DataSet := Self;
  FormPago := TDExpotadoTransito_FormPago.Create(AOwner);
  FormPago.Valor.DataSet := Self;
  ComisaoSFatura := TDExpotadoTransito_ComisaoSFatura.Create(AOwner);
  ComisaoSFatura.Valor.DataSet := Self;
  StDocumento := TDExpotadoTransito_StDocumento.Create(AOwner);
  StDocumento.Valor.DataSet := Self;
  OBS := TDExpotadoTransito_OBS.Create(AOwner);
  OBS.Valor.DataSet := Self;
  Comentario := TDExpotadoTransito_Comentario.Create(AOwner);
  Comentario.Valor.DataSet := Self;
  Rate := TDExpotadoTransito_Rate.Create(AOwner);
  Rate.Valor.DataSet := Self;
  DataLiq := TDExpotadoTransito_DataLiq.Create(AOwner);
  DataLiq.Valor.DataSet := Self;
  NumNFEmit := TDExpotadoTransito_NumNFEmit.Create(AOwner);
  NumNFEmit.Valor.DataSet := Self;
  NumFatura := TDExpotadoTransito_NumFatura.Create(AOwner);
  NumFatura.Valor.DataSet := Self;
  DataFatura := TDExpotadoTransito_DataFatura.Create(AOwner);
  DataFatura.Valor.DataSet := Self;
  DataNF := TDExpotadoTransito_DataNF.Create(AOwner);
  DataNF.Valor.DataSet := Self;
  Status := TDExpotadoTransito_Status.Create(AOwner);
  Status.Valor.DataSet := Self;
  PrecoFOB := TDExpotadoTransito_PrecoFOB.Create(AOwner);
  PrecoFOB.Valor.DataSet := Self;
  ValorConvertido := TDExpotadoTransito_ValorConvertido.Create(AOwner);
  ValorConvertido.Valor.DataSet := Self;
  ValorDesconto := TDExpotadoTransito_ValorDesconto.Create(AOwner);
  ValorDesconto.Valor.DataSet := Self;
  Comissao := TDExpotadoTransito_Comissao.Create(AOwner);
  Comissao.Valor.DataSet := Self;
  FormComissao := TDExpotadoTransito_FormComissao.Create(AOwner);
  FormComissao.Valor.DataSet := Self;
  FORCOD := TDExpotadoTransito_FORCOD.Create(AOwner);
  FORCOD.Valor.DataSet := Self;
  MOEDACOMISSAO := TDExpotadoTransito_MOEDACOMISSAO.Create(AOwner);
  MOEDACOMISSAO.Valor.DataSet := Self;
  NomeMix := TDExpotadoTransito_NomeMix.Create(AOwner);
  NomeMix.Valor.DataSet := Self;
  RAZAO := TDExpotadoTransito_RAZAO.Create(AOwner);
  RAZAO.Valor.DataSet := Self;
  Recebimento := TDExpotadoTransito_Recebimento.Create(AOwner);
  Recebimento.Valor.DataSet := Self;
  Valor_NF := TDExpotadoTransito_Valor_NF.Create(AOwner);
  Valor_NF.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(Contrato);
  ChavePrimaria.Add(Seq);
//CRIANDO CAMPOS 
  Campos.Add(Contrato);
  Campos.Add(Seq);
  Campos.Add(Navio);
  Campos.Add(Cadastro);
  Campos.Add(DataEmbarque);
  Campos.Add(ETADestino);
  Campos.Add(Fatura);
  Campos.Add(QuantidadeExp);
  Campos.Add(Valor);
  Campos.Add(ValorDesconto);
  Campos.Add(FormPago);
  Campos.Add(PrecoFOB);
  Campos.Add(FormComissao);
  Campos.Add(Comissao);
  Campos.Add(ComisaoSFatura);
  Campos.Add(StDocumento);
  Campos.Add(OBS);
  Campos.Add(Comentario);
  Campos.Add(Rate);
  Campos.Add(DataLiq);
  Campos.Add(NumNFEmit);
  Campos.Add(NumFatura);
  Campos.Add(DataFatura);
  Campos.Add(DataNF);
  Campos.Add(Status);
  Campos.Add(MOEDACOMISSAO);
  Campos.Add(ValorConvertido);
  Campos.Add(FORCOD);
  Campos.Add(NomeMix);
  Campos.Add(RAZAO);
  Campos.Add(Recebimento);
  Campos.Add(Valor_NF);
  TituloIndices.Add('Contrato,Seq.');
  Indices.Add('ExpotadoTransito.Contrato,ExpotadoTransito.Seq');
  Crescente.Add('S');
  TituloPrimaria := 'Contrato,Seq.';
  ChPrimaria     := 'ExpotadoTransito.Contrato,ExpotadoTransito.Seq';
//CRIANDO TituloIndices 
  TituloIndice   := 'Contrato,Seq.';
  ChaveIndice    := 'ExpotadoTransito.Contrato,ExpotadoTransito.Seq';
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

procedure TDExpotadoTransito.CriaForeignKeys;
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

function TDExpotadoTransito.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDExpotadoTransito.ExclusaoCascata;
begin
end;

function TDExpotadoTransito.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
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

function TDExpotadoTransito.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('ContratoTransporte') then
    if PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('Fornecedores') then
    if PTabela(TabGlobal.DFornecedores, ['FORCOD'], [FORCOD.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('ExpotadoTransito') then
    if PTabela(TabGlobal.DExpotadoTransito, ['Contrato','Seq'], [Contrato.Valor.Value,Seq.Valor.Value]) then
      Result := True;
end;

procedure TDExpotadoTransito.CalculaCampos;
begin
  ComisaoSFatura.Conteudo := CalculaDExpotadoTransito_ComisaoSFatura(Self);
  ValorConvertido.Conteudo := CalculaDExpotadoTransito_ValorConvertido(Self);
end;

procedure TDExpotadoTransito.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDExpotadoTransito.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
var
  I: Integer;
begin
  Filtro.Clear;
  FiltroRelac.Clear;
  if Atribui then
  begin
    FiltroRelac.Add('ExpotadoTransito.Contrato = :ContratoTransporte_Contrato');
  end
  else
    for I:=0 to Campos.Count-1 do
      TAtributo(Campos[I]).Valor.OnValidate := nil;
  Contrato.Valor.ReadOnly := Atribui;
  if Atualiza then
    AtualizaSql;
end;

procedure TDExpotadoTransito.AtribuiMestre(DataSet: TDataSet);
begin
  Contrato.Valor.Value := TabGlobal.DContratoTransporte.Contrato.Valor.Value;
end;

procedure TDExpotadoTransito.ProcessoDireto1(DataSet: TDataSet);
var
  QueryLc: TTabela;
  EmEdicao: Boolean;
begin
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'QUANTTOTALEXP = QUANTTOTALEXP +:ExpotadoTransito_QuantidadeExp') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if (( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'BO' )  Or ( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'EX' )) then
    if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'StatusCT = ''EX''') then
      MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorTotalComissao = ValorTotalComissao  + :ExpotadoTransito_ComisaoSFatura') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorTotalExp = ValorTotalExp + :ExpotadoTransito_Valor') then
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

procedure TDExpotadoTransito.ProcessoDireto2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if Modificacao then
  begin
    EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
    if EmEdicao then
      TabGlobal.DContratoTransporte.Salva;
    if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'QUANTTOTALEXP = QUANTTOTALEXP +:ExpotadoTransito_QuantidadeExp') then
      MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
    if EmEdicao then
      TabGlobal.DContratoTransporte.Modifica;
  end;
  if Modificacao then
  begin
    EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
    if EmEdicao then
      TabGlobal.DContratoTransporte.Salva;
    if (( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'BO' )  Or ( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'EX' )) then
      if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'StatusCT = ''EX''') then
        MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
    if EmEdicao then
      TabGlobal.DContratoTransporte.Modifica;
  end;
  if Modificacao then
  begin
    EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
    if EmEdicao then
      TabGlobal.DContratoTransporte.Salva;
    if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorTotalComissao = ValorTotalComissao  + :ExpotadoTransito_ComisaoSFatura') then
      MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
    if EmEdicao then
      TabGlobal.DContratoTransporte.Modifica;
  end;
  if Modificacao then
  begin
    EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
    if EmEdicao then
      TabGlobal.DContratoTransporte.Salva;
    if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorTotalExp = ValorTotalExp + :ExpotadoTransito_Valor') then
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

procedure TDExpotadoTransito.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (Contrato.SempreAtribui) and (Contrato.AutoIncremento > 0) then
      AutoIncremento('Contrato', True, Contrato.AutoIncremento);
end;

procedure TDExpotadoTransito.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'QUANTTOTALEXP = QUANTTOTALEXP - :ExpotadoTransito_QuantidadeExp') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if (( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'BO' )  Or ( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'EX' )) then
    if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'StatusCT = ''BO''') then
      MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorTotalComissao = ValorTotalComissao  - :ExpotadoTransito_ComisaoSFatura') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorTotalExp = ValorTotalExp -  :ExpotadoTransito_Valor') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
end;

procedure TDExpotadoTransito.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'QUANTTOTALEXP = QUANTTOTALEXP - :ExpotadoTransito_QuantidadeExp') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if (( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'BO' )  Or ( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'EX' )) then
    if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'StatusCT = ''BO''') then
      MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorTotalComissao = ValorTotalComissao  - :ExpotadoTransito_ComisaoSFatura') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorTotalExp = ValorTotalExp -  :ExpotadoTransito_Valor') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  ExclusaoCascata;
end;

procedure TDExpotadoTransito.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
