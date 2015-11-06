with Participant;
use Participant;

generic
	columns : Integer;
	rows : Integer;
	nwinning : Integer;

package Puissance4 is
	type Etat is array(1..rows, 1..columns) of Character;
	type Coup is record
		col : Integer range 1..columns; --number of column to insert coin
		Player : Joueur;
		Symbol : Character;
	end record;

	function Jouer(E : Etat; C : Coup) return Etat;
	function Est_Gagnant(E : Etat; J : Joueur) return Boolean;
	function Est_Nul(E : Etat) return Boolean;
	procedure Afficher(E : Etat);
	procedure Affiche_Coup(C : in Coup);
	function Demande_Coup_Joueur1(E : Etat) return Coup;
	function Demande_Coup_Joueur2(E : Etat) return Coup;
	procedure Initialiser(P : in out Etat);
end Puissance4;
