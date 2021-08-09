library ieee;
    use ieee.std_logic_1164.ALL;
	 use ieee.std_logic_arith.all;
	 

	package FUNCTION_SET is
		 function command(x : std_logic_vector) 
			return std_logic_vector ;
	
		 function lcd_display(x : std_logic_vector) 
			return std_logic_vector ;	
	end ;


	package body FUNCTION_SET is
	
		function command(x : std_logic_vector) 
		  return std_logic_vector is
		
		  variable lcd_data  :  std_logic_vector (9 downto 0);  
		  variable rs        :  std_logic :='0'; 
		  variable rw        :  std_logic :='0';
		  
		begin
		
			lcd_data(9 downto 2) := x(7 downto 0); 
			lcd_data(1) := rs; 
			lcd_data(0) := rw; 
			
			return lcd_data;
		
		end command;
	
		function lcd_display(x : std_logic_vector) 
		  return std_logic_vector is
		
		  variable lcd_data  :  std_logic_vector (9 downto 0);  
		  variable rs        :  std_logic :='1'; 
		  variable rw        :  std_logic :='0';
		  
		begin
		
			lcd_data(9 downto 2) := x(7 downto 0); 
			lcd_data(1) := rs; 
			lcd_data(0) := rw; 
			
			return lcd_data;
			
		end lcd_display;
		
	end package body;
