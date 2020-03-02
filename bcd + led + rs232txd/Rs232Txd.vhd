library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Rs232Txd is

	port( Reset,Clock16x,Send: in std_logic;
			DataIn: in std_logic_vector (15 downto 0);
			Txd: out std_logic);
			
end Rs232Txd;

architecture Behavioral of Rs232Txd is

	attribute enum_encoding: string;
	
	--state definitions
	type stateType is (stIdle,stData,stRepeat,stTxdCompleted);
	attribute enum_encoding of stateType: type is "00 01 11 10";
	
	signal presState: stateType;
	signal nextState: stateType;
	signal iReset_iNoBitsSent: std_logic := '0';
	signal iSend1, iSend2, iReset, iClock1xEnable, iEnableTxdBuffer, iEnableShift: std_logic;
	signal iTxdBuffer: std_logic_vector (8 downto 0) := (others => '1');
	signal iClockDiv: std_logic_vector (3 downto 0);
	signal iClock1x: std_logic;
	signal i_data_out_sel: std_logic_vector (2 downto 0):= (others => '0');
	signal iNoBitsSent: std_logic_vector (3 downto 0);
	signal i_tens,i_ones,i_tensth,i_onesth,iStop,i_DataIn: std_logic_vector (7 downto 0);
	signal i_decimal: std_logic_vector (7 downto 0) := "00101110";		-- decimal character
	signal i_space: std_logic_vector (7 downto 0):= "00101100"; 	-- space character
	signal i_Celsius: std_logic_vector (7 downto 0):= "01000011";	-- Celsius character
	
	--function for converting bcd to binary for txd transmission
	function bcdtobin (data_in_bcd: in std_logic_vector(3 downto 0))
	
		return std_logic_vector is 
		variable i_bcdtobin : std_logic_vector(7 downto 0);
		
		begin
			case data_in_bcd is 
				when "0000" => i_bcdtobin := "00110000";  -- 0
				when "0001" => i_bcdtobin := "00110001";  -- 1
				when "0010" => i_bcdtobin := "00110010";  -- 2
				when "0011" => i_bcdtobin := "00110011";  -- 3
				when "0100" => i_bcdtobin := "00110100";  -- 4
				when "0101" => i_bcdtobin := "00110101";  -- 5
				when "0110" => i_bcdtobin := "00110110";  -- 6
				when "0111" => i_bcdtobin := "00110111";  -- 7
				when "1000" => i_bcdtobin := "00111000";  -- 8
				when "1001" => i_bcdtobin := "00111001";  -- 9
				when "1100" => i_bcdtobin := "00110000";  -- 0
				when "1101" => i_bcdtobin := "00110101";  -- 5
				when "1110" => i_bcdtobin := "00110010";  -- 2
				when "1111" => i_bcdtobin := "00110000";  -- 7
				when others => null;
			end case;
			return i_bcdtobin; -- values passed back via return statement
	end bcdtobin;
	
begin

process (DataIn)

begin

	i_tens <= bcdtobin(DataIn(15 downto 12));
	i_ones <= bcdtobin(DataIn(11 downto 8));
	i_onesth <= bcdtobin(DataIn(7 downto 4));
	i_tensth <= bcdtobin(DataIn(3 downto 0));
	
end process;

with i_data_out_sel select i_DataIn <=  
		i_tens when "000",
		i_ones when "001",
		i_decimal when "010",  -- decimal character
		i_onesth when "011",
		i_tensth when "100",
		i_celsius when "101",	  -- Celsius character
		i_space when "110",		-- space character
		i_space when "111";		-- space character

process (Clock16x)

begin

	if Clock16x'event and Clock16x = '1' then
	
		if Reset = '1' or iReset = '1' then
		
			iSend1 <= '1';
			iSend2 <= '1';
			iClock1xEnable <= '0';
			iClockDiv <= (others => '0');
				
		else
		
			iSend1 <= Send;
			iSend2 <= iSend1;
			
		end if;
		
		if iSend1 = '1' and iSend2 = '0' then
		
			iClock1xEnable <= '1';
			
		end if;

		if iClock1xEnable = '1' then
		
			iClockDiv <= iClockDiv + '1';
			
		end if;
		
	end if;
end process;

iClock1x <= iClockDiv(3);

process (iClock1xEnable, iClock1x,i_DataIn,iReset_iNoBitsSent)

begin

		if iReset_iNoBitsSent = '1' then 
	
			iNoBitsSent <= (others=>'0');
		
		end if;
	
	if iClock1xEnable = '0' then
	
		iNoBitsSent <= (others=>'0');
		iStop <= (others=>'0');
		presState <= stIdle;
			
	elsif iClock1x'event and iClock1x = '1' then
	
		iNoBitsSent <= iNoBitsSent + '1';
		presState <= nextState;
		iStop <= iStop + '1';
		
	end if;		
	
	if iClock1x'event and iClock1x = '1' then
	
		if iEnableTxdBuffer = '1' then
		
			iTxdBuffer <= i_DataIn & '0'; -- inserting start bit 
			
		end if;	
		
		if iEnableShift = '1' then
		
			iTxdBuffer <= '1' & iTxdBuffer(8 downto 1);
			
		end if;
	end if;
	
end process;

Txd <= iTxdBuffer(0);

process (presState, iClock1xEnable, iNoBitsSent)
begin

	-- signal defaults
	iReset <= '0';
	iEnableTxdBuffer <= '0';
	iEnableShift <= '0';
	iReset_iNoBitsSent <= '0';
	
	case presState is
	
		when stIdle =>
			if iClock1xEnable = '1' then
				iEnableTxdBuffer <= '1';
				nextState <= stData;
			else
				nextState <= stIdle;
			end if;
			
		when stData =>
		
			if iNoBitsSent = "1010" then
				i_data_out_sel <= i_data_out_sel + '1';
				nextState <= stRepeat;
				
			else
				iEnableShift <= '1';
				nextState <= stData;
			end if;
			
			if iStop = "01010111" then
				nextState <= stTxdCompleted;
			end if;
			
		when stRepeat => 
			iReset_iNoBitsSent <= '1';
			iEnableTxdBuffer <= '1';
			nextState <= stData;
			
		when stTxdCompleted =>
				iReset <= '1';
				nextState <= stIdle;
				
	end case;
	
end process;

end Behavioral;

