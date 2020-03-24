
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
         Reset : IN  std_logic;
         Clock16x : IN  std_logic;
         Send : IN  std_logic;
         DataIn : IN  std_logic_vector(23 downto 0);
         Txd : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal tb_Reset : std_logic := '0';
   signal tb_Clock16x : std_logic := '0';
   signal tb_Send : std_logic := '0';
   signal tb_DataIn : std_logic_vector(23 downto 0) := (others => '0');

 	--Outputs
   signal tb_Txd : std_logic;

   -- Clock period definitions
   constant tb_Clock16x_period : time := 6.52us;		--6.25us is from clock16div at toplevel
 
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
   tb_Clock16x_process :process
   begin
		tb_Clock16x <= '0';
		wait for tb_Clock16x_period/2;
		tb_Clock16x <= '1';
		wait for tb_Clock16x_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      --Reset Everything
      tb_Reset <= '1';
      wait for Clock16x_period;
      tb_Reset <= '0';
      wait for Clock16x_period;
		
		tb_Send  <= '1';
      wait for 10 us;
      tb_Send <= '0';

		tb_DataIn <= "000000000010011011111101";	--26.75
      wait for Clock16x_period;

      wait;
   end process;

END;
