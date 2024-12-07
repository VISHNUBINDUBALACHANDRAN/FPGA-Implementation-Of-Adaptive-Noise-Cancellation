Library ieee; 
    Use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use IEEE.STD_LOGIC_SIGNED.ALL;
    USE WORK.ASCII_PACKAGE.ALL;
    USE WORK.FUNCTION_SET.ALL;
	 

entity LCD_DISPLAY_MODULE  is 
  port( 
		 clk   						: in std_logic; 
		 LCD_RS, LCD_RW, LCD_E 	: out std_logic;
		 LCD_DataBus 				: out std_logic_vector(7 downto 0);
		
		 ------------LCD PANEL POSTION ---------
		 --==============================================================================
		 LCD1 ,LCD2 ,LCD3 ,LCD4 ,LCD5 ,LCD6 ,LCD7 ,LCD8 ,LCD9 ,LCD10,LCD11,LCD12,LCD13,LCD14,LCD15,LCD16,LCD17,LCD18,LCD19,LCD20,
		 LCD21,LCD22,LCD23,LCD24,LCD25,LCD26,LCD27,LCD28,LCD29,LCD30,LCD31,LCD32,LCD33,LCD34,LCD35,LCD36,LCD37,LCD38,LCD39,LCD40,
		 LCD41,LCD42,LCD43,LCD44,LCD45,LCD46,LCD47,LCD48,LCD49,LCD50,LCD51,LCD52,LCD53,LCD54,LCD55,LCD56,LCD57,LCD58,LCD59,LCD60,
		 LCD61,LCD62,LCD63,LCD64,LCD65,LCD66,LCD67,LCD68,LCD69,LCD70,LCD71,LCD72,LCD73,LCD74,LCD75,LCD76,LCD77,LCD78,LCD79,LCD80
		 --==============================================================================

                              : IN std_logic_vector(7 downto 0));
  end LCD_DISPLAY_MODULE;
  

architecture behav_lcd of LCD_DISPLAY_MODULE  is 

constant counter : Std_Logic_Vector(3 downto 0):="0000";
signal state     : integer range 0 to 11000;
signal ledcount  : integer range 0 to 11000;
signal dis       : std_logic_vector (9 downto 0);
signal DATA      : std_logic_vector (7 downto 0);
signal dcount    : std_logic_vector(10 downto 0):="00000000000";     
       
	begin
		process(clk,dcount,state)
		begin
			LCD_DataBus <= dis (9 downto 2);
			LCD_RS  <= dis(1);
			LCD_RW  <= dis(0);

			if clk'event and clk='1' then
				 
				dcount <= dcount +1;
				
				if(dcount="11111111111")  then
					
					state<= state+1;					
					ledcount<=ledcount+1;
					
					CASE state IS
						  
							WHEN 1=> 
							dis <= command (FUNCTION_SET);
												  
							WHEN 2=>
							dis <= command (DISPLAY_ON);
									  
							WHEN 3=>
							dis <= command (SET_DD_RAM_Address_80);
							 
							WHEN 6=>
							dis <= lcd_display(LCD1);
							
							WHEN 7=>
							dis <= lcd_display(LCD2);
																
							WHEN 8=>
							dis <= lcd_display(LCD3);
									
							WHEN 9=>
							dis <= lcd_display(LCD4);
							
							WHEN 10=>
							dis <= lcd_display(LCD5);
							
							WHEN 11=>
							dis <= lcd_display(LCD6);
							
							WHEN 12=>
							dis <= lcd_display(LCD7);
							
							WHEN 13=>
							dis <= lcd_display(LCD8);
							
							WHEN 14=>
							dis <= lcd_display(LCD9);
							
							WHEN 15=>
							dis <= lcd_display(LCD10);
							
							WHEN 16=>
							dis <= lcd_display(LCD11);
							
							WHEN 17=>
							dis <= lcd_display(LCD12);
							
							WHEN 18=>
							dis <= lcd_display(LCD13);
							
							WHEN 19=>
							dis <= lcd_display(LCD14);
							
							WHEN 20=>
							dis <= lcd_display(LCD15);
							
							WHEN 21=>
							dis <= lcd_display(LCD16);
							
							WHEN 22=>
							dis <= lcd_display(LCD17);
							
							WHEN 23=>
							dis <= lcd_display(LCD18);
							
							WHEN 24=>
							dis <= lcd_display(LCD19);
							
							WHEN 25=>
							dis <= lcd_display(LCD20);
							
							WHEN 26=>
							dis <= command ("11000000");
							 
							WHEN 27=>
							dis <= lcd_display(LCD21);
							
							WHEN 28=>
							dis <= lcd_display(LCD22);
							
							WHEN 29=>
							dis <= lcd_display(LCD23);
							
							WHEN 30=>
							dis <= lcd_display(LCD24);
							
							WHEN 31=>
							dis <= lcd_display(LCD25);
							
							WHEN 32=>
							dis <= lcd_display(LCD26);
							
							WHEN 33=>
							dis <= lcd_display(LCD27);
							
							WHEN 34=>
							dis <= lcd_display(LCD28);
							
							WHEN 35=>
							dis <= lcd_display(LCD29);
							
							WHEN 36=>
							dis <= lcd_display(LCD30);
							
							WHEN 37=>
							dis <= lcd_display(LCD31);
							
							WHEN 38=>
							dis <= lcd_display(LCD32);
							
							WHEN 39=>
							dis <= lcd_display(LCD33);
							
							WHEN 40=>
							dis <= lcd_display(LCD34);
							
							WHEN 41=>
							dis <= lcd_display(LCD35);
							
							WHEN 42=>
							dis <= lcd_display(LCD36);
							
							WHEN 43=>
							dis <= lcd_display(LCD37);
							
							WHEN 44=>
							dis <= lcd_display(LCD38);
							
							WHEN 45=>
							dis <= lcd_display(LCD39);
							
							WHEN 46=>
							dis <= lcd_display(LCD40);
							
							WHEN 47=>
							dis <= command ("10010100");
							 
							WHEN 48=>
							dis <= lcd_display(LCD41);
							
							WHEN 49=>
							dis <= lcd_display(LCD42);
							
							WHEN 50=>
							dis <= lcd_display(LCD43);
							
							WHEN 51=>
							dis <= lcd_display(LCD44);
							
							WHEN 52=>
							dis <= lcd_display(LCD45);
							
							WHEN 53=>
							dis <= lcd_display(LCD46);
							
							WHEN 54=>
							dis <= lcd_display(LCD47);
							
							WHEN 55=>
							dis <= lcd_display(LCD48);
							
							WHEN 56=>
							dis <= lcd_display(LCD49);
							
							WHEN 57=>
							dis <= lcd_display(LCD50);
							
							WHEN 58=>
							dis <= lcd_display(LCD51);
							
							WHEN 59=>
							dis <= lcd_display(LCD52);
							
							WHEN 60=>
							dis <= lcd_display(LCD53);
							
							WHEN 61=>
							dis <= lcd_display(LCD54);
							
							WHEN 62=>
							dis <= lcd_display(LCD55);
							
							WHEN 63=>
							dis <= lcd_display(LCD56);
							
							WHEN 64=>
							dis <= lcd_display(LCD57);
							
							WHEN 65=>
							dis <= lcd_display(LCD58);
							
							WHEN 66=>
							dis <= lcd_display(LCD59);
							
							WHEN 67=>
							dis <= lcd_display(LCD60);
							
							WHEN 68=>
							dis <= command ("11010100");
							 
							WHEN 69=>
							dis <= lcd_display(LCD61);
							
							WHEN 70=>
							dis <= lcd_display(LCD62);
							
							WHEN 71=>
							dis <= lcd_display(LCD63);
							
							WHEN 72=>
							dis <= lcd_display(LCD64);
							
							WHEN 73=>
							dis <= lcd_display(LCD65);
							
							WHEN 74=>
							dis <= lcd_display(LCD66);
							
							WHEN 75=>
							dis <= lcd_display(LCD67);
							
							WHEN 76=>
							dis <= lcd_display(LCD68);
							
							WHEN 77=>
							dis <= lcd_display(LCD69);
							
							WHEN 78=>
							dis <= lcd_display(LCD70);
							
							WHEN 79=>
							dis <= lcd_display(LCD71);
							
							WHEN 80=>
							dis <= lcd_display(LCD72);
							
							WHEN 81=>
							dis <= lcd_display(LCD73);
							
							WHEN 82=>
							dis <= lcd_display(LCD74);
							
							WHEN 83=>
							dis <= lcd_display(LCD75);
							
							WHEN 84=>
							dis <= lcd_display(LCD76);
							
							WHEN 85=>
							dis <= lcd_display(LCD77);
							
							WHEN 86=>
							dis <= lcd_display(LCD78);
							
							WHEN 87=>
							dis <= lcd_display(LCD79);
							
							WHEN 88=>
							dis <= lcd_display(LCD80);
							
							when 89=>
							
							state<=3;
							
							WHEN OTHERS =>
							
					END CASE;
							
				end if;
				
				if dcount <= "00000000111"  then		
					lcd_E <='1';
				else
					lcd_E<='0';				
				end if;  
			
				if ledcount<=5000 then 
					data<="01010101"; 
				else 
					if ledcount>5000 and ledcount<=10000 then 
						data<="10101010"; 
					else 
					   if ledcount>10000 then 
						   ledcount<=0; 
					   end if;
				   end if;					
				end if;
				
			end if;

		end process;
		
end behav_lcd;                     



