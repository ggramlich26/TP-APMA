with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Ada.Text_IO; use Ada.Text_IO;
with Participant;
use Participant;

package body Partie is

	procedure Joue_Partie(E: in out Etat; J : in Joueur) is
		over : Boolean := false;
		cPlayer : Joueur := J;
	begin
		while(over /= true) loop
			if(cPlayer = Joueur1) then
				E := Etat_Suivant(E, Coup_Joueur1(E));
			else
				E := Etat_Suivant(E, Coup_Joueur1(E));
			end if;
			if(Est_Gagnant(E, Joueur1)) then
				over := true;
				Put("Player1 won");
				New_Line;
			elsif(Est_Gagnant(E, Joueur2)) then
				over := true;
				Put("Player2 won");
				New_Line;
			elsif(Est_Nul(E)) then
				over := true;
				Put("Evan match");
				New_Line;
			end if;
		end loop;
	end Joue_Partie;
end Partie;
