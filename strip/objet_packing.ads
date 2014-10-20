
package Objet_Packing is
   
   type Point is record
      X : Natural;
      Y : Natural;
   end record;

   type Objet is private;
   type Tableau_Objets is array (Integer range <>) of Objet;
   
   procedure Set_Indice (This : in out Objet;
			 Indice : in Natural);
   
   procedure Set_Largeur (This : in out Objet;
                          Largeur : in Natural);

   procedure Set_Hauteur (This : in out Objet;
                          Hauteur : in Natural);
   
   procedure Set_Position (This : in out Objet;
			  Position : in Point);
   
   function Get_Indice (This : Objet) return Natural;
   
   function Get_Largeur (This : Objet) return Natural;

   function Get_Hauteur (This : Objet) return Natural;
   
   function Get_Position (This : Objet) return Point;

   procedure Put_Line (Tab : in Tableau_Objets);
   
private

   type Objet is record
      Indice : Natural; -- Utile pour Debug seul
      Largeur : Natural;
      Hauteur : Natural;
      Position : Point; -- Coin Superieur-droit du rectangle
   end record;

end Objet_Packing;
