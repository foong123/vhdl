----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:15:22 10/16/2019 
-- Design Name: 
-- Module Name:    full_adder_top_level - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity full_adder_top_level is
    Port ( carry_in : in  STD_LOGIC;
           a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           sum_out : out  STD_LOGIC;
           carry_out : out  STD_LOGIC);
end full_adder_top_level;

architecture Behavioral of full_adder_top_level is

Component half_adder
	
	Port( a,b	:	in 	STD_LOGIC;
			sum_out, carry_out : out	STD_LOGIC);
End Component;

signal s_s,c1,c2: STD_LOGIC ;

begin

	HA1:	half_adder port map(a,b,s_s,c1);
	HA2:	half_adder port map (s_s,carry_in,sum_out,c2);
	carry_out <=c1 or c2 ;


end Behavioral;

