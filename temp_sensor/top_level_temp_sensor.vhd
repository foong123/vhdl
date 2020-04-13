library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level_temp_sensor is

	port( Reset,SystemClock,MISO: in std_logic;
			An: out std_logic_vector (5 downto 0);
			Txd,SPI_power,SCLK,CS: out std_logic;
			Ca, Cb, Cc, Cd, Ce, Cf, Cg: out std_logic);
			
end top_level_temp_sensor;

architecture Behavioral of top_level_temp_sensor is

component SPI

	port( Clock,MISO,Reset: in std_logic;
			SCLK,CS,Send: out std_logic;
			DataOut: out std_logic_vector (15 downto 0));

end component;

component Rs232Txd

	port( Reset,Clock16x,Send: in std_logic;
			DataIn: std_logic_vector (23 downto 0);
			Txd: out std_logic);

end component; 

component bcd

  port ( input_number: in std_logic_vector (11 downto 0);
			converted_number: out std_logic_vector (23 downto 0));

end component;

component D4to7

  port ( Q: in std_logic_vector (3 downto 0);
			Seg: out std_logic_vector (6 downto 0));

end component;

component scan4digit

	port(	Digit5, Digit4, Digit3, Digit2, Digit1, Digit0: in std_logic_vector(6 downto 0); 
			Clock: in std_logic;
			An : out std_logic_vector(5 downto 0);
			Ca, Cb, Cc, Cd, Ce, Cf, Cg: out std_logic); 

end component;

signal iDigitOut5, iDigitOut4, iDigitOut3, iDigitOut2, iDigitOut1, iDigitOut0: std_logic_vector (6 downto 0);
signal i_DataIN : std_logic_vector (15 downto 0) := (others => '0');
signal i_converted_number : std_logic_vector (23 downto 0) := (others => '0');
signal iClock16x,iSend: std_logic;
signal iCount9: std_logic_vector (8 downto 0) := (others=>'0');

begin

SPI_power <= '1';

--for the Rs 232 clock
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

U1: bcd port map (
	input_number => i_DataIN(14 downto 3),
	converted_number => i_converted_number);
	
U2: D4to7 port map (
	--tenth
	Q => i_converted_number(3 downto 0),
	Seg => iDigitOut0);

U3: D4to7 port map (
	--oneth
	Q => i_converted_number(7 downto 4),
	Seg => iDigitOut1);

U4: D4to7 port map (
	--ones
	Q => i_converted_number(11 downto 8),
	Seg => iDigitOut2); 
	 
U5: D4to7 port map (
	--tens
	Q => i_converted_number(15 downto 12),
	Seg => iDigitOut3);
	
U6: D4to7 port map (
	--hundreds
	Q => i_converted_number(19 downto 16),
	Seg => iDigitOut4);
	
U7: D4to7 port map (
	--thousands
	Q => i_converted_number(23 downto 20),
	Seg => iDigitOut5);
	
U8: scan4digit port map (
	Digit5 => iDigitOut5,
	Digit4 => iDigitOut4,
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
	
U9: Rs232Txd port map (
	Reset => Reset,
	Clock16x => iClock16x,
	Send => iSend,
	DataIn => i_converted_number,
	Txd => Txd);

U10: SPI port map (

	Clock => SystemClock,
	MISO => MISO,
	Reset => Reset,
	SCLK => SCLK,
	CS => CS,
	Send => iSend,
	DataOut => i_DataIN);

end Behavioral;