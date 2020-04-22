LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY SPI IS
	PORT (
		Clock, MISO, Reset : IN std_logic;
		SCLK, CS, Display : OUT std_logic;
		DataOut : OUT std_logic_vector (23 DOWNTO 0));
END SPI;

ARCHITECTURE Behavioral OF SPI IS

	ATTRIBUTE enum_encoding : STRING;
	-- state definitions
	TYPE stateType IS (stIdle, stData,stDisplay, stStop);
	ATTRIBUTE enum_encoding OF statetype : TYPE IS "00 01 11 10";

	--Internal signals
	SIGNAL presState, nextState : stateType;
	SIGNAL iReset, iClock1xEnable, iEnableDataOut, iSCLK, iDisplay : std_logic := '0';
	SIGNAL iClockDiv : std_logic_vector (23 DOWNTO 0) := (OTHERS => '0');
	SIGNAL iSCLKDiv,iNoBitsReceived : std_logic_vector (3 DOWNTO 0) := (OTHERS => '0');
	SIGNAL i_converted_number, iShiftRegister : std_logic_vector (15 DOWNTO 0) := (OTHERS => '0');
	SIGNAL i_decimal : std_logic_vector (7 DOWNTO 0) := (OTHERS => '0');

	--Function for bin to bcd
	FUNCTION bin_to_bcd (bin_in : std_logic_vector(9 DOWNTO 0)) RETURN std_logic_vector IS

		-- temporary variable
		VARIABLE temp : STD_LOGIC_VECTOR (9 DOWNTO 0); -- variable to store the output BCD number
		VARIABLE bcd : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0'); -- variable to store the output BCD number
		-- organized as follows
		-- thousands = bcd(15 downto 12),hundreds = bcd(11 downto 8),tens = bcd(7 downto 4),ones = bcd(3 downto 0)
	BEGIN
		-- zero the bcd variable
		bcd := (OTHERS => '0');

		-- read input into temp variable
		temp(9 DOWNTO 0) := bin_in;
		-- cycle 10 times as 10 input bits
		-- need not to check and add 3 for the first 3 iterations as the number can never be > 4
		FOR i IN 1 TO temp'Length LOOP
			--one
			IF bcd(3 DOWNTO 0) > 4 THEN --add 3 as number cannot be > 4.
				bcd(3 DOWNTO 0) := bcd(3 DOWNTO 0) + 3;
			END IF;
			--tens
			IF bcd(7 DOWNTO 4) > 4 THEN --add 3 as number cannot be > 4.
				bcd(7 DOWNTO 4) := bcd(7 DOWNTO 4) + 3;
			END IF;
			--huns
			IF bcd(11 DOWNTO 8) > 4 THEN --add 3 as number cannot be > 4.
				bcd(11 DOWNTO 8) := bcd(11 DOWNTO 8) + 3;
			END IF;
			-- thousands can't be > 4 for 10-bit input number so don't need to do anything for thousands	
			-- shift bcd left by 1 bit, copy MSB of temp into LSB of bcd
			bcd := bcd(14 DOWNTO 0) & temp(9);

			-- shift temp left by 1 bit
			temp := temp(8 DOWNTO 0) & '0';

		END LOOP;
		RETURN bcd;
	END bin_to_bcd;
BEGIN

	PROCESS (Clock)
	BEGIN

		IF Clock'event AND Clock = '1' THEN
			IF Reset = '1' OR iReset = '1' THEN
				iClock1xEnable <= '0';
				iClockDiv <= (OTHERS => '0');
				iSCLKDiv <= "0010";
			ELSE
				iClockDiv <= iClockDiv + '1';
				CS <= '1';
			END IF;

			IF iClockDiv >= "111110111100010100100000" THEN --16500000 counts or approx 0.33s
				-- clock divider for SCLK
				iClock1xEnable <= '1';
				CS <= '0';
				IF iSCLKDiv = "1101" THEN --clock operates at 4.16MHz speed or 240ns period 
					iSCLKDiv <= "0010"; -- reset clock
				ELSE
					iSCLKDiv <= iSCLKDiv + '1';
				END IF;
				iSCLK <= iSCLKDiv(3);
			END IF;
		END IF;
	END PROCESS;

	--SCLK is 4.16MHz
	SCLK <= iSCLK;

	PROCESS (iClock1xEnable, iSCLK)
	BEGIN

		IF iClock1xEnable = '0' THEN
			--iNoBitsReceived <= (OTHERS => '0');
			presState <= stIdle;
			iDisplay <= '0';
		ELSE
			IF iSCLK'event AND iSCLK = '0' THEN
				--Start writing the data
				iNoBitsReceived <= iNoBitsReceived + '1'; --Begin count the number of data readed
				presState <= nextState;
				IF iEnableDataOut = '1' THEN
					iDisplay <= '1';
					iNoBitsReceived <= (OTHERS => '0');
					i_converted_number <= bin_to_bcd(iShiftRegister(14 DOWNTO 5));
					-- Decimal handling
					CASE iShiftRegister(4 DOWNTO 3) IS
						WHEN "00" => i_decimal <= "00000000";
						WHEN "01" => i_decimal <= "00100101"; --.25
						WHEN "10" => i_decimal <= "01010000"; --.50
						WHEN "11" => i_decimal <= "01110101"; --.75
						WHEN OTHERS => i_decimal <= "00000000";
					END CASE;
				ELSE
					--write the data 
					iShiftRegister <= iShiftRegister(14 DOWNTO 0) & MISO;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	DataOut <= i_converted_number & i_decimal;		--Output
	Display <= iDisplay;	--Output

	PROCESS (presState, iClock1xEnable, iNoBitsReceived)
	BEGIN
		-- signal defaults
		iReset <= '0';
		iEnableDataOut <= '0';
		CASE presState IS
			WHEN stIdle =>
				IF iClock1xEnable = '1' THEN
					nextState <= stData;
				ELSE
					nextState <= stIdle;
				END IF;
			WHEN stData =>
				--Once written 16 bits then stop 	
				IF iNoBitsReceived = "1111" THEN
					--iEnableDataOut <= '1';
					nextState <= stDisplay;
				ELSE
					--Continue writing
					iEnableDataOut <= '0';
					nextState <= stData;
				END IF;
			WHEN stDisplay =>
				--Reset the clock using internal reset 
				nextState <= stStop;
				iEnableDataOut <= '1';
			WHEN stStop =>
				--Reset the clock using internal reset 
				nextState <= stIdle;
				iReset <= '1';
		END CASE;
	END PROCESS;
END Behavioral;