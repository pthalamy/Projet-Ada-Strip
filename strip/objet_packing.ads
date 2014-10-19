
package Objet_Packing is
   
   type Point is record
      X : Natural;
      Y : Natural;
   end record;

   type Objet is private;
   type Tableau_Objets is array (Integer range <>) of Objet;
   
   procedure Set_Index (This : in out Objet;
			Index : in Natural);
   
   procedure Set_Largeur (This : in out Objet;
                          Largeur : in Natural);

   procedure Set_Hauteur (This : in out Objet;
                          Hauteur : in Natural);
   
   procedure Set_Position (This : in out Objet;
			  Position : in Point);
   
   function Get_Index (This : Objet) return Natural;
   
   function Get_Largeur (This : Objet) return Natural;

   function Get_Hauteur (This : Objet) return Natural;
   
   function Get_Position (This : Objet) return Point;

   -- Affiche le contenu des objets d'un tableau
   procedure Put_Line (Tab : in Tableau_Objets);
   
private

   type Objet is record
      Index : Natural;
      Largeur : Natural;
      Hauteur : Natural;
      Position : Point; -- Top-Left Corner
   end record;

end Objet_Packing;
