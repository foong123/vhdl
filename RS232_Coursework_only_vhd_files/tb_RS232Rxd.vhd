--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:21:49 10/25/2019
-- Design Name:   
-- Module Name:   D:/unmc degree/year 4/sem 1/hdl/hdl_git/RS232/tb_RS232Rxd.vhd
-- Project Name:  RS232
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Rs232Rxd
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
 
ENTITY tb_RS232Rxd IS
END tb_RS232Rxd;
 
ARCHITECTURE behavior OF tb_RS232Rxd IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Rs232Rxd
    PORT(
         Reset : IN  std_logic;
         Clock16x : IN  std_logic;
         Rxd : IN  std_logic;
         DataOut1 : OUT  std_logic_vector(7 downto 0);
         DataOut2 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal tb_Reset : std_logic := '0';
   signal tb_Clock16x : std_logic := '0';
   signal tb_Rxd : std_logic := '0';

 	--Outputs
   signal tb_DataOut1 : std_logic_vector(7 downto 0);
   signal tb_DataOut2 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant Clock16x_period : time := 6.5 us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Rs232Rxd PORT MAP (
          Reset => tb_Reset,
          Clock16x => tb_Clock16x,
          Rxd => tb_Rxd,
          DataOut1 => tb_DataOut1,
          DataOut2 => tb_DataOut2
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

      wait for Clock16x_period*10;

      -- insert stimulus here 
		
		tb_Reset <= '1';
      wait for 1.5 * Clock16x_period;
      tb_Reset <= '0';
		
      tb_Rxd   <= '1';
      wait for 5.5 * Clock16x_period;
		
      tb_Rxd <= '0'; -- Start bit
      wait for 16 * Clock16x_period;
		
		-- 10001000 (dataIn)
      tb_Rxd <= '0'; -- Bit 0
      wait for 16 * Clock16x_period;
      tb_Rxd <= '0'; -- Bit 1
      wait for 16 * Clock16x_period;
      tb_Rxd <= '0'; -- Bit 2
      wait for 16 * Clock16x_period;
      tb_Rxd <= '1'; -- Bit 3
      wait for 16 * Clock16x_period;
      tb_Rxd <= '0'; -- Bit 4
      wait for 16 * Clock16x_period;
      tb_Rxd <= '0'; -- Bit 5
      wait for 16 * Clock16x_period;
      tb_Rxd <= '0'; -- Bit 6
      wait for 16 * Clock16x_period;
      tb_Rxd <= '1'; -- Bit 7
      wait for 16 * Clock16x_period;

      tb_Rxd <= '1'; -- Stop bit
      wait for 16 * Clock16x_period;
		
      tb_Rxd <= '0'; -- Start bit
      wait for 16 * Clock16x_period;
		
		-- 11111111 (dataIn)
      tb_Rxd <= '1'; -- Bit 0
      wait for 16 * Clock16x_period;
      tb_Rxd <= '1'; -- Bit 1
      wait for 16 * Clock16x_period;
      tb_Rxd <= '1'; -- Bit 2
      wait for 16 * Clock16x_period;
      tb_Rxd <= '1'; -- Bit 3
      wait for 16 * Clock16x_period;
      tb_Rxd <= '1'; -- Bit 4
      wait for 16 * Clock16x_period;
      tb_Rxd <= '1'; -- Bit 5
      wait for 16 * Clock16x_period;
      tb_Rxd <= '1'; -- Bit 6
      wait for 16 * Clock16x_period;
      tb_Rxd <= '1'; -- Bit 7
      wait for 16 * Clock16x_period;

      tb_Rxd <= '1'; -- Stop bit
      wait for 16 * Clock16x_period;

		--testing for the reset button 
		wait for 16 * Clock16x_period;
		tb_Reset <= '1';
      wait for 1.5 * Clock16x_period;
      tb_Reset <= '0';
		
		--DataIn1 and 2 is now 00000000
		
      tb_Rxd <= '0'; -- Start bit
      wait for 16 * Clock16x_period;
				
		-- 10101010 (dataIn)
      tb_Rxd <= '0'; -- Bit 0
      wait for 16 * Clock16x_period;
      tb_Rxd <= '1'; -- Bit 1
      wait for 16 * Clock16x_period;
      tb_Rxd <= '0'; -- Bit 2
      wait for 16 * Clock16x_period;
      tb_Rxd <= '1'; -- Bit 3
      wait for 16 * Clock16x_period;
      tb_Rxd <= '0'; -- Bit 4
      wait for 16 * Clock16x_period;
      tb_Rxd <= '1'; -- Bit 5
      wait for 16 * Clock16x_period;
      tb_Rxd <= '0'; -- Bit 6
      wait for 16 * Clock16x_period;
      tb_Rxd <= '1'; -- Bit 7
      wait for 16 * Clock16x_period;

      tb_Rxd <= '1'; -- Stop bit
      wait for 16 * Clock16x_period;
		
		tb_Rxd <= '0'; -- Start bit
      wait for 16 * Clock16x_period;
		
		-- 01010101 (dataIn)
      tb_Rxd <= '1'; -- Bit 0
      wait for 16 * Clock16x_period;
      tb_Rxd <= '0'; -- Bit 1
      wait for 16 * Clock16x_period;
      tb_Rxd <= '1'; -- Bit 2
      wait for 16 * Clock16x_period;
      tb_Rxd <= '0'; -- Bit 3
      wait for 16 * Clock16x_period;
      tb_Rxd <= '1'; -- Bit 4
      wait for 16 * Clock16x_period;
      tb_Rxd <= '0'; -- Bit 5
      wait for 16 * Clock16x_period;
      tb_Rxd <= '1'; -- Bit 6
      wait for 16 * Clock16x_period;
      tb_Rxd <= '0'; -- Bit 7
      wait for 16 * Clock16x_period;

      tb_Rxd <= '1'; -- Stop bit
      wait for 16 * Clock16x_period;

      wait;
   end process;

END;
