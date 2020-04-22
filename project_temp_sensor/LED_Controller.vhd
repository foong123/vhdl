library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity LED_Controller is
port (Clock : in std_logic;
		DataIn : in std_logic_vector (23 downto 0);
		an : out  std_logic_vector (5 downto 0);
		ca : out  std_logic;
		cb : out  std_logic;
		cc : out  std_logic;
		cd : out  std_logic;
		ce : out  std_logic;
		cf : out  std_logic;
		cg : out  std_logic);
end LED_Controller;

architecture Behavioral of LED_Controller is

signal iCount16: std_logic_vector (15 downto 0) := (others=>'0');
signal iDigitOut: std_logic_vector (6 downto 0) := (others=>'0');
signal iSeg: std_logic_vector (3 downto 0);

begin

-- Generate the scan clock 50MHz/2**16 (763Hz)
process(Clock)
begin
if Clock'event and Clock='1' then
	iCount16 <= iCount16 + '1';
end if;

end process; 
		
--Send 6 digits to 6 7-segment display using scan mode
with iCount16 (15 downto 13) select
iSeg <= 	DataIn(3 downto 0) when "000", -- Connect Digit0 to the 7-segment display
			DataIn(7 downto 4) when "001", -- Connect Digit1 to the 7-segment display
			DataIn(11 downto 8) when "010", -- Connect Digit2 to the 7-segment display
			DataIn(15 downto 12) when "011", -- Connect Digit3 to the 7-segment display
			DataIn(19 downto 16) when "100", -- Connect Digit4 to the 7-segment display
			DataIn(23 downto 20) when "101", -- Connect Digit5 to the 7-segment display
			DataIn(3 downto 0) when others;
 
-- Select the position of LED
with iCount16 (15 downto 13) select
An <= "111110" when "000", 		-- with AN0 low only
	   "111101" when "001",       -- with AN1 low only
	   "111011" when "010",       -- with AN2 low only
	   "110111" when "011",       -- with AN3 low only
	   "101111" when "100",       -- with AN4 low only
	   "011111" when "101",       -- with AN5 low only
	   "111110" when others;
		
--Spartan 3E extension LED board
iDigitOut<=	"1111110" when iSeg = "0000" else  	--0
		"0110000" when iSeg = "0001" else	--1
		"1101101" when iSeg = "0010" else	--2
		"1111001" when iSeg = "0011" else	--3
		"0110011" when iSeg = "0100" else	--4
		"1011011" when iSeg = "0101" else	--5
		"1011111" when iSeg = "0110" else	--6
		"1110000" when iSeg = "0111" else	--7
		"1111111" when iSeg = "1000" else	--8
		"1111011" when iSeg = "1001" else	--9
		"0000000" when iSeg = "1010" else	--LED OFF unused
		"0000000" when iSeg = "1011" else	--LED OFF unused
		"0000000" when iSeg = "1100" else	--LED OFF unused
		"0000000" when iSeg = "1101" else	--LED OFF unused
		"0000000" when iSeg = "1110" else	--LED OFF unused
		"0000000" when iSeg = "1111" else	--LED OFF unused
		"0000000" ; --LED OFF
					
Ca <= iDigitOut(6);
Cb <= iDigitOut(5);
Cc <= iDigitOut(4);
Cd <= iDigitOut(3);
Ce <= iDigitOut(2);
Cf <= iDigitOut(1);
Cg <= iDigitOut(0);
end Behavioral;