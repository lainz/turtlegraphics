unit umain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  BGRAVirtualScreen, BGRABitmap, BGRABitmapTypes, BGRATurtle;

type

  { TfrmTurtle }

  TfrmTurtle = class(TForm)
    BGRAGraphicControl1: TBGRAVirtualScreen;
    Timer1: TTimer;
    procedure BGRAGraphicControl1Redraw(Sender: TObject; Bitmap: TBGRABitmap);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    centerX, centerY: integer;
    gAngle: single;
  public

  end;

var
  frmTurtle: TfrmTurtle;

implementation

{$R *.lfm}

{ TfrmTurtle }

procedure TfrmTurtle.BGRAGraphicControl1Redraw(Sender: TObject; Bitmap: TBGRABitmap);
var
  i, j: integer;
begin
  // spiraling

  Bitmap.ResetTurtle;
  Bitmap.TranslateTurtle(centerX, centerY);
  for i := 1 to 490 do
  begin
    Bitmap.MoveTurtle(i);
    Bitmap.RotateTurtle(gAngle);
  end;

  // drawing 1
  //Bitmap.ResetTurtle;
  Bitmap.ColorTurtle(255, 128, 64, 255);

  Bitmap.TranslateTurtle((Bitmap.Width div 2) - 25, (Bitmap.Height div 2) - 25);
  for i := 1 to 4 do
  begin
    Bitmap.MoveTurtle(50);
    Bitmap.RotateTurtle(gAngle);
  end;

  // drawing 2
  //Bitmap.ResetTurtle;
  Bitmap.ColorTurtle(0, 128, 192, 255);

  Bitmap.TranslateTurtle((Bitmap.Width div 2) - 100, (Bitmap.Height div 2) - 50);
  for i := 1 to 5 do
  begin
    Bitmap.MoveTurtle(200);
    Bitmap.RotateTurtle(gAngle);
  end;

  // drawing 3
  //Bitmap.ResetTurtle;
  Bitmap.ColorTurtle(255, 0, 0, 255);

  Bitmap.TranslateTurtle((Bitmap.Width div 2) - 50, (Bitmap.Height div 2) - 120);
  for i := 1 to 3 do
  begin
    Bitmap.MoveTurtle(200);
    for j := 1 to 2 do
    begin
      Bitmap.RotateTurtle(gAngle);
      Bitmap.MoveTurtle(100);
    end;
    for j := 1 to 2 do
    begin
      Bitmap.RotateTurtle(-gAngle);
      Bitmap.MoveTurtle(100);
    end;
    Bitmap.RotateTurtle(120);
  end;
end;

procedure TfrmTurtle.FormCreate(Sender: TObject);
begin
  gAngle := 0;
  centerX := Width div 2;
  centerY := Height div 2;
  Timer1.Enabled := True;
end;

procedure TfrmTurtle.Timer1Timer(Sender: TObject);
begin
  gAngle := gAngle + 0.1;
  Caption := FloatToStr(gAngle);
  BGRAGraphicControl1.DiscardBitmap;
  if (gAngle >= 360) then
    Timer1.Enabled := False;
end;

end.
