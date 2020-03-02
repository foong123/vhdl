--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:44:11 03/02/2020
-- Design Name:   
-- Module Name:   D:/unmc degree/year 4/sem2/hdl/project/bcd_led_rs232txd/tb_Rs232Txd.vhd
-- Project Name:  bcd_led_rs232txd
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Rs232Txd
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_Rs232Txd IS
END tb_Rs232Txd;
 
ARCHITECTURE behavior OF tb_Rs232Txd IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Rs232Txd
    PORT(
			Reset : IN std_logic;
         Clock16x : IN  std_logic;
         Send : IN  std_logic;
         DataIn : IN  std_logic_vector(15 downto 0);
         Txd : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
	signal tb_Reset : std_logic := '0';
   signal tb_Clock16x : std_logic := '0';
   signal tb_Send : std_logic := '0';
   signal tb_DataIn : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal tb_Txd : std_logic;

   -- Clock period definitions
   constant Clock16x_period : time := 6.5 us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Rs232Txd PORT MAP (
			 Reset => tb_Reset,
          Clock16x => tb_Clock16x,
          Send => tb_Send,
          DataIn => tb_DataIn,
          Txd => tb_Txd
        );

   -- Clock process definitions
   Clock16x_process :process
   begin
		tb_Clock16x <= '0';
		wait for Clock16x_period/2;
		tb_Clock16x <= '1';
		wait for Clock16x_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;

		--Reset Everything
      tb_Reset <= '1';
      wait for 1.5 * Clock16x_period;
      tb_Reset <= '0';
      wait for Clock16x_period;

      tb_DataIn <= "0000000111011100";		--01.50
      wait for Clock16x_period;
		
      tb_Send <= '1';
      wait for 5 * Clock16x_period;
      tb_Send <= '0';
      wait for 1500 * Clock16x_period;
		
		tb_DataIn <= "0010001111111101";		--23.75
      wait for Clock16x_period;

      --Send button
      tb_Send <= '1';
      wait for 5 * Clock16x_period;
      tb_Send <= '0';
      wait for 1500 * Clock16x_period;

      wait;
   end process;

END;
