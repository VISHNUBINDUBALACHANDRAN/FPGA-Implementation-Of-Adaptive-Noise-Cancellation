library IEEE  ;
USE IEEE.std_logic_1164.all;

Entity FIR_Multiplier_Array is
  Generic (n:integer:=16);
  port(   multiplicand: in std_logic_vector(n-1 downto 0);
            multiplier: in std_logic_vector(n-1 downto 0);
                   MUL: out std_logic_vector((2*n)-1 downto 0));
   end FIR_Multiplier_Array;
   
Architecture operation of FIR_Multiplier_Array is 

  component RCA is
    generic ( n : integer );
      port(a,b:in std_logic_vector(n-1 downto 0);
           cin:in std_logic;
           s:out std_logic_vector(n-1 downto 0);
           cout:out std_logic
           );
    end component;
 
 component twos_complement is
  Generic (n:integer:=8);
  port(   A: in std_logic_vector(n-1 downto 0);
          B: in std_logic_vector(n-1 downto 0);
       A_2s:out std_logic_vector(n-1 downto 0);
       B_2s:out std_logic_vector(n-1 downto 0));               
   end component;
   
component vedic_m is
  
port(
     a,b:in std_logic_vector(15 downto 0);
     c:out std_logic_vector(31 downto 0)
     );
     
end component;
   


 signal A_2s,B_2s,A,B:  std_logic_vector(n-1 downto 0);

    begin
  --# # # # # # # # # # # 2's compliment # # # # # # # # # # # # # # # # # # 
          
              Twos_comp : twos_complement generic map(n)
                      port map(multiplicand,multiplier,A_2s,B_2s) ; 
  
            A <= B_2s when (A_2s(n-1)='0' and B_2s(n-1)='1') ElSE A_2s;
            B <= A_2s when (A_2s(n-1)='0' and B_2s(n-1)='1') ElSE B_2s;
  
  --# # # # # # # # # # # #  Multiplier # # # # # # # # # # # # # # # # # # # 
      
       Multiplier_BOOT : vedic_m
                                        port map(A,B,MUL) ; 
                                        
  --# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

 end operation;