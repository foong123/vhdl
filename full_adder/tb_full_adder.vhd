--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:45:38 10/09/2019
-- Design Name:   
-- Module Name:   D:/unmc degree/year 4/sem 1/hdl/full_adder/tb_full_adder.vhd
-- Project Name:  full_adder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: full_adder
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
 
ENTITY tb_full_adder IS
END tb_full_adder;
 
ARCHITECTURE behavior OF tb_full_adder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT full_adder
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         cin : IN  std_logic;
         sum_out : OUT  std_logic;
         carry_out : OUT  std_logic
        );
    END COMPONENT;
    
	-- declaring tb
   --Inputs
   signal tb_a : std_logic := '0';
   signal tb_b : std_logic := '0';
   signal tb_cin : std_logic := '0';

 	--Outputs
   signal tb_sum_out : std_logic;
   signal tb_carry_out : std_logic;
	
	--Truth table
	-- cin | b | a | sum_out | carry_out
	--	 0		0	 0		0				0
	--	 0		0	 1		1				0
	--	 0		1	 0		1				0
	--	 0		1	 1		0				1
	--	 1		0	 0		1				0
	--	 1		0	 1		0				1
	--	 1		1	 0		0				1
	--	 1		1	 1		1				1
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: full_adder PORT MAP (
	
	-- assign tb values
          a => tb_a,
          b => tb_b,
          cin => tb_cin,
          sum_out => tb_sum_out,
          carry_out => tb_carry_out
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

       for i in std_logic range '0' to '1' loop
			tb_cin <= i;
			for j in std_logic range '0' to '1' loop
				tb_b <= j;
				for k in std_logic range '0' to '1' loop
					tb_a <= k;
					wait for 10ns;
				end loop;
			end loop;
		end loop;

      wait;
   end process;

END;
