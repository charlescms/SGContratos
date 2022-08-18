{
 Classe da tabela: FaturaProdExp - Produtos Exportados da Fatura
}

unit DFaturaProdExp;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0008,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDFaturaProdExp = class(TTabela)
  public
    NumFatura: TDFaturaProdExp_NumFatura;
    Contrato: TDFaturaProdExp_Contrato;
    Seq: TDFaturaProdExp_Seq;
    Navio: TDFaturaProdExp_Navio;
    DataEmbarque: TDFaturaProdExp_DataEmbarque;
    QuantidadeExp: TDFaturaProdExp_QuantidadeExp;
    Fatura: TDFaturaProdExp_Fatura;
    StDocumento: TDFaturaProdExp_StDocumento;
    Valor: TDFaturaProdExp_Valor;
    ValorDesconto: TDFaturaProdExp_ValorDesconto;
    ValorConvertido: TDFaturaProdExp_ValorConvertido;
    ComisaoSFatura: TDFaturaProdExp_ComisaoSFatura;
    Cadastro: TDFaturaProdExp_Cadastro;
    ETADestino: TDFaturaProdExp_ETADestino;
    FormPago: TDFaturaProdExp_FormPago;
    PrecoFOB: TDFaturaProdExp_PrecoFOB;
    DataFatura: TDFaturaProdExp_DataFatura;
    Rate: TDFaturaProdExp_Rate;
    Status: TDFaturaProdExp_Status;
    OBS: TDFaturaProdExp_OBS;
    Comentario: TDFaturaProdExp_Comentario;
    DataLiq: TDFaturaProdExp_DataLiq;
    NomeMix: TDFaturaProdExp_NomeMix;
    Comissao: TDFaturaProdExp_Comissao;
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

constructor TDFaturaProdExp.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'FaturaProdExp';
  Titulo           := 'Produtos Exportados da Fatura';
  Name             := 'DFaturaProdExp';
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
  DataSource.Name  := 'DsFaturaProdExp';
  with UpdateSql do
  begin
    Name           := 'UpdSql_FaturaProdExp';
    // Exclusão de Registro
    DeleteSQL.Add('delete from FaturaProdExp');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  NumFatura = :OLD_NumFatura');
    DeleteSQL.Add('  and Contrato = :OLD_Contrato');
    DeleteSQL.Add('  and Seq = :OLD_Seq');
    // Inserção de Registro
    InsertSQL.Add('insert into FaturaProdExp');
    InsertSQL.Add('  (');
    InsertSQL.Add('  NumFatura,');
    InsertSQL.Add('  Contrato,');
    InsertSQL.Add('  Seq');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :NumFatura,');
    InsertSQL.Add('  :Contrato,');
    InsertSQL.Add('  :Seq');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update FaturaProdExp');
    ModifySQL.Add('set');
    ModifySQL.Add('  NumFatura = :NumFatura,');
    ModifySQL.Add('  Contrato = :Contrato,');
    ModifySQL.Add('  Seq = :Seq');
    ModifySQL.Add('where');
    ModifySQL.Add('  NumFatura = :OLD_NumFatura');
    ModifySQL.Add('  and Contrato = :OLD_Contrato');
    ModifySQL.Add('  and Seq = :OLD_Seq');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  FaturaProdExp.NumFatura AS NumFatura,');
    RefreshSQL.Add('  FaturaProdExp.Contrato AS Contrato,');
    RefreshSQL.Add('  FaturaProdExp.Seq AS Seq,');
    RefreshSQL.Add('  ExportadoTransito.Navio AS Navio,');
    RefreshSQL.Add('  ExportadoTransito.DataEmbarque AS DataEmbarque,');
    RefreshSQL.Add('  ExportadoTransito.QuantidadeExp AS QuantidadeExp,');
    RefreshSQL.Add('  ExportadoTransito.Fatura AS Fatura,');
    RefreshSQL.Add('  ExportadoTransito.StDocumento AS StDocumento,');
    RefreshSQL.Add('  ExportadoTransito.Valor AS Valor,');
    RefreshSQL.Add('  ExportadoTransito.ValorDesconto AS ValorDesconto,');
    RefreshSQL.Add('  ExportadoTransito.ValorConvertido AS ValorConvertido,');
    RefreshSQL.Add('  ExportadoTransito.ComisaoSFatura AS ComisaoSFatura,');
    RefreshSQL.Add('  ExportadoTransito.Cadastro AS Cadastro,');
    RefreshSQL.Add('  ExportadoTransito.ETADestino AS ETADestino,');
    RefreshSQL.Add('  ExportadoTransito.FormPago AS FormPago,');
    RefreshSQL.Add('  ExportadoTransito.PrecoFOB AS PrecoFOB,');
    RefreshSQL.Add('  ExportadoTransito.DataFatura AS DataFatura,');
    RefreshSQL.Add('  ExportadoTransito.Rate AS Rate,');
    RefreshSQL.Add('  ExportadoTransito.Status AS Status,');
    RefreshSQL.Add('  ExportadoTransito.OBS AS OBS,');
    RefreshSQL.Add('  ExportadoTransito.Comentario AS Comentario,');
    RefreshSQL.Add('  ExportadoTransito.DataLiq AS DataLiq,');
    RefreshSQL.Add('  ContratoTransporte.NomeMix AS NomeMix,');
    RefreshSQL.Add('  ContratoTransporte.Comissao AS Comissao');
    RefreshSQL.Add('from FaturaProdExp');
    RefreshSQL.Add('Left Outer Join ExportadoTransito on');
    RefreshSQL.Add('  FaturaProdExp.Contrato = ExportadoTransito.Contrato');
    RefreshSQL.Add('  and FaturaProdExp.Seq = ExportadoTransito.Seq');
    RefreshSQL.Add('Left Outer Join ContratoTransporte on');
    RefreshSQL.Add('  FaturaProdExp.Contrato = ContratoTransporte.Contrato');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  FaturaProdExp.NumFatura = :OLD_NumFatura');
    RefreshSQL.Add('  and FaturaProdExp.Contrato = :OLD_Contrato');
    RefreshSQL.Add('  and FaturaProdExp.Seq = :OLD_Seq');
  end;
  TabelasExtras.Add('ExportadoTransito');
  TabelasExtras.Add('ContratoTransporte');
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  FaturaProdExp.NumFatura AS NumFatura,');
  SqlPrincipal.Add('  FaturaProdExp.Contrato AS Contrato,');
  SqlPrincipal.Add('  FaturaProdExp.Seq AS Seq,');
  SqlPrincipal.Add('  ExportadoTransito.Navio AS Navio,');
  SqlPrincipal.Add('  ExportadoTransito.DataEmbarque AS DataEmbarque,');
  SqlPrincipal.Add('  ExportadoTransito.QuantidadeExp AS QuantidadeExp,');
  SqlPrincipal.Add('  ExportadoTransito.Fatura AS Fatura,');
  SqlPrincipal.Add('  ExportadoTransito.StDocumento AS StDocumento,');
  SqlPrincipal.Add('  ExportadoTransito.Valor AS Valor,');
  SqlPrincipal.Add('  ExportadoTransito.ValorDesconto AS ValorDesconto,');
  SqlPrincipal.Add('  ExportadoTransito.ValorConvertido AS ValorConvertido,');
  SqlPrincipal.Add('  ExportadoTransito.ComisaoSFatura AS ComisaoSFatura,');
  SqlPrincipal.Add('  ExportadoTransito.Cadastro AS Cadastro,');
  SqlPrincipal.Add('  ExportadoTransito.ETADestino AS ETADestino,');
  SqlPrincipal.Add('  ExportadoTransito.FormPago AS FormPago,');
  SqlPrincipal.Add('  ExportadoTransito.PrecoFOB AS PrecoFOB,');
  SqlPrincipal.Add('  ExportadoTransito.DataFatura AS DataFatura,');
  SqlPrincipal.Add('  ExportadoTransito.Rate AS Rate,');
  SqlPrincipal.Add('  ExportadoTransito.Status AS Status,');
  SqlPrincipal.Add('  ExportadoTransito.OBS AS OBS,');
  SqlPrincipal.Add('  ExportadoTransito.Comentario AS Comentario,');
  SqlPrincipal.Add('  ExportadoTransito.DataLiq AS DataLiq,');
  SqlPrincipal.Add('  ContratoTransporte.NomeMix AS NomeMix,');
  SqlPrincipal.Add('  ContratoTransporte.Comissao AS Comissao');
  SqlPrincipal.Add('from FaturaProdExp');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  FiltroExtra.Add('Left Outer Join ExportadoTransito on');
  FiltroExtra.Add('  FaturaProdExp.Contrato = ExportadoTransito.Contrato');
  FiltroExtra.Add('  and FaturaProdExp.Seq = ExportadoTransito.Seq');
  FiltroExtra.Add('Left Outer Join ContratoTransporte on');
  FiltroExtra.Add('  FaturaProdExp.Contrato = ContratoTransporte.Contrato');
  Sql.Add('order by FaturaProdExp.NumFatura,FaturaProdExp.Contrato,FaturaProdExp.Seq');
  NumFatura := TDFaturaProdExp_NumFatura.Create(AOwner);
  NumFatura.Valor.DataSet := Self;
  Status := TDFaturaProdExp_Status.Create(AOwner);
  Status.Valor.DataSet := Self;
  Contrato := TDFaturaProdExp_Contrato.Create(AOwner);
  Contrato.Valor.DataSet := Self;
  Fatura := TDFaturaProdExp_Fatura.Create(AOwner);
  Fatura.Valor.DataSet := Self;
  Seq := TDFaturaProdExp_Seq.Create(AOwner);
  Seq.Valor.DataSet := Self;
  Navio := TDFaturaProdExp_Navio.Create(AOwner);
  Navio.Valor.DataSet := Self;
  DataEmbarque := TDFaturaProdExp_DataEmbarque.Create(AOwner);
  DataEmbarque.Valor.DataSet := Self;
  ETADestino := TDFaturaProdExp_ETADestino.Create(AOwner);
  ETADestino.Valor.DataSet := Self;
  QuantidadeExp := TDFaturaProdExp_QuantidadeExp.Create(AOwner);
  QuantidadeExp.Valor.DataSet := Self;
  Valor := TDFaturaProdExp_Valor.Create(AOwner);
  Valor.Valor.DataSet := Self;
  ValorDesconto := TDFaturaProdExp_ValorDesconto.Create(AOwner);
  ValorDesconto.Valor.DataSet := Self;
  ValorConvertido := TDFaturaProdExp_ValorConvertido.Create(AOwner);
  ValorConvertido.Valor.DataSet := Self;
  FormPago := TDFaturaProdExp_FormPago.Create(AOwner);
  FormPago.Valor.DataSet := Self;
  PrecoFOB := TDFaturaProdExp_PrecoFOB.Create(AOwner);
  PrecoFOB.Valor.DataSet := Self;
  StDocumento := TDFaturaProdExp_StDocumento.Create(AOwner);
  StDocumento.Valor.DataSet := Self;
  OBS := TDFaturaProdExp_OBS.Create(AOwner);
  OBS.Valor.DataSet := Self;
  Comentario := TDFaturaProdExp_Comentario.Create(AOwner);
  Comentario.Valor.DataSet := Self;
  Rate := TDFaturaProdExp_Rate.Create(AOwner);
  Rate.Valor.DataSet := Self;
  DataLiq := TDFaturaProdExp_DataLiq.Create(AOwner);
  DataLiq.Valor.DataSet := Self;
  DataFatura := TDFaturaProdExp_DataFatura.Create(AOwner);
  DataFatura.Valor.DataSet := Self;
  Cadastro := TDFaturaProdExp_Cadastro.Create(AOwner);
  Cadastro.Valor.DataSet := Self;
  ComisaoSFatura := TDFaturaProdExp_ComisaoSFatura.Create(AOwner);
  ComisaoSFatura.Valor.DataSet := Self;
  NomeMix := TDFaturaProdExp_NomeMix.Create(AOwner);
  NomeMix.Valor.DataSet := Self;
  Comissao := TDFaturaProdExp_Comissao.Create(AOwner);
  Comissao.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(NumFatura);
  ChavePrimaria.Add(Contrato);
  ChavePrimaria.Add(Seq);
//CRIANDO CAMPOS 
  Campos.Add(NumFatura);
  Campos.Add(Contrato);
  Campos.Add(Seq);
  Campos.Add(Navio);
  Campos.Add(DataEmbarque);
  Campos.Add(QuantidadeExp);
  Campos.Add(Fatura);
  Campos.Add(StDocumento);
  Campos.Add(Valor);
  Campos.Add(ValorDesconto);
  Campos.Add(ValorConvertido);
  Campos.Add(ComisaoSFatura);
  Campos.Add(Cadastro);
  Campos.Add(ETADestino);
  Campos.Add(FormPago);
  Campos.Add(PrecoFOB);
  Campos.Add(DataFatura);
  Campos.Add(Rate);
  Campos.Add(Status);
  Campos.Add(OBS);
  Campos.Add(Comentario);
  Campos.Add(DataLiq);
  Campos.Add(NomeMix);
  Campos.Add(Comissao);
  TituloIndices.Add('Fatura Surimpex,Contrato,Seq.');
  Indices.Add('FaturaProdExp.NumFatura,FaturaProdExp.Contrato,FaturaProdExp.Seq');
  Crescente.Add('S');
  TituloPrimaria := 'Fatura Surimpex,Contrato,Seq.';
  ChPrimaria     := 'FaturaProdExp.NumFatura,FaturaProdExp.Contrato,FaturaProdExp.Seq';
//CRIANDO TituloIndices 
  TituloIndice   := 'Fatura Surimpex,Contrato,Seq.';
  ChaveIndice    := 'FaturaProdExp.NumFatura,FaturaProdExp.Contrato,FaturaProdExp.Seq';
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

procedure TDFaturaProdExp.CriaForeignKeys;
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

function TDFaturaProdExp.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDFaturaProdExp.ExclusaoCascata;
begin
end;

function TDFaturaProdExp.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('ExportadoTransito') then
    if (UpperCase('Contrato') = UpperCase(CampoFoco)) or (UpperCase('Seq') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DExportadoTransito, ['Contrato','Seq'], [Contrato.Valor.Value,Seq.Valor.Value], [Campo], Retorno) then
        Result := True;

  if UpperCase(Tabela) = UpperCase('ContratoTransporte') then
    if (UpperCase('Contrato') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], [Campo], Retorno) then
        Result := True;

end;

function TDFaturaProdExp.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('ExportadoTransito') then
    if PTabela(TabGlobal.DExportadoTransito, ['Contrato','Seq'], [Contrato.Valor.Value,Seq.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('ContratoTransporte') then
    if PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('FaturaProdExp') then
    if PTabela(TabGlobal.DFaturaProdExp, ['NumFatura','Contrato','Seq'], [NumFatura.Valor.Value,Contrato.Valor.Value,Seq.Valor.Value]) then
      Result := True;
end;

procedure TDFaturaProdExp.CalculaCampos;
begin
  ValorConvertido.Conteudo := CalculaDFaturaProdExp_ValorConvertido(Self);
  ComisaoSFatura.Conteudo := CalculaDFaturaProdExp_ComisaoSFatura(Self);
end;

procedure TDFaturaProdExp.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDFaturaProdExp.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
var
  I: Integer;
begin
  Filtro.Clear;
  FiltroRelac.Clear;
  if Atribui then
  begin
    FiltroRelac.Add('FaturaProdExp.NumFatura = :FaturaTab_NumFatura');
  end
  else
    for I:=0 to Campos.Count-1 do
      TAtributo(Campos[I]).Valor.OnValidate := nil;
  NumFatura.Valor.ReadOnly := Atribui;
  if Atualiza then
    AtualizaSql;
end;

procedure TDFaturaProdExp.AtribuiMestre(DataSet: TDataSet);
begin
  NumFatura.Valor.Value := TabGlobal.DFaturaTab.NumFatura.Valor.Value;
end;

procedure TDFaturaProdExp.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDFaturaProdExp.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDFaturaProdExp.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (NumFatura.SempreAtribui) and (NumFatura.AutoIncremento > 0) then
      AutoIncremento('NumFatura', True, NumFatura.AutoIncremento);
end;

procedure TDFaturaProdExp.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDFaturaProdExp.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDFaturaProdExp.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
