library work;
library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use work.valeurs.all;

package random is

function random_number(valeur : integer; j: integer) return tab_nc;
function random_entree(valeur : integer) return tab_nc;

end package random;

package body random is

function random_number(valeur : integer; j : integer) return tab_nc is

    variable seed1, seed2,seed3, seed4: positive;               
    variable rand1,rand2: real;   
    variable range_of_rand : real := 8.0;    
    variable wi : tab_nc(1 to valeur):= (others => 1);

begin

    for i in 1 to valeur loop
	uniform(seed1, seed2, rand1);   -- generate random number
	uniform(seed3, seed4, rand2);   -- generate random number
    	wi(i):= abs((i-j) mod integer((rand1*range_of_rand)+rand2+1.0));

    end loop;

	return wi;

end random_number; 

function random_entree(valeur : integer) return tab_nc is

    variable wi : tab_nc(1 to valeur):= (others => 1);

--Les entrées vont prendre la valeur 2 si c'est une entrée paire, 5 sinon

begin
    for i in 1 to valeur loop
	if i mod 2 = 0 then
		wi(i):= VMIN;
	else
		wi(i) := VMAX;
	end if;
    end loop;

    return wi;

end random_entree; 

end random;
