library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
 
entity RS232 is
  port( 	Reset, Clock16x, Rxd, Send: in std_logic;
			DataIn: in std_logic_vector (7 downto 0);
			Txd: out std_logic;
			DataOut1, DataOut2: out std_logic_vector (7 downto 0)
			);
end RS232; 
 
architecture RS232_Arch of RS232 is 
 
 component Rs232Rxd
 port( 	Reset, Clock16x, Rxd: in std_logic;
			DataOut1, DataOut2: out std_logic_vector (7 downto 0));
 end component; 
 
 component Rs232Txd
 port( 	Reset,Clock16x, Send: in std_logic;
			DataIn: in std_logic_vector (7 downto 0);
			Txd: out std_logic);
 end component; 
 
begin 
 
	u1: Rs232Rxd port map(
				Reset => Reset,
				Clock16x => Clock16x,
				Rxd => Rxd,
				DataOut1 => DataOut1,
				DataOut2 => DataOut2); 
				
	u2: Rs232Txd port map(
				Reset => Reset,
				Clock16x => Clock16x,
				Send => Send,
				DataIn => DataIn,
				Txd => Txd);
 
end RS232_Arch; 