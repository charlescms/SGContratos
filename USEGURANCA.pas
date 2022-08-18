unit USEGURANCA;
{
  Seguranca := TSeguranca.create ;
  op_ok := Seguranca.dll_ok ;
  if op_ok <> 0 then begin
     msg:= PAnsiChar( Seguranca.MSG_Erro())  ;
     FatalAppExit(0,msg );
     Application.Terminate;
  end;

  if Seguranca.get_sEmpresa <> cont_empresa_surimpes then begin
     msg:= PAnsiChar( const_MSG_ERRO_EMPRESA )  ;
     FatalAppExit(0,msg );
     Application.Terminate;
  end;
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit,Rotinas;
CONST
   NOME_DLL =   'CMS_FUNC.DLL';

   const_ok = 0 ;
   const_grava_dados_dll = 1 ;   txt_grava_dados_dll = 'Access violation at address 7C910FCP in module  => Erro de gravacao de DLL ' ;            // ' + Chr(39) +  '
   const_ler_dados_dll   = 2 ;   txt_ler_dados_dll   = 'Access violation at address 7C911FCP in module  => Erro de carga de DLL '  ;              // ' + Chr(39) +  '
   const_sSerialHDDll    = 3 ;   txt_sSerialHDDll    = 'Access violation at address 7C912FCP in module  => Número de serie do HD não bate ' ;     // ' + Chr(39) +  '
   const_tData_Final     = 4 ;   txt_tData_Final     = 'Access violation at address 7C913FCP in module  => Data final da DLL Invalida '   ;       // ' + Chr(39) +  '
   const_MSG_ERRO_EMPRESA= 'Este Sistema é valido para empresa :' ;
/// empresas que atuo
   cont_empresa_aliance    = 'ALLIANCE';       // EMPRESA 1
   cont_empresa_Miller     = 'MILLER';
   cont_empresa_sensitive  = 'SENSITIVE';
   cont_empresa_surimpes   = 'SURIMPEX';
   cont_empresa_SWANY_BR   = 'SWANY';
   cont_empresa_SWANY_BRAS = 'SWANY BRAS';
//   cont_empresa_SWANY_BRAS = 'SWANY BRAS';
type

  TSeguranca = class
  private
    { Private declarations }
    tData_inicial ,tData_Final : TDateTime ;
   // iDias : integer ;
    sSerialHD,  sSerialHDDll, sEmpresa : string   ;
    sMSG_Erro : string ;
//    IDias, Data, Data2, Texto, Texto2, Linha1, Linha2 , Linha3, Linha4: string;
//    i: integer;
    f: TextFile;
    function grava_dados_dll: integer;
    function ler_dados_dll: integer  ;
    procedure get_serial_HD();
  public
    constructor create;
    function cria_dll():integer ;
    function ler_dll():integer ;
    function dll_ok():integer ;
    function get_tData_inicial():TDateTime ;
    function get_tData_Final() : TDateTime ;
   // function get_iDias (): integer ;
    function get_sSerialHD (): string ;
    function get_sSerialHDDLL (): string ;
    function get_sEmpresa () : string  ;
    function MSG_Erro() : string ;


//     sMSG_Erro : string ;: string ;
    procedure set_tData_inicial ( ltData_inicial : TDateTime );
    procedure set_tData_Final ( ltData_Final: TDateTime );
  //  procedure set_iDias( liDias : integer );
    procedure set_sSerialHD( lsSerialHD : string );
    procedure set_sSerialHDDLL( lsSerialHDDLL : string );
    procedure set_sEmpresa( lsEmpresa : string );
    function Diretorio_trabalho() : string ;

  end;




implementation

constructor TSeguranca.create;
begin
  tData_inicial := date ;
  tData_Final   := date ;
//  iDias         := 0 ;
  sSerialHD     := '' ;
  sSerialHDDll  := '' ;
  sEmpresa      := '' ;

  get_serial_HD();

end;

function TSeguranca.ler_dll():integer ;
var
  ret : integer ;
begin

  ret := const_ok ;

  if ler_dados_dll <> const_ok   then begin
     ret := const_ler_dados_dll ;
     raise Exception.Create(txt_ler_dados_dll);
  end;

  ler_dll :=ret ;
end ;


function TSeguranca.cria_dll():integer ;
begin
  cria_dll :=  grava_dados_dll
end;

function TSeguranca.dll_ok():integer ;
var
  ret : integer ;
begin
  ret := const_ok ;
  if ler_dados_dll = const_ok   then begin
     if sSerialHD <> sSerialHDDll then   begin
         ret := const_sSerialHDDll ;
//         halt ( ret );
//         raise Exception.Create(txt_sSerialHDDll);
         sMSG_Erro := txt_sSerialHDDll;
     end;

     if tData_Final < date then  begin
        ret := const_tData_Final;
//        halt ( ret );
//        raise Exception.Create(txt_tData_Final);
        sMSG_Erro := txt_tData_Final;
     end;
  end
  else begin
//     ret := const_ler_dados_dll ;
//     SetForegroundWindow(H);
//     Halt(0);
//    halt ( ret );
//     raise Exception.Create(txt_ler_dados_dll);
     sMSG_Erro := txt_ler_dados_dll ;
     ret := const_ler_dados_dll ;

  end;

  dll_ok :=ret ;
end ;

function TSeguranca.get_tData_inicial():TDateTime ;
begin
  get_tData_inicial := tData_inicial ;
end ;

function TSeguranca.get_tData_Final() : TDateTime ;
begin
  get_tData_Final := tData_Final   ;
end ;
{
function TSeguranca.get_iDias (): integer ;
begin
  get_iDias := get_iDias
end ;
}
function TSeguranca.get_sSerialHD (): string ;
begin
  get_sSerialHD := sSerialHD ;
end ;

function TSeguranca.get_sSerialHDDLL (): string ;
begin
  get_sSerialHDDLL := sSerialHDDLL ;
end ;

function TSeguranca.get_sEmpresa () : string  ;
begin
  get_sEmpresa := sEmpresa ;
end ;


procedure TSeguranca.set_tData_inicial ( ltData_inicial : TDateTime );
begin
  tData_inicial := ltData_inicial ;
end;
procedure TSeguranca.set_tData_Final ( ltData_Final: TDateTime );
begin
  tData_Final := ltData_Final ;
end;
{
procedure TSeguranca.set_iDias( liDias : integer );
begin
  iDias := liDias ;
end;
}
procedure TSeguranca.set_sSerialHD( lsSerialHD : string );
begin
  sSerialHD := lsSerialHD ;
end;

procedure TSeguranca.set_sSerialHDDLL( lsSerialHDDLL : string );
begin
  sSerialHDDLL := lsSerialHDDLL ;
end;

procedure TSeguranca.set_sEmpresa( lsEmpresa : string );
begin
  sEmpresa := lsEmpresa   ;
end;


function TSeguranca.ler_dados_dll() : integer;
var
Linha1, Linha2 , Linha3, Linha4: string;
ret : integer ;
begin
 ret  := const_ler_dados_dll ;
 if FileExists(NOME_DLL) Then
    begin
      assignfile(f, NOME_DLL);
      Reset(f);
      Readln(f, Linha2); {A data do ultimo acesso}
      Readln(f, Linha1); {A data de válidade do sistema}
      Readln(f, Linha3); // nome empresa
      Readln(f, Linha4); // serial hd

      Linha1 := Decript(Linha1);
      Linha2 := Decript(Linha2);
      Linha3 := Decript(Linha3);
      Linha4 := Decript(Linha4);

      tData_inicial :=  strtodate( Linha1 );
      tData_Final :=  strtodate( Linha2 ) ;
      sEmpresa  :=  Linha3 ;
      sSerialHDDll :=  Linha4 ;
      CloseFile(f);
      ret  := const_ok ;
    end
 else begin
    sMSG_Erro := ' Arquivo nao Existe ';
//    raise Exception.Create(sMSG_Erro);
 end;

ler_dados_dll := ret ;
end;

function TSeguranca.MSG_Erro() : string ;
begin
 MSG_Erro := sMSG_Erro ;
end;

function TSeguranca.grava_dados_dll () : integer;
var
sDateF, sDateI : string ;
ret : integer ;
begin
try
  assignfile(f, NOME_DLL);

  rewrite(f);
  sDateF := DateToStr(tData_Final) ;
  sDatei := DateToStr(tData_inicial) ;

  writeln(f, Encript(sDateF));
  writeln(f, Encript(sDatei));
  writeln(f, Encript(sEmpresa));
  writeln(f, Encript(sSerialHDDll));

  CloseFile(f);
  ret :=   const_ok ;
except
  ret :=   const_grava_dados_dll ;
end ;

grava_dados_dll := ret ;
end;

procedure TSeguranca.get_serial_HD();
Var
//  ArqIni: TIniFile;
  S_Diretorio, S_Drive : STRING ;
begin

 S_Diretorio :=  Diretorio_trabalho ;
 S_Drive := COPY(S_Diretorio, 1,1 ) ;
// ArqIni := TInifile.Create(DiretorioComBarra(ExtractFilePath(Application.ExeName))+
//            ChangeFileExt(ExtractFileName(Application.ExeName), '.ini'));
 sSerialHD :=   SerialHD(S_Drive);


// APPLICATION.ExeName ;
end;

function TSeguranca.Diretorio_trabalho() : string ;
begin
 Diretorio_trabalho  :=  ExtractFilePath(Application.ExeName) ;
end;
end.
