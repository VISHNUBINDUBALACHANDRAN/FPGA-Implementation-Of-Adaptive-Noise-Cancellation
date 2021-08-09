
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.numeric_std.all;
      
entity FIR_filterm is
  generic ( n : integer := 16; tab:integer:=50);
    port(clk:in  std_logic;
           x:in  std_logic_vector(n-1 downto 0);
           y:out std_logic_vector((2*n)-1 downto 0)
         );
end FIR_filterm;

Architecture operation of FIR_filterm is
  
  component Z_Delay is
  generic ( n : integer);
    port(clk:in  std_logic;
           D:in  std_logic_vector(n-1 downto 0):=(others=>'0');
           Q:out std_logic_vector(n-1 downto 0):=(others=>'0')
         );
  end component;
  
  component FIR_Multiplier_Array is
  Generic (n:integer:=16);
  port(   multiplicand: in std_logic_vector(n-1 downto 0);
            multiplier: in std_logic_vector(n-1 downto 0);
                   MUL: out std_logic_vector((2*n)-1 downto 0));
   end component;
   
   component RCA is
    generic ( n : integer := 8);
     port(a,b:in std_logic_vector(n-1 downto 0);
          cin:in std_logic;
          s:out std_logic_vector(n-1 downto 0);
          cout:out std_logic
          );
   end component ;

 Type TABS is array (0 to tab-1) of std_logic_vector(n-1 downto 0);
 
 Type  Co_effecient_momory is array (0 to tab-1) of std_logic_vector(n-1 downto 0);
 Type  Product_momory is array (0 to tab-1) of std_logic_vector((2*n)-1 downto 0);
     
    Type int_Co_effecient_momory is array (0 to tab-1) of integer;
    Constant int_Co_effecient : int_Co_effecient_momory := (
       -505,-349,321,892,795,2,-889,-1101,-332,931,1722,1368,89,-1066,
       -1012,432,2712,987,-2219,-4643,-3822,1177,8830,15744,15744,8830
       ,1177,-3822,-4643,-2219,987,2712,432,-1012,-1066,89,1368,1722,931
       ,-332,-1101,-889,2,795,892,321,-349,-505,-505,-505
       );
    
    
    Signal Co_effecient : Co_effecient_momory;
  
    signal TAB_Delay:TABS:=(others=>(others=>'0'));
    signal Products:Product_momory;
    signal Adder_tree:Product_momory;
    signal C: std_logic_vector(tab-1 downto 0):=(others=>'0');
 begin
   
   
     
                        TAB_Delay(0)<=x;
   
   FIR_Delay:         for i in 1 to tab-1 generate
                
      Tab_Delays:    Z_Delay generic map (n)
                                port map (clk,TAB_Delay(i-1),TAB_Delay(i));
              
                      end generate;
   
  
FIR_Co_eff_multi:   for i in 0 to tab-1 generate 
   
    Co_effecient(i)<=std_logic_vector(to_signed(int_Co_effecient((tab-1)-i),n));
           
           Multi:   FIR_Multiplier_Array  generic map (n)
                            port map(TAB_Delay(i),Co_effecient(i),Products(i));
                                      
                     end generate;

  

                  adder_TREE(0)<=Products(0);
                         

FIR_ADDER_TREE:   for i in 1 to tab-1 generate
 
            ADDER     : RCA generic map(2*n)
                            port map(Products(i),Adder_TREE(i-1),'0',Adder_TREE(i),C(i)) ;  
          
                  end generate;

                        y<=Adder_TREE(n-1);

 end;


-----------------------32 bit

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.numeric_std.all;
      
entity FIR_filterm_32 is
  generic ( n : integer := 32; tab:integer:=50);
    port(clk:in  std_logic;
           x:in  std_logic_vector(n-1 downto 0);
           y:out std_logic_vector((2*n)-1 downto 0)
         );
end FIR_filterm_32;

Architecture operation of FIR_filterm_32 is
  
  component Z_Delay is
  generic ( n : integer);
    port(clk:in  std_logic;
           D:in  std_logic_vector(n-1 downto 0):=(others=>'0');
           Q:out std_logic_vector(n-1 downto 0):=(others=>'0')
         );
  end component;
  
  component FIR_Multiplier_Array is
  Generic (n:integer:=16);
  port(   multiplicand: in std_logic_vector(n-1 downto 0);
            multiplier: in std_logic_vector(n-1 downto 0);
                   MUL: out std_logic_vector((2*n)-1 downto 0));
   end component;
   
   component RCA is
    generic ( n : integer := 8);
     port(a,b:in std_logic_vector(n-1 downto 0);
          cin:in std_logic;
          s:out std_logic_vector(n-1 downto 0);
          cout:out std_logic
          );
   end component ;

 Type TABS is array (0 to tab-1) of std_logic_vector(n-1 downto 0);
 
 Type  Co_effecient_momory is array (0 to tab-1) of std_logic_vector(n-1 downto 0);
 Type  Product_momory is array (0 to tab-1) of std_logic_vector((2*n)-1 downto 0);
     
    Type int_Co_effecient_momory is array (0 to tab-1) of integer;
    Constant int_Co_effecient : int_Co_effecient_momory := (
    36,     64,     79,    134,    177,    252,    326,    426,    533,
      660,    797,    950,   1111,   1284,   1460,   1641,   1819,   1994,
     2160,   2313,   2450,   2568,   2662,   2732,   2774,   2788,   2774,
     2732,   2662,   2568,   2450,   2313,   2160,   1994,   1819,   1641,
     1460,   1284,   1111,    950,    797,    660,    533,    426,    326,
      252,    177,    134,     79,     64
       );
    
    
    Signal Co_effecient : Co_effecient_momory;
  
    signal TAB_Delay:TABS:=(others=>(others=>'0'));
    signal Products:Product_momory;
    signal Adder_tree:Product_momory;
    signal C: std_logic_vector(tab-1 downto 0):=(others=>'0');
 begin
   
   
     
                        TAB_Delay(0)<=x;
   
   FIR_Delay:         for i in 1 to tab-1 generate
                
      Tab_Delays:    Z_Delay generic map (n)
                                port map (clk,TAB_Delay(i-1),TAB_Delay(i));
              
                      end generate;
   
  
FIR_Co_eff_multi:   for i in 0 to tab-1 generate 
   
    Co_effecient(i)<=std_logic_vector(to_signed(int_Co_effecient((tab-1)-i),n));
           
           Multi:   FIR_Multiplier_Array  generic map (n)
                            port map(TAB_Delay(i),Co_effecient(i),Products(i));
                                      
                     end generate;

  

                  adder_TREE(0)<=Products(0);
                         

FIR_ADDER_TREE:   for i in 1 to tab-1 generate
 
            ADDER     : RCA generic map(2*n)
                            port map(Products(i),Adder_TREE(i-1),'0',Adder_TREE(i),C(i)) ;  
          
                  end generate;

                        y<=Adder_TREE(n-1);

 end;


