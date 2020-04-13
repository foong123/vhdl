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
         Send : OUT  std_logic;
         DataOut : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal tb_Clock : std_logic := '0';
   signal tb_MISO : std_logic := '0';
   signal tb_Reset : std_logic := '0';

 	--Outputs
   signal tb_SCLK : std_logic;
   signal tb_CS : std_logic;
   signal tb_Send : std_logic;
   signal tb_DataOut : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
	
	--DataIn is in LSB to MSB
	--tb_DataOut will be same as DataIn but in MSB to LSB, example DataIn 0110 DataOut 0110
	constant Data1: std_logic_vector(0 to 15) := "1100001111110000";		-- 2174
	constant Data2: std_logic_vector(0 to 15) := "1111000011110000";		-- 3614
	constant Data3: std_logic_vector(0 to 15) := "1100101001010011";		-- 3614
	constant Data4: std_logic_vector(0 to 15) := "0110100100011000";		-- 3363
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SPI PORT MAP (
          Clock => tb_Clock,
          MISO => tb_MISO,
          Reset => tb_Reset,
          SCLK => tb_SCLK,
          CS => tb_CS,
          Send => tb_Send,
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
      wait for tb_Clock16x_period;
      tb_Reset <= '0';
      wait for tb_Clock16x_period;
		
		wait for 330ms;
		wait for 130ns;
		--Write data
      for i in 0 to 15 loop

			tb_MISO <= Data1(i);
			wait for 320 ns;
      end loop;
		
		tb_MISO <= '0';
		
		wait for 330ms;
		wait for 270ns;
		--Write data
		for i in 0 to 15 loop

			tb_MISO <= Data2(i);
			wait for 320 ns;

      end loop;
		
		tb_MISO <= '0';
		wait for 330ms;
		wait for 590ns;
		--Write data
		for i in 0 to 15 loop

			tb_MISO <= Data3(i);
			wait for 320 ns;

      end loop;
		
		tb_MISO <= '0';
		
		wait for 330ms;
		wait for 590ns;
		--Write data
		for i in 0 to 15 loop

			tb_MISO <= Data4(i);
			wait for 320 ns;

      end loop;
		
      wait;
   end process;

END;
