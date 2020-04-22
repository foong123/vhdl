library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity scan4digit is

Port ( 		digit0 : in  STD_LOGIC_VECTOR (6 downto 0);
				digit1 : in  STD_LOGIC_VECTOR (6 downto 0);
				digit2 : in  STD_LOGIC_VECTOR (6 downto 0);
				digit3 : in  STD_LOGIC_VECTOR (6 downto 0);
				digit4 : in  STD_LOGIC_VECTOR (6 downto 0);
				digit5 : in  STD_LOGIC_VECTOR (6 downto 0);
				clock : in  STD_LOGIC;
				an : out  STD_LOGIC_VECTOR (5 downto 0);
				ca : out  STD_LOGIC;
				cb : out  STD_LOGIC;
				cc : out  STD_LOGIC;
				cd : out  STD_LOGIC;
				ce : out  STD_LOGIC;
				cf : out  STD_LOGIC;
				cg : out  STD_LOGIC);
end scan4digit;

architecture Behavioral of scan4digit is

signal iCount16: std_logic_vector (15 downto 0) := (others=>'0');
signal iDigitOut: std_logic_vector (6 downto 0) := (others=>'0');

begin

-- Generate the scan clock 50MHz/2**16 (763Hz)
process(Clock)

begin
if Clock'event and Clock='1' then
	iCount16 <= iCount16 + '1';

end if;

end process; 
 
--Send four digits to four 7-segment display using scan mode
 
with iCount16 (15 downto 13) select

iDigitOut<= Digit0 when "000", -- Connect Digit0 to the 7-segment display
				Digit1 when "001", -- Connect Digit1 to the 7-segment display
				Digit2 when "010", -- Connect Digit2 to the 7-segment display
				Digit3 when "011", -- Connect Digit3 to the 7-segment display
				Digit4 when "100", -- Connect Digit4 to the 7-segment display
				Digit5 when "101", -- Connect Digit5 to the 7-segment display
				Digit0 when others; 
 
with iCount16 (15 downto 13) select

An <= "111110" when "000", 		-- with AN0 low only
	   "111101" when "001",       -- with AN1 low only
	   "111011" when "010",       -- with AN2 low only
	   "110111" when "011",       -- with AN3 low only
	   "101111" when "100",       -- with AN4 low only
	   "011111" when "101",       -- with AN5 low only
	   "111110" when others;
			
Ca <= iDigitOut(6);
Cb <= iDigitOut(5);
Cc <= iDigitOut(4);
Cd <= iDigitOut(3);
Ce <= iDigitOut(2);
Cf <= iDigitOut(1);
Cg <= iDigitOut(0);

end Behavioral;

