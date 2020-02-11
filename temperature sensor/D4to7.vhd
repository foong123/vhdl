----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:34:16 02/11/2020 
-- Design Name: 
-- Module Name:    D4to7 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
 use IEEE.STD_LOGIC_1164.ALL;
 use IEEE.STD_LOGIC_ARITH.ALL;
 use IEEE.STD_LOGIC_UNSIGNED.ALL; 
 
---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code
--library UNISIM;
--use UNISIM.VComponents.all; 
 
entity D4to7 is

	Port(	q : in  STD_LOGIC_VECTOR (3 downto 0);
			seg : out  STD_LOGIC_VECTOR (6 downto 0));
			
end D4to7; 
	  
architecture Behavioral of D4to7 is 
 
begin
Seg<=	"0000001" when q = "0000" else
		"1001111" when q = "0001" else
		"0010010" when q = "0010" else
		"0000110" when q = "0011" else
		"1001100" when q = "0100" else
		"0100100" when q = "0101" else
		"0100000" when q = "0110" else
		"0001111" when q = "0111" else
		"0000000" when q = "1000" else
		"0000100" when q = "1001" else
		"0001000" when q = "1010" else
		"1100000" when q = "1011" else
		"0110001" when q = "1100" else
		"1000010" when q = "1101" else
		"0110000" when q = "1110" else
		"0111000" when q = "1111" else
		"1111111"; 
 
end Behavioral;

