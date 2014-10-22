
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
      when Name_Error | Data_Error | Layout_Error | Constraint_Error =>
	 Put_Line (Standard_Error, 
		   "Erreur: Erreur de lecture de l'entete !");
	 raise Erreur_Lecture_Benchmark;
   end Lecture_En_Tete;

   procedure Lecture (Nom_Fichier : in String; Objets : out Tableau_Objets) is
      Fichier : File_Type;
      Indice_Objet, Largeur_Objet, Hauteur_Objet : Natural;
      Indice_Courant : Natural := Objets'First;
      Nombre_Objets_Invalide : exception;
   begin
      Open (File => Fichier,
            Mode => In_File,
            Name => Nom_Fichier);

      Skip_Line(File => Fichier, Spacing => 2);

      -- Pour tous les objets du fichier, en extraire les informations 
      -- et les stocker dans le tableau de facon contigue
      while not End_Of_File (Fichier) loop
         Get (Fichier, Indice_Objet);
         Get (Fichier, Largeur_Objet);
         Get (Fichier, Hauteur_Objet);
	 
	 Set_Indice (Objets(Indice_Courant), Indice_Objet);
         Set_Largeur (Objets(Indice_Courant), Largeur_Objet);
         Set_Hauteur (Objets(Indice_Courant), Hauteur_Objet);
	 
	 Set_Position (Objets(Indice_Courant), (0, 0));
	 
	 Indice_Courant := Indice_Courant + 1;
      End loop;

      Close (Fichier);
      
      if Indice_Courant /= Objets'Length then
	 raise Nombre_Objets_Invalide;
      end if;
      
      Put_Line (Objets);

   exception
      when Nombre_Objets_Invalide =>
	 Put_Line (Standard_Error, 
		   "Erreur: Nombre_Objets /= Nombre objets reels !");
	 raise Erreur_Lecture_Benchmark;
      when Name_Error | Data_Error | Layout_Error | Constraint_Error =>
	 Put_Line (Standard_Error, 
		   "Erreur: Erreur de lecture !");
	 raise Erreur_Lecture_Benchmark;
   end Lecture;

end Parseur;
