library work;
library ieee;
use ieee.std_logic_1164.all;
use work.valeurs.all;


entity reseau_neurone_test is
end entity;


architecture arch_reseau_neurone_test of reseau_neurone_test is 

signal sortie_test : tab_nc(1 to (N/(2**(couche-1))));

component couche_neurone
	generic( NbCouche : integer);
	port( sortie_final : OUT tab_nc(1 to (N/(2**(couche-1)))));
end component;

begin

test : couche_neurone
	generic map(nbCouche => couche)
	port map(sortie_final => sortie_test);


end architecture;