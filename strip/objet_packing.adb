with Ada.Integer_Text_IO, Ada.Text_IO;
use Ada.Integer_Text_IO, Ada.Text_IO;

package body Objet_Packing is
   
   -- SETTERS
   
   procedure Set_Indice (This : in out Objet;
			Indice : in Natural)
   is
   begin
      This.Indice := Indice;
   end Set_Indice;
   
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
   
   procedure Set_Position (This : in out Objet;
                          Position : in Point)
   is
   begin
      This.Position := Position;
   end Set_Position;      
   
   -- GETTERS
   
   function Get_Indice (This : Objet) return Natural is
   begin
      return This.Indice;
   end Get_Indice;
   
   function Get_Largeur (This : Objet) return Natural is
   begin
      return This.Largeur;
   end Get_Largeur;

   function Get_Hauteur (This : Objet) return Natural is
   begin
      return This.Hauteur;
   end Get_Hauteur;
   
   function Get_Position (This : Objet) return Point is
   begin
      return This.Position;
   end Get_Position;
   
   -- PUT (Pour debug notamment)
   
   procedure Put (P : in Point) is
   begin
      Put (P.X);
      Put (P.Y);
   end Put;
   
   procedure Put_Line (Obj : in Objet) is
   begin
      Put (Get_Indice (Obj));
      Put (Get_Largeur (Obj));
      Put (Get_Hauteur (Obj));
      Put (Get_Position (Obj));
      New_Line;
   end Put_Line;

   procedure Put_Line (Tab : in Tableau_Objets)
   is
   begin
      for I in Tab'Range loop
         Put_Line (Tab(I));
      end loop;
   end Put_Line;
   
end Objet_Packing;
