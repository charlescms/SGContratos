unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button3: TButton;
    CheckBox1: TCheckBox;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    procedure DeleteRow(StringGrid: TStringGrid; ARow: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

type
  TStringGridHack = class(TStringGrid)
  protected
    procedure DeleteRow(ARow: Longint); reintroduce;
    procedure InsertRow(ARow: Longint);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if StringGrid1.Row = 0 then
    MessageDlg('O cabeçalho das colunas não pode ser deletado', mtWarning, [mbOk], 0)
  else
    if MessageDlg('Confirma exclusão da linha selecionada?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      DeleteRow(StringGrid1, StringGrid1.Row);
end;

procedure TForm1.DeleteRow(StringGrid: TStringGrid; ARow: integer);
var
  i, j: integer;
begin
  with StringGrid do
  begin
    for i := ARow to RowCount - 2 do
      for j := 0 to ColCount - 1 do
        Cells[j, i] := Cells[j, i + 1];
    RowCount := RowCount - 1;
  end;
end;

procedure TStringGridHack.DeleteRow(ARow: Longint);
var
  GemRow: Integer;
begin
  GemRow := Row;
  if RowCount > FixedRows + 1 then
    inherited DeleteRow(ARow)
  else
    Rows[ARow].Clear;
  if GemRow < RowCount then
    Row := GemRow;
end;

procedure TStringGridHack.InsertRow(ARow: Longint);
var
  GemRow: Integer;
begin
  GemRow := Row;
  while ARow < FixedRows do
    Inc(ARow);
  RowCount := RowCount + 1;
  MoveRow(RowCount - 1, ARow);
  Row := GemRow;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  I : Integer;
  procedure Inserir(ALinha: Integer; ANome, ASobreNome, AEmail, ASite: String);
  begin
    StringGrid1.Cells[0, ALinha] := ANome;
    StringGrid1.Cells[1, ALinha] := ASobreNome;
    StringGrid1.Cells[2, ALinha] := AEmail;
    StringGrid1.Cells[3, ALinha] := ASite;
  end;
begin
  if ((Trim(Edit1.Text) = '') or
      (Trim(Edit2.Text) = '') or
      (Trim(Edit3.Text) = '') or
      (Trim(Edit4.Text) = '')
     ) then
     MessageDlg('Um ou mais campos não foram preenchidos.', mtInformation, [mbOk], 0)
  else
  begin
    if CheckBox1.Checked then
    begin
      TStringGridHack(StringGrid1).InsertRow(1);
      Inserir(1, Edit1.Text, Edit2.Text, Edit3.Text, Edit4.Text);
    end
    else
    begin
      { Loop para saber qual a linha que está vazia }
      for I := 0 to StringGrid1.RowCount-1 do
      begin
        if StringGrid1.Cells[0, I] = '' then
        begin
          Inserir(StringGrid1.RowCount-1, Edit1.Text, Edit2.Text, Edit3.Text, Edit4.Text);
          Break;
        end
        else
        begin
          TStringGridHack(StringGrid1).InsertRow(StringGrid1.RowCount);
          Inserir(StringGrid1.RowCount-1, Edit1.Text, Edit2.Text, Edit3.Text, Edit4.Text);
          Break;
        end;
      end;
    end;
    Edit1.Text := '';
    Edit2.Text := '';
    Edit3.Text := '';
    Edit4.Text := '';
  end;

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  TStringGridHack(StringGrid1).DeleteRow(1);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  { Aumenta as colunas }
  for i := 0 to StringGrid1.ColCount -1 do
    StringGrid1.ColWidths[i] := 150;
  { Insere alguns itens para teste e atualiza o RowCount }
  for i := 0 to 3 do
    TStringGridHack(StringGrid1).InsertRow(1);
  {Criar as colunas }
  StringGrid1.Cells[0,0] := 'Nome';
  StringGrid1.Cells[1,0] := 'Sobrenome';
  StringGrid1.Cells[2,0] := 'E-mail';
  StringGrid1.Cells[3,0] := 'Site';

  { Alimenta com os registros }
  StringGrid1.Cells[0,1] := 'Adriano';
  StringGrid1.Cells[1,1] := 'Santos';
  StringGrid1.Cells[2,1] := 'asrsantos@gmail.com';
  StringGrid1.Cells[3,1] := 'delphitodelphi.blogspot.com';

  StringGrid1.Cells[0,2] := 'José';
  StringGrid1.Cells[1,2] := 'de Arimatéia';
  StringGrid1.Cells[2,2] := 'arimateia@gmail.com';
  StringGrid1.Cells[3,2] := 'arimateia.blogspot.com';

  StringGrid1.Cells[0,3] := 'João';
  StringGrid1.Cells[1,3] := 'Bosco';
  StringGrid1.Cells[2,3] := 'bosco@gmail.com';
  StringGrid1.Cells[3,3] := 'bosco.blogspot.com';

  StringGrid1.Cells[0,4] := 'Marina';
  StringGrid1.Cells[1,4] := 'Silva';
  StringGrid1.Cells[2,4] := 'silva@gmail.com';
  StringGrid1.Cells[3,4] := 'silva.blogspot.com';
end;

end.
