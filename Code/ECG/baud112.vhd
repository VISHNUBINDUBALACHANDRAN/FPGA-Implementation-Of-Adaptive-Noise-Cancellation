LIBRARY ieee; 
	Use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use IEEE.STD_LOGIC_SIGNED.ALL;


ENTITY baud_rate is 
port( 
			clk_in   : in  std_logic; 
			clk_out  : out std_logic
		);

end; 

architecture behav_baud of baud_rate is

signal count : integer:=0;
begin
process(clk_in,count)
begin

if clk_in'event and clk_in='1' then
  count <= count + 1;     
        if(count=430)  then
            clk_out<='1';           
        elsif count  = 434 then          
            clk_out<='0';
             count<=0; 
        end if;            
end if;
end process;

end;

 