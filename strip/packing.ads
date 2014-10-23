with Objet_Packing;
use Objet_Packing;

package Packing is
   
   -- Requiert : Objets un Tableau_Objets non vide
   -- Garantit : Objets trier par ordre decroissant de la hauteur de ses objets
   --            Chaque Objet.Position assigné à une valeur de type point
   procedure Next_Fit_Decreasing_Height (Objets : in out Tableau_Objets;
					 Largeur_Ruban : in Natural;
					 Hauteur_Ruban : out Natural);
   
end Packing;
