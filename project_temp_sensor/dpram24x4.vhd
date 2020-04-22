library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.ALL;

entity dpram is
    port (
        Clock,Read_button,Write_button   : in std_logic;
        DataIn  : in std_logic_vector(23 downto 0);
        Display : out std_logic;
        DataOut : out std_logic_vector(23 downto 0)
    );
end dpram;

architecture Behavioral of dpram is

attribute enum_encoding : STRING;
    -- state definitions
    type stateType is (stIdle, stSave, stDisplay, stStop);
    attribute enum_encoding of statetype : type is "00 01 11 10";
    signal presState,nextState: stateType;
    signal iWriteEnable,iReadEnable,iReset,iRead_button1,iRead_button2,iWrite_button1,iWrite_button2:std_logic:= '0';
    signal iWE: std_logic_vector(0 downto 0)  := (others => '0');
    signal iAddrA,iAddrB: std_logic_vector(3 downto 0)  := (others => '0');
    signal iDataIn,iDataOut: std_logic_vector(23 downto 0) := (others => '0');
	
	 COMPONENT dpram24x4
        port (
            clka  : in STD_LOGIC;
            wea   : in STD_LOGIC_VECTOR(0 downto 0);
            addra : in STD_LOGIC_VECTOR(3 downto 0);
            dina  : in STD_LOGIC_VECTOR(23 downto 0);
            clkb  : in STD_LOGIC;
            addrb : in STD_LOGIC_VECTOR(3 downto 0);
            doutb : out STD_LOGIC_VECTOR(23 downto 0)
        );
END COMPONENT;
begin

U1 : dpram24x4 port map(

		  clka  => Clock,
		  wea   => iWE,
		  addra => iAddrA,
		  dina  => iDataIn,
		  clkb  => Clock,
		  addrb => iAddrB,
		  doutb => iDataOut);
		  
process (Clock)
begin
	if Clock'event and Clock = '1' then
		if iReset = '1' then		--internal reset the signal 
			 iWriteEnable    <= '0';
			 iReadEnable    <= '0';	
			 presState <= stIdle;
			 --iReadEnable <= '0';		 
		else
			iRead_button1 <= Read_button;
			iRead_button2 <= iRead_button1;
			iWrite_button1 <= Write_button;
			iWrite_button2 <= iWrite_button1;
		end if;
		
		if (iRead_button1 = '1' and iRead_button2 = '0') and (iWrite_button1 = '1' and iWrite_button2 = '0') then
		-- if write and read also high then it will write first
			iWriteEnable <= '1';
			presState <= nextState;
		end if;
		
		if iRead_button1 = '0' and iRead_button2 = '0' then 	--make use that read button is not pressed
			presState <= nextState;	--idle
			if iWrite_button1 = '1' and iWrite_button2 = '0' then		-- check for write button is pressed
				iWriteEnable <= '1';
			end if;
		elsif	iRead_button1 = '1' and iRead_button2 = '0' then		--read button is pressed
				presState <= stDisplay;
				iReadEnable <= '1';
		end if;
	end if;
end process;

process (presState,iWriteEnable)
begin
	iReset <= '0';
	
	case presState is
		when stIdle =>
			Display   <= '0';
			if iWriteEnable = '1' then
				nextState <= stSave;
				iAddrB <= (others => '0');
			else
				nextState <= stIdle;
			end if;
		when stSave =>
			nextState <= stStop;
			iDataIn   <= DataIn;
			iAddrA <= iAddrA + '1';
		when stDisplay =>
			nextState <= stStop;
			iAddrB <= iAddrB + '1';
		when stStop =>
			if iReadEnable = '1' then 
				Display   <= '1';
				nextState <= stIdle;
				iReset <= '1';
			else
			nextState <= stIdle;
			iReset <= '1';
			end if;
  end case;
end process;

DataOut <= iDataOut;
iWE     <= "1";
end Behavioral;