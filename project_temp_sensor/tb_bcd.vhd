LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_bcd IS
END tb_bcd;
 
ARCHITECTURE behavior OF tb_bcd IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT bcd
    PORT(
         DataIn : IN  std_logic_vector(11 downto 0);
         Clock : IN  std_logic;
         Reset : IN  std_logic;
         Convert : IN  std_logic;
         Display : OUT  std_logic;
         converted_number : OUT  std_logic_vector(23 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal tb_DataIn : std_logic_vector(11 downto 0) := (others => '0');
   signal tb_Clock : std_logic := '0';
   signal tb_Reset : std_logic := '0';
   signal tb_Convert : std_logic := '0';

 	--Outputs
   signal tb_Display : std_logic;
   signal tb_converted_number : std_logic_vector(23 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 6.52us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: bcd PORT MAP (
          DataIn => tb_DataIn,
          Clock => tb_Clock,
          Reset => tb_Reset,
          Convert => tb_Convert,
          Display => tb_Display,
          converted_number => tb_converted_number
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      tb_Reset <= '1';
      wait for Clock_period * 5;
      tb_Reset <= '0';
		wait for 100ns;
		
		--Insert Stimulus here
		tb_Convert <= '1';
		tb_DataIn <= "100001111110";		-- 2174	converted = 543.50 / 0000 0101 0100 0011 0101 0000
      wait for Clock_period * 2;
      tb_Convert <= '0';
		wait for 10us;
		
		tb_convert <= '1';
		tb_DataIn <= "001110101001";		-- 937 	converted = 234.25 / 0000 0010 0011 0100 0010 0101
      wait for clock_period * 2;
      tb_convert <= '0';
		wait for 10us;

		tb_convert <= '1';
		tb_DataIn <= "011111010000";		-- 2000	converted = 500.00 / 0000 0101 0000 0000 0000 0000
      wait for clock_period * 2;
      tb_convert <= '0';
		wait for 10us;

		tb_convert <= '1';
		tb_DataIn <= "111111111111";		-- 4095	converted = 1023.75 / 0001 0000 0010 0011 0111 0101
      wait for clock_period * 2;
      tb_convert <= '0';
		wait for 10us;
      wait;
   end process;

END;
