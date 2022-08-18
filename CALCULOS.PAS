{
 Cálculos para Campos
}

unit Calculos;

interface

uses SysUtils, StdCtrls, BaseD, classes, Atributo, Estrutur, Princ,
     {$I LTab.pas}
     Rotinas, Validar, Controls, Tabela, Abertura, Publicas;


function CalculaDBoocking_SALDO(AOwner: TComponent) : Double;

function CalculaDBoocking_SALDO_Rel(AOwner: TComponent) : Double;

function CalculaDContratoTransporte_StatusCT(AOwner: TComponent) : String;

function CalculaDContratoTransporte_StatusCT_Rel(AOwner: TComponent) : String;

function CalculaDContratoTransporte_QuantadePendente(AOwner: TComponent) : Double;

function CalculaDContratoTransporte_QuantadePendente_Rel(AOwner: TComponent) : Double;

function CalculaDContratoTransporte_ValorTotalPendente(AOwner: TComponent) : Double;

function CalculaDContratoTransporte_ValorTotalPendente_Rel(AOwner: TComponent) : Double;

function CalculaDContratoTransporte_VlTotalComissaoPendente(AOwner: TComponent) : Double;

function CalculaDContratoTransporte_VlTotalComissaoPendente_Rel(AOwner: TComponent) : Double;

function CalculaDExportadoTransito_ComisaoSFatura(AOwner: TComponent) : Double;

function CalculaDExportadoTransito_ComisaoSFatura_Rel(AOwner: TComponent) : Double;

function CalculaDExportadoTransito_ValorConvertido(AOwner: TComponent) : Double;

function CalculaDExportadoTransito_ValorConvertido_Rel(AOwner: TComponent) : Double;

function CalculaDProdutoContratoT_ValorSCC(AOwner: TComponent) : Double;

function CalculaDProdutoContratoT_ValorSCC_Rel(AOwner: TComponent) : Double;

function CalculaDProdutoContratoT_ComisaoSFatura(AOwner: TComponent) : Double;

function CalculaDProdutoContratoT_ComisaoSFatura_Rel(AOwner: TComponent) : Double;

function CalculaDFatura_ComisaoSFatura(AOwner: TComponent) : Double;

function CalculaDFatura_ComisaoSFatura_Rel(AOwner: TComponent) : Double;

function CalculaDFatura_ValorConvertido(AOwner: TComponent) : Double;

function CalculaDFatura_ValorConvertido_Rel(AOwner: TComponent) : Double;

function CalculaDOrdemCobranca_Valor(AOwner: TComponent) : Double;

function CalculaDOrdemCobranca_Valor_Rel(AOwner: TComponent) : Double;

function CalculaDOrdemCobranca_ValorDesconto(AOwner: TComponent) : Double;

function CalculaDOrdemCobranca_ValorDesconto_Rel(AOwner: TComponent) : Double;

function CalculaDOrdemCobranca_VALOR_LIQ(AOwner: TComponent) : Double;

function CalculaDOrdemCobranca_VALOR_LIQ_Rel(AOwner: TComponent) : Double;

function CalculaDOrdemCobranca_VALOR_NF_LIQ(AOwner: TComponent) : Double;

function CalculaDOrdemCobranca_VALOR_NF_LIQ_Rel(AOwner: TComponent) : Double;

function CalculaDOrdemCobrancaProdExp_COMISAOSFATURA_EX(AOwner: TComponent) : Double;

function CalculaDOrdemCobrancaProdExp_COMISAOSFATURA_EX_Rel(AOwner: TComponent) : Double;

function CalculaDOrdemCobrancaProdExp_VALORCONVERTIDO_EX(AOwner: TComponent) : Double;

function CalculaDOrdemCobrancaProdExp_VALORCONVERTIDO_EX_Rel(AOwner: TComponent) : Double;

function CalculaDOrdemCobrancaProdExp_VALORCONVERTIDO(AOwner: TComponent) : Double;

function CalculaDOrdemCobrancaProdExp_VALORCONVERTIDO_Rel(AOwner: TComponent) : Double;

implementation

function CalculaDBoocking_SALDO(AOwner: TComponent) : Double;
  // variáveis locais
begin
  // a variável "Result" deverá conter o resultado da expressão
  // ATUALOIZA O STATUS DPO BOOCK
  //IF ( TabGlobal.DBoocking.Quantidade.Conteudo - TabGlobal.DBoocking.QuntTransp.Conteudo = 0 ) THEN
  //     TabGlobal.DBoocking.StatusBK.Conteudo := 'RE' ;
  Result := TabGlobal.DBoocking.Quantidade.Conteudo - TabGlobal.DBoocking.QuntTransp.Conteudo ;
end;

function CalculaDBoocking_SALDO_Rel(AOwner: TComponent) : Double;
var
  DBoocking: TDBoocking;
  // variáveis locais
begin
  DBoocking := TDBoocking(LocalizaTabela(AOwner, 'DBoocking'));
  // a variável "Result" deverá conter o resultado da expressão
  // ATUALOIZA O STATUS DPO BOOCK
  //IF ( DBoocking.Quantidade.Conteudo - DBoocking.QuntTransp.Conteudo = 0 ) THEN
  //     DBoocking.StatusBK.Conteudo := 'RE' ;
  Result := DBoocking.Quantidade.Conteudo - DBoocking.QuntTransp.Conteudo ;
end;

function CalculaDContratoTransporte_StatusCT(AOwner: TComponent) : String;
  // variáveis locais
begin
  // a variável "Result" deverá conter o resultado da expressão
  // StatusCT  CALCULO
  // CORRECAO 07/12/2011 CORRECAO DO CAMPO StatusCT EM BRANCO
  IF ( TabGlobal.DContratoTransporte.QuantidadeTotal.Conteudo  > 0 ) AND
     ( TabGlobal.DContratoTransporte.QUANTTOTALEXP.Conteudo    > 0 ) AND
     ( TabGlobal.DContratoTransporte.QuantadePendente.Conteudo = 0 ) then BEGIN
     if TabGlobal.DContratoTransporte.StatusCT.Conteudo  <> 'PR' then
        Result := 'EX'
  END
  else   // COSO ESTAJA EM BRANCO O CAMPO  StatusCT ESTE DEVE TERE CORRIGIDO PARA O STATUS CORRETO
     IF TabGlobal.DContratoTransporte.StatusCT.Conteudo <> '' THEN
        Result := TabGlobal.DContratoTransporte.StatusCT.Conteudo
     ELSE BEGIN
          if PTabela(TabGlobal.DBoocking, ['Contrato'], [ TabGlobal.DContratoTransporte.Contrato.Conteudo]) then
             Result := 'BO'
          ELSE
             Result := 'AB' ;
     END;
end;

function CalculaDContratoTransporte_StatusCT_Rel(AOwner: TComponent) : String;
var
  DBoocking: TDBoocking;
  DContratoTransporte: TDContratoTransporte;
  // variáveis locais
begin
  DBoocking := TDBoocking(LocalizaTabela(Nil, 'DBoocking'));
  DContratoTransporte := TDContratoTransporte(LocalizaTabela(AOwner, 'DContratoTransporte'));
  // a variável "Result" deverá conter o resultado da expressão
  // StatusCT  CALCULO
  // CORRECAO 07/12/2011 CORRECAO DO CAMPO StatusCT EM BRANCO
  IF ( DContratoTransporte.QuantidadeTotal.Conteudo  > 0 ) AND
     ( DContratoTransporte.QUANTTOTALEXP.Conteudo    > 0 ) AND
     ( DContratoTransporte.QuantadePendente.Conteudo = 0 ) then BEGIN
     if DContratoTransporte.StatusCT.Conteudo  <> 'PR' then
        Result := 'EX'
  END
  else   // COSO ESTAJA EM BRANCO O CAMPO  StatusCT ESTE DEVE TERE CORRIGIDO PARA O STATUS CORRETO
     IF DContratoTransporte.StatusCT.Conteudo <> '' THEN
        Result := DContratoTransporte.StatusCT.Conteudo
     ELSE BEGIN
          if PTabela(DBoocking, ['Contrato'], [ DContratoTransporte.Contrato.Conteudo]) then
             Result := 'BO'
          ELSE
             Result := 'AB' ;
     END;
end;

function CalculaDContratoTransporte_QuantadePendente(AOwner: TComponent) : Double;
  // variáveis locais
begin
  // Round()FloatToStr()// a variável "Result" deverá conter o resultado da expressão
  // CHARLES
  TabGlobal.DContratoTransporte.QuantadePendente.Conteudo := 0;
  Result := RoundDec(TabGlobal.DContratoTransporte.QuantidadeTotal.Conteudo, 3) - RoundDec( TabGlobal.DContratoTransporte.QUANTTOTALEXP.Conteudo, 3) ;
  IF  Result = 0 THEN
      Result := 0;
end;

function CalculaDContratoTransporte_QuantadePendente_Rel(AOwner: TComponent) : Double;
var
  DContratoTransporte: TDContratoTransporte;
  // variáveis locais
begin
  DContratoTransporte := TDContratoTransporte(LocalizaTabela(AOwner, 'DContratoTransporte'));
  // Round()FloatToStr()// a variável "Result" deverá conter o resultado da expressão
  // CHARLES
  DContratoTransporte.QuantadePendente.Conteudo := 0;
  Result := RoundDec(DContratoTransporte.QuantidadeTotal.Conteudo, 3) - RoundDec( DContratoTransporte.QUANTTOTALEXP.Conteudo, 3) ;
  IF  Result = 0 THEN
      Result := 0;
end;

function CalculaDContratoTransporte_ValorTotalPendente(AOwner: TComponent) : Double;
  // variáveis locais
begin
  // a variável "Result" deverá conter o resultado da expressão
  // CHARLES
  TabGlobal.DContratoTransporte.ValorTotalPendente.Conteudo := 0;
  Result := TabGlobal.DContratoTransporte.ValorSCCTotal.Conteudo - TabGlobal.DContratoTransporte.ValorTotalExp.Conteudo ;
  IF Result = 0 THEN
     Result := 0 ;
end;

function CalculaDContratoTransporte_ValorTotalPendente_Rel(AOwner: TComponent) : Double;
var
  DContratoTransporte: TDContratoTransporte;
  // variáveis locais
begin
  DContratoTransporte := TDContratoTransporte(LocalizaTabela(AOwner, 'DContratoTransporte'));
  // a variável "Result" deverá conter o resultado da expressão
  // CHARLES
  DContratoTransporte.ValorTotalPendente.Conteudo := 0;
  Result := DContratoTransporte.ValorSCCTotal.Conteudo - DContratoTransporte.ValorTotalExp.Conteudo ;
  IF Result = 0 THEN
     Result := 0 ;
end;

function CalculaDContratoTransporte_VlTotalComissaoPendente(AOwner: TComponent) : Double;
  // variáveis locais
begin
  // a variável "Result" deverá conter o resultado da expressão
  Result := TabGlobal.DContratoTransporte.ValorTotalComissao.Conteudo - TabGlobal.DContratoTransporte.ValorTotalComissaoExecutado.Conteudo ;
end;

function CalculaDContratoTransporte_VlTotalComissaoPendente_Rel(AOwner: TComponent) : Double;
var
  DContratoTransporte: TDContratoTransporte;
  // variáveis locais
begin
  DContratoTransporte := TDContratoTransporte(LocalizaTabela(AOwner, 'DContratoTransporte'));
  // a variável "Result" deverá conter o resultado da expressão
  Result := DContratoTransporte.ValorTotalComissao.Conteudo - DContratoTransporte.ValorTotalComissaoExecutado.Conteudo ;
end;

function CalculaDExportadoTransito_ComisaoSFatura(AOwner: TComponent) : Double;
  // variáveis locais
begin
  // a variável "Result" deverá conter o resultado da expressão
  // teste charles
  if TabGlobal.DExportadoTransito.ComisaoSFatura.Conteudo = 0 then begin
     IF TabGlobal.DExportadoTransito.FormComissao.Conteudo = 'TM' THEN
        Result := ( TabGlobal.DExportadoTransito.QuantidadeExp.Conteudo * TabGlobal.DExportadoTransito.Comissao.Conteudo )
     ELSE
        Result := ( TabGlobal.DExportadoTransito.QuantidadeExp.Conteudo * TabGlobal.DExportadoTransito.Comissao.Conteudo * TabGlobal.DExportadoTransito.PrecoFOB.Conteudo )  /100 ;
  end
  else
     Result := TabGlobal.DExportadoTransito.ComisaoSFatura.Conteudo ;
end;

function CalculaDExportadoTransito_ComisaoSFatura_Rel(AOwner: TComponent) : Double;
var
  DExportadoTransito: TDExportadoTransito;
  // variáveis locais
begin
  DExportadoTransito := TDExportadoTransito(LocalizaTabela(AOwner, 'DExportadoTransito'));
  // a variável "Result" deverá conter o resultado da expressão
  // teste charles
  if DExportadoTransito.ComisaoSFatura.Conteudo = 0 then begin
     IF DExportadoTransito.FormComissao.Conteudo = 'TM' THEN
        Result := ( DExportadoTransito.QuantidadeExp.Conteudo * DExportadoTransito.Comissao.Conteudo )
     ELSE
        Result := ( DExportadoTransito.QuantidadeExp.Conteudo * DExportadoTransito.Comissao.Conteudo * DExportadoTransito.PrecoFOB.Conteudo )  /100 ;
  end
  else
     Result := DExportadoTransito.ComisaoSFatura.Conteudo ;
end;

function CalculaDExportadoTransito_ValorConvertido(AOwner: TComponent) : Double;
  // variáveis locais
begin
  // a variável "Result" deverá conter o resultado da expressão
  // charles teste
  Result := 0.0 ;
  IF TabGlobal.DExportadoTransito.Rate.Conteudo > 0 THEN BEGIN
    IF TabGlobal.DExportadoTransito.MOEDACOMISSAOTAXA.Conteudo = 'EUR' THEN
       Result :=( TabGlobal.DExportadoTransito.ComisaoSFatura.Conteudo ) / TabGlobal.DExportadoTransito.Rate.Conteudo  ;
    IF TabGlobal.DExportadoTransito.MOEDACOMISSAOTAXA.Conteudo = 'R$ ' THEN
       Result :=( TabGlobal.DExportadoTransito.ComisaoSFatura.Conteudo  ) * TabGlobal.DExportadoTransito.Rate.Conteudo ;
    IF TabGlobal.DExportadoTransito.MOEDACOMISSAOTAXA.Conteudo = 'USR' THEN
       Result :=( TabGlobal.DExportadoTransito.ComisaoSFatura.Conteudo  )  ;
  END;
end;

function CalculaDExportadoTransito_ValorConvertido_Rel(AOwner: TComponent) : Double;
var
  DExportadoTransito: TDExportadoTransito;
  // variáveis locais
begin
  DExportadoTransito := TDExportadoTransito(LocalizaTabela(AOwner, 'DExportadoTransito'));
  // a variável "Result" deverá conter o resultado da expressão
  // charles teste
  Result := 0.0 ;
  IF DExportadoTransito.Rate.Conteudo > 0 THEN BEGIN
    IF DExportadoTransito.MOEDACOMISSAOTAXA.Conteudo = 'EUR' THEN
       Result :=( DExportadoTransito.ComisaoSFatura.Conteudo ) / DExportadoTransito.Rate.Conteudo  ;
    IF DExportadoTransito.MOEDACOMISSAOTAXA.Conteudo = 'R$ ' THEN
       Result :=( DExportadoTransito.ComisaoSFatura.Conteudo  ) * DExportadoTransito.Rate.Conteudo ;
    IF DExportadoTransito.MOEDACOMISSAOTAXA.Conteudo = 'USR' THEN
       Result :=( DExportadoTransito.ComisaoSFatura.Conteudo  )  ;
  END;
end;

function CalculaDProdutoContratoT_ValorSCC(AOwner: TComponent) : Double;
  // variáveis locais
begin
  // a variável "Result" deverá conter o resultado da expressão
  if TabGlobal.DProdutoContratoT.ValorSCC.Conteudo = 0 then
     Result := TabGlobal.DProdutoContratoT.PrecoSCC.Conteudo * TabGlobal.DProdutoContratoT.Quantidade.Conteudo
  else
     Result := TabGlobal.DProdutoContratoT.ValorSCC.Conteudo;
end;

function CalculaDProdutoContratoT_ValorSCC_Rel(AOwner: TComponent) : Double;
var
  DProdutoContratoT: TDProdutoContratoT;
  // variáveis locais
begin
  DProdutoContratoT := TDProdutoContratoT(LocalizaTabela(AOwner, 'DProdutoContratoT'));
  // a variável "Result" deverá conter o resultado da expressão
  if DProdutoContratoT.ValorSCC.Conteudo = 0 then
     Result := DProdutoContratoT.PrecoSCC.Conteudo * DProdutoContratoT.Quantidade.Conteudo
  else
     Result := DProdutoContratoT.ValorSCC.Conteudo;
end;

function CalculaDProdutoContratoT_ComisaoSFatura(AOwner: TComponent) : Double;
  // variáveis locais
begin
  // a variável "Result" deverá conter o resultado da expressão
  // teste charles
  IF TabGlobal.DProdutoContratoT.ComisaoSFatura.Conteudo = 0 THEN BEGIN
     IF TabGlobal.DProdutoContratoT.FormComissao.Conteudo = 'TM' THEN
        Result := ( TabGlobal.DProdutoContratoT.Quantidade.Conteudo * TabGlobal.DProdutoContratoT.Comissao.Conteudo )
     ELSE
        Result := ( TabGlobal.DProdutoContratoT.Quantidade.Conteudo * TabGlobal.DProdutoContratoT.Comissao.Conteudo * TabGlobal.DProdutoContratoT.PrecoFOB.Conteudo )  /100 ;
     END
  ELSE
     Result := TabGlobal.DProdutoContratoT.ComisaoSFatura.Conteudo ;
end;

function CalculaDProdutoContratoT_ComisaoSFatura_Rel(AOwner: TComponent) : Double;
var
  DProdutoContratoT: TDProdutoContratoT;
  // variáveis locais
begin
  DProdutoContratoT := TDProdutoContratoT(LocalizaTabela(AOwner, 'DProdutoContratoT'));
  // a variável "Result" deverá conter o resultado da expressão
  // teste charles
  IF DProdutoContratoT.ComisaoSFatura.Conteudo = 0 THEN BEGIN
     IF DProdutoContratoT.FormComissao.Conteudo = 'TM' THEN
        Result := ( DProdutoContratoT.Quantidade.Conteudo * DProdutoContratoT.Comissao.Conteudo )
     ELSE
        Result := ( DProdutoContratoT.Quantidade.Conteudo * DProdutoContratoT.Comissao.Conteudo * DProdutoContratoT.PrecoFOB.Conteudo )  /100 ;
     END
  ELSE
     Result := DProdutoContratoT.ComisaoSFatura.Conteudo ;
end;

function CalculaDFatura_ComisaoSFatura(AOwner: TComponent) : Double;
  // variáveis locais
begin
  // a variável "Result" deverá conter o resultado da expressão
  //IF TabGlobal.DFatura.FormComissao.Conteudo = 'TM' THEN
  //   Result := ( TabGlobal.DFatura.QuantidadeExp.Conteudo * TabGlobal.DFatura.Comissao.Conteudo )
  //ELSE
  //   Result := ( TabGlobal.DFatura.QuantidadeExp.Conteudo * TabGlobal.DFatura.PrecoFOB.Conteudo *  TabGlobal.DFatura.Comissao.Conteudo )  /100 ;
  // a variável "Result" deverá conter o resultado da expressão
  // teste charles
  if TabGlobal.DFatura.ComisaoSFatura.Conteudo = 0 then begin
     IF TabGlobal.DFatura.FormComissao.Conteudo = 'TM' THEN
        Result := ( TabGlobal.DFatura.QuantidadeExp.Conteudo * TabGlobal.DFatura.Comissao.Conteudo )
     ELSE
        Result := ( TabGlobal.DFatura.QuantidadeExp.Conteudo * TabGlobal.DFatura.Comissao.Conteudo * TabGlobal.DFatura.PrecoFOB.Conteudo )  /100 ;
  end
  else
     Result := TabGlobal.DFatura.ComisaoSFatura.Conteudo ;
end;

function CalculaDFatura_ComisaoSFatura_Rel(AOwner: TComponent) : Double;
var
  DFatura: TDFatura;
  // variáveis locais
begin
  DFatura := TDFatura(LocalizaTabela(AOwner, 'DFatura'));
  // a variável "Result" deverá conter o resultado da expressão
  //IF DFatura.FormComissao.Conteudo = 'TM' THEN
  //   Result := ( DFatura.QuantidadeExp.Conteudo * DFatura.Comissao.Conteudo )
  //ELSE
  //   Result := ( DFatura.QuantidadeExp.Conteudo * DFatura.PrecoFOB.Conteudo *  DFatura.Comissao.Conteudo )  /100 ;
  // a variável "Result" deverá conter o resultado da expressão
  // teste charles
  if DFatura.ComisaoSFatura.Conteudo = 0 then begin
     IF DFatura.FormComissao.Conteudo = 'TM' THEN
        Result := ( DFatura.QuantidadeExp.Conteudo * DFatura.Comissao.Conteudo )
     ELSE
        Result := ( DFatura.QuantidadeExp.Conteudo * DFatura.Comissao.Conteudo * DFatura.PrecoFOB.Conteudo )  /100 ;
  end
  else
     Result := DFatura.ComisaoSFatura.Conteudo ;
end;

function CalculaDFatura_ValorConvertido(AOwner: TComponent) : Double;
  // variáveis locais
begin
  // a variável "Result" deverá conter o resultado da expressão
  Result := 0.0 ;
  if TabGlobal.DFatura.Rate.Conteudo > 0 then begin
    IF TabGlobal.DFatura.MOEDACOMISSAOTAXA.Conteudo = 'EUR' THEN
       Result :=( TabGlobal.DFatura.ComisaoSFatura.Conteudo  ) / TabGlobal.DFatura.Rate.Conteudo  ;
    IF TabGlobal.DFatura.MOEDACOMISSAOTAXA.Conteudo = 'R$ ' THEN
       Result :=( TabGlobal.DFatura.ComisaoSFatura.Conteudo  ) * TabGlobal.DFatura.Rate.Conteudo ;
    IF TabGlobal.DFatura.MOEDACOMISSAOTAXA.Conteudo = 'USR' THEN
       Result :=( TabGlobal.DFatura.ComisaoSFatura.Conteudo  )  ;
  end;
end;

function CalculaDFatura_ValorConvertido_Rel(AOwner: TComponent) : Double;
var
  DFatura: TDFatura;
  // variáveis locais
begin
  DFatura := TDFatura(LocalizaTabela(AOwner, 'DFatura'));
  // a variável "Result" deverá conter o resultado da expressão
  Result := 0.0 ;
  if DFatura.Rate.Conteudo > 0 then begin
    IF DFatura.MOEDACOMISSAOTAXA.Conteudo = 'EUR' THEN
       Result :=( DFatura.ComisaoSFatura.Conteudo  ) / DFatura.Rate.Conteudo  ;
    IF DFatura.MOEDACOMISSAOTAXA.Conteudo = 'R$ ' THEN
       Result :=( DFatura.ComisaoSFatura.Conteudo  ) * DFatura.Rate.Conteudo ;
    IF DFatura.MOEDACOMISSAOTAXA.Conteudo = 'USR' THEN
       Result :=( DFatura.ComisaoSFatura.Conteudo  )  ;
  end;
end;

function CalculaDOrdemCobranca_Valor(AOwner: TComponent) : Double;
  // variáveis locais
var
  s_ValorConvertido : double ;
begin
  // a variável "Result" deverá conter o resultado da expressão
  // CHARLES CALCULA O VALOR TOTAL DE IMPOSTO
  s_ValorConvertido := 0 ;
  TabGlobal.DOrdemCobrancaProdExp.first ;
  while not TabGlobal.DOrdemCobrancaProdExp.eof do
  begin
   s_ValorConvertido := s_ValorConvertido + TabGlobal.DOrdemCobrancaProdExp.ValorConvertido.Conteudo;
   TabGlobal.DOrdemCobrancaProdExp.next ;
  end;
  Result := s_ValorConvertido ;
end;

function CalculaDOrdemCobranca_Valor_Rel(AOwner: TComponent) : Double;
var
  DOrdemCobrancaProdExp: TDOrdemCobrancaProdExp;
  // variáveis locais
  s_ValorConvertido : double ;
begin
  DOrdemCobrancaProdExp := TDOrdemCobrancaProdExp(LocalizaTabela(AOwner, 'DOrdemCobrancaProdExp'));
  // a variável "Result" deverá conter o resultado da expressão
  // CHARLES CALCULA O VALOR TOTAL DE IMPOSTO
  s_ValorConvertido := 0 ;
  DOrdemCobrancaProdExp.first ;
  while not DOrdemCobrancaProdExp.eof do
  begin
   s_ValorConvertido := s_ValorConvertido + DOrdemCobrancaProdExp.ValorConvertido.Conteudo;
   DOrdemCobrancaProdExp.next ;
  end;
  Result := s_ValorConvertido ;
end;

function CalculaDOrdemCobranca_ValorDesconto(AOwner: TComponent) : Double;
  // vari
var
  s_desconto : double ;
begin
  // a variável "Result" deverá conter o resultado da expressão
  TabGlobal.DOrdemCobrancaDescont.first ;
  s_desconto :=  0 ;
  while not TabGlobal.DOrdemCobrancaDescont.eof  do
  begin
     s_desconto := s_desconto + TabGlobal.DOrdemCobrancaDescont.Valor.Conteudo ;
     TabGlobal.DOrdemCobrancaDescont.next ;
  end;
  Result := s_desconto ;
end;

function CalculaDOrdemCobranca_ValorDesconto_Rel(AOwner: TComponent) : Double;
var
  DOrdemCobrancaDescont: TDOrdemCobrancaDescont;
  // vari
  s_desconto : double ;
begin
  DOrdemCobrancaDescont := TDOrdemCobrancaDescont(LocalizaTabela(AOwner, 'DOrdemCobrancaDescont'));
  // a variável "Result" deverá conter o resultado da expressão
  DOrdemCobrancaDescont.first ;
  s_desconto :=  0 ;
  while not DOrdemCobrancaDescont.eof  do
  begin
     s_desconto := s_desconto + DOrdemCobrancaDescont.Valor.Conteudo ;
     DOrdemCobrancaDescont.next ;
  end;
  Result := s_desconto ;
end;

function CalculaDOrdemCobranca_VALOR_LIQ(AOwner: TComponent) : Double;
  // variáveis locais
begin
  // a variável "Result" deverá conter o resultado da expressão
    Result := TabGlobal.DOrdemCobranca.Valor.Conteudo - TabGlobal.DOrdemCobranca.ValorDesconto.Conteudo ;
end;

function CalculaDOrdemCobranca_VALOR_LIQ_Rel(AOwner: TComponent) : Double;
var
  DOrdemCobranca: TDOrdemCobranca;
  // variáveis locais
begin
  DOrdemCobranca := TDOrdemCobranca(LocalizaTabela(AOwner, 'DOrdemCobranca'));
  // a variável "Result" deverá conter o resultado da expressão
    Result := DOrdemCobranca.Valor.Conteudo - DOrdemCobranca.ValorDesconto.Conteudo ;
end;

function CalculaDOrdemCobranca_VALOR_NF_LIQ(AOwner: TComponent) : Double;
  // variáveis locais
begin
  // a variável "Result" deverá conter o resultado da expressão
    Result := TabGlobal.DOrdemCobranca.VALOR_NF.Conteudo  -
      (  TabGlobal.DOrdemCobranca.VALOR_IRRF.Conteudo +
         TabGlobal.DOrdemCobranca.VALOR_PIS_COF.Conteudo ) ;
end;

function CalculaDOrdemCobranca_VALOR_NF_LIQ_Rel(AOwner: TComponent) : Double;
var
  DOrdemCobranca: TDOrdemCobranca;
  // variáveis locais
begin
  DOrdemCobranca := TDOrdemCobranca(LocalizaTabela(AOwner, 'DOrdemCobranca'));
  // a variável "Result" deverá conter o resultado da expressão
    Result := DOrdemCobranca.VALOR_NF.Conteudo  -
      (  DOrdemCobranca.VALOR_IRRF.Conteudo +
         DOrdemCobranca.VALOR_PIS_COF.Conteudo ) ;
end;

function CalculaDOrdemCobrancaProdExp_COMISAOSFATURA_EX(AOwner: TComponent) : Double;
begin
end;

function CalculaDOrdemCobrancaProdExp_COMISAOSFATURA_EX_Rel(AOwner: TComponent) : Double;
begin
end;

function CalculaDOrdemCobrancaProdExp_VALORCONVERTIDO_EX(AOwner: TComponent) : Double;
begin
end;

function CalculaDOrdemCobrancaProdExp_VALORCONVERTIDO_EX_Rel(AOwner: TComponent) : Double;
begin
end;

function CalculaDOrdemCobrancaProdExp_VALORCONVERTIDO(AOwner: TComponent) : Double;
  // variáveis locais
begin
  // a variável "Result" deverá conter o resultado da expressão
  Result := 0.0 ;
  IF TabGlobal.DOrdemCobrancaProdExp.TAXACONVERCAO.Conteudo > 0 THEN BEGIN
    IF TabGlobal.DOrdemCobrancaProdExp.MOEDACOMISSAO.Conteudo = 'EUR' THEN
       Result :=( TabGlobal.DOrdemCobrancaProdExp.ComisaoSFatura.Conteudo ) / TabGlobal.DOrdemCobrancaProdExp.TAXACONVERCAO.Conteudo  ;
    IF TabGlobal.DOrdemCobrancaProdExp.MOEDACOMISSAO.Conteudo = 'R$ ' THEN
       Result :=( TabGlobal.DOrdemCobrancaProdExp.ComisaoSFatura.Conteudo  ) * TabGlobal.DOrdemCobrancaProdExp.TAXACONVERCAO.Conteudo ;
    IF TabGlobal.DOrdemCobrancaProdExp.MOEDACOMISSAO.Conteudo = 'USR' THEN
       Result :=( TabGlobal.DOrdemCobrancaProdExp.ComisaoSFatura.Conteudo  )  ;
  END;
end;

function CalculaDOrdemCobrancaProdExp_VALORCONVERTIDO_Rel(AOwner: TComponent) : Double;
var
  DOrdemCobrancaProdExp: TDOrdemCobrancaProdExp;
  // variáveis locais
begin
  DOrdemCobrancaProdExp := TDOrdemCobrancaProdExp(LocalizaTabela(AOwner, 'DOrdemCobrancaProdExp'));
  // a variável "Result" deverá conter o resultado da expressão
  Result := 0.0 ;
  IF DOrdemCobrancaProdExp.TAXACONVERCAO.Conteudo > 0 THEN BEGIN
    IF DOrdemCobrancaProdExp.MOEDACOMISSAO.Conteudo = 'EUR' THEN
       Result :=( DOrdemCobrancaProdExp.ComisaoSFatura.Conteudo ) / DOrdemCobrancaProdExp.TAXACONVERCAO.Conteudo  ;
    IF DOrdemCobrancaProdExp.MOEDACOMISSAO.Conteudo = 'R$ ' THEN
       Result :=( DOrdemCobrancaProdExp.ComisaoSFatura.Conteudo  ) * DOrdemCobrancaProdExp.TAXACONVERCAO.Conteudo ;
    IF DOrdemCobrancaProdExp.MOEDACOMISSAO.Conteudo = 'USR' THEN
       Result :=( DOrdemCobrancaProdExp.ComisaoSFatura.Conteudo  )  ;
  END;
end;

end.
