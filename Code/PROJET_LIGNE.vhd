library work;
library ieee;
use ieee.std_logic_1164.all;
use work.valeurs.all;
use work.random.all;

entity generate_line is
	generic( NouveauN: integer := 2);
	port(	tab_entree_line : IN tab_nc(1 to N);
		tab_sortie_line : OUT tab_nc(1 to N));
end entity;

architecture arch_generate_line of generate_line is

component neurone
	generic(Wi : IN tab_nc(1 to N) := (others => 1));
	port(	entreeXi : IN tab_nc(1 to N);
		sortie : OUT integer);
end component;

	signal tab_interm : tab_nc(1 to N) := (others => 0);

begin
  --On génére ici chaque neurone d'une seule et unique ligne
	GEN_Neurone: for i in 1 to NouveauN generate
	myneuroneX: neurone
		generic map( Wi => random_number(N, i)) --Les poids de chaque neurone pour une même ligne est aléatoire. Entre deux lignes différentes ils auront le même poids
		port map (entreeXi => tab_entree_line, sortie => tab_interm(i));
	end generate GEN_Neurone;

	tab_sortie_line <= tab_interm;

end architecture;