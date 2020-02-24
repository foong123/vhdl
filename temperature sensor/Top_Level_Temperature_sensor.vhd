----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:26:12 02/11/2020 
-- Design Name: 
-- Module Name:    Top_Level_Temperature_sensor - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Top_Level_Temperature_sensor is

	port(	Rxd: in std_logic;
			Reset: in std_logic;
			SystemClock: in std_logic;
			Send: in std_logic;
			DataIn: in std_logic_vector (7 downto 0);
			An: out std_logic_vector (3 downto 0);
			Txd: out std_logic;
			Ca, Cb, Cc, Cd, Ce, Cf, Cg: out std_logic);
				
end Top_Level_Temperature_sensor;

architecture Behavioral of Top_Level_Temperature_sensor is

component RS232

	port( Reset, Clock16x, Rxd, Send: in std_logic;
			DataIn: std_logic_vector (7 downto 0);
			Txd: out std_logic;
			DataOut1, DataOut2: out std_logic_vector (7 downto 0));

end component; 

component bcd

  port ( number: in std_logic_vector (7 downto 0);
			tens: out std_logic_vector (3 downto 0);
			ones: out std_logic_vector (3 downto 0);
			tensth: out std_logic_vector (3 downto 0);
			onesth: out std_logic_vector (3 downto 0));

end component; 
 
component D4to7

  port ( Q: in std_logic_vector (3 downto 0);
			Seg: out std_logic_vector (6 downto 0));

end component; 
  
component scan4digit

	port(	Digit3, Digit2, Digit1, Digit0: in std_logic_vector(6 downto 0); 
			Clock: in std_logic;
			An : out std_logic_vector(3 downto 0);
			Ca, Cb, Cc, Cd, Ce, Cf, Cg: out std_logic);

end component; 
	  
signal iClock16x: std_logic; 
signal iDigitOut3, iDigitOut2, iDigitOut1, iDigitOut0: std_logic_vector (6 downto 0);
signal iDataOut1: std_logic_vector (7 downto 0);
signal iDataOut2: std_logic_vector (7 downto 0); 
signal iCount9: std_logic_vector (8 downto 0) := (others=>'0');
signal i_tensth,i_onesth,i_ones,i_tens: std_logic_vector (3 downto 0);

begin 
 
process (SystemClock)
	
	begin
	
	if SystemClock'event and SystemClock = '1' then
		if Reset = '1' then
			iCount9 <= (others=>'0');
		elsif
			iCount9 = "101000101" then -- the divider is 325, or "101000101"
			iCount9 <= (others=>'0');
		else 
			iCount9 <= iCount9 + '1';
		end if;
	end if;
	
end process;
 
iClock16x <= iCount9(8);

U1: RS232 port map (
	Reset => Reset,
	Clock16x => iClock16x,
	Rxd => Rxd,
	Send => Send,
	DataIn => DataIn,
	Txd => Txd,
	DataOut1 => iDataOut1,
	DataOut2 => iDataOut2);
	
U2: bcd port map (
		number => iDataOut1,
		tens => i_tens,
		ones => i_ones,
		tensth => i_tensth,
		onesth => i_onesth);
 
U3: D4to7 port map (
	Q => i_tensth,
	Seg => iDigitOut0);  
 
U4: D4to7 port map (
	Q => i_onesth,
	Seg => iDigitOut1);

U5: D4to7 port map ( 
	Q => i_ones,
	Seg => iDigitOut2); 
	 
U6: D4to7 port map ( 
	Q => i_tens,
	Seg => iDigitOut3);
	
--U6: D4to7 port map ( 
--	Q => bcd_huns(3 downto 0),
--	Seg => iDigitOut3);	
--
--U7: D4to7 port map ( 
--	Q => bcd_thos(3 downto 0),
--	Seg => iDigitOut3); 	
 
U7: scan4digit port map (
	Digit3 => iDigitOut3,
	Digit2 => iDigitOut2,
	Digit1 => iDigitOut1,
	Digit0 => iDigitOut0,
	Clock => SystemClock,
	An => An,
	Ca => Ca,
	Cb => Cb,
	Cc => Cc,
	Cd => Cd,
	Ce => Ce,
	Cf => Cf,
	Cg => Cg);

end Behavioral;