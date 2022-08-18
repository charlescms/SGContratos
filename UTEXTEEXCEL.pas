unit UTEXTEEXCEL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleServer, ExcelXP, StdCtrls, ComObj;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
 excel : variant ;
 i , j : integer ;
begin
 excel := CREATEOLEOBJECT('EXCEL.APLICATION');
 excel.VISIBLE := TRUE ;
 excel.WORKBOOKS.ADD;
 FOR I := 0 TO 3 DO
   FOR J := 0 TO 3 DO
     excel.WORKBOOKS[1].SHEETS.CELLS[J+1,I+1]:= I* J;
 excel.WORKBOOKS[1].SAVEAS('TESTE.XLS');
 excel.QUIT;
end;

end.
