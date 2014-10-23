with Objet_Packing;
use Objet_Packing;

package Parseur is
   
   Erreur_Lecture_Benchmark : exception;
   
   -- requiert : Nom_Fichier nom de fichier existant et bien formatté.
   --            (Largeur et nombre d'éléments non nuls)
   -- garantit : Lecture et stockage du nombre d'objets 
   --            et de la largeur du ruban dans le fichier d'entrée.
   procedure Lecture_En_Tete (Nom_Fichier : in String;
                              Nombre_Objets : out Natural;
                              Largeur_Ruban : out Natural);


   -- requiert : Nom_Fichier nom de fichier existant et bien formatté,
   --            Objets bien indexés,
   --            Objets Tableau_Objets initialisé.
   -- garantit : Objets rempli d'objets de dimension et indice
   --            lus dans le fichier.
   procedure Lecture (Nom_Fichier : in String;
                      Objets : out Tableau_Objets);

end Parseur;
