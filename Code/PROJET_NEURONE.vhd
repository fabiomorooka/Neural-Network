library work;
library ieee;
use ieee.std_logic_1164.all;

package valeurs is

	---Paramètres modifiables du réseau---
	CONSTANT N : integer := 4;	
	CONSTANT couche : integer := 3;	
	--------------------------------------

	CONSTANT T : integer := 10;
	CONSTANT VMAX : integer := 5;
	CONSTANT VMIN : integer := 2;
	
	type tab_nc is array(natural range <>) of integer;
	subtype indice is integer range 1 to N;

	subtype t_dim2 is tab_nc(1 to N);
	type array_nc is array(natural range <>) of t_dim2;
	
end package;

library work;
library ieee;
use ieee.std_logic_1164.all;
use work.valeurs.all;

entity neurone is
	generic (Wi : IN tab_nc(1 to N) := (others => 1));
	port(	entreeXi : IN tab_nc(1 to N);
		sortie : OUT integer);
end neurone;

architecture arch_neurone of neurone is
	signal poids: tab_nc (1 to N) := Wi; --signal crée afin de récupérer les valeurs des poids choisies alléatoirement en simulation
begin

process(entreeXi)

variable Y : integer;

begin 
  
  Y := 0; 
	
	for i in 1 to N loop
		Y := Y + entreeXi(i) * Wi(i);
	end loop;

	if(Y>T) then
		sortie <= VMAX;
	elsif(Y<T or Y=T) then 
		sortie <= VMIN;
	end if;

end process;



end arch_neurone;