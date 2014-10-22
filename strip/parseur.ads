with Objet_Packing;
use Objet_Packing;

package Parseur is
   
   Erreur_Lecture_Benchmark : exception;
   
   -- requiert : Nom_Fichier nom de fichier existant et bien formatte.
   --            (Largeur et nombre d'elements non nuls)
   -- garantit : Lecture et stockage du nombre d'objets 
   --            et de la largeur du ruban dans le fichier d'entree.
   procedure Lecture_En_Tete (Nom_Fichier : in String;
                              Nombre_Objets : out Natural;
                              Largeur_Ruban : out Natural);


   -- requiert : Nom_Fichier nom de fichier existant et bien formatte,
   --            Objets bien indexes,
   --            Objets Tableau_Objets initialise.
   -- garantit : Objets rempli d'objets de dimension et indice
   --            lus dans le fichier.
   procedure Lecture (Nom_Fichier : in String;
                      Objets : out Tableau_Objets);

end Parseur;
