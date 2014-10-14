
with Ada.Text_IO;
use Ada.Text_IO;;

package body Parseur is 
   
   procedure Lecture_En_Tete (FichierEntree : in String, 
				Nombre_Objets : out Natural, 
				Largeur_Ruban : out Natural) is
      Fichier : File_Type;
   begin 
      -- Ouverture du fichier
      Open (File => Fichier,
	    Mode => In_File;,
	    Name => FichierEntree);
      
      -- Lecture du nombre d'objets
      Get (Fichier, Nombre_Objets);
      
      -- Lecture de la largeur du ruban
      Get (Largeur_Ruban);
 
   end Lecture_En_Tete;
   
   procedure Lecture (FichierEntree : String, Objets : Tableau_Objets) is
   begin
      
   end Lecture;
   
end Parseur;
