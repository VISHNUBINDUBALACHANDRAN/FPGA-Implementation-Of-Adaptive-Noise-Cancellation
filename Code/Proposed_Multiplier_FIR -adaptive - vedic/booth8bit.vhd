library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;
   entity booth_8 is
        port(i1:in std_logic_vector(7 downto 0):="01011101";
             i2:in std_logic_vector(7 downto 0):="01010001";
              output:out std_logic_vector(15 downto 0)
              );
      end booth_8;
architecture multiple11 of booth_8 is   
function full_adder (q,r,t:std_logic) return std_logic_vector is
variable output1:std_logic_vector(1 downto 0);
 begin
    output1(0):= q xor r xor t;
    output1(1):= (q and r) or (r and t) or (t and q);
  return output1;
 end full_adder; 
           
       component two_comp
           port(a:in std_logic_vector(9 downto 0);
                y:out std_logic_vector(10 downto 0));
         end component;
     signal a,b,c,d,e:std_logic_vector(19 downto 0);
     signal u:std_logic_vector(9 downto 0);
     signal e0,e1,e2,e3,e4,f,g,h,j,p:std_logic_vector(10 downto 0);
     signal k,L,m,n,nn:std_logic_vector(2 downto 0);
     signal sum,sum1,sum2,sum3:std_logic_vector(19 downto 0);
     signal cy,cy1,cy2,cy3:std_logic_vector(20 downto 0);
     signal x,y:std_logic_vector(9 downto 0);
     begin
    process(i1,i2,x,y,a,b,c,d,e,e0,e1,e2,e3,e4,f,g,h,u,j,k,l,m,n,nn,p,sum,sum1,sum2,sum3,cy,cy1,cy2,cy3)
       variable temp:std_logic_vector(1 downto 0);
          begin
            
         x <= "00"&i1;
         y <= "00"&i2;
            
         h<=x&'0';
        k<=h(2 downto 0);
           case k is
               when "000"=> e0 <="00000000000";
               when "111"=> e0 <="00000000000";
               when "001"=> e0 <= ('0'&y);
               when "010"=> e0 <= ('0'&y);
               when "011"=> e0 <= f;
               when "100"=> e0 <= p;
               when "101"=> e0 <= g;
               when "110"=> e0 <= g;
                when others=>
           end case;
           a<=sxt(e0,20);
        L<=h(4 downto 2);
           case L is
               when "000"=> e1 <="00000000000";
               when "111"=> e1 <="00000000000";
               when "001"=> e1 <= ('0'&y);
               when "010"=> e1 <= ('0'&y);
               when "011"=> e1 <= f;
               when "100"=> e1 <= p;
               when "101"=> e1 <= g;
               when "110"=> e1 <= g;
                when others=>
           end case;
           b<=sxt(e1,18)&"00"; 
        m<=h(6 downto 4);
           case m is 
               when "000"=> e2 <="00000000000";
               when "111"=> e2 <="00000000000";
               when "001"=> e2 <= ('0'&y);
               when "010"=> e2 <= ('0'&y);
               when "011"=> e2 <= f;
               when "100"=> e2 <= p;
               when "101"=> e2 <= g;
               when "110"=> e2 <= g;
                when others=>
            end case;
            c<=sxt(e2,16)& "0000";
        n<=h(8 downto 6);
            case n is
               when "000"=> e3 <="00000000000";
               when "111"=> e3 <="00000000000";
               when "001"=> e3 <= ('0'&y);
               when "010"=> e3 <= ('0'&y);
               when "011"=> e3 <= f;
               when "100"=> e3 <= p;
               when "101"=> e3 <= g;
               when "110"=> e3 <= g;
                when others=>
            end case;
            d<=sxt(e3,14)&"000000";
        nn <= h(10 downto 8);
	     case nn is
               when "000"=> e4 <="00000000000";
               when "111"=> e4 <="00000000000";
               when "001"=> e4 <= ('0'&y);
               when "010"=> e4 <= ('0'&y);
               when "011"=> e4 <= f;
               when "100"=> e4 <= p;
               when "101"=> e4 <= g;
               when "110"=> e4 <= g;
                when others=>
            end case;
            e<=sxt(e4,12)&"00000000";
           
   cy(0)<='0';      
     for i in 0 to 19 loop
      temp:=full_adder(a(i),b(i),cy(i));
      sum(i)<=temp(0);
     cy(i+1)<=temp(1);
     end loop;
   cy1(0)<='0';
     for i in 0 to 19 loop
      temp:=full_adder(c(i),sum(i),cy1(i));
      sum1(i)<=temp(0);
      cy1(i+1)<=temp(1);
     end loop;
   cy2(0)<='0';
     for i in 0 to 19 loop
      temp:=full_adder(d(i),sum1(i),cy2(i));
      sum2(i)<=temp(0);
      cy2(i+1)<=temp(1);
     end loop;
    cy3(0)<='0';
     for i in 0 to 19 loop
      temp:=full_adder(e(i),sum2(i),cy3(i));
      sum3(i)<=temp(0);
      cy3(i+1)<=temp(1);
     end loop;
     
    end process;
           l1:two_comp port map(y,j);
               u<=j(9 downto 0);
               g<=sxt(u,11);
               f<= y & '0';
               p<= j(9 downto 0) & '0';
           output<=sum3(15 downto 0);
end multiple11;