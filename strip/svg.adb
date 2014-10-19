with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

with Objet_Packing;
use Objet_Packing;

package body Svg is

   type Couleur is (Violet, Indigo, Bleu, Cyan, Vert, Jaune, Orange, 
		    Rouge, Marron, Noir, Blanc);

   Display_Width, Display_Height : Natural;
   Fichier_Svg : File_Type;

   function Code_Couleur (C : Couleur) return String is
   begin
      case C is
         when Violet  => return "rgb(255,0,255)";
         when Indigo  => return "rgb(111,0,255)";
         when Bleu  => return "rgb(0,0,255)";
	 when Cyan  => return "rgb(0,255,255)";
         when Vert  => return "rgb(0,255,0)";
         When Jaune => return "rgb(255,255,0)";
         When Orange => return "rgb(255,165,0)";
         when Rouge => return "rgb(255,0,0)";
         when Marron  => return "rgb(128,0,0)";
	    
	 when Noir => return "rgb(0,0,0)";
         when Blanc => return "rgb(255,255,255)";
      end case;
   end Code_Couleur;

   -- ! A appeler avant toute ecriture dans le fichier svg !
   -- garantit : Insere le header svg dans Fichier_Svg.
   procedure Svg_Header (Largeur, Hauteur : Natural) is
   begin
      Put (Fichier_Svg, "<svg width=""");
      Put (Fichier_Svg, Largeur);
      Put (Fichier_Svg, """ height=""");
      Put (Fichier_Svg, Hauteur);
      Put_Line (Fichier_Svg, """>");

      Display_Width := Largeur;
      Display_Height := Hauteur;
   end Svg_Header;


   -- ! A appeler pour clore le fichier svg !
   -- garantit : Insere le footer svg dans Fichier_Svg.
   procedure Svg_Footer is
   begin
      Put_Line (Fichier_Svg, "</svg>");
   end Svg_Footer;

   -- Dessine un rectangle de la forme:
   --              A/O ---- B
   --               |      |
   --               D ---- C
   -- et de couleur C.
   procedure Svg_Rectangle (O : Point;
                            Largeur, Hauteur : Natural;
                            C : Couleur)
   is
   begin
      Put (Fichier_Svg, "<rect ");
      Put (Fichier_Svg, "x=""" & Integer'Image(O.X) & """ ");
      Put (Fichier_Svg, "y=""" & Integer'Image(O.Y) & """ ");
      Put (Fichier_Svg, "width=""" & Integer'Image(Largeur) & """ ");
      Put (Fichier_Svg, "height=""" & Integer'Image(Hauteur) & """ ");
      Put (Fichier_Svg, "style=""fill:" & Code_Couleur (C) & ";"
             & "stroke-width:0;"
             & "stroke:" & Code_Couleur (Noir));
      Put_Line (Fichier_Svg, """/>");
   end Svg_Rectangle;

   procedure Sauvegarde (Nom_Fichier_Svg : String;
                         Objets : Tableau_Objets;
                         Largeur_Ruban : Natural;
                         Hauteur_Ruban : Natural) 
   is
      C : Couleur := Couleur'First;
      Index_Couleur : Natural := 0;
   begin
      -- Ouverture du fichier
      Open (File => Fichier_Svg,
            Mode => Out_File,
            Name => Nom_Fichier_Svg);

      Svg_Header (Largeur_Ruban, Hauteur_Ruban);

      for I in Objets'Range loop
	 Svg_Rectangle (Get_Position (Objets(I)),
			Get_Largeur (Objets(I)),
			Get_Hauteur (Objets(I)),
			C);
	 Index_Couleur := (Index_Couleur + 1) mod (Couleur'Pos(Couleur'Last)-1);
	 C := Couleur'Val (Index_Couleur);
      end loop;

      Svg_Footer;
   end Sauvegarde;

end Svg;
