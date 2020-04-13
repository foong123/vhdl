LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_LCD_Controller IS
END tb_LCD_Controller;
 
ARCHITECTURE behavior OF tb_LCD_Controller IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LCD_Controller
    PORT(
         Clock : IN  std_logic;
         Display : IN  std_logic;
			Reset : IN  std_logic;
			Display_DPRAM : IN  std_logic;
         DataIn : IN  std_logic_vector(23 downto 0);
			DataInDPRAM : IN  std_logic_vector(23 downto 0);
         SF_D : OUT  std_logic_vector(3 downto 0);
         LCD_En : OUT  std_logic;
         LCD_RS : OUT  std_logic;
         LCD_RW : OUT  std_logic;
         SF_CE0 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal tb_Clock : std_logic := '0';
   signal tb_Display : std_logic := '0';
	signal tb_Reset : std_logic := '0';
	signal tb_Display_DPRAM : std_logic := '0';
   signal tb_DataIn : std_logic_vector(23 downto 0) := (others => '0');
	signal tb_DataInDPRAM : std_logic_vector(23 downto 0) := (others => '0');

 	--Outputs
   signal tb_SF_D : std_logic_vector(3 downto 0);
   signal tb_LCD_En : std_logic;
   signal tb_LCD_RS : std_logic;
   signal tb_LCD_RW : std_logic;
   signal tb_SF_CE0 : std_logic;

   -- Clock period definitions
   constant Clock_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LCD_Controller PORT MAP (
          Clock => tb_Clock,
          Display => tb_Display,
			 Reset => tb_Reset,
			 Display_DPRAM => tb_Display_DPRAM,
          DataIn => tb_DataIn,
			 DataInDPRAM => tb_DataInDPRAM,
          SF_D => tb_SF_D,
          LCD_En => tb_LCD_En,
          LCD_RS => tb_LCD_RS,
          LCD_RW => tb_LCD_RW,
          SF_CE0 => tb_SF_CE0
        );

   -- Clock process definitions
   Clock_process :process
   begin
		tb_Clock <= '0';
		wait for Clock_period/2;
		tb_Clock <= '1';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		
		wait for 30ms; -- for initialization
		tb_DataIn <= "000001010100001101010000";	--543.50
		wait for 1ms;
		tb_Display  <= '1';
      wait for 6.52 us;
      tb_Display <= '0';
		wait for 25ms;

      tb_Reset <= '1';
      wait for Clock_period;
      tb_Reset <= '0';
      wait for Clock_period;
		
		wait for 30ms;		--for initialization
		wait for 5ms;
		tb_DataIn <= "000000100011010000100101";	--234.25
		tb_Display  <= '1';
      wait for 6.52 us;
      tb_Display <= '0';
		wait for 27ms;
		
		tb_DataInDPRAM <= "000001010000000000000000";	--500.00
		wait for 1ms;
		tb_Display_DPRAM  <= '1';
      wait for 6.52 us;
      tb_Display_DPRAM <= '0';
		wait for 27ms;
		
		tb_DataInDPRAM <= "000100000010001101110101";	--1023.75
		wait for 1ms;
		tb_Display_DPRAM  <= '1';
      wait for 6.52 us;
      tb_Display_DPRAM <= '0';
		
		wait for 20ms;
		tb_Display_DPRAM  <= '1';
		tb_Display  <= '1';
      wait for 6.52 us;
      tb_Display_DPRAM <= '0';
		tb_Display <= '0';
      wait;
		
		
		
   end process;

END;