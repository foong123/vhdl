LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_bcd IS
END tb_bcd;
 
ARCHITECTURE behavior OF tb_bcd IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT bcd
    PORT(
         input_number : IN  std_logic_vector(11 downto 0);
         converted_number : OUT  std_logic_vector(23 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal tb_input_number : std_logic_vector(11 downto 0) := (others => '0');

 	--Outputs
   signal tb_converted_number : std_logic_vector(23 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: bcd PORT MAP (
          input_number => tb_input_number,
          converted_number => tb_converted_number
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 10 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		
		loop
		
         tb_input_number <= "100001111110";		-- 2174	converted = 543.50
			wait for 100 ns;
			tb_input_number <= "000001101011";		-- 107	converted = 26.75
			wait for 100 ns;
			tb_input_number <= "111110100000";		-- 4000	converted = 1000.00
			wait for 100 ns;
			tb_input_number <= "111000011110";		-- 3614 	converted = 903.50
			wait for 100 ns;
			tb_input_number <= "000000000010";		-- 2	converted = 0.50
			wait for 100 ns;
			tb_input_number <= "110100100011";		-- 3363	converted = 840.75
			wait for 100 ns;
			tb_input_number <= "111111110101";		-- 4085	converted = 1021.25
			wait for 100 ns;
			tb_input_number <= "000000000011";		-- 3	converted = 0.75
			wait for 100 ns;
			tb_input_number <= "111111111111";		-- 4095	converted = 1023.75
			wait for 100 ns;
			
      end loop;


      wait;
   end process;

END;