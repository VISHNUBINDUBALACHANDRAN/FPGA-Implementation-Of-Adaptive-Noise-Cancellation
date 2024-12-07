library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use work.ascii_package.all;

entity tx_uart is
port (
				tx_clk  : in std_logic;
				data_in : in tx_vec;
				tx_rst  : in std_logic;
				tx      : out std_logic;				
				tx_stop : inout std_logic
			);
end;

Architecture tx_uart of tx_uart is
	signal tx_busy      : std_logic;
	signal tx_shift_reg : std_logic_vector(7 downto 0);
	signal tx_address	  : std_logic_vector(3 downto 0);
	signal tx_count     : std_logic_vector(3 downto 0):="0001";
	signal n,s		     : integer := 0;
	signal count3	     : integer := 0;
	
	
	
begin
    
  process ( tx_clk,tx_rst,data_in)   
  variable count,aa:integer:=0;
  begin
  
      if(tx_rst ='0') then           
					
					tx_address   <= "0000";
					tx_shift_reg <= "00000000";
					tx <= '1';
					tx_stop		<='0';
					count :=0;

       elsif (tx_clk'event and tx_clk ='1') then

				  tx_shift_reg<= data_in(count);	
				  
					  case tx_address is     				  
						when "0000" =>			
							tx  <= '0';
							 tx_address <= tx_address + tx_count;
						when "0001" =>

							  tx <= tx_shift_reg(0);
							  tx_address <= tx_address + tx_count;
								
						when "0010" =>						
								tx <= tx_shift_reg(1);
								tx_address <= tx_address + tx_count;
							 
						when "0011" =>						
								tx <= tx_shift_reg(2);
								tx_address <= tx_address + tx_count;
								
						when "0100" =>						
								tx <= tx_shift_reg(3);
								tx_address <= tx_address + tx_count;
								
						when "0101" =>						
								tx <= tx_shift_reg(4);
								tx_address <= tx_address + tx_count;
								
						when "0110" =>						
								tx <= tx_shift_reg(5);
								tx_address <= tx_address + tx_count;
								
						when "0111" =>						
								tx <= tx_shift_reg(6);
								tx_address <= tx_address + tx_count;
								
						when "1000" =>						
								tx <= tx_shift_reg(7);
								tx_address <= tx_address + tx_count;
							
						when "1001" => 																
								tx <= '1';                        aa:=aa+1;                        if(aa=50)then
								aa:=0;
								tx_address <="0000";	
								count:=count+1;
								if count=2 then
								tx_stop<='1';
								end if;
                        end if;
						 when others =>						 
					null;
			 end case;
   end if; 
end process;
end;   