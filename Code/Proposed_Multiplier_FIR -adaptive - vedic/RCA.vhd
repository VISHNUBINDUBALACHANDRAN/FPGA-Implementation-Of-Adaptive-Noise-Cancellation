library ieee;
    use ieee.std_logic_1164.all;
      
entity RCA is
  generic ( n : integer := 8);
    port(a,b:in std_logic_vector(n-1 downto 0);
         cin:in std_logic;
         s:out std_logic_vector(n-1 downto 0);
         cout:out std_logic
         );
end RCA;

Architecture operation of RCA is
    procedure full_adder (
          a,b,c:in std_logic;
          variable sum:out std_logic;
          variable carry:out std_logic )is
         begin
           sum:=a xor b xor c;
           carry:=(a and b) or (b and c) or (c and a);
         end full_adder;
          
          begin
            process(a,b,cin)
              variable c,su:std_logic_vector(n-1 downto 0);
              begin
                full_adder(a(0),b(0),cin,su(0),c(0));
                for i in 1 to n-1 loop
                full_adder(a(i),b(i),c(i-1),su(i),c(i));
                end loop;
                s<=su;
                cout<=c(n-1);
             end process;
        end operation;

