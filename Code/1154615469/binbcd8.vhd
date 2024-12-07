
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
USE WORK.ASCII_PACKAGE.ALL;

entity binbcd is
    port(
        B: in STD_LOGIC_VECTOR (7 downto 0);
        data1,data2,data3 : out std_logic_vector(7 downto 0)
			);
end binbcd;
architecture binbcd_arch of binbcd is
signal P: STD_LOGIC_VECTOR (9 downto 0);
begin
  bcd1: process(B)

  variable z: STD_LOGIC_VECTOR (17 downto 0);

  begin

    	for i in 0 to 17 loop
		z(i) := '0';
    	end loop;
		
 		z(10 downto 3) := B; 
    	
	for i in 0 to 4 loop			
			if z(11 downto 8) > 4 then	
					z(11 downto 8) := z(11 downto 8) + 3;
			end if;	
			if z(15 downto 12) > 4 then	
					z(15 downto 12) := z(15 downto 12) + 3;
			end if;		
			z(17 downto 1) := z(16 downto 0);
		
   end loop;
		
	P <= z(17 downto 8);	
	
	data1 <= '0' & '0' & '1' & '1' & P(3 downto 0);
	data2 <= '0' & '0' & '1' & '1' & P(7 downto 4);
	data3 <= '0' & '0' & '1' & '1' & '0' & '0'  & P(9 downto 8);

  end process bcd1;            
end binbcd_arch;
