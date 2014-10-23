
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

with Objet_Packing;
use Objet_Packing;

package body Parseur is
   
   procedure Lecture_En_Tete (Nom_Fichier : in String;
                              Nombre_Objets : out Natural;
                              Largeur_Ruban : out Natural) is
      Fichier : File_Type;
      Nombre_Elements_Nul : exception;
      Largeur_Nulle : exception;
   begin
      Open (File => Fichier,
            Mode => In_File,
            Name => Nom_Fichier);

      Get (Fichier, Nombre_Objets);
      Get (Fichier, Largeur_Ruban);
      
      Close (Fichier);
      
      if Nombre_Objets = 0 then 
	 raise Nombre_Elements_Nul; 
      elsif Largeur_Ruban = 0 then
	 raise Largeur_Nulle;
      end if;
      
   exception
      when Nombre_Elements_Nul =>
	 Put_Line (Standard_Error, 
		   "Erreur: Il n'y a aucun objet declare !");
	 raise Erreur_Lecture_Benchmark;
      when Largeur_Nulle =>
	 Put_Line (Standard_Error, 
		   "Erreur: Le fichier d'entree donne une largeur nulle !");
	 raise Erreur_Lecture_Benchmark;
      when Name_Error | Data_Error | Layout_Error | End_Error 
	| Constraint_Error =>
	 Put_Line (Standard_Error, 
		   "Erreur: Erreur de lecture de l'entete !");
	 raise Erreur_Lecture_Benchmark;
   end Lecture_En_Tete;

   procedure Lecture (Nom_Fichier : in String; Objets : out Tableau_Objets) is
      Fichier : File_Type;
      Indice_Objet, Largeur_Objet, Hauteur_Objet : Natural;
   begin
      Open (File => Fichier,
            Mode => In_File,
            Name => Nom_Fichier);

      Skip_Line(File => Fichier, Spacing => 2);

      -- Pour tous les objets du fichier, en extraire les informations 
      -- et les stocker dans le tableau de facon contigue
      for I in Objets'Range loop
         Get (Fichier, Indice_Objet);
         Get (Fichier, Largeur_Objet);
         Get (Fichier, Hauteur_Objet);
	 
	 Set_Indice (Objets(I), Indice_Objet);
         Set_Largeur (Objets(I), Largeur_Objet);
         Set_Hauteur (Objets(I), Hauteur_Objet);
	 
	 Set_Position (Objets(I), (0, 0));	
      End loop;

      Close (Fichier);
   exception
      when End_Error | Name_Error | Data_Error | Layout_Error
	| Constraint_Error =>
	 Put_Line (Standard_Error, 
		   "Erreur: Erreur de lecture !");
	 raise Erreur_Lecture_Benchmark;
   end Lecture;

end Parseur;
