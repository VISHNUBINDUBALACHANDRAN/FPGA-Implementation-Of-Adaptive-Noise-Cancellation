library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_3 is
  generic ( n : integer :=  16;m : integer :=  8 );
    port (z:in std_logic_vector ((2*m)-1 downto 0);
          c,s:in std_logic;
          y : out std_logic_vector ((2*n)-1 downto 0));
end mux_3;

architecture Behavioral of mux_3 is
begin
 process(z,s,c)
   begin
     if c='0' and s='0' then
       y(2*n-1 downto (2*m))<=(others=>'0');
       y((2*m)-1 downto 0 )<=z;
     elsif c='0' and s='1' then
       y((2*n)-1 downto ((2*n)-(n-m)))<=(others=>'0');
       y(((2*n)-(n-m))-1 downto (n-m))<=z;
       y((n-m)-1 downto 0)<=(others=>'0');
     elsif c='1' and s='0' then
       y((2*n)-1 downto 2*(n-m) )<=z;
       y(2*(n-m)-1 downto 0)<=(others=>'0');
       
     
     end if;
   end process;
 end;
