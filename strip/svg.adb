with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

with Objet_Packing;
use Objet_Packing;

package body Svg is

   type Couleur is (Violet, Indigo, Bleu, Cyan, Vert, Jaune, Orange, 
		    Rouge, Marron, Noir, Blanc);

   function Code_Couleur (C : Couleur) return String is
   begin
      case C is
	 -- Couleurs utilisées pour les objets
         when Violet  => return "rgb(255,0,255)";
         when Indigo  => return "rgb(111,0,255)";
         when Bleu  => return "rgb(0,0,255)";
	 when Cyan  => return "rgb(0,255,255)";
         when Vert  => return "rgb(0,255,0)";
         When Jaune => return "rgb(255,255,0)";
         When Orange => return "rgb(255,165,0)";
         when Rouge => return "rgb(255,0,0)";
         when Marron  => return "rgb(128,0,0)";
	 -- autres couleurs
	 when Noir => return "rgb(0,0,0)";
         when Blanc => return "rgb(255,255,255)";
      end case;
   end Code_Couleur;

   procedure Svg_Header (Fichier_Svg : in File_Type;
			 Largeur, Hauteur : in Natural) is
   begin
      Put (Fichier_Svg, "<svg width=""");
      Put (Fichier_Svg, Largeur);
      Put (Fichier_Svg, """ height=""");
      Put (Fichier_Svg, Hauteur);
      Put_Line (Fichier_Svg, """>");
   end Svg_Header;

   procedure Svg_Footer (Fichier_Svg : in File_Type) is
   begin
      Put_Line (Fichier_Svg, "</svg>");
   end Svg_Footer;

   -- Dessine un rectangle de la forme:
   --               O ----- P1
   --               |       |
   --               P3 ---- P2
   -- et de couleur C.
   procedure Svg_Rectangle (Fichier_Svg : in File_Type;
			    O : in Point;
                            Largeur, Hauteur : in Natural;
                            C : in Couleur)
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

   procedure Sauvegarde (Nom_Fichier_Svg : in String;
                         Objets : in Tableau_Objets;
                         Largeur_Ruban : in Natural;
                         Hauteur_Ruban : in Natural) 
   is
      Fichier_Svg : File_Type;
      C : Couleur := Couleur'First;
      Indice_Couleur : Natural := 0;
   begin
      Create (File => Fichier_Svg,
	      Mode => Out_File,
	      Name => Nom_Fichier_Svg);

      Svg_Header (Fichier_Svg, Largeur_Ruban, Hauteur_Ruban);

      for I in Objets'Range loop
	 Svg_Rectangle (Fichier_Svg,
			Get_Position (Objets(I)),
			Get_Largeur (Objets(I)),
			Get_Hauteur (Objets(I)),
			C);
	 
	 -- Donne une couleur a chaque rectangle parmi celle existantes
	 -- de façon cyclique. Noir et Blanc non inclus.
	 Indice_Couleur := (Indice_Couleur + 1) 
	   mod (Couleur'Pos(Couleur'Last)-1);
	 C := Couleur'Val (Indice_Couleur);
      end loop;

      Svg_Footer (Fichier_Svg);
   end Sauvegarde;

end Svg;
