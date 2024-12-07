library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity two_comp is
  port(a:in std_logic_vector(9 downto 0);
          y:out std_logic_vector(10 downto 0));
 end two_comp;
architecture behave of two_comp is
    signal s1:std_logic_vector(9 downto 0);
    begin
        s1<= not a;
        process (s1)
            variable temp:std_logic_vector(10 downto 0);
            begin
                temp(0):='1';
        for i IN 0 to 9 loop
              y(i)<= s1(i) xor temp(i);
              temp(i+1):=s1(i) and temp(i);
          end loop;
          y(10)<=temp(10);
      end process;
    end behave;