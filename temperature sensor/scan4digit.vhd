library IEEE;
 use IEEE.STD_LOGIC_1164.ALL;
 use IEEE.STD_LOGIC_ARITH.ALL;
 use IEEE.STD_LOGIC_UNSIGNED.ALL; 
 
---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all; 
 
entity scan4Digit is
     Port ( digit0 : in  STD_LOGIC_VECTOR (6 downto 0);
				digit1 : in  STD_LOGIC_VECTOR (6 downto 0);
				digit2 : in  STD_LOGIC_VECTOR (6 downto 0);
				digit3 : in  STD_LOGIC_VECTOR (6 downto 0);
				clock : in  STD_LOGIC;
				an : out  STD_LOGIC_VECTOR (3 downto 0);
				ca : out  STD_LOGIC;
				cb : out  STD_LOGIC;
				cc : out  STD_LOGIC;
				cd : out  STD_LOGIC;
				ce : out  STD_LOGIC;
				cf : out  STD_LOGIC;
				cg : out  STD_LOGIC);
	  
end scan4Digit; 
 
architecture Behavioral of scan4Digit is
signal iCount16: std_logic_vector (15 downto 0) := (others=>'0');
signal iDigitOut: std_logic_vector (6 downto 0);


begin
 
-- Generate the scan clock 50MHz/2**16 (763Hz)
process(Clock)

begin
if Clock'event and Clock='1' then
	iCount16 <= iCount16 + '1';


end if;

end process; 
 
--Send four digits to four 7-segment display using scan mode
 
with iCount16 (15 downto 14) select

iDigitOut<= Digit0 when "00", -- Connect Digit0 to the 7-segment display
				Digit1 when "01", -- Connect Digit1 to the 7-segment display
				Digit2 when "10", -- Connect Digit2 to the 7-segment display
				Digit3 when "11", -- Connect Digit3 to the 7-segment display
				Digit0 when others; 
 
with iCount16 (15 downto 14) select
An <=	"1110" when "00", -- with AN0 low only
		"1101" when "01", -- with AN1 low only
		"1011" when "10", -- with AN2 low only
		"0111" when "11", -- with AN3 low only
		"1110" when others;
			
Ca <= iDigitOut(6);
Cb <= iDigitOut(5);
Cc <= iDigitOut(4);
Cd <= iDigitOut(3);
Ce <= iDigitOut(2);
Cf <= iDigitOut(1);
Cg <= iDigitOut(0);
  
end Behavioral;