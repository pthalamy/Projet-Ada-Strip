with Objet_Packing, Ada.Text_IO;
use Objet_Packing, Ada.Text_IO;

package Svg is
   
   type Couleur is (Darkred, Green, Black, Mediumblue, Gold, Hotpink, Darkmagenta, Ghostwhite, Lightsalmon, Darkturquoise, Lightblue);
   
   procedure Sauvegarde(Nom_Fichier_Svg : in String ; Objets : in out Tableau_Objets ; Largeur_Ruban : in out Natural ; Hauteur_Ruban : in out Natural);
   
end Svg;
