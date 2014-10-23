with Ada.Text_IO;
use Ada.Text_IO;
with Objet_Packing;
use Objet_Packing;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

package body Packing is
   
   procedure Next_Fit_Decreasing_Height (Objets : in out Tableau_Objets ; Largeur_Ruban : Natural ; Hauteur_Ruban : in out Natural) is
      RangMin : Natural;
      Largeur_Niveau : Natural := 0;
      Hauteur_Max : Natural;
      Hauteur_Courante : Natural:=0;
      
      type Hauteur_Niveau is array (Natural range <>) of Natural;
   begin
      Calcul_Hauteur_Ruban(Objets , Hauteur_Ruban) ;
      for I in Objets'range loop
	 RangMin_Hauteur(RangMin , Objets , I , Objets'Last);
         Echanger_Objet(Objets(I),Objets(RangMin)) ;
      end loop;
      Hauteur_Max:= Hauteur(Objets(Objets'First));
      for I in reverse Objets'Range loop
	 if (Largeur_Niveau + Largeur(Objets(I))) > Largeur_Ruban then
	    Hauteur_Courante:= Hauteur_Max;
	    Hauteur_Max := Hauteur_Courante + Hauteur(Objets(I));
	    Largeur_Niveau:=0;
	 end if;
	 Affecter_Position(Objets(I) , (Largeur_Niveau,Hauteur_Courante));
	 Largeur_Niveau := Largeur_Niveau + Largeur(Objets(I));
	 end loop;
	    
	    
	    
	    
	    
      end Next_Fit_Decreasing_Height;
  
end Packing;
