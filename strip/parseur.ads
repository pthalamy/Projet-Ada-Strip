with Objet_Packing;
use Objet_Packing;

package Parseur is
   
   Erreur_Lecture_Benchmark : exception;
   
   -- requiert : Nom_Fichier nom de fichier existant et valide.
   -- garantit : Nombre_Objets et Largeur_Ruban fixes a leur valeur
   -- correspondante dans le fichier lu.
   procedure Lecture_En_Tete (Nom_Fichier : in String;
                              Nombre_Objets : out Natural;
                              Largeur_Ruban : out Natural);


   -- requiert : Nom_Fichier nom de fichier existant et valide, Objets initialise.
   -- garantit : Objets rempli d'objets de dimensions contenues dans le fichier lu.
   procedure Lecture (Nom_Fichier : in String;
                      Objets : out Tableau_Objets);

end Parseur;
