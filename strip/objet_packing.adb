with Ada.Integer_Text_IO, Ada.Text_IO;
use Ada.Integer_Text_IO, Ada.Text_IO;

package body Objet_Packing is

   procedure Set_Largeur (This : in out Objet;
                          Largeur : in Natural)
   is
   begin
      This.Largeur := Largeur;
   end Set_Largeur;

   procedure Set_Hauteur (This : in out Objet;
                          Hauteur : in Natural)
   is
   begin
      This.Hauteur := Hauteur;
   end Set_Hauteur;


   function Get_Largeur (This : Objet) return Natural is
   begin
      return This.Largeur;
   end Get_Largeur;


   function Get_Hauteur (This : Objet) return Natural is
   begin
      return This.Hauteur;
   end Get_Hauteur;
   
   procedure Put (P : in Point) is
   begin
      Put (P.X);
      Put (P.Y);
   end Put;
   
   procedure Put (Obj : in Objet) is
   begin
      Put (Get_Largeur (Obj));
      Put (Get_Hauteur (Obj));
      New_Line;
   end Put;

   procedure Put (Tab : in Tableau_Objets;
                  Taille : in Natural)
   is
   begin
      for I in 1..Taille loop
         Put (I);
         Put (Tab(I));
      end loop;
   end Put;
   
end Objet_Packing;
