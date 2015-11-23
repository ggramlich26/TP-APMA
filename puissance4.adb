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
		--I : Integer;
		nE : Etat := E;
	begin
		for I in Integer range 0 .. (rows-1) loop
			if(nE(C.col, rows - I) = ' ') then
				nE(C.col, rows - I) := C.Symbol;
				return nE;
			end if;
		end loop;
	end Jouer;

	function checkRightDown(E : Etat; J : Joueur; c : Integer; r : Integer) return Boolean is
		--I : Integer;
	begin
		if(r < 1) then
			return false;
		end if;
		if(c < 1) then
			return false;
		end if;
		if (r < 4 or else c > columns - 3) then
			return false;
		end if;
		for I in Integer range 0..4 loop
			if(E(c+I, r-I) /= getSymbol(J)) then
				return false;
			end if;
		end loop;
		return true;
	end checkRightDown;

	function checkRightUp(E : Etat; J : Joueur; c : Integer; r : Integer) return Boolean is
		--I : Integer;
	begin
		if(r < 1) then
			return false;
		end if;
		if(c < 1) then
			return false;
		end if;
		if (r > rows-3 or else c > columns - 3) then
			return false;
		end if;
		for I in Integer range 0..4 loop
			if(E(c+I, r+I) /= getSymbol(J)) then
				return false;
			end if;
		end loop;
		return true;
	end checkRightUp;

	function checkRight(E : Etat; J : Joueur; c : Integer; r : Integer) return Boolean is
		--I : Integer;
	begin
		if(r < 1) then
			return false;
		end if;
		if(c < 1) then
			return false;
		end if;
		if (c > columns - 3 or else r > rows) then
			return false;
		end if;
		for I in Integer range 0..4 loop
			if(E(c+I, r) /= getSymbol(J)) then
				return false;
			end if;
		end loop;
		return true;
	end checkRight;

	function Est_Gagnant(E : Etat; J : Joueur) return Boolean is
		--I, K : Integer;
	begin
		for I in integer range 0..columns-4 loop
			for K in Integer range 0..rows-1 loop
				if(checkRight(E, J, I, K) or else
					checkRightDown(E, J, I, K) or else
					checkRightUp(E, J, I, K)) then
					return true;
				end if;
			end loop;
		end loop;
		return false;
	end Est_Gagnant;

	function Est_Nul(E : Etat) return Boolean is
		--I : Integer;
	begin
		for I in Integer range 0..columns loop
			if(E(I, rows-1) = ' ') then
				return false;
			end if;
		end loop;
		if(Est_Gagnant(E, Joueur1) or else Est_Gagnant(E, Joueur2)) then
			return false;
		end if;
		return true;
	end Est_Nul;

	procedure Afficher(E : Etat) is
		--I, J : Integer;
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
		Put("Player 1"	& ": ");
		Ada.Integer_Text_Io.Get(move.col);
		while move.col < 1 or else move.col > columns loop
			Put("Invalid column. Pleas enter a number between 1 and " & Integer'Image(columns) & ": ");
			Ada.Integer_Text_Io.Get(move.col);
		end loop;
		move.Player := Joueur1;
		move.Symbol := getSymbol(Joueur1);
		return move;
	end Demande_Coup_Joueur1;

	function Demande_Coup_Joueur2(E : Etat) return Coup is
		move : Coup;
	begin
		--todo implementer
		return move;
	end Demande_Coup_Joueur2;

	procedure Initialiser(P : in out Etat) is
		--I, J : Integer;
	begin
		for I in Integer range 1..rows loop
			for J in Integer range 1..columns loop
				P(I, J) := ' ';
			end loop;
		end loop;
	end Initialiser;

end Puissance4;	

