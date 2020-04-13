LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_SPI IS
END tb_SPI;
 
ARCHITECTURE behavior OF tb_SPI IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SPI
    PORT(
         Clock : IN  std_logic;
         MISO : IN  std_logic;
         Reset : IN  std_logic;
         SCLK : OUT  std_logic;
         CS : OUT  std_logic;
         Convert : OUT  std_logic;
         DataOut : OUT  std_logic_vector(11 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal tb_Clock : std_logic := '0';
   signal tb_MISO : std_logic := '0';
   signal tb_Reset : std_logic := '0';

 	--Outputs
   signal tb_SCLK : std_logic;
   signal tb_CS : std_logic;
   signal tb_Convert : std_logic;
   signal tb_DataOut : std_logic_vector(11 downto 0);

   -- Clock period definitions
   constant tb_Clock_period : time := 20 ns;
	
	--DataIn is in LSB to MSB
	--tb_DataOut will be same as DataIn but in MSB to LSB, example DataIn 0110 DataOut 0110
	constant Data1: std_logic_vector(0 to 15) := "0100001111110000";		-- 2174 / 87E
	constant Data2: std_logic_vector(0 to 15) := "0001110101001000";		-- 937 / 3A9
	constant Data3: std_logic_vector(0 to 15) := "0011111010000000";		-- 2000 / 7D0
	constant Data4: std_logic_vector(0 to 15) := "0111111111111000";		-- 4095 / FFF
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SPI PORT MAP (
          Clock => tb_Clock,
          MISO => tb_MISO,
          Reset => tb_Reset,
          SCLK => tb_SCLK,
          CS => tb_CS,
          Convert => tb_Convert,
          DataOut => tb_DataOut
        );

   -- Clock process definitions
   Clock_process :process
   begin
		tb_Clock <= '0';
		wait for tb_Clock_period/2;
		tb_Clock <= '1';
		wait for tb_Clock_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
   begin		
	
		--Reset Everything
      tb_Reset <= '1';
      wait for tb_Clock_period;
      tb_Reset <= '0';
      wait for tb_Clock_period;
		
		wait for 330ms;
		wait for 110ns;
		--Write data
      for i in 0 to 15 loop

			tb_MISO <= Data1(i);
			wait for 240 ns;
      end loop;
		
		tb_MISO <= '0';
		
		wait for 330ms;
		wait for 300ns;
		--Write data
		for i in 0 to 15 loop

			tb_MISO <= Data2(i);
			wait for 240 ns;

      end loop;
		
		tb_MISO <= '0';
		wait for 330ms;
		wait for 300ns;
		--Write data
		for i in 0 to 15 loop

			tb_MISO <= Data3(i);
			wait for 240 ns;

      end loop;
		
		tb_MISO <= '0';
		
		wait for 300ns;
		--Reset Everything
      tb_Reset <= '1';
      wait for tb_Clock_period;
      tb_Reset <= '0';
      wait for tb_Clock_period;
		
		wait for 330ms;
		wait for 100ns;
		--Write data
		for i in 0 to 15 loop

			tb_MISO <= Data4(i);
			wait for 240 ns;

      end loop;
		
      wait;
   end process;

END;
