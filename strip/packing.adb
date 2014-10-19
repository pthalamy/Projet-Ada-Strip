
with Objet_Packing;
use Objet_Packing;

with Ada.Containers.Generic_Array_Sort;

package body Packing is
   
   
   procedure Next_Fit_Decreasing_Height (Objets : in out Tableau_Objets;
					 Largeur_Ruban : in Natural;
					 Hauteur_Ruban : out Natural) 
   is
      
      LOffset, HOffset, HMax : Natural := 0;
            
      function "<" (L, R : Objet) return Boolean is
      begin
	 return Get_Hauteur (L) > Get_Hauteur (R);
      end "<";
      
      procedure TriParHauteurDecroissante is 
	 new Ada.Containers.Generic_Array_Sort (Integer, 
						Objet, 
						Tableau_Objets);
      
   begin   
      TriParHauteurDecroissante (Objets);
      HMax := Get_Hauteur (Objets(Objets'First));
      
      for I in Objets'Range loop
	 
	 -- Si l'objet ne peut pas rentrer dans le niveau courant alors
	 -- Niveau suivant
	 if (LOffset + Get_Largeur (Objets(I))) > Largeur_Ruban then
	    HOffset := HMax;
	    HMax := HMax + Get_Hauteur (Objets(I));
	    LOffset := 0;
	 end if;
	 
	 -- Sinon placer l'objet a la fin du niveau
	 Set_Position (Objets(I), (LOffset, HOffset));
	 LOffset := LOffset + Get_Largeur (Objets(I));
      end loop;
      
      Hauteur_Ruban := HMax;
      
   end Next_Fit_Decreasing_Height;      
   
end Packing;
