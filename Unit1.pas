unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, Buttons, StdCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    PaintBox1: TPaintBox;
    BitBtn1: TBitBtn;
    TrackBar1: TTrackBar;
    Label1: TLabel;
    Label2: TLabel;
    TrackBar2: TTrackBar;
    Button1: TButton;
    pnl1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure pnl1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnl1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);


  private
    { Private declarations }
    procedure Draw;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

type TMolecula=record x,y,vx,vy,v,a:real end;

const r=5; //радиус молекулы
var BMP:TBitMap;//BitMap дл€ рисовани€
    M:array[1..1000] of TMolecula;//массив молекул
    V:real;//скорость
    x1,x2,y1,y2:integer;//ограничители координат молекул
    Count:integer=50;//количество молекул
    x0,y0:integer;


procedure TForm1.FormCreate(Sender: TObject);
  var i:integer;
      a:real;

begin
  BMP:=TBitMap.Create;
  BMP.Width:=PaintBox1.Width;
  BMP.Height:=PaintBox1.Height;
  v:=3;//скорость
  x1:=r;//минимальна€ координата x
  x2:=PaintBox1.Width-r;//максимальна€ координата x
  y1:=Pnl1.Height+r;//минимальна€ координата y}
  y2:=PaintBox1.Height-r;//максимальна€ координата y
  for i:=1 to Count do
  begin  //расчет положени€ молекул
    M[i].x:=x1+(x2-x1)*0.5;
    M[i].y:=y2;
    a:=random; //расчет направлени€ движени€ молекул
    M[i].vx:=cos(a)*v;
    M[i].vy:=sin(a)*v;
  end;
  Draw;
    end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
BMP.Free;
end;
  procedure TForm1.PaintBox1Paint(Sender: TObject);
begin
Draw;
end;
   procedure TForm1.Draw;
  var i,x,y:integer;
begin
  BMP.Canvas.Brush.Color:=clSkyBlue; // цвет PaintBox
  BMP.Canvas.Rectangle(0,0,BMP.Width,BMP.Height);
  BMP.Canvas.Brush.Color:=clMaroon; // цвет молекулы
  for i:=1 to Count do
  begin
    x:=round(M[i].x);
    y:=round(M[i].y);
    BMP.Canvas.Ellipse(x-r,y-r,x+r,y+r);
  end;
  PaintBox1.Canvas.Draw(0,0,BMP);
end;
  

var t:Boolean;  // установка позиций кнопки ѕуск\—топ
procedure TForm1.Button1Click(Sender: TObject);

begin
if t then
  begin
     Timer1.Enabled:=True;
     Button1.Caption:='—топ';
     t:= not t;
  end
else
  begin
     Timer1.Enabled:=false;
     Button1.Caption:='ѕуск';
     t:= not t;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
        var i:integer;

begin
    v:=TrackBar1.Position;
    Count:=TrackBar2.Position;
 for i:=1 to Count do
   begin
   M[i].x:=M[i].x+v*M[i].vx;
   M[i].y:=M[i].y+v*M[i].vy;
   //отражение от стенок сосуда
    //левой
    if M[i].x<x1 then
    begin
      M[i].x:=2*x1 - M[i].x;  M[i].vx:=-M[i].vx;
    end;
    //правой
    if M[i].x>x2 then
    begin
      M[i].x:=2*x2 - M[i].x;  M[i].vx:=-M[i].vx;
    end;
    //верхней
    if M[i].y<y1 then
    begin
      M[i].y:=2*y1 - M[i].y;  M[i].vy:=-M[i].vy;
    end;
    //нижней
    if M[i].y>=y2 then
    begin
      M[i].y:=2*y2 - M[i].y;  M[i].vy:=-M[i].vy;
    end;

 end;
  Draw;
end;
       procedure TForm1.TrackBar1Change(Sender: TObject);
var i:integer;   // движок температуры
a:real;
begin
for i:=1 to Count do
 begin
   M[i].v:=random(10)+1;
   M[i].x:=x1+(x2-x1)*random;
   M[i].y:=y1+(y2-y1)*random;
   M[i].a:=2*pi*random;
   M[i].vx:=cos(M[i].a)*M[i].v;
   M[i].vy:=sin(M[i].a)*M[i].v;
 end;
 end;

procedure TForm1.TrackBar2Change(Sender: TObject);
var i:integer;   // движок давлени€
    a:real;
begin
Count:=count+1;
for i:=1 to Count do
begin
    M[i].v:=random(10)+1;
    M[i].x:=x1+(x2-x1)*random;
    M[i].y:=y1+(y2-y1)*random;
    M[i].a:=2*pi*random;
    M[i].vx:=cos(M[i].a)*M[i].v;
    M[i].vy:=sin(M[i].a)*M[i].v;
end;
begin
Count:=count-1;
for i:=1 downto Count do
begin
    M[i].v:=random(40)+1;
    M[i].x:=x1+(x2-x1)*random;
    M[i].y:=y1+(y2-y1)*random;
    M[i].a:=2*pi*random;
    M[i].vx:=cos(M[i].a)*M[i].v;
    M[i].vy:=sin(M[i].a)*M[i].v;
 end;
 end;
 end;

procedure TForm1.pnl1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  x0:=x; y0:=y;
  Pnl1.BeginDrag(true);
end;

  procedure TForm1.pnl1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
  var t:integer;
begin
  t:=Pnl1.Top+y-y0;
  if t<80 then t:=80;
  if t>432 then t:=432;
  Pnl1.Top:=t;
  y1:=Pnl1.Top+Pnl1.Height-PaintBox1.Top;
  end;

initialization
  randomize;
end.
