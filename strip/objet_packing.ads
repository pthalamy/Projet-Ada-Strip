
package Objet_Packing is

   type Objet is private;
   type Tableau_Objets is array (Integer range <>) of Objet;

   procedure Set_Largeur (This : in out Objet;
                          Largeur : in Natural);

   procedure Set_Hauteur (This : in out Objet;
                          Hauteur : in Natural);

   function Get_Largeur (This : Objet) return Natural;

   function Get_Hauteur (This : Objet) return Natural;

   -- Affiche le contenu des objets d'un tableau
   procedure Put (Tab : in Tableau_Objets;
                  Taille : in Natural);

private

   type Objet is record
      Largeur : Natural;
      Hauteur : Natural;
   end record;

end Objet_Packing;
