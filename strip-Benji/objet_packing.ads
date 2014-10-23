with Ada.Text_IO;
use Ada.Text_IO;

package Objet_Packing is
   
   type Objet is private;
   
   type Point is record
      X : Natural;
      Y : Natural;
   end record;
   
   type Tableau_Objets is array (Natural range <>) of Objet;
   
   procedure Get_Indice(Fichier : File_Type ; O: in out Objet);
   
   procedure Get_Hauteur(Fichier : File_Type ; O: in out Objet);
   
   procedure Get_Largeur(Fichier : File_Type ; O: in out Objet);
   
   function Indice(O : Objet) return Natural;
   
   function Hauteur(O : Objet) return Natural;
   
   function Largeur(O : Objet) return Natural;
   
   function Position(O :Objet) return Point;
   
   --  procedures/fonctions fans packing
   
   procedure Calcul_Hauteur_Ruban(T :in out Tableau_Objets  ; Hauteur_Ruban :in out Natural);
   
   procedure RangMin_Hauteur(RangMin : out Natural ; T : in out Tableau_Objets ; Debut : Natural ; Fin : Natural);
   
   procedure Affecter_Position(O : in out Objet; Position : Point);
   
   procedure Echanger_Objet(O1 : in out Objet ; O2 : in out Objet);   
   
private
   
   type Objet is record
      Indice : Natural;
      Hauteur : Natural;
      Largeur : Natural;
      Position : Point;
   end record;
   
end Objet_Packing;
