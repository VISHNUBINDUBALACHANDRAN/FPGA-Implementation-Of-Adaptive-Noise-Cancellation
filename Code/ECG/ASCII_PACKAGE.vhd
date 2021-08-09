
library IEEE;
use IEEE.STD_LOGIC_1164.all;

package ASCII_PACKAGE is
   type tx_vec is array (0 to 1) of std_logic_vector(7 downto 0);
 type dis_array	is array(1 to 80) of std_logic_vector(7 downto 0);	
-- The numbers 
	constant ONE   :	std_logic_vector(7 downto 0) := "00110001";
	constant TWO   :	std_logic_vector(7 downto 0) := "00110010";
	constant THREE :	std_logic_vector(7 downto 0) := "00110011";
	constant FOUR  :	std_logic_vector(7 downto 0) := "00110100";
	constant FIVE  :	std_logic_vector(7 downto 0) := "00110101";
	constant SIX   :	std_logic_vector(7 downto 0) := "00110110";
	constant SEVEN :	std_logic_vector(7 downto 0) := "00110111";
	constant EIGHT :	std_logic_vector(7 downto 0) := "00111000";
	constant NINE  :	std_logic_vector(7 downto 0) := "00111001";
	constant ZERO  :	std_logic_vector(7 downto 0) := "00110000";
	
-- THE CHARACTERS 

	constant A :	std_logic_vector(7 downto 0) := "01000001";
	constant B :	std_logic_vector(7 downto 0) := "01000010";
	constant C :	std_logic_vector(7 downto 0) := "01000011";
	constant D :	std_logic_vector(7 downto 0) := "01000100";
	constant E :	std_logic_vector(7 downto 0) := "01000101";
	constant F :	std_logic_vector(7 downto 0) := "01000110";
	constant G :	std_logic_vector(7 downto 0) := "01000111";
	constant H :	std_logic_vector(7 downto 0) := "01001000";
	constant I :	std_logic_vector(7 downto 0) := "01001001";
	constant J :	std_logic_vector(7 downto 0) := "01001010";
	constant K :	std_logic_vector(7 downto 0) := "01001011";
	constant L :	std_logic_vector(7 downto 0) := "01001100";
	constant M :	std_logic_vector(7 downto 0) := "01001101";
	constant N :	std_logic_vector(7 downto 0) := "01001110";
	constant O :	std_logic_vector(7 downto 0) := "01001111";
	constant P :	std_logic_vector(7 downto 0) := "01010000";
	constant Q :	std_logic_vector(7 downto 0) := "01010001";
	constant R :	std_logic_vector(7 downto 0) := "01010010";
	constant S :	std_logic_vector(7 downto 0) := "01010011";
	constant T :	std_logic_vector(7 downto 0) := "01010100";
	constant U :	std_logic_vector(7 downto 0) := "01010101";
	constant V :	std_logic_vector(7 downto 0) := "01010110";
	constant W :	std_logic_vector(7 downto 0) := "01010111";
	constant X :	std_logic_vector(7 downto 0) := "01011000";
	constant Y :	std_logic_vector(7 downto 0) := "01011001";
	constant Z :	std_logic_vector(7 downto 0) := "01011010";
----
-- SMAL LETTERS
	constant SA :	std_logic_vector(7 downto 0) := "01100001";
	constant SB :	std_logic_vector(7 downto 0) := "01100010";
	constant SC :	std_logic_vector(7 downto 0) := "01100011";
	constant SD :	std_logic_vector(7 downto 0) := "01100100";
	constant SE :	std_logic_vector(7 downto 0) := "01100101";
	constant SF :	std_logic_vector(7 downto 0) := "01100110";
	constant SG :	std_logic_vector(7 downto 0) := "01100111";
	constant SH :	std_logic_vector(7 downto 0) := "01101000";
	constant SI :	std_logic_vector(7 downto 0) := "01101001";
	constant SJ :	std_logic_vector(7 downto 0) := "01101010";
	constant SK :	std_logic_vector(7 downto 0) := "01101011";
	constant SL :	std_logic_vector(7 downto 0) := "01101100";
	constant SM :	std_logic_vector(7 downto 0) := "01101101";
	constant SN :	std_logic_vector(7 downto 0) := "01101110";
	constant SO :	std_logic_vector(7 downto 0) := "01101111";
	constant SP :	std_logic_vector(7 downto 0) := "01110000";
	constant SQ :	std_logic_vector(7 downto 0) := "01110001";
	constant SR :	std_logic_vector(7 downto 0) := "01110010";
	constant SS :	std_logic_vector(7 downto 0) := "01110011";
	constant ST :	std_logic_vector(7 downto 0) := "01110100";
	constant SU :	std_logic_vector(7 downto 0) := "01110101";
	constant SV :	std_logic_vector(7 downto 0) := "01110110";
	constant SW :	std_logic_vector(7 downto 0) := "01110111";
	constant SX :	std_logic_vector(7 downto 0) := "01111000";
	constant SY :	std_logic_vector(7 downto 0) := "01111001";
	constant SZ :	std_logic_vector(7 downto 0) := "01111010";
--
---THE symbols
	constant SPACE:	std_logic_vector(7 downto 0) := "00100000";
	constant SLASH:	std_logic_vector(7 downto 0) := "00101111";
	constant MINUS:	std_logic_vector(7 downto 0) := "00101101";
	constant EQUAL:	std_logic_vector(7 downto 0) := "00111101";
	constant PLUS :	std_logic_vector(7 downto 0) := "00101011";
	constant STAR :	std_logic_vector(7 downto 0) := "00101010";
   constant QUOTS :	std_logic_vector(7 downto 0) := "00100010";
   constant ARROW_OUT :	std_logic_vector(7 downto 0) := "00111110";
	constant ARROW_IN :	std_logic_vector(7 downto 0) := "00111100";
	constant OPEN_PAR :	std_logic_vector(7 downto 0) := "00111100" ;
	constant CLOSE_PAR :	std_logic_vector(7 downto 0) := "00111110";
	constant DOT :	std_logic_vector(7 downto 0) := "00101110";
	constant ENTER :	std_logic_vector(7 downto 0) := "00001101";
	constant UP_ARROW :	std_logic_vector(7 downto 0) := "00011000";
   constant COLON :	std_logic_vector(7 downto 0) := "00111010";
   constant SET_DD_RAM_Address_80 :	std_logic_vector(7 downto 0) := "10000000";
	constant DISPLAY_ON :	std_logic_vector(7 downto 0) := "00001100";
	constant FUNCTION_SET :	std_logic_vector(7 downto 0) := "00111000";


end ASCII_PACKAGE;


