with Ada.Command_line;
use Ada.Command_Line;
with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Objet_Packing;
use Objet_Packing;

package body Parseur is 
   
   Fichier: File_Type;
   
   procedure Lecture_En_Tete(Nom_Fichier: in String;
			     Nombre_Objets: in out Natural;
			     Largeur_Ruban : in out Natural) is
      
      Nombre_Elements_Nul : exception;
      Largeur_Nulle : exception;
      
   begin
      Open (File => Fichier,	    
	    Mode => In_File,
	    Name => Nom_Fichier);
      Get(Fichier, Nombre_Objets);
      Get(Fichier, Largeur_Ruban);
      Close(Fichier);
      
      
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
   
   procedure Lecture (Nom_Fichier: in String; Objets: in out Tableau_Objets) is
      
      Nombre_Objets_Invalide : exception;
      Indice_Courant : Natural := 0;
   begin
      Open (File => Fichier,	    
	    Mode => In_File,
	    Name => Nom_Fichier);
      
      Set_Line(File => Fichier,
	       To => 3);
      for I in Objets'Range loop
	 
	 Get_Indice(Fichier , Objets(I));
	 Get_Hauteur(Fichier , Objets(I));
	 Get_Largeur(Fichier , Objets(I));
	 Indice_Courant := Indice_Courant + 1;
      end loop;
      
      Close(Fichier);
      
      if Indice_Courant /= Objets'Length then
	 raise Nombre_Objets_Invalide;
      end if;
      
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
