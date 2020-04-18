LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_dpram IS
END tb_dpram;
 
ARCHITECTURE behavior OF tb_dpram IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dpram
    PORT(
         Clock : IN  std_logic;
         Read_button : IN  std_logic;
         Write_button : IN  std_logic;
         DataIn : IN  std_logic_vector(23 downto 0);
			Display : OUT std_logic;
         DataOut : OUT  std_logic_vector(23 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal tb_Clock : std_logic := '0';
   signal tb_Read_button : std_logic := '0';
   signal tb_Write_button : std_logic := '0';
   signal tb_DataIn : std_logic_vector(23 downto 0) := (others => '0');

 	--Outputs
	signal tb_Display : std_logic := '0';
   signal tb_DataOut : std_logic_vector(23 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 20ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dpram PORT MAP (
          Clock => tb_Clock,
          Read_button => tb_Read_button,
          Write_button => tb_Write_button,
			 Display => tb_Display,
          DataIn => tb_DataIn,
          DataOut => tb_DataOut
        );

   -- Clock process definitions
   Clock_process :process
   begin
		tb_Clock <= '1';
		wait for Clock_period/2;
		tb_Clock <= '0';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 100ns;
		
		tb_Read_button <= '0';
		
		--write 
      tb_DataIn <= "000001010100001101010000";	--543.50
		wait for 5 * Clock_period;
      tb_Write_button   <= '1';
      wait for 5 * Clock_period;
      tb_Write_button <= '0';
      wait for 16 * Clock_period;
			
		--write	
      tb_DataIn <= "000000100011010000100101";	--234.25
		wait for 5 * Clock_period;
      tb_Write_button <= '1';
      wait for 5 * Clock_period;
      tb_Write_button <= '0';
      wait for 16 * Clock_period;
		
		--read
      tb_Read_button <= '1';		-- read 543.50 value
      wait for 5 * Clock_period;
      tb_Read_button <= '0';
		wait for 10 * Clock_period;
		
		--read
      tb_Read_button <= '1';		-- read 234.25 value
      wait for 5 * Clock_period;
      tb_Read_button <= '0';
		wait for 10 * Clock_period;
		
		--read
      tb_Read_button <= '1';		-- read 0000.00 value
      wait for 5 * Clock_period;
      tb_Read_button <= '0';
		wait for 10 * Clock_period;
		
		--read
      tb_Read_button <= '1';		-- read 0000.00 value
      wait for 5 * Clock_period;
      tb_Read_button <= '0';
		wait for 10 * Clock_period;
		
		--read
      tb_Read_button <= '1';		-- read 0000.00 value
      wait for 5 * Clock_period;
      tb_Read_button <= '0';
		wait for 10 * Clock_period;
		
		--read
      tb_Read_button <= '1';		-- read 0000.00 value
      wait for 5 * Clock_period;
      tb_Read_button <= '0';
		wait for 10 * Clock_period;
		
		--write
		tb_DataIn <= "000001010000000000000000";	--500.00
		wait for 5 * Clock_period;
      tb_Write_button <= '1';
      wait for 5 * Clock_period;
      tb_Write_button <= '0';
      wait for 16 * Clock_period;
		
		--write
		tb_DataIn <= "000100000010001101110101";	--1023.75
		wait for 5 * Clock_period;
      tb_Write_button <= '1';
      wait for 5 * Clock_period;
      tb_Write_button <= '0';
      wait for 16 * Clock_period;
		
		--read
      tb_Read_button <= '1';		-- read 543.50 value
      wait for 5 * Clock_period;
      tb_Read_button <= '0';
		wait for 5 * Clock_period;
		
		--read
      tb_Read_button <= '1';		-- read 234.25 value
      wait for 5 * Clock_period;
      tb_Read_button <= '0';
		wait for 5 * Clock_period;
		
		--read
      tb_Read_button <= '1';		-- read 500.00 value
      wait for 5 * Clock_period;
      tb_Read_button <= '0';
		wait for 5 * Clock_period;
		
		--read
      tb_Read_button <= '1';		-- read 1023.75 value
      wait for 5 * Clock_period;
      tb_Read_button <= '0';
		wait for 5 * Clock_period;
		
		
      wait;
   end process;

END;
