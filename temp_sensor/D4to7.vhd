library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity D4to7 is

	Port(	q : in  STD_LOGIC_VECTOR (3 downto 0);
			seg : out  STD_LOGIC_VECTOR (6 downto 0));
			
end D4to7; 
	  
architecture Behavioral of D4to7 is 
 
begin

--originaL D4to7 (Nexys board)
--Seg<=	"0000001" when q = "0000" else  	--0
--		"1001111" when q = "0001" else	--1
--		"0010010" when q = "0010" else	--2
--		"0000110" when q = "0011" else	--3
--		"1001100" when q = "0100" else	--4
--		"0100100" when q = "0101" else	--5
--		"0100000" when q = "0110" else	--6
--		"0001111" when q = "0111" else	--7
--		"0000000" when q = "1000" else	--8
--		"0000100" when q = "1001" else	--9
--		"1111111" when q = "1010" else	--LED OFF unused
--		"1111111" when q = "1011" else	--LED OFF unused
--		"0000001" when q = "1100" else	--0 -> decimal 0.x0
--		"0100100" when q = "1101" else	--5 -> decimal 0.50 or 0.x5
--		"0010010" when q = "1110" else	--2 -> decimal 0.25
--		"0001111" when q = "1111" else	--7 -> decimal 0.75
--		"1111111" ; --LED OFF
 
--Spartan 3E board
Seg<=	"1111110" when q = "0000" else  	--0
		"0110000" when q = "0001" else	--1
		"1101101" when q = "0010" else	--2
		"1111001" when q = "0011" else	--3
		"0110011" when q = "0100" else	--4
		"1011011" when q = "0101" else	--5
		"1011111" when q = "0110" else	--6
		"1110000" when q = "0111" else	--7
		"1111111" when q = "1000" else	--8
		"1111011" when q = "1001" else	--9
		"0000000" when q = "1010" else	--LED OFF unused
		"0000000" when q = "1011" else	--LED OFF unused
		"1111110" when q = "1100" else	--0 -> decimal 0.x0
		"1011011" when q = "1101" else	--5 -> decimal 0.50 or 0.x5
		"1101101" when q = "1110" else	--2 -> decimal 0.25
		"1110000" when q = "1111" else	--7 -> decimal 0.75
		"0000000" ; --LED OFF
 
end Behavioral;

