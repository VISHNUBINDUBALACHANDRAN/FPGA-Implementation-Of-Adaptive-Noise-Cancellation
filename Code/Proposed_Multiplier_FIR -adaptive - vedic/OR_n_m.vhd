library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_n_m is
  generic ( n : integer :=  16;m : integer :=  8 );
     port (A :in std_logic_vector (n-1 downto m);
           y : out std_logic);
end OR_n_m;

architecture Behavioral of OR_n_m is
begin
  
process(A)
  variable temp:std_logic:='0';
  begin
     temp:='0';
    for i in n-1 downto m loop
      temp:=temp OR A(i);
    end loop;
     y<=temp;
  end process;
end;
