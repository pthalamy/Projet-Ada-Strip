
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
      Open (File => Fichier,
            Mode => In_File,
            Name => Nom_Fichier);

      Get (Fichier, Nombre_Objets);
      Get (Fichier, Largeur_Ruban);

      Close (Fichier);

   exception
      when Name_Error | Data_Error | Layout_Error | Constraint_Error =>
         raise Erreur_Lecture_Benchmark;
   end Lecture_En_Tete;

   procedure Lecture (Nom_Fichier : in String; Objets : out Tableau_Objets) is
      Fichier : File_Type;
      Indice_Objet, Largeur_Objet, Hauteur_Objet : Natural;
      Indice_Courant : Natural := Objets'First;
   begin
      Open (File => Fichier,
            Mode => In_File,
            Name => Nom_Fichier);

      Skip_Line(File => Fichier, Spacing => 2);

      -- Pour tous les objets du fichier, en extraire les informations et les stocker
      -- dans le tableau a l'index donne par leur id + 1.
      -- Format : Index Largeur Hauteur
      while not End_Of_File (Fichier) loop
         Get (Fichier, Indice_Objet);
         Get (Fichier, Largeur_Objet);
         Get (Fichier, Hauteur_Objet);
	 
	 Set_Indice (Objets(Indice_Courant), Indice_Objet);
         Set_Largeur (Objets(Indice_Courant), Largeur_Objet);
         Set_Hauteur (Objets(Indice_Courant), Hauteur_Objet);
	 
	 Indice_Courant := Indice_Courant + 1;
      End loop;

      Close (Fichier);

   exception
      when Name_Error | Data_Error | Layout_Error | Constraint_Error =>
         raise Erreur_Lecture_Benchmark;
   end Lecture;

end Parseur;
