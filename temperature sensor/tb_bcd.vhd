--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:27:54 02/24/2020
-- Design Name:   
-- Module Name:   D:/unmc degree/year 4/sem2/hdl/project/Temperature_sensor/tb_bcd.vhd
-- Project Name:  Temperature_sensor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: bcd
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
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
         tens : OUT  std_logic_vector(3 downto 0);
         ones : OUT  std_logic_vector(3 downto 0);
         tensth : OUT  std_logic_vector(3 downto 0);
         onesth : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal tb_number : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal tb_tens : std_logic_vector(3 downto 0);
   signal tb_ones : std_logic_vector(3 downto 0);
   signal tb_tensth : std_logic_vector(3 downto 0);
   signal tb_onesth : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: bcd PORT MAP (
          number => tb_number,
          tens => tb_tens,
          ones => tb_ones,
          tensth => tb_tensth,
          onesth => tb_onesth
        );

   -- Stimulus process
   stim_proc: process
   begin		
      loop
		
         tb_number <= std_logic_vector(unsigned(tb_number) + 1);
         
         wait for 10 ns;
      end loop;

      wait;

      wait;
   end process;

END;
