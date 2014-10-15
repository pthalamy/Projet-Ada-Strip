
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

with Objet_Packing;
use Objet_Packing;

package body Parseur is
   
   procedure Lecture_En_Tete (Nom_Fichier : in String;
                              Nombre_Objets : out Natural;
                              Largeur_Ruban : out Natural) is
      Fichier : File_Type;
   begin
      -- Ouverture du fichier
      Open (File => Fichier,
            Mode => In_File,
            Name => Nom_Fichier);

      -- Lecture du nombre d'objets
      Get (Fichier, Nombre_Objets);

      -- Lecture de la largeur du ruban
      Get (Fichier, Largeur_Ruban);

      -- Fermeture du fichier
      Close (Fichier);
      
   exception 
      when Name_Error | Data_Error | Layout_Error =>
	 raise Erreur_Lecture_Benchmark;   
   end Lecture_En_Tete;

   procedure Lecture (Nom_Fichier : in String; Objets : out Tableau_Objets) is
      Fichier : File_Type;
      Index_Objet, Largeur_Objet, Hauteur_Objet : Natural;
   begin
      -- Ouverture du fichier
      Open (File => Fichier,
            Mode => In_File,
            Name => Nom_Fichier);

      -- Saut des deux premieres lignes d'entete
      Skip_Line(File => Fichier, Spacing => 2);

      -- Pour tous les objets du fichier, en extraire les informations et les stocker
      -- dans le tableau a l'index donne par leur id + 1.
      -- Format : Index Largeur Hauteur
      while not End_Of_File (Fichier) loop
         Get (Fichier, Index_Objet);
         Get (Fichier, Largeur_Objet);
         Get (Fichier, Hauteur_Objet);

         Set_Largeur (Objets(Index_Objet + 1), Largeur_Objet);
         Set_Hauteur (Objets(Index_Objet + 1), Hauteur_Objet);
      End loop;
      
      -- Affichage du contenu du tableau
      --  Put (Objets, Index_Objet + 1);

      -- Fermeture du fichier
      Close (Fichier);
      
   exception 
      when Name_Error | Data_Error | Layout_Error =>
	 raise Erreur_Lecture_Benchmark;
   end Lecture;

end Parseur;
