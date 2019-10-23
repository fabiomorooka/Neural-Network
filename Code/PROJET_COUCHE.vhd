library work;
library ieee;
use ieee.std_logic_1164.all;
use work.valeurs.all;
use work.random.all;

entity couche_neurone is
	generic( NbCouche : integer);
	port( sortie_final : OUT tab_nc(1 to (N/(2**(couche-1)))));
end entity;

architecture arch_couche_neurone of couche_neurone is

	signal NouveauN: integer := NbCouche;
	signal tab_sortie : array_nc(0 to NbCouche);

component generate_line
	generic( NouveauN: integer := 1);
	port(	tab_entree_line : IN tab_nc(1 to N);
		tab_sortie_line : OUT tab_nc(1 to N));
end component;

begin

--Les entrées sont générées pseudo-aléatoirement
tab_sortie(0)<= random_entree(N);

--On va créer ici chaque ligne du réseau de neurone

	GEN_Line: for i in 1 to NbCouche generate 
		myline: generate_line
				generic map( NouveauN => (N/(2**(i-1))))  
				port map ( tab_entree_line => tab_sortie(i-1), tab_sortie_line => tab_sortie(i));
	end generate GEN_Line;

	
	sortie_final <= tab_sortie(NbCouche)(1 to (N/(2**(couche-1))));


end architecture;