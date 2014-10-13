
package Svg is
   --	type Color is (Red, Green, Blue, Black);
   
   -- -> DANS ADB
   
   -- ! A appeler avant toute ecriture dans le fichier svg !
   -- garantit : Insere le header svg dans FichierSvg.
   procedure Svg_Header (FichierSvg : String);
   
   -- ! A appeler pour clore le fichier svg !
   -- garantit : Insere le footer svg dans FichierSvg.
   procedure Svg_Footer (FichierSvg : String);
   
   ----------------------------------------
   
   -- Sauvegarde la position des objets dans le fichier svg.
   procedure Sauvegarde (FichierSvg : String,
			   Objets : Tableau_Objets,
			   Largeur_Ruban : Natural
			   Hauteur_Ruban : Natural);
   
end Svg;
