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
         number : IN  std_logic_vector(7 downto 0);
         converted_number : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal tb_number : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal tb_converted_number : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: bcd PORT MAP (
          number => tb_number,
          converted_number => tb_converted_number
        );
 
   -- Stimulus process
   stim_proc: process
   begin	

		loop
		
         tb_number <= std_logic_vector(unsigned(tb_number) + 1);
         
         wait for 20 ns;
			
      end loop;

	wait;
   end process;

END;
