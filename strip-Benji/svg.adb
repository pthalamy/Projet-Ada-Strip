with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Elementary_Functions, Objet_Packing;
use Ada.Text_IO,  Ada.Integer_Text_IO, Ada.Numerics.Elementary_Functions, Objet_Packing;


package body Svg is
   
   Display_Width, Display_Height : Natural;
   
   procedure Sauvegarde(Nom_Fichier_Svg : in String ; Objets : in out Tableau_Objets ; Largeur_Ruban : in out Natural ; Hauteur_Ruban : in out Natural) is
      
      Fichier_Svg : File_Type;
      
       procedure Svg_Rectangle(C : Point ; H : Natural ; L : Natural ; Color : Couleur) is
	begin
		Put("<rect x=""");
		Put(C.X);
		Put (""" y=""");
		Put(C.Y);
		Put(""" height=""");
		Put(H);
		Put(""" width=""");
		Put(L);
		Put(""" fill=""");
		Put(Couleur'Image(Color));
		Put(""" />");
		New_Line;
       end SVG_Rectangle;
       
       procedure Svg_Header(Width, Height : Natural) is
	begin
		Put("<svg width=""");
		Put(Width);
		Put(""" height=""");
		Put(Height);
		Put_Line(""">");
		Display_Width := Width;
		Display_Height := Height;
	end Svg_Header;

	procedure Svg_Footer is
	begin
		Put_Line("</svg>");
	end Svg_Footer;
	
	Color : Couleur;
   begin
      Color := Couleur'First;
      Open(Fichier_Svg,In_File,Nom_Fichier_Svg);
      
      Svg_Header(Largeur_Ruban , Hauteur_Ruban);
      for I in Objets'Range loop
	 Svg_Rectangle(Position(Objets(I)) ,Hauteur(Objets(I)), Largeur(Objets(I)),Color);
	 Color := Couleur'Val(I mod Couleur'Pos(Couleur'Last)+1);
	 end loop;
     
      
      Svg_Footer;
      
   end Sauvegarde;
        
   end Svg;
