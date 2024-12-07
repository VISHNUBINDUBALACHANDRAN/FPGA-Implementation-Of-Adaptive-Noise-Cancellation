library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2 is
  generic ( m : integer :=  8 );
    port (A,B :in std_logic_vector (m-1 downto 0);
          sel:in std_logic;
          y : out std_logic_vector (m-1 downto 0));
end mux_2;

architecture Behavioral of mux_2 is
begin
 process(sel,A,B)
   begin
     if sel='0' then
       y<=A;
     else
       y<=b;
     end if;
   end process;
 end;