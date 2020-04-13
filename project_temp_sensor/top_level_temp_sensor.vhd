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

	port( Reset,SystemClock,MISO,Read_button,Write_button: in std_logic;
			An: out std_logic_vector (5 downto 0);
			SF_D: out std_logic_vector (3 downto 0);
			Txd, SPI_power, SCLK,CS, LCD_En, LCD_RS, LCD_RW, SF_CE0, Ca, Cb, Cc, Cd, Ce, Cf, Cg: out std_logic);
			
end top_level_temp_sensor;

architecture Behavioral of top_level_temp_sensor is

component SPI

	port( Clock,MISO,Reset: in std_logic;
			SCLK,CS,Convert: out std_logic;
			DataOut: out std_logic_vector (11 downto 0));

end component;

component Rs232Txd

	port( Reset,Clock16x,Send,Send_DPRAM: in std_logic;
			DataIn,DataInDPRAM: std_logic_vector (23 downto 0);
			Txd: out std_logic);

end component; 

component bcd

  port ( DataIn: in std_logic_vector (11 downto 0);
  			Clock16x,Reset,Convert : in std_logic;
			Display : out std_logic;
			converted_number: out std_logic_vector (23 downto 0));

end component;

component LED_Controller

  port ( Clock: in std_logic;
			DataIn: in std_logic_vector (23 downto 0);
			An : out std_logic_vector(5 downto 0);
			Ca, Cb, Cc, Cd, Ce, Cf, Cg: out std_logic);

end component;

component LCD_Controller

	port(	Clock,Reset,Display,Display_DPRAM: in std_logic; 
			DataIn,DataInDPRAM: std_logic_vector (23 downto 0);
			SF_D: out std_logic_vector (3 downto 0);
			LCD_En,LCD_RS,LCD_RW,SF_CE0: out std_logic); 

end component;

component dpram
	port (
        Clock,Read_button,Write_button   : in std_logic;
        DataIn  : in std_logic_vector(23 downto 0);
        Display : out std_logic;
        DataOut : out std_logic_vector(23 downto 0));
end component;

signal i_DataIn : std_logic_vector (11 downto 0) := (others => '0');	-- for SPI output
signal i_converted_number,i_converted_number_DPRAM : std_logic_vector (23 downto 0) := (others => '0');	-- for Binary to BCD output
signal iClock16x,iConvert,iDisplay,iSend_DPRAM: std_logic;
signal iCount9: std_logic_vector (8 downto 0) := (others=>'0');	-- for RS232

begin

SPI_power <= '1';		--SPI power supply

--for the RS232 clock
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
	DataIn => i_DataIn,			
	Clock16x => iClock16x,
	Reset => Reset,
	Convert => iConvert,
	Display => iDisplay,
	converted_number => i_converted_number);
	
U2: LED_controller port map (
	Clock => SystemClock,
	DataIn => i_converted_number,
	An => An,
	Ca => Ca,
	Cb => Cb,
	Cc => Cc,
	Cd => Cd,
	Ce => Ce,
	Cf => Cf,
	Cg => Cg);
	
U3: Rs232Txd port map (
	Reset => Reset,
	Clock16x => iClock16x,
	Send => iDisplay,
	Send_DPRAM => iSend_DPRAM,
	DataIn => i_converted_number,
	DataInDPRAM => i_converted_number_DPRAM,
	Txd => Txd);

U4: SPI port map (
	Clock => SystemClock,
	MISO => MISO,
	Reset => Reset,
	SCLK => SCLK,
	CS => CS,
	Convert => iConvert,
	DataOut => i_DataIN);
	
U5: LCD_Controller port map (
	Clock => SystemClock,
	Reset => Reset,
	Display => iDisplay,
	Display_DPRAM => iSend_DPRAM,
	DataIn => i_converted_number,
	DataInDPRAM => i_converted_number_DPRAM,
	SF_D => SF_D,
	LCD_En => LCD_En,
	LCD_RS => LCD_RS,
	LCD_RW => LCD_RW,
	SF_CE0 => SF_CE0);

U6: dpram port map (
	  Clock => iClock16x,
	  Read_button => Read_button,
	  Write_button => Write_button,
	  DataIn => i_converted_number,
	  Display => iSend_DPRAM,
	  DataOut => i_converted_number_DPRAM);
	
end Behavioral;