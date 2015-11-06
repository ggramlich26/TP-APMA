with Ada.Text_IO; 
with Ada.Integer_Text_Io;
with Puissance4;
with Participant;
with Partie;
with Liste_Generique;
with Moteur_Jeu;

use Ada.Text_IO;
use Ada.Integer_Text_Io;
use Participant;

package body Puissance4 is

	function Jouer(E : Etat; C : Coup) return Etat is
		I : Integer;
		nE : Etat := E;
	begin
		for I in Integer range 0..rows-1 loop
			if(nE(C.col, rows - I) = ' ') then
				nE(C.col, rows - I) := C.Symbol;
				return nE;
			end if;
		end loop;
	end Jouer;

	function Est_Gagnant(E : Etat; J : Joueur) return Boolean is

	begin
	
	return false;
	end Est_Gagnant;

	function Est_Nul(E : Etat) return Boolean is

	begin

		return false;
	end Est_Nul;

	procedure Afficher(E : Etat) is
		I, J : Integer;
	begin
		for I in Integer range 1..columns loop
			Put(" " & Integer'Image(I));
		end loop;
		New_Line;
		for I in Integer range 1..rows loop
			for J in Integer range 1..columns loop
				Put("|" & E(I, J));
			end loop;
			Put("|");
			New_Line;
		end loop;
		for I in Integer range 1..columns loop
			Put("--");
		end loop;
		New_Line;
	end Afficher;

	procedure Affiche_Coup(C : in Coup) is

	begin
		Put(Joueur'Image(C.Player) & " joue: " & Integer'Image(C.col));
		New_Line;
	end Affiche_Coup;

	function Demande_Coup_Joueur1(E : Etat) return Coup is
		move : Coup;
	begin

		return move;
	end Demande_Coup_Joueur1;

	function Demande_Coup_Joueur2(E : Etat) return Coup is
		move : Coup;
	begin

		return move;
	end Demande_Coup_Joueur2;

	procedure Initialiser(P : in out Etat) is
		I, J : Integer;
	begin
		for I in Integer range 1..rows loop
			for J in Integer range 1..columns loop
				P(I, J) := ' ';
			end loop;
		end loop;
	end Initialiser;

end Puissance4;	

