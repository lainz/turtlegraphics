{
  BGRATurtle.pas - 2021 by Lainz
}
unit bgraturtle;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BGRABitmap, BGRABitmapTypes;

type

  { TBGRABitmapTurtleHelper }

  TBGRABitmapTurtleHelper = class helper for TBGRABitmap
  public
    procedure MoveTurtle(distance: single);
    procedure RotateTurtle(angle: single);
    procedure TranslateTurtle(x: single; y: single);
    procedure ResetTurtle;
    procedure ColorTurtle(red, green, blue: byte; alpha: byte = 255);
  end;

implementation

{ TBGRABitmapTurtleHelper }

procedure TBGRABitmapTurtleHelper.MoveTurtle(distance: single);
begin
  Self.Canvas2D.beginPath;
  Self.Canvas2D.moveTo(0, 0);
  Self.Canvas2D.translate(distance, 0);
  Self.Canvas2D.lineTo(0, 0);
  Self.Canvas2D.stroke;
end;

procedure TBGRABitmapTurtleHelper.RotateTurtle(angle: single);
begin
  Self.Canvas2D.rotate(angle * pi / 180);
end;

procedure TBGRABitmapTurtleHelper.TranslateTurtle(x: single; y: single);
begin
  Self.Canvas2D.translate(x, y);
end;

procedure TBGRABitmapTurtleHelper.ResetTurtle;
begin
  Self.Canvas2D.resetTransform;
end;

procedure TBGRABitmapTurtleHelper.ColorTurtle(red, green, blue: byte; alpha: byte);
begin
  Self.Canvas2D.strokeStyle(BGRA(red, green, blue, alpha));
end;

end.


