with Participant; use Participant; 
with Liste_Generique;
with Ada.Text_IO;


package body Moteur_Jeu is
    
    -- Choix du prochain coup par l'ordinateur. 
    -- E : l'etat actuel du jeu;
    -- P : profondeur a laquelle la selection doit s'effetuer
    function Choix_Coup(E : Etat) return Coup is
		C : Coup;
	begin
		--todo implement
		return C;
	end Choix_Coup;

	-- Evaluation d'un coup a partir d'un etat donne
	-- E : Etat courant
	-- P : profondeur a laquelle cette evaluation doit etre realisee
	-- C : Coup a evaluer
	-- J : Joueur qui realise le coup
	function Eval_Min_Max(E : Etat; P : Natural; C : Coup; J : Joueur)
		return Integer is
	begin
		--todo implement
		return 0;
	end Eval_Min_Max;
   
end Moteur_Jeu;



