with Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO;

package body Svg is

	Display_Width, Display_Height : Float;

	--  procedure Svg_Line(P1, P2 : Point ; C : Color) is
	--  begin
	--  	Put("<line x1=""");
	--  	Put(P1.X);
	--  	Put(""" y1=""");
	--  	Put(P1.Y);
	--  	Put(""" x2=""");
	--  	Put(P2.X);
	--  	Put(""" y2=""");
	--  	Put(P2.Y);
	--  	Put(""" style=""stroke:");
	--  	case C is
	--  		when Red => Put("rgb(255,0,0)");
	--  		when Green => Put("rgb(0,255,0)");
	--  		when Blue => Put("rgb(0,0,255)");
	--  		when Black => Put("rgb(0,0,0)");
	--  	end case;
	--  	Put_Line(";stroke-width:0.2""/>");
	--  end Svg_Line;

	--  procedure Svg_Circle(C : Point ; R : Float) is
	--  begin
	--  	Put("<circle cx=""");
	--  	Put(C.X);
	--  	Put(""" cy=""");
	--  	Put(C.Y);
	--  	Put(""" r=""");
	--  	Put(R);
	--  	Put_Line(""" stroke=""black"" stroke-width=""0.1"" fill=""none""/>");
	--  end Svg_Circle;

	procedure Svg_Header(Width, Height : Integer) is
	begin
		Put("<svg width=""");
		Put(Width);
		Put(""" height=""");
		Put(Height);
		Put_Line(""">");
		Display_Width := Float(Width);
		Display_Height := Float(Height);
	end Svg_Header;

	procedure Svg_Footer is
	begin
		Put_Line("</svg>");
	end Svg_Footer;

end Svg;