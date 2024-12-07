Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_signed.ALL;
    use ieee.numeric_std.all;
use work.ASCII_PACKAGE.all;



entity MAIN is
port(clk:in std_logic;     
      tx:out std_logic;
	   rxd:in std_logic;
		
		lcd_rw 		: out std_logic;
		lcd_select 	: out std_logic;
		lcd_enable 	: out std_logic;
		lcd_data : out std_logic_vector(7 downto 0));
end MAIN;


architecture BEHAV of MAIN is 
     
component LCD_DISPLAY_MODULE  is 
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
	 end component;	
  

		component binbcd is
    port(
        B: in STD_LOGIC_VECTOR (7 downto 0);
        data1,data2,data3 : out std_logic_vector(7 downto 0)
			);
end component binbcd;

--component async_transmitter
--port (
--	 clk:in std_logic;
--	 TxD_start:in std_logic;  
--	 TxD_data:in std_logic_Vector(7 downto 0);  
--	                       
--	 TxD:out std_logic;
--	 TxD_busy:out std_logic
--);
--end component;
component async_receiver is
port(
	clk:in std_logic;
	RxD:in std_logic;
	RxD_data_ready:out std_logic:= '0';
	RxD_data:out std_logic_Vector(7 downto 0);
	RxD_idle:out std_logic;
	RxD_endofpacket:out std_logic:='0'
);
end component;


component tx_uart_final is                                           

                                                                  
port (                                                         
			f_clk 	: in std_logic;                                 
			f_rst 	: in std_logic;       
			data_in 	: in tx_vec ;
			f_baud	: inout std_logic;                                    
			f_tx 		: out std_logic;			
			tx_stop	: inout std_logic
		);                 
end component; 




      
		signal TT2,TT1,TT0,TT5,TT4,TT3,a2,a1,a0,YL1,YH1,aa1:std_logic_vector(7 downto 0);		
       
			-------------receiver----------------
	signal rx_ready,rx_idle,rx_eop:std_logic;
	signal rx_data:std_logic_vector(7 downto 0);		
	signal received : std_logic_vector(3 downto 0):="0000";
		    
      signal display:dis_array;
   -------------transmitter----------------
--   signal tx_start:std_logic:='0';
--	signal tx_busy:std_logic;
--	signal tx_data:std_logic_vector(7 downto 0); 
			signal tx_baud,tx_stop:std_logic;
		signal transmit:std_logic:='0';
		signal tx_data:tx_vec;

--	 Type TABS is array (0 to 49) of integer;
--	 Type  pmm is array (0 to 49) of integer;
    signal top:std_logic_vector(15 downto 0):="0000000000000000";	
    Type datamemory is array (1 to 50) of integer;
	 type int_Co_effecient_momory is array (1 to 50) of integer;
begin
process(clk)          

      variable temp1,temp2 :std_logic_vector(7 downto 0);
	  variable tempt,fo1,fo2,fo3,fo4 :std_logic_vector(7 downto 0):="00000000";
     variable temp:std_logic_vector(15 downto 0);   
	  variable ii,sec:natural:=0;
     variable rd_addr:std_logic_Vector(17 downto 0):=(others=>'0');   	  
	  variable Co_effecient : int_Co_effecient_momory := 
   (
       3,     6,     7,    13,    17,    25,    32,    42,    53,
      66,    79,    95,   111,   128,   146,   164,   181,   199,
     216,   231,   245,   256,   266,   273,   277,   278,   277,
     273,   266,   256,   245,   231,   216,   199,   181,   164,
     146,   128,   111,    95,    79,    66,    53,    42,    32,
      25,    17,    13,     7,     6
);

     variable xn:datamemory;
	  variable dm,km:integer:=0;
     variable sum1,sum2:integer:=0;
	  variable index,ind:integer:=1;

	  variable en:std_logic; 
	  
	  variable tp:std_logic_vector(39 downto 0);

	
   begin
	
	if(rising_Edge(clk))then

						
						case (received) is
						
				when "0000"=>
										if (rx_ready='1') then
											if rx_data=star then								
												received<="0001";
											end if;
											
										end if;					

										
				when "0001"=>
							    if(rx_ready='1')then
										tempt:=rx_data;                             
                                xn(index):=conv_integer(tempt);										
									     index:=index+1;
										 if(index>=51)then
												index:=1;
												received<="0010";									  									
										else										
												received<="0001";
										end if; 						
							  						
							
								end if;										
   					

				


when "0010"=>					  
							  
				     sum1:=sum1+((xn(ind))*(Co_effecient(ind))); 
                       ind:=ind+1;       
								  
						            if(ind>=51)then
												ind:=1;
												received<="0011";	
                                    tp:= conv_std_logic_vector((sum1),40);		
	                                 fo1:= tempt;
											
										else										
												received<="0010";
										end if; 		
						
when "0011"=>	

      display(1)  <= space;
		 display(2) <= space;
		 display(3) <= space;
		 display(4) <= space;
		 display(5) <= I;
		 display(6) <= N;
		 display(7) <= P;
		 display(8) <= U;
		 display(9) <= T;
		 display(10)<= EQUAL;
		 display(11)<= space;
		 display(12)<= "0011000" & fo1(0);
		 display(13)<= "0011000" & fo1(1);
		 display(14)<= "0011000" & fo1(2);
		 display(15)<= "0011000" & fo1(3);
		 display(16)<= "0011000" & fo1(4);
		 display(17)<= "0011000" & fo1(5);
		 display(18)<= "0011000" & fo1(6);
		 display(19)<= "0011000" & fo1(7);
		 display(20)<= space;
		 
		 display(21)<= space;
		 display(22)<= space;
		 display(23)<= space;
		 display(24)<= space;
		 display(25)<= space;
		 display(26)<= O;
		 display(27)<= U;
		 display(28)<= T;
		 display(29)<= P;
		 display(30)<= U;
		 display(31)<= T;
		 display(32)<= space;
		 display(33)<= EQUAL;
		 display(34)<= space;
		 display(35)<= space;
		 display(36)<= space;
		 display(37)<= space;
		 display(38)<= space;
		 display(39)<= space;
		 display(40)<= space;
		 
		 
		 display(41)<= "0011000" & tp(0);
		 display(42)<= "0011000" & tp(1);
		 display(43)<= "0011000" & tp(2);
		 display(44)<= "0011000" & tp(3);
		 display(45)<= "0011000" & tp(4);
		 display(46)<= "0011000" & tp(5);
		 display(47)<= "0011000" & tp(6);
		 display(48)<= "0011000" & tp(7);
		 display(49)<= "0011000" & tp(8);
		 display(50)<= "0011000" & tp(9);
		 display(51)<= "0011000" & tp(10);
		 display(52)<= "0011000" & tp(11);
		 display(53)<= "0011000" & tp(12);
		 display(54)<= "0011000" & tp(13);
		 display(55)<= "0011000" & tp(14);
		 display(56)<= "0011000" & tp(15);
		 display(57)<= "0011000" & tp(16);
		 display(58)<= "0011000" & tp(17);
		 display(59)<= "0011000" & tp(18);
		 display(60)<= "0011000" & tp(19);
		 
		 
		 display(61)<= "0011000" & tp(20);
		 display(62)<= "0011000" & tp(21);
		 display(63)<= "0011000" & tp(22);
		 display(64)<= "0011000" & tp(23);
		 display(65)<= "0011000" & tp(24);
		 display(66)<= "0011000" & tp(25);
		 display(67)<= "0011000" & tp(26);
		 display(68)<= "0011000" & tp(27);
		 display(69)<= "0011000" & tp(28);
		 display(70)<= "0011000" & tp(29);
		 display(71)<= "0011000" & tp(30);
		 display(72)<= "0011000" & tp(31);
		 display(73)<= "0011000" & tp(32);
		 display(74)<= "0011000" & tp(33);
		 display(75)<= "0011000" & tp(34);
		 display(76)<= "0011000" & tp(35);
		 display(77)<= "0011000" & tp(36);
		 display(78)<= "0011000" & tp(37);
		 display(79)<= "0011000" & tp(38);
		 display(80)<= "0011000" & tp(39);
 

   received<="0000";    

	
	
						  when others=>
					              
									  end case;


   
          
   end if;
   end process;
	

	
	
--	m5:async_transmitter port map(clk=>clk,TxD_start=>tx_start,TxD_data=>tx_data,TxD=>tx,TxD_busy=>tx_busy);
	m4:async_receiver  port map(clk=>clk,RxD=>RXD,RxD_data_ready=>rx_ready,RxD_data=>rx_data,RxD_idle=>rx_idle,RxD_endofpacket=>rx_eop);
 --  label12:tx_uart_final port map(clk,transmit,tx_data,tx_baud,tx,tx_stop);
 
  	lab: LCD_DISPLAY_MODULE port map(clk        , lcd_select, lcd_rw    , lcd_enable,lcd_data   ,											
				                         display(1) ,display(2) ,display(3) ,display(4) ,display(5) ,display(6) ,display(7) ,display(8) ,display(9) ,display(10),display(11),display(12),display(13),display(14),display(15),display(16),display(17),display(18),display(19),display(20),
											    display(21),display(22),display(23),display(24),display(25),display(26),display(27),display(28),display(29),display(30),display(31),display(32),display(33),display(34),display(35),display(36),display(37),display(38),display(39),DISPLAY(40),
											    display(41),display(42),display(43),display(44),DISPLAY(45),display(46),display(47),display(48),display(49),display(50),display(51),display(52),display(53),display(54),display(55),DISPLAY(56),display(57),display(58),display(59),display(60),
											    display(61),display(62),display(63),display(64),DISPLAY(65),display(66),display(67),display(68),display(69),display(70),display(71),display(72),display(73),display(74),display(75),DISPLAY(76),display(77),display(78),display(79),display(80));


   end behav;
   

