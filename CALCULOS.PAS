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

function CalculaDContratoTransporte_QuantadePendente(AOwner: TComponent) : Double;

function CalculaDContratoTransporte_QuantadePendente_Rel(AOwner: TComponent) : Double;

function CalculaDContratoTransporte_ValorTotalPendente(AOwner: TComponent) : Double;

function CalculaDContratoTransporte_ValorTotalPendente_Rel(AOwner: TComponent) : Double;

function CalculaDExpotadoTransito_ComisaoSFatura(AOwner: TComponent) : Double;

function CalculaDExpotadoTransito_ComisaoSFatura_Rel(AOwner: TComponent) : Double;

function CalculaDExpotadoTransito_ValorConvertido(AOwner: TComponent) : Double;

function CalculaDExpotadoTransito_ValorConvertido_Rel(AOwner: TComponent) : Double;

function CalculaDPrudutoContratoT_ValorSCC(AOwner: TComponent) : Double;

function CalculaDPrudutoContratoT_ValorSCC_Rel(AOwner: TComponent) : Double;

function CalculaDFatura_ComisaoSFatura(AOwner: TComponent) : Double;

function CalculaDFatura_ComisaoSFatura_Rel(AOwner: TComponent) : Double;

function CalculaDFatura_ValorConvertido(AOwner: TComponent) : Double;

function CalculaDFatura_ValorConvertido_Rel(AOwner: TComponent) : Double;

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

function CalculaDContratoTransporte_QuantadePendente(AOwner: TComponent) : Double;
  // variáveis locais
begin
  // a variável "Result" deverá conter o resultado da expressão
  Result := TabGlobal.DContratoTransporte.QuantidadeTotal.Conteudo - TabGlobal.DContratoTransporte.QUANTTOTALEXP.Conteudo ;
end;

function CalculaDContratoTransporte_QuantadePendente_Rel(AOwner: TComponent) : Double;
var
  DContratoTransporte: TDContratoTransporte;
  // variáveis locais
begin
  DContratoTransporte := TDContratoTransporte(LocalizaTabela(AOwner, 'DContratoTransporte'));
  // a variável "Result" deverá conter o resultado da expressão
  Result := DContratoTransporte.QuantidadeTotal.Conteudo - DContratoTransporte.QUANTTOTALEXP.Conteudo ;
end;

function CalculaDContratoTransporte_ValorTotalPendente(AOwner: TComponent) : Double;
  // variáveis locais
begin
  // a variável "Result" deverá conter o resultado da expressão
  Result := TabGlobal.DContratoTransporte.ValorSCCTotal.Conteudo - TabGlobal.DContratoTransporte.ValorTotalExp.Conteudo ;
end;

function CalculaDContratoTransporte_ValorTotalPendente_Rel(AOwner: TComponent) : Double;
var
  DContratoTransporte: TDContratoTransporte;
  // variáveis locais
begin
  DContratoTransporte := TDContratoTransporte(LocalizaTabela(AOwner, 'DContratoTransporte'));
  // a variável "Result" deverá conter o resultado da expressão
  Result := DContratoTransporte.ValorSCCTotal.Conteudo - DContratoTransporte.ValorTotalExp.Conteudo ;
end;

function CalculaDExpotadoTransito_ComisaoSFatura(AOwner: TComponent) : Double;
  // variáveis locais
begin
  // a variável "Result" deverá conter o resultado da expressão
  // teste charles
  IF TabGlobal.DExpotadoTransito.FormComissao.Conteudo = 'TM' THEN
     Result := ( TabGlobal.DExpotadoTransito.QuantidadeExp.Conteudo * TabGlobal.DExpotadoTransito.Comissao.Conteudo )
  ELSE
     Result := ( TabGlobal.DExpotadoTransito.QuantidadeExp.Conteudo * TabGlobal.DExpotadoTransito.PrecoFOB.Conteudo *  TabGlobal.DExpotadoTransito.Comissao.Conteudo )  /100 ;
end;

function CalculaDExpotadoTransito_ComisaoSFatura_Rel(AOwner: TComponent) : Double;
var
  DExpotadoTransito: TDExpotadoTransito;
  // variáveis locais
begin
  DExpotadoTransito := TDExpotadoTransito(LocalizaTabela(AOwner, 'DExpotadoTransito'));
  // a variável "Result" deverá conter o resultado da expressão
  // teste charles
  IF DExpotadoTransito.FormComissao.Conteudo = 'TM' THEN
     Result := ( DExpotadoTransito.QuantidadeExp.Conteudo * DExpotadoTransito.Comissao.Conteudo )
  ELSE
     Result := ( DExpotadoTransito.QuantidadeExp.Conteudo * DExpotadoTransito.PrecoFOB.Conteudo *  DExpotadoTransito.Comissao.Conteudo )  /100 ;
end;

function CalculaDExpotadoTransito_ValorConvertido(AOwner: TComponent) : Double;
  // variáveis locais
begin
  // a variável "Result" deverá conter o resultado da expressão
  IF TabGlobal.DExpotadoTransito.Rate.Conteudo > 0 THEN BEGIN
    IF TabGlobal.DExpotadoTransito.MOEDACOMISSAO.Conteudo = 'EUR' THEN
       Result :=( TabGlobal.DExpotadoTransito.ComisaoSFatura.Conteudo ) / TabGlobal.DExpotadoTransito.Rate.Conteudo  ;
    IF TabGlobal.DExpotadoTransito.MOEDACOMISSAO.Conteudo = 'R$ ' THEN
       Result :=( TabGlobal.DExpotadoTransito.ComisaoSFatura.Conteudo  ) * TabGlobal.DExpotadoTransito.Rate.Conteudo ;
    IF TabGlobal.DExpotadoTransito.MOEDACOMISSAO.Conteudo = 'USR' THEN
       Result :=( TabGlobal.DExpotadoTransito.ComisaoSFatura.Conteudo  )  ;
  END;
end;

function CalculaDExpotadoTransito_ValorConvertido_Rel(AOwner: TComponent) : Double;
var
  DExpotadoTransito: TDExpotadoTransito;
  // variáveis locais
begin
  DExpotadoTransito := TDExpotadoTransito(LocalizaTabela(AOwner, 'DExpotadoTransito'));
  // a variável "Result" deverá conter o resultado da expressão
  IF DExpotadoTransito.Rate.Conteudo > 0 THEN BEGIN
    IF DExpotadoTransito.MOEDACOMISSAO.Conteudo = 'EUR' THEN
       Result :=( DExpotadoTransito.ComisaoSFatura.Conteudo ) / DExpotadoTransito.Rate.Conteudo  ;
    IF DExpotadoTransito.MOEDACOMISSAO.Conteudo = 'R$ ' THEN
       Result :=( DExpotadoTransito.ComisaoSFatura.Conteudo  ) * DExpotadoTransito.Rate.Conteudo ;
    IF DExpotadoTransito.MOEDACOMISSAO.Conteudo = 'USR' THEN
       Result :=( DExpotadoTransito.ComisaoSFatura.Conteudo  )  ;
  END;
end;

function CalculaDPrudutoContratoT_ValorSCC(AOwner: TComponent) : Double;
  // variáveis locais
begin
  // a variável "Result" deverá conter o resultado da expressão
  Result := TabGlobal.DPrudutoContratoT.PrecoSCC.Conteudo * TabGlobal.DPrudutoContratoT.Quantidade.Conteudo ;
end;

function CalculaDPrudutoContratoT_ValorSCC_Rel(AOwner: TComponent) : Double;
var
  DPrudutoContratoT: TDPrudutoContratoT;
  // variáveis locais
begin
  DPrudutoContratoT := TDPrudutoContratoT(LocalizaTabela(AOwner, 'DPrudutoContratoT'));
  // a variável "Result" deverá conter o resultado da expressão
  Result := DPrudutoContratoT.PrecoSCC.Conteudo * DPrudutoContratoT.Quantidade.Conteudo ;
end;

function CalculaDFatura_ComisaoSFatura(AOwner: TComponent) : Double;
  // variáveis locais
begin
  // a variável "Result" deverá conter o resultado da expressão
  IF TabGlobal.DFatura.FormComissao.Conteudo = 'TM' THEN
     Result := ( TabGlobal.DFatura.QuantidadeExp.Conteudo * TabGlobal.DFatura.Comissao.Conteudo )
  ELSE
     Result := ( TabGlobal.DFatura.QuantidadeExp.Conteudo * TabGlobal.DFatura.PrecoFOB.Conteudo *  TabGlobal.DFatura.Comissao.Conteudo )  /100 ;
end;

function CalculaDFatura_ComisaoSFatura_Rel(AOwner: TComponent) : Double;
var
  DFatura: TDFatura;
  // variáveis locais
begin
  DFatura := TDFatura(LocalizaTabela(AOwner, 'DFatura'));
  // a variável "Result" deverá conter o resultado da expressão
  IF DFatura.FormComissao.Conteudo = 'TM' THEN
     Result := ( DFatura.QuantidadeExp.Conteudo * DFatura.Comissao.Conteudo )
  ELSE
     Result := ( DFatura.QuantidadeExp.Conteudo * DFatura.PrecoFOB.Conteudo *  DFatura.Comissao.Conteudo )  /100 ;
end;

function CalculaDFatura_ValorConvertido(AOwner: TComponent) : Double;
  // variáveis locais
begin
  // a variável "Result" deverá conter o resultado da expressão
  if TabGlobal.DFatura.Rate.Conteudo > 0 then begin
    IF TabGlobal.DFatura.MOEDACOMISSAO.Conteudo = 'EUR' THEN
       Result :=( TabGlobal.DFatura.Valor.Conteudo + TabGlobal.DFatura.ValorDesconto.Conteudo ) / TabGlobal.DFatura.Rate.Conteudo  ;
    IF TabGlobal.DFatura.MOEDACOMISSAO.Conteudo = 'R$ ' THEN
       Result :=( TabGlobal.DFatura.Valor.Conteudo + TabGlobal.DFatura.ValorDesconto.Conteudo ) * TabGlobal.DFatura.Rate.Conteudo ;
    IF TabGlobal.DFatura.MOEDACOMISSAO.Conteudo = 'USR' THEN
       Result :=( TabGlobal.DFatura.Valor.Conteudo + TabGlobal.DFatura.ValorDesconto.Conteudo )  ;
  end;
end;

function CalculaDFatura_ValorConvertido_Rel(AOwner: TComponent) : Double;
var
  DFatura: TDFatura;
  // variáveis locais
begin
  DFatura := TDFatura(LocalizaTabela(AOwner, 'DFatura'));
  // a variável "Result" deverá conter o resultado da expressão
  if DFatura.Rate.Conteudo > 0 then begin
    IF DFatura.MOEDACOMISSAO.Conteudo = 'EUR' THEN
       Result :=( DFatura.Valor.Conteudo + DFatura.ValorDesconto.Conteudo ) / DFatura.Rate.Conteudo  ;
    IF DFatura.MOEDACOMISSAO.Conteudo = 'R$ ' THEN
       Result :=( DFatura.Valor.Conteudo + DFatura.ValorDesconto.Conteudo ) * DFatura.Rate.Conteudo ;
    IF DFatura.MOEDACOMISSAO.Conteudo = 'USR' THEN
       Result :=( DFatura.Valor.Conteudo + DFatura.ValorDesconto.Conteudo )  ;
  end;
end;

end.
