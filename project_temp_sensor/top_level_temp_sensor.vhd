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
			DataOut: out std_logic_vector (23 downto 0));

end component;

component Rs232Txd

	port( Reset,Clock,Clock16x,Send,Send_DPRAM: in std_logic;
			DataIn,DataInDPRAM: std_logic_vector (23 downto 0);
			Txd: out std_logic);

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

signal i_converted_number,i_converted_number_DPRAM : std_logic_vector (23 downto 0) := (others => '0');
signal iClockDiv: std_logic_vector(12 downto 0) := (others => '0');
signal iDisplay,iSend_DPRAM,iClock1x: std_logic;

begin

SPI_power <= '1';		--SPI power supply

--for the RS232 clock
process (SystemClock)
begin
	
	if SystemClock'event and SystemClock = '1' then
		if Reset = '1' then
			iClockDiv <= (others=>'0');
		elsif iClockDiv = "1101000100111" then -- the divider is 325, or "101000101"
			iClockDiv <= "0010111011000";
		else 
			iClockDiv <= iClockDiv + '1';
		end if;
	end if;
	
end process;

iClock1x <= iClockDiv(12);

U1: LED_controller port map (
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
	
U2: Rs232Txd port map (
	Reset => Reset,
	Clock => SystemClock,
	Clock16x => iClock1x,
	Send => iDisplay,
	Send_DPRAM => iSend_DPRAM,
	DataIn => i_converted_number,
	DataInDPRAM => i_converted_number_DPRAM,
	Txd => Txd);

U3: SPI port map (
	Clock => SystemClock,
	MISO => MISO,
	Reset => Reset,
	SCLK => SCLK,
	CS => CS,
	Convert => iDisplay,
	DataOut => i_converted_number);
	
U4: LCD_Controller port map (
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

U5: dpram port map (
	  Clock => SystemClock,
	  Read_button => Read_button,
	  Write_button => Write_button,
	  DataIn => i_converted_number,
	  Display => iSend_DPRAM,
	  DataOut => i_converted_number_DPRAM);
	
end Behavioral;