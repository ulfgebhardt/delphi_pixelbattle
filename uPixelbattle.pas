unit uPixelbattle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure pixelred;
    procedure pixelblue;
    procedure pixelrandom;
  private
    { Private declarations }
  public
    { Public declarations }
    blue,red,tred,tblue:integer;
    allfarben:boolean;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin

  randomize;

  if messagedlg('Alle Farben?',mtwarning,[mbok,mbno],0)=mrok then allfarben:=true else allfarben:=false;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
var i:integer;
begin

  if allfarben then
    begin
    for I:=0 to 10000 do pixelrandom;
    end else
      begin
  for i:=0 to 10000 do
     begin

    pixelred;
    pixelblue;

    form1.caption:= 'Red= '+inttostr(red)+'/'+inttostr(tred)+'; blue= '+inttostr(blue)+'/'+inttostr(tblue);
    end;

  if red+blue >= 490000 then
    begin
    timer1.Enabled:=false;
    if blue-red>0 then showmessage('blue WINS!');
    if blue-red<0 then showmessage('Red WINS!');
    if blue-red=0 then showmessage('DRAW!');
    end;
  end;

end;

procedure TForm1.pixelrandom;
var i,j,c:integer;
    tempcolor,tempcolor2:TColor;
begin

  i:=random(form1.Width);
  j:=random(form1.Height);
  tempcolor:=canvas.Pixels[i,j];

  inc(tred);

  if tempcolor=clsilver then
    begin
    c:=random(14);
    if c=0 then tempcolor2:=clblack;
    if c=1 then tempcolor2:=clred;
    if c=2 then tempcolor2:=clgreen;
    if c=3 then tempcolor2:=clwhite;
    if c=4 then tempcolor2:=clblue;
    if c=5 then tempcolor2:=clyellow;
    if c=6 then tempcolor2:=clpurple;
    if c=7 then tempcolor2:=clmaroon;
    if c=8 then tempcolor2:=clnavy;
    if c=9 then tempcolor2:=cllime;
    if c=10 then tempcolor2:=clteal;
    if c=11 then tempcolor2:=clfuchsia;
    if c=12 then tempcolor2:=claqua;
    if c=13 then tempcolor2:=clgray;
    canvas.Pixels[i,j]:=tempcolor2;
    end;

end;

procedure TForm1.pixelred;
var i,j:integer;
    tempcolor:TColor;
begin

  i:=random(form1.Width);
  j:=random(form1.Height);
  tempcolor:=canvas.Pixels[i,j];

  inc(tred);

  if tempcolor=clsilver then
    begin
    canvas.Pixels[i,j]:=clred;
    inc(red);
    end;

end;

procedure TForm1.pixelblue;
var i,j:integer;
    tempcolor:TColor;
begin

  i:=random(form1.Width);
  j:=random(form1.Height);
  tempcolor:=canvas.Pixels[i,j];

  inc(tblue);

  if tempcolor=clsilver then
    begin
    canvas.Pixels[i,j]:=clblue;
    inc(blue);
    end;

end;

end.
