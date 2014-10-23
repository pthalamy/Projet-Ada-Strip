with Objet_Packing;
use Objet_Packing;

package Svg is
   
   -- Requiert : Nom_Fichier_Svg nom de fichier valide
   -- Garantit : Un fichier de nom Nom_Fichier_Svg en sortie
   --            contenant une image svg de taille Largeur_Ruban * Hauteur_Ruban
   --            et une représentation en couleur de chaque élément de Objets.
   procedure Sauvegarde (Nom_Fichier_Svg : in String;
                         Objets : in Tableau_Objets;
                         Largeur_Ruban : in Natural;
                         Hauteur_Ruban : in Natural);

end Svg;
