package body Participant is
	function getSymbol(J : Joueur) return Character is
	begin
		if(J = Joueur1) then
			return 'X';
		else
			return 'O';
		end if;
	end getSymbol;

	function Adversaire(J : Joueur) return Joueur is
	begin
		if(J = Joueur1) then
			return Joueur2;
		else
			return Joueur1;
		end if;
	end Adversaire;

end Participant;
