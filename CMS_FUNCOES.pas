unit CMS_FUNCOES;

interface

uses Forms, Classes, WinProcs, Controls, Menus, ExtCtrls, Printers,
     Mask, {$IFDEF DELPHI5}{$ELSE}MaskUtils,{$ENDIF} Dialogs, Sysutils, math ,
     Graphics;

CONST
 // contantes sistemicas charles
 NOVA_LINHA = CHR(13)+CHR(10) ;
 CMS_Data_vazia = -693594;

function AtribuiAspas(S: String): String;
function RepeatChar(Ch: Char; S: string): string;
function RoundDec(valor : double ; decimais : integer ): double;

implementation



function RoundDec( Valor : double ; Decimais : integer ): double;
var
 Mult : double ;
begin
 Mult := power(10, Decimais) ;
 result := trunc(valor*Mult+0.5*sign(valor))/Mult;
end;

function AtribuiAspas(S: String): String;
begin
  AtribuiAspas := Format('''%s''', [RepeatChar('''', S)]);
end;

function RepeatChar(Ch: Char; S: string): string;
var
  i: Integer;
begin
  i := 1;
  Result := S;
  while i <= Length(Result) do begin
    if Result[i] = Ch then begin
      Insert( Ch, Result, i+1 );
      Inc(i);
    end;
    Inc(i);
  end;
end;


end.
