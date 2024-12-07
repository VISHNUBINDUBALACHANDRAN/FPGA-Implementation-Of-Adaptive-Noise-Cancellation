library IEEE;
    use IEEE.std_logic_1164.all;
    use IEEE.std_logic_unsigned.all;


entity binbcd16 is
    port(
         B     : in std_logic_vector (11 downto 0);
         data1 : out std_logic_vector(7 downto 0);
			data2 : out std_logic_vector(7 downto 0);
			data3 : out std_logic_vector(7 downto 0);
			data4 : out std_logic_vector(7 downto 0));
    end binbcd16;


architecture binbcd_arch of binbcd16 is
  
	signal P: STD_LOGIC_VECTOR (18 downto 0);

begin
    
  bcd1: process(B)

		  variable z: STD_LOGIC_VECTOR (34 downto 0);
  
		  begin
	
				for i in 0 to 34 loop			
					z(i):='0';
				end loop;
	
				   z(18 downto 3) := "0000" & B; 
    	
				for i in 0 to 12 loop		
		
					if z(19 downto 16) > 4 then	
						z(19 downto 16) := z(19 downto 16) + 3;
					end if;
					if z(23 downto 20) > 4 then	
						z(23 downto 20) := z(23 downto 20) + 3;
					end if;
						
					if z(27 downto 24) > 4 then	
						z(27 downto 24) := z(27 downto 24) + 3;
					end if;	
					
					if z(31 downto 28) > 4 then	
						z(31 downto 28) :=z(31 downto 28) + 3;
					end if;			
		  
				   z(34 downto 1) := z(33 downto 0);			
		  
				end loop;
   
				p<=z(34 downto 16);
				data1<="0011"  & z(31 downto 28);
				data2<="0011"  & z(27 downto 24);
				data3<="0011"  & z(23 downto 20);
				data4<="0011"  & z(19 downto 16);
	 
		  end process bcd1;
		  
end binbcd_arch;
