
with Objet_Packing;
use Objet_Packing;

with Ada.Containers.Generic_Array_Sort;

package body Packing is   
   
   procedure Next_Fit_Decreasing_Height (Objets : in out Tableau_Objets;
					 Largeur_Ruban : in Natural;
					 Hauteur_Ruban : out Natural) 
   is
      
      L_Cour, H_Cour, H_Max : Natural := 0;
      
      -- Fonction necessaire a l'instantiation de Generic_Array_Sort 
      -- Compare deux elements du tableau pour son tri croissant
      function "<" (L, R : Objet) return Boolean is
      begin
	 -- Normalement Get_Hauteur (L) < Get_Hauteur (R)
	 -- Mais le signe a ete inverse afin d'obtenir un tri decroissant
	 return Get_Hauteur (L) > Get_Hauteur (R);
      end "<";
      
      -- Instanciation du package generic sort de la bibliotheque standard Ada
      procedure TriParHauteurDecroissante is 
	 new Ada.Containers.Generic_Array_Sort (Index_Type => Integer, 
						Element_Type => Objet, 
						Array_Type => Tableau_Objets);
      
      Objet_Unique : exception;
   begin   
      if Objets'Length > 1 then
	 TriParHauteurDecroissante (Objets);
	 H_Max := Get_Hauteur (Objets(Objets'First));
	 
	 for I in Objets'Range loop
	    
	    -- Si l'objet ne peut pas rentrer dans le niveau courant alors
	    -- Niveau suivant
	    if (L_Cour + Get_Largeur (Objets(I))) > Largeur_Ruban then
	       H_Cour := H_Max;
	       H_Max := H_Max + Get_Hauteur (Objets(I));
	       L_Cour := 0;
	    end if;
	    
	    -- Sinon placer l'objet a la fin du niveau
	    Set_Position (Objets(I), (L_Cour, H_Cour));
	    L_Cour := L_Cour + Get_Largeur (Objets(I));
	 end loop;
	 
	 Hauteur_Ruban := H_Max;
      elsif Objets'Length = 1 then
	 raise Objet_Unique;
      end if;
   exception
      when Objet_Unique =>
	 -- Tri non necessaire
	 Hauteur_Ruban := Get_Hauteur (Objets(Objets'First));
   end Next_Fit_Decreasing_Height;      
   
end Packing;
