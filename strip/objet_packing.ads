
package Objet_Packing is
   
   type Point is record
      X : Natural;
      Y : Natural;
   end record;

   type Objet is private;
   type Tableau_Objets is array (Integer range <>) of Objet;
   
   -- Requiert : This un Objet existant et Indice un Natural
   -- Garantit : This.Indice = Indice
   procedure Set_Indice (This : in out Objet;
			 Indice : in Natural);
   
   -- Requiert : This un Objet existant et Largeur un Natural
   -- Garantit : This.Largeur = Largeur
   procedure Set_Largeur (This : in out Objet;
                          Largeur : in Natural);
   
   -- Requiert : This un Objet existant et Hauteur un Natural
   -- Garantit : This.Hauteur = Hauteur        
   procedure Set_Hauteur (This : in out Objet;
                          Hauteur : in Natural);
   
   -- Requiert : This un Objet existant et Position de type Point
   -- Garantit : This.Position = Position
   procedure Set_Position (This : in out Objet;
			   Position : in Point);
   
   -- Requiert : This un Objet existant 
   -- Retourne : Retourne This.Indice
   function Get_Indice (This : Objet) return Natural;
   
   -- Requiert : This un Objet existant 
   -- Retourne : Retourne This.Largeur
   function Get_Largeur (This : Objet) return Natural;
   
   -- Requiert : This un Objet existant 
   -- Retourne : Retourne This.Hauteur
   function Get_Hauteur (This : Objet) return Natural;
   
   -- Requiert : This un Objet existant
   -- Retourne : Retourne This.Position
   function Get_Position (This : Objet) return Point;
   
   -- Requiert : Tab de type Tableau_Objets
   -- Garantit : Affiche le contenu de Tab
   procedure Put_Line (Tab : in Tableau_Objets);
   
private

   type Objet is record
      Indice : Natural;
      Largeur : Natural;
      Hauteur : Natural;
      Position : Point; -- Coin Superieur-gauche du rectangle
   end record;

end Objet_Packing;
