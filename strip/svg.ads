with Objet_Packing;
use Objet_Packing;

package Svg is

   -- Sauvegarde la position des objets dans le fichier svg.
   procedure Sauvegarde (Nom_Fichier_Svg : in String;
                         Objets : in Tableau_Objets;
                         Largeur_Ruban : in Natural;
                         Hauteur_Ruban : in Natural);

end Svg;
