with Objet_Packing;
use Objet_Packing;

package Parseur is
   
   procedure  Lecture_En_Tete(Nom_Fichier: in String;
			      Nombre_Objets: in out Natural;
			      Largeur_Ruban: in out Natural );

   procedure  Lecture(Nom_Fichier: in String ;Objets: in out Tableau_Objets);

   Erreur_Lecture_Benchmark : Exception;


end Parseur;
