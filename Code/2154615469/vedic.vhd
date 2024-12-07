-------------------com1
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    
entity cla is
    port(
			  a,b:in std_logic_vector(3 downto 0);
        s:out std_logic_vector(4 downto 0));

    end cla;
    architecture look of cla is
    
    begin
	 process(a,b)
	   
	  variable p:std_logic_vector(3 downto 0);
    variable g:std_logic_vector(3 downto 0);
    variable c:std_logic_vector(4 downto 0);
    variable sum:std_logic_vector(4 downto 0);
    
 begin

    c(0):='0';
    p:=a xor b;
    g:=a and b;
    c(1):=g(0) or (p(0)and c(0));
    c(2):=g(1) or (p(1)and c(1));
    c(3):=g(2) or (p(2)and c(2));
    c(4):=g(3) or (p(3)and c(3));
    sum(0):=p(0) xor c(0);
    sum(1):=p(1) xor c(1);
    sum(2):=p(2) xor c(2);
    sum(3):=p(3) xor c(3);
    

      sum(4):=c(4);
      
      s<= sum;

	end process;
	
end look;  

---------------------com2
  library ieee;
        use ieee.std_logic_1164.all;
        use ieee.std_logic_arith.all;
        use ieee.std_logic_unsigned.all;
        
    entity fulladder is
        port(a,b,c:in std_logic;
             sum:out std_logic;
             carry:out std_logic);       
    end fulladder;
    
    architecture fuladder of fulladder is
       
    begin
      
      process(a,b,c)
begin    
    sum<=a xor b xor c;
    carry<= (a and b )or (b and c)or (a and c);
   end process; 
   end fuladder;
   
   ------------------------com3
   library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
   
    
entity halfadder is
    port(a,b:in std_logic;
         sum:out std_logic;
         carry:out std_logic);       
end halfadder;

architecture adder of halfadder is
   
begin
  process(a,b)
begin
sum<=a xor b ;
carry<= a and b ;
end process;
end adder;

------------------------------com4

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity vedic_4 is
    port(
			   a,b:in std_logic_vector(3 downto 0);
         output:out std_logic_vector (7 downto 0));
end vedic_4;

architecture multiplier of vedic_4 is
    
  component halfadder is
      port(a,b:in std_logic;
           sum:out std_logic;
           carry:out std_logic);       
  end component;

  component fulladder is
        port(a,b,c:in std_logic;
             sum:out std_logic;
             carry:out std_logic);       
  end component;
  
  component cla is
    port(
			a,b:in std_logic_vector(3 downto 0);
        s:out std_logic_vector(4 downto 0));
  end component;
  
  signal p1,p2,p3,p4,x,y:std_logic_vector(3 downto 0);
  signal s1,s2,c1,c2:std_logic_vector(3 downto 0);
  signal z:std_logic_vector(4 downto 0);
begin
   
              p1(0)<=a(0) and b(0);
              p1(1)<=a(1) and b(0);
              p1(2)<=a(2) and b(0);
              p1(3)<=a(3) and b(0);
  
               
              p2(0)<=a(0) and b(1);
              p2(1)<=a(1) and b(1);
              p2(2)<=a(2) and b(1);
              p2(3)<=a(3) and b(1);
              
               
              p3(0)<=a(0) and b(2);
              p3(1)<=a(1) and b(2);
              p3(2)<=a(2) and b(2);
              p3(3)<=a(3) and b(2);
  
  
              p4(0)<=a(0) and b(3);
              p4(1)<=a(1) and b(3);
              p4(2)<=a(2) and b(3);
              p4(3)<=a(3) and b(3);
              
      -------------------------------------------------------------------
            a1:halfadder port map(p1(1),p2(0),s1(0),c1(0));  
            a2:fulladder port map(p1(2),p2(1),p3(0),s1(1),c1(1)); 
            a3:fulladder port map(p1(3),p2(2),p3(1),s1(2),c1(2)); 
            a4:halfadder port map(p2(3),p3(2),s1(3),c1(3)); 
      ------------------------------------------------------------------- 
            b1:halfadder port map(s1(1),c1(0),s2(0),c2(0));  
            b2:fulladder port map(s1(2),c1(1),p4(0),s2(1),c2(1)); 
            b3:fulladder port map(s1(3),c1(2),p4(1),s2(2),c2(2)); 
            b4:fulladder port map(p3(3),c1(3),p4(2),s2(3),c2(3)); 
      --------------------------------------------------------------------
            x<=c2(3 downto 0);
            y<=p4(3) & s2(3) & s2(2) & s2(1);
            d1:cla port map(x,y,z);
            
            output<=z & s2(0) & s1(0) & p1(0);
            
    end multiplier;
    
-------------------comp5
    
    library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;
    
    entity vedic_8 is
      
      port(
           a,b:in std_logic_vector(7 downto 0);
           c:out std_logic_vector(15 downto 0)
           );
           
  end vedic_8;
  
  architecture vedic_8_rtl of vedic_8 is
  
component vedic_4 is
    port(
			   a,b:in std_logic_vector(3 downto 0);
         output:out std_logic_vector (7 downto 0));
end component;


      signal p1,p2,p3,p4:std_logic_vector(7 downto 0);
      signal t1,q4:std_logic_vector(7 downto 0);
      signal t2,t3,t4,q5,q6:std_logic_vector(11 downto 0);
begin
  
   u1:vedic_4 port map(a(3 downto 0),b(3 downto 0),p1);
   u2:vedic_4 port map(a(7 downto 4),b(3 downto 0),p2);
   u3:vedic_4 port map(a(3 downto 0),b(7 downto 4),p3);
   u4:vedic_4 port map(a(7 downto 4),b(7 downto 4),p4);
   
   t1<= ("0000" & p1(7 downto 4));
   q4<= (t1 + p2);
   q5<= ("0000" & q4);
   t2<= ("0000" & p3);
   t3<= (p4 & "0000");
   t4<= (t2 + t3);
   q6<= (t4 + q5);
   c<=  (q6 & p1(3 downto 0));  
    
end vedic_8_rtl;

-------------------------mian

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity vedic_m is
  
port(
     a,b:in std_logic_vector(15 downto 0);
     c:out std_logic_vector(31 downto 0)
     );
     
end vedic_m;


architecture vedic_m_rtl of vedic_m is

   component vedic_8 is
      
      port(
           a,b:in std_logic_vector(7 downto 0);
           c:out std_logic_vector(15 downto 0)
           );
           
  end component;

signal twa,twb:std_logic_vector(15 downto 0);

      signal p1,p2,p3,p4:std_logic_vector(15 downto 0);
      signal t1,q4:std_logic_vector(15 downto 0);
      signal t2,t3,t4,q5,q6:std_logic_vector(23 downto 0);
      signal p:std_logic_vector(31 downto 0);
      signal l:std_logic;
begin

process(a,b)
  
  begin
    
  if(a(15)='1')then
     
     twa<= ((not a) + 1);
     
  else
  
     twa<= a; 
  end if;
  
  if(b(15)='1')then
     
     twb<= ((not b) + 1);
     
  else
  
     twb<= b; 
  end if;
  
end process;


    
   u1:vedic_8 port map(twa(7 downto 0),twb(7 downto 0),p1);
   u2:vedic_8 port map(twa(15 downto 8),twb(7 downto 0),p2);
   u3:vedic_8 port map(twa(7 downto 0),twb(15 downto 8),p3);
   u4:vedic_8 port map(twa(15 downto 8),twb(15 downto 8),p4);
   
   t1<= ("00000000" & p1(15 downto 8));
   q4<= (t1 + p2);
   q5<= ("00000000" & q4);
   t2<= ("00000000" & p3);
   t3<= (p4 & "00000000");
   t4<= (t2 + t3);
   q6<= (t4 + q5);
   p<=  (q6 & p1(7 downto 0));    
   
   
process(p,a,b)
  
begin
  
   l<= (a(15) xor b(15));
   
   if(l='1')then
     
    c<= ((not p) + 1);
    
 else
   
   c<= p;
   
 end if;
 
 
 end process;
 
 end vedic_m_rtl;
  
    