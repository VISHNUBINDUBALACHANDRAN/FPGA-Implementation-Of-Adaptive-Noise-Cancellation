library ieee;                                                     
use ieee.std_logic_1164.all;                                      
use ieee.std_logic_unsigned.all;                                  
use ieee.std_logic_arith.all;
use WORK.ASCII_PACKAGE.ALL;
                                     
entity tx_uart_final is                                           
                                                                  
port (                                                         
			f_clk 	: in std_logic;                                 
			f_rst 	: in std_logic;       
			data_in 	: in tx_vec ;
			f_baud	: inout std_logic;                                    
			f_tx 		: out std_logic;			
			tx_stop	: inout std_logic
		);                 
end;                                                              
                                                                  
                                                                  
Architecture final_tx_uart of tx_uart_final is 

   
                                                                                                                                                      
	component baud_rate is                                            
	   port (clk_in   	: in  std_logic; 
			   clk_out  	: out std_logic);                                
		 end component;  

	component tx_uart is
	   port (tx_clk 		: in std_logic;
				data_in 		: in tx_vec;
				tx_rst  		: in std_logic;
				tx      		: out std_logic;				
				tx_stop		: inout std_logic);
	end component;

                                                              
      
		signal data_c         :	std_logic;       
		signal new_data	    :	std_logic;
		signal f_shift_reg	 : std_logic_vector(7 downto 0);
		
begin                                                                                                                              
                                                                  
u1 : tx_uart port map(f_baud,data_in,f_rst,f_tx,tx_stop);                                                                       
u2 : baud_rate port map(f_clk,f_baud); 
end;              
                               