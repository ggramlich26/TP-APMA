with Ada.Unchecked_Deallocation;


package body Liste_Generique is

	type Cellule is record
		Val : Element;
		Next : Liste;
	end record;

	type Iterateur_Interne is record
		el : Liste;
	end record;

	procedure free is new Ada.Unchecked_Deallocation (Cellule, Liste);
	procedure free is new Ada.Unchecked_Deallocation (Iterateur_Interne, Iterateur);

    -- Affichage de la liste, dans l'ordre de parcours
    procedure Affiche_Liste (L : in Liste) is
		It : Liste;
	begin
		It := L;
		while It /= null loop
			Put(It.Val);
			It := It.Next;
		end loop;
	end Affiche_Liste;

    -- Insertion d'un element V en tete de liste
    procedure Insere_Tete (V : in Element; L : in out Liste) is
		nEl : Liste;
	begin
		nEl := new Cellule;
		nEl.Next := L;
		nEl.Val := V;
		L := nEl;
	end;

    -- Vide la liste et libere toute la memoire utilisee
    procedure Libere_Liste(L : in out Liste) is
		it , tmp: Liste;
	begin
		it := L;
		while it /= null loop
			tmp := it;
			it := it.Next;
			free(tmp);
		end loop;
	end Libere_Liste;

    -- Creation de la liste vide
    function Creer_Liste return Liste is
	begin
		return null;
	end Creer_Liste;

    -- Cree un nouvel iterateur 
    function Creer_Iterateur (L : Liste) return Iterateur is
		it : Iterateur;
	begin
		it := new Iterateur_Interne;
		it.el := L;
		return it;
	end Creer_Iterateur;

    -- Liberation d'un iterateur
    procedure Libere_Iterateur(It : in out Iterateur) is
	begin
		free(It);
		It := null;
	end;

    -- Avance d'une case dans la liste
    procedure Suivant(It : in out Iterateur) is
	begin
		if(It = null or else It.el = null) then
			raise FinDeListe;
		end if;
		It.el := It.el.Next;
	end Suivant;

    -- Retourne l'element courant
    function Element_Courant(It : Iterateur) return Element is
	begin
		if (It /= null and then It.el /= null) then
			return It.el.Val;
		else
			raise FinDeListe;
		end if;
	end Element_Courant;

    -- Verifie s'il reste un element a parcourir
    function A_Suivant(It : Iterateur) return Boolean is
	begin
		return It.el.Next /= null;
	end A_Suivant;

end Liste_Generique;


