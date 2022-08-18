{
 Classe de consulta: CNS_Infome - Infome
}

unit CSCNS_Infome;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TCSCNS_Infome = class(TTabela)
  public
    constructor Create(AOwner: TComponent); override;
    procedure Parametros(Tabela: TTabela); override;
    procedure ConfiguraMascara_CS; override;
  end;

implementation

uses Publicas, Validar, Rotinas, Abertura, Calculos, RotinaEd;

constructor TCSCNS_Infome.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'CSCNS_Infome';
  Titulo           := 'Infome';
  Name             := 'CSCNS_Infome';
  Database         := BaseDados.BD_Base_Dados;
  {$IFDEF IBX}
  Transaction      := BaseDados.TRS_BD_Base_Dados;
  {$ELSE}
  DatabaseName     := BaseDados.BD_Base_Dados.DatabaseName;
  CachedUpdates    := True;
  {$ENDIF}
  Local            := False;
  Open_begin       := False;
  Versao           := 6;
  TableType        := ttView;
  SqlPrincipal.Add('SELECT  contratotransporte.nomemix, contratotransporte.quantidadetotal, ');
  SqlPrincipal.Add('  contratotransporte.valorscctotal, contratotransporte.quanttotalexp, contratotransporte.quantadependente, ');
  SqlPrincipal.Add('  contratotransporte.valortotalexp, contratotransporte.valortotalcomissao');
  SqlPrincipal.Add('FROM  contratotransporte');
  Sql.AddStrings(SqlPrincipal);
end;

procedure TCSCNS_Infome.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

procedure TCSCNS_Infome.ConfiguraMascara_CS;
var
  I: Integer;
  Coluna: TField;
begin
  inherited ConfiguraMascara_CS;
  for I:=0 to Fields.Count-1 do
    Fields[I].Visible := False;
  Coluna := FieldByName('NOMEMIX');
  if Assigned(Coluna) then
    ConfiguraMascaraCampo(Coluna, 'Produto', '', 0, 30, True);
  Coluna := FieldByName('QUANTIDADETOTAL');
  if Assigned(Coluna) then
    ConfiguraMascaraCampo(Coluna, 'Contratado_Cant', '', 1, 0, True);
  Coluna := FieldByName('VALORSCCTOTAL');
  if Assigned(Coluna) then
    ConfiguraMascaraCampo(Coluna, 'Contratado_Valor', '', 2, 0, True);
  Coluna := FieldByName('QUANTTOTALEXP');
  if Assigned(Coluna) then
    ConfiguraMascaraCampo(Coluna, 'Ejecutado_Cant', '', 3, 0, True);
  Coluna := FieldByName('QUANTADEPENDENTE');
  if Assigned(Coluna) then
    ConfiguraMascaraCampo(Coluna, 'Pendiente_Cant', '', 4, 0, True);
  Coluna := FieldByName('VALORTOTALEXP');
  if Assigned(Coluna) then
    ConfiguraMascaraCampo(Coluna, 'Ejecutado_valor ', '', 5, 0, True);
  Coluna := FieldByName('VALORTOTALCOMISSAO');
  if Assigned(Coluna) then
    ConfiguraMascaraCampo(Coluna, 'Comisiones USD', '', 6, 0, True);
end;

end.
