with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

package body Objet_Packing is
   
   procedure Get_Indice(Fichier : File_Type ; O : in out Objet) is
   begin
      Get (Fichier, O.Indice);
   end Get_Indice;
   
   procedure Get_Hauteur(Fichier : File_Type ; O : in out Objet) is
   begin
      Get (Fichier, O.Hauteur);
   end Get_Hauteur;
   
   procedure Get_Largeur(Fichier : File_Type ; O : in out Objet) is
   begin
      Get (Fichier, O.Largeur);
   end Get_Largeur;
   
   
   
   procedure Calcul_Hauteur_Ruban(T :in out Tableau_Objets  ; Hauteur_Ruban : in out Natural) is
   begin
      Hauteur_Ruban := 0;
      for I in T'Range loop
	 Hauteur_Ruban:=Hauteur_Ruban + T(I).Hauteur;
      end loop;
   end Calcul_Hauteur_Ruban;
   
   procedure Echanger_Objet(O1 : in out Objet ; O2 : in out Objet) is
      c : Objet ; 
   begin 
      c :=O1  ; 
      O1 := O2 ; 
      O2 := c ; 
   end Echanger_Objet ;
   
   procedure RangMin_Hauteur(RangMin : out Natural ; T : in out Tableau_Objets ; Debut : Natural ; Fin : Natural) is 
      Min : Natural;
   begin
      RangMin := Debut;
      Min := T(Debut).Hauteur;
      for I in Debut..Fin loop
   	 if T(I).Hauteur<Min then	    
   	    T(I).Hauteur := Min;
   	    RangMin := I;
   	 end if;
      end loop;
   end RangMin_Hauteur;
   
   
   procedure Affecter_Position(O : in out Objet ; Position : Point) is
   begin
      O.Position:=Position;
   end Affecter_Position;
   
   
   
   function Indice(O : Objet) return Natural  is
   begin
      return O.Indice;
   end Indice;
   
   function Largeur(O : Objet) return Natural is
   begin
      return O.Largeur;
   end Largeur;
   
   function Hauteur(O : Objet) return Natural is
   begin
      return O.Hauteur;
   end Hauteur;
   
   function Position(O : Objet) return Point is
   begin
      return O.Position;
   end Position;
   
end Objet_Packing;
