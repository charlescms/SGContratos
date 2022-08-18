unit LogPrograma;
// vercao com o novo componewnte de abertura de indice
interface



Uses SysUtils, Math, Classes {, UTextos } 
    {$IFDEF COMPILER6_UP} ,StrUtils, DateUtils {$ELSE} ,{ACBrD5,} FileCtrl {$ENDIF}
    {$IFDEF FPC}
      ,dynlibs
      {$IFDEF USE_LConvEncoding} ,LConvEncoding {$ENDIF}
      {$IFDEF USE_LCLIntf} ,LCLIntf {$ENDIF}
    {$ENDIF}
    {$IFDEF MSWINDOWS}
      ,Windows, ShellAPI
    {$else}
      {$IFNDEF FPC}
        ,Libc
      {$else}
        ,unix, BaseUnix
      {$endif}
    {$endif} ;

CONST
  cARQUIVO_LOG    = '\PROGRAMA.LOG';
  cDIRETORIO_LOG  = '\log' ;
  cINICIO_ARQUIVO = 'INICIO DO ARQUIVO LOG';
  cFIM_ARQUIVO    = 'FIM DO ARQUIVO LOG';
  cMSG_ERRO_CRIACAO_DIRETORIO = 'Diretório não pode ser criado ';

Procedure WriteToTXT( const ArqTXT, AString : AnsiString;
   const AppendIfExists : Boolean = True; AddLineBreak : Boolean = True );

type
  TLogPrograma = class
  private
  sArquivoGravacao : string ;
  log_ativo : boolean ;
  public
//  destructor Destroy;
  constructor Create(sArq : string = cARQUIVO_LOG   ; plog_ativo : boolean = true );
//  constructor Create(sArq : string = cARQUIVO_LOG   ; plog_ativo : boolean = False );

  destructor Destroy;  override;

  PROCEDURE LOG(sMSG : string ) ;

  end;
  
//
// exemplo de
 var
    log_cms : TLogPrograma ; //.create('\TFormPrincipal_cms.log');

implementation

{-----------------------------------------------------------------------------
 - Grava conteudo de "AString" no arquivo "ArqTXT".
 - Se arquivo "ArqTXT" não existir, será criado.  Se "ArqTXT" já existir e
   "Append" for verdadeiro adiciona "AString" no final do arquivo
 ---------------------------------------------------------------------------- }
Procedure WriteToTXT( const ArqTXT, AString : AnsiString;
   const AppendIfExists : Boolean = True; AddLineBreak : Boolean = True );
var
  FS : TFileStream ;
  Buffer : AnsiString ;
begin
  FS := TFileStream.Create( ArqTXT, IfThen( AppendIfExists and FileExists(ArqTXT),
     fmOpenReadWrite, fmCreate) or fmShareDenyWrite );
  try
     Buffer := AString ;
     if AddLineBreak then
        Buffer := Buffer + sLineBreak ;

     FS.Seek(0, soFromEnd);  // vai para EOF
     FS.Write(Pointer(Buffer)^,Length(Buffer));
  finally
     FS.Free ;
  end;
end;



constructor TLogPrograma.Create(sArq : string = cARQUIVO_LOG ; plog_ativo : boolean = True );
begin
//  FormatDateTime('yyyymmdd',Date)
if pos('\',sArq) > 0 then
   sArquivoGravacao := cDIRETORIO_LOG + sArq
else
   sArquivoGravacao := cDIRETORIO_LOG +'\'+FormatDateTime('yyyymmdd',Date)+sArq   ;

if not DirectoryExists(cDIRETORIO_LOG) then
   if not CreateDir(cDIRETORIO_LOG) then
      raise Exception.Create(cMSG_ERRO_CRIACAO_DIRETORIO + ' = '+cDIRETORIO_LOG);


log_ativo := plog_ativo ;

WriteToTXT (sArquivoGravacao,'=============================================================', TRUE);
WriteToTXT (sArquivoGravacao,cINICIO_ARQUIVO, TRUE);
WriteToTXT (sArquivoGravacao,'=============================================================', TRUE);
end;

destructor TLogPrograma.Destroy;
begin
WriteToTXT (sArquivoGravacao,'=============================================================', TRUE);
WriteToTXT (sArquivoGravacao,cFIM_ARQUIVO, TRUE);
WriteToTXT (sArquivoGravacao,'=============================================================', TRUE);
end;


PROCEDURE TLogPrograma.LOG(sMSG : string ) ;
begin
// trica depois
 if log_ativo then
   WriteToTXT (sArquivoGravacao,DateTimeToStr(Now())+ '  ' + TRIM( sMSG ) , TRUE);

end;


end.
