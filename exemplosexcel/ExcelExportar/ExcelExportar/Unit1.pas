unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComObj, OleServer, Excel2000, DB, DBTables, Grids,
  DBGrids, ActiveX, Buttons {$IFDEF VER150},ExcelXP{$ENDIF};

type
  TForm1 = class(TForm)
    Button1: TButton;
    xlsApp: TExcelApplication;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    opgDialogo: TOpenDialog;
    xlsSheet: TExcelWorksheet;
    tblPaises: TTable;
    tblPaisesName: TStringField;
    tblPaisesCapital: TStringField;
    tblPaisesContinent: TStringField;
    tblPaisesArea: TFloatField;
    tblPaisesPopulation: TFloatField;
    dbgPaises: TDBGrid;
    dtsPaises: TDataSource;
    Button5: TButton;
    Button6: TButton;
    BitBtn1: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button6Click(Sender: TObject);
    procedure dbgPaisesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AbreExcel;
    procedure Titulo;
  end;

var
  Form1: TForm1;
  LCID: Integer;
  WKBK: _Workbook;
  linha: Integer;
  novoarq: string[1];
  Caminho: string;

implementation

{$R *.dfm}

procedure TForm1.AbreExcel;
begin
  Caminho := '';
  //Testa se é um novo arquivo ou não
  if NovoArq = 'N' then
  begin
  {
    if opgDialogo.Execute then
      // Caso não seja selecionado um arquivo
      // não executa outros procedimentos
      Caminho := opgDialogo.FileName
    else
      Exit;
      }
  end;

  //Pega o usuário logado
  LCID := GetUserDefaultLCID;
  //Torna a aplicação visível
  //xlsApp.Visible[LCID] := true;
  //Remove alertas do excel
  xlsApp.DisplayAlerts[LCID] := false;

  if NovoArq = 'S' then
    // Se for um novo arquivo, este procedimento cria o arquivo
    WKBK := xlsApp.Workbooks.Add(EmptyParam, LCID)
  else
    // Se for um arquivo existente, esta linha conecta a aplicação com o arquivo.
    // OBS - Vale apena ver o nº de parametros
    // e suas funcionalidades.

    WKBK := xlsApp.Workbooks.Open('C:\Pasta1.xls', EmptyParam, True {EmptyParam}, EmptyParam, EmptyParam,
      EmptyParam, EmptyParam, EmptyParam,
      EmptyParam, False{EmptyParam}, EmptyParam,
      EmptyParam, EmptyParam, {$IFDEF VER150}EmptyParam,EmptyParam,{$ENDIF}LCID);

  // Conecta a planilha (1) que será a planilha a receber os dados
  xlsSheet.ConnectTo(WKBK.Worksheets[1] as _Worksheet);

  //Ativa a planilha conectada
  xlsSheet.Activate(LCID);

  //Torna possível fazer alterações
  xlsApp.ScreenUpdating[LCID] := True;

  //Atribui um nome a planilha
  xlsSheet.Name := 'Relatórios via Excel';

  {Para que não seja possível que o usuário tente enviar os dados sem  que exista uma aplicação
   aberta os botões que servirão para enviar os dados iniciam a aplicação desabilitados e
   somente quando é aberta uma instância do Excel esses botões se tornam habilitados }

  {if BTTodos.Enabled = False then
  begin
    BTTodos.Enabled := True;
    BTSelecionados.Enabled := True;
  end;      }
end;

procedure TForm1.Button1Click(Sender: TObject);

begin
  NovoArq := 'N';
  AbreExcel;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  NovoArq := 'S';
  AbreExcel;
  Button3.Enabled := True;
end;

procedure TForm1.Titulo;
begin
  {$IFDEF VER150}
    xlsSheet.Range['A1', 'A1'].Value2 := 'NOME';
    xlsSheet.Range['B1', 'B1'].Value2 := 'CAPITAL';
    xlsSheet.Range['C1', 'C1'].Value2 := 'CONTINENTE';
    xlsSheet.Range['D1', 'D1'].Value2 := 'AREA';
    xlsSheet.Range['E1', 'E1'].Value2 := 'POPULAÇÃO';
  {$ELSE}
    xlsSheet.Range['A1', 'A1'].Value := 'NOME';
    xlsSheet.Range['B1', 'B1'].Value := 'CAPITAL';
    xlsSheet.Range['C1', 'C1'].Value := 'CONTINENTE';
    xlsSheet.Range['D1', 'D1'].Value := 'AREA';
    xlsSheet.Range['E1', 'E1'].Value := 'POPULAÇÃO';
  {$ENDIF}
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  Linha : Integer;
begin
  Linha := 1;
  tblPaises.First;

  {$IFDEF VER150}
    xlsSheet.Range['A1', 'A1'].Value2 := 'NOME';
    xlsSheet.Range['B1', 'B1'].Value2 := 'CAPITAL';
    xlsSheet.Range['C1', 'C1'].Value2 := 'CONTINENTE';
    xlsSheet.Range['D1', 'D1'].Value2 := 'AREA';
    xlsSheet.Range['E1', 'E1'].Value2 := 'POPULAÇÃO';
  {$ELSE}
    xlsSheet.Range['A1', 'A1'].Value := 'NOME';
    xlsSheet.Range['B1', 'B1'].Value := 'CAPITAL';
    xlsSheet.Range['C1', 'C1'].Value := 'CONTINENTE';
    xlsSheet.Range['D1', 'D1'].Value := 'AREA';
    xlsSheet.Range['E1', 'E1'].Value := 'POPULAÇÃO';
  {$ENDIF}

  with tblPaises do begin
    while not EOF do
    begin
      Linha := Linha + 1;
      {$IFDEF VER150}
        xlsSheet.Range['A' + IntToStr(Linha), 'A' + IntToStr(Linha)].Value2 := FieldByName('NAME').AsString;
        xlsSheet.Range['B' + IntToStr(Linha), 'B' + IntToStr(Linha)].Value2 := FieldByName('CAPITAL').AsString;
        xlsSheet.Range['C' + IntToStr(Linha), 'C' + IntToStr(Linha)].Value2 := FieldByName('Continent').AsString;
        xlsSheet.Range['D' + IntToStr(Linha), 'D' + IntToStr(Linha)].Value2 := FieldByName('Area').AsString;
        xlsSheet.Range['E' + IntToStr(Linha), 'E' + IntToStr(Linha)].Value2 := FieldByName('Population').AsString;
      {$ELSE}
        xlsSheet.Range['A' + IntToStr(Linha), 'A' + IntToStr(Linha)].Value := FieldByName('NAME').AsString;
        xlsSheet.Range['B' + IntToStr(Linha), 'B' + IntToStr(Linha)].Value := FieldByName('CAPITAL').AsString;
        xlsSheet.Range['C' + IntToStr(Linha), 'C' + IntToStr(Linha)].Value := FieldByName('Continent').AsString;
        xlsSheet.Range['D' + IntToStr(Linha), 'D' + IntToStr(Linha)].Value := FieldByName('Area').AsString;
        xlsSheet.Range['E' + IntToStr(Linha), 'E' + IntToStr(Linha)].Value := FieldByName('Population').AsString;
      {$ENDIF}
      Next;
    end;
  end;

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if dbgPaises.SelectedRows.CurrentRowSelected = false then
    // verifica se existe um registro selecionado.
  begin
    ShowMessage('Sem registro selecionado');
    exit;
  end;
  linha := 1;
  tblPaises.First;

  { Enquanto não for o final da tabela, se existir algum
  registro selecionado, os dados deste regintro
  são enviados para a planilha (da 2º linha em diante,
  já que a primeira linha é a linha de tituli) }

  while not tblPaises.Eof do
  begin
    if dbgPaises.SelectedRows.CurrentRowSelected = true then
    begin
      linha := linha + 1;
      {$IFDEF VER150}
        xlsSheet.Range['A' + inttostr(linha), 'A' + inttostr(linha)].Value2 := tblPaisesNAME.Value;
        xlsSheet.Range['B' + inttostr(linha), 'B' + inttostr(linha)].Value2 := tblPaisesCAPITAL.Value;
        xlsSheet.Range['C' + inttostr(linha), 'C' + inttostr(linha)].Value2 := tblPaisesContinent.Value;
        xlsSheet.Range['D' + inttostr(linha), 'D' + inttostr(linha)].Value2 := tblPaisesArea.Value;
        xlsSheet.Range['E' + inttostr(linha), 'E' + inttostr(linha)].Value2 := tblPaisesPopulation.Value;
      {$ELSE}
        xlsSheet.Range['A' + inttostr(linha), 'A' + inttostr(linha)].Value := tblPaisesNAME.Value;
        xlsSheet.Range['B' + inttostr(linha), 'B' + inttostr(linha)].Value := tblPaisesCAPITAL.Value;
        xlsSheet.Range['C' + inttostr(linha), 'C' + inttostr(linha)].Value := tblPaisesContinent.Value;
        xlsSheet.Range['D' + inttostr(linha), 'D' + inttostr(linha)].Value := tblPaisesArea.Value;
        xlsSheet.Range['E' + inttostr(linha), 'E' + inttostr(linha)].Value := tblPaisesPopulation.Value;
      {$ENDIF}
      tblPaises.Next;
    end
    else
      tblPaises.Next;
  end;

  xlsApp.SaveWorkspace('C:\Nome do arquivo.XLS');
//  ExcelWorksheet1. SaveAs('Nome do arquivo');
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  // LinkToFile (True = make link to file, False = make copy of the file in document)
  // SaveWithDocument (must be True if LinkToFile is False)
  // Left
  // Top
  // Width
  // Height)
  if opgDialogo.Execute then
    xlsSheet.Shapes.AddPicture(opgDialogo.FileName, 0, 1, 001, 001, 150, 150);
  //Torna a aplicação visível
  //Torna possível fazer alterações
  xlsApp.ScreenUpdating[LCID] := True;
  xlsApp.Visible[LCID] := true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  tblPaises.Active := True;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tblPaises.Active := False;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin

  xlsApp.Workbooks.Open(
    'C:\Pasta1.xls', // Filename
    3, // UpdateLinks
    False, // ReadOnly
    EmptyParam, // Format
    '', // Password
    '', // WriteResPassword
    True, // IgnoreReadOnlyRecommended
    EmptyParam, // Origin
    EmptyParam, // Delimiter
    EmptyParam, // Editable
    EmptyParam, // Notify
    EmptyParam, // Converter
    True, // AddToMru
    0); // LCID

end;

procedure TForm1.dbgPaisesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if dbgPaises.SelectedField = tblPaisesNAME then
  begin
    if BitBtn1.Visible then
      if gdFocused in State then
         BitBtn1.SetBounds(Rect.Left,Rect.Top, Rect.Right-Rect.Left, Rect.Bottom-Rect.Top);
  end
  else if dbgPaises.SelectedField = tblPaisesCAPITAL then
  begin
    BitBtn1.Visible := dbgPaises.SelectedField = tblPaisesCAPITAL;
    if BitBtn1.Visible then
      if gdFocused in State then
         BitBtn1.SetBounds(Rect.Left,Rect.Top, Rect.Right-Rect.Left, Rect.Bottom-Rect.Top);
  end;
end;

end.



(*
//Algumas outros métodos interresantes que não foram utilizados no projeto:

ExcelWorksheet1. SaveAs('Nome do arquivo');

//Salve a planilha corrente no local e com o nome especificado.

ExcelWorksheet1.PrintOut; - Imprime a planilha corrente.
//Este metódo é utilizado para desconectar o Excel, e necesário que fique claro que
//este metódo fecha a aplicação mais não a descarrega de memória, ou seja a aplicação
//fica fechada mais ainda continua utilizando espaço em memória.
ExcelApplication.Disconnect;

//Descarrega a aplicação (Excel) da memória.
ExcelApplication1.Free;

//Daqui para frente é com vocês, tanto na melhoria deste código quanto na utlização dos outros objetos.
//Um Abraço a todos.
//tpersan@hotmail.com


*)



