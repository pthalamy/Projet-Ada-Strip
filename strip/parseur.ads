
package Parseur is
   
   -- requiert : FichierEntree nom de fichier existant et valide.
   -- garantit : Nombre_Objets et Largeur_Ruban fixes a leur valeur 
   -- correspondante dans le fichier lu.
   procedure Lecture_En_Tete (FichierEntree : String, 
				Nombre_Objets : Natural, 
				Largeur_Ruban : Natural);
   
   
   -- requiert : FichierEntree nom de fichier existant et valide.
   -- garantit : Objets rempli d'objets de dimensions contenues dans le fichier lu.
   procedure Lecture (FichierEntree : String,
			Objets : Tableau_Objets);
   
end Parseur;
