library IEEE  ;
USE IEEE.std_logic_1164.all;

Entity twos_complement is
  Generic (n:integer:=8);
  port(   A: in std_logic_vector(n-1 downto 0);
          B: in std_logic_vector(n-1 downto 0);
       A_2s:out std_logic_vector(n-1 downto 0);
       B_2s:out std_logic_vector(n-1 downto 0));
                  
   end twos_complement;
   
Architecture operation of twos_complement is 

  component RCA is
    generic ( n : integer );
      port(a,b:in std_logic_vector(n-1 downto 0);
           cin:in std_logic;
           s:out std_logic_vector(n-1 downto 0);
           cout:out std_logic
           );
    end component;
 
 type partialProduct is array (0 to n-1) of std_logic_vector((2*n)-1 downto 0);

 signal A2s,B2s,A_1s,B_1s :  std_logic_vector(n-1 downto 0);
 signal C1,C2             :  std_logic;
 signal PlusOne           :  std_logic_vector(n-1 downto 0):=(others=>'0');
    begin
  --################# 2's compliment ################################### 

       A_1s <= not(A) when (A(n-1)='1' and B(n-1)='1') ELSE A ;
       B_1s <= not(B) when (A(n-1)='1' and B(n-1)='1') ELSE B ;

             PlusOne(0)<='1' ;
       ADDER_A_2s : RCA generic map(n)
                     port map(A_1s,PlusOne,'0', A2s,C1);  
       ADDER_B_2s : RCA generic map(n)
                     port map(B_1s,PlusOne,'0', B2s,C2);
                     
       A_2s <=A2s  when (A(n-1)='1' and B(n-1)='1') ELSE A ;
       B_2s <=B2s  when (A(n-1)='1' and B(n-1)='1') ELSE B ;
 
 end operation;
