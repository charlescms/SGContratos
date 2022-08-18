// a variável "Result" deverá conter o resultado da expressão
//   if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'QuantidadeTotal = (QuantidadeTotal + (:ProdutoContratoT_Quantidade))') then
   PTabela(DProdutoContratoT,['SUM(Quantidade) AS Quantidade'],'Contrato = '+AtribuiAspas(DContratoTransporte.Contrato.Conteudo),ValoresRetornar);
   Result := 0 ;
   IF ValoresRetornar[0] <> null then
      Result := ValoresRetornar[0]  ;


procedure TDExportadoTransito.ProcessoDireto1(DataSet: TDataSet);
var
  QueryLc: TTabela;
  EmEdicao: Boolean;
begin
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorTotalExp = ValorTotalExp + :ExportadoTransito_Valor') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'QUANTTOTALEXP = QUANTTOTALEXP + :ExportadoTransito_QuantidadeExp') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if (( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'BO' )  Or ( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'EM' ) Or ( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'AB' )) then
    if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'StatusCT = ''EM''') then
      MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'VALORTOTALCOMISSAOEXECUTADOUS = VALORTOTALCOMISSAOEXECUTADOUS +:ExportadoTransito_ComisaoSFatura') then
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

procedure TDFatura.ProcessoDireto1(DataSet: TDataSet);
var
  QueryLc: TTabela;
  EmEdicao: Boolean;
begin
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorTotalComissaoExecutado = ValorTotalComissaoExecutado + :Fatura_ValorConvertido') then
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
