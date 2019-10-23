library work;
library ieee;
use ieee.std_logic_1164.all;
use work.valeurs.all;


entity testPROJET is
end entity;

architecture arch_testPROJET of testPROJET is

	signal test_entree : tab_nc(1 to N);
	signal sortie1, sortie2 : integer;

component neurone
	generic(Wi : IN tab_nc(1 to N) := (others => 1));
	port(	entreeXi : IN tab_nc(1 to N);
	sortie : OUT integer);
end component;

begin

test_entree <= (1,1, 0, 0), (2, 3, 4, 5) after 100 ns;

myneurone1: neurone
	generic map( Wi => (4, 2, 1, 3))
	port map (entreeXi => test_entree, sortie => sortie1);

myneurone2: neurone
	generic map( Wi => (7, 4, 3, 1))
	port map (entreeXi => test_entree, sortie => sortie2);


end arch_testPROJET;