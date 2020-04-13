library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LCD is

	port(	Clock, Reset,Display: in std_logic; 
			DataIn: std_logic_vector (23 downto 0);
			SF_D: out std_logic_vector (3 downto 0);
			LCD_En,LCD_RS,LCD_RW,SF_CE0: out std_logic); 
			
end LCD;

architecture Behavioral of LCD is
attribute enum_encoding: string;

	type tx_sequence is (high_setup, high_hold, oneus, low_setup, low_hold, fortyus, write_char, done);
	attribute enum_encoding of tx_sequence: type is "0000 0001 0011 0010 0110 0111 0101 0100";
	signal tx_state : tx_sequence := done;
	signal tx_byte : std_logic_vector(7 downto 0);
	signal tx_init : std_logic := '0';
	
	type init_sequence is (idle, fifteenms, one, two, three, four, five, six, seven, eight, done);
	signal init_state : init_sequence := idle;
	signal init_init, init_done : std_logic := '0';
	signal i : std_logic_vector(19 downto 0) := (others => '0');
	signal i2 : std_logic_vector(10 downto 0) := (others => '0');
	signal i3 : std_logic_vector(16 downto 0) := (others => '0');
	signal SF_D0, SF_D1,i_thous,i_huns,i_tens,i_ones,i_tensth,i_onesth,i_data_out_sel : std_logic_vector(3 downto 0);
	signal iClockCharCount : std_logic_vector (3 downto 0); 
	signal LCD_E0, LCD_E1,mux : std_logic;

	type display_state is (init, function_set, entry_set, set_display, clr_display, pause, set_addr, 
									display_char, done);
	signal cur_state : display_state := init;
	
begin

i_thous <= DataIn(23 downto 20);
i_huns <= DataIn(19 downto 16);
i_tens <= DataIn(15 downto 12);
i_ones <= DataIn(11 downto 8);
i_onesth <= DataIn(7 downto 4);
i_tensth <= DataIn(3 downto 0);

--disable intel strataflash
SF_CE0 <= '1';

 --write only
LCD_RW <= '0';

--when to transmit a command or data and when not to, use "|" instead of "or" in the with select statement
with cur_state select
	tx_init <= '0' when init | pause | done,
	'1' when others;
	
--control the bus
with cur_state select
	mux <= '1' when init,
	'0' when others;
	
--control the initialization sequence
with cur_state select
	init_init <= '1' when init,
	'0' when others;

--register select
with cur_state select
	LCD_RS <= '0' when function_set|entry_set|set_display|clr_display|set_addr,
	'1' when others;

--what byte to transmit to lcd, byte values are from datasheet 
with cur_state select

	tx_byte <= "00101000" when function_set,
	"00000110" when entry_set,
	"00001100" when set_display,
	"00000001" when clr_display,
	"10000000" when set_addr,
	"0100" & i_thous when thousands,
	"0100" & i_huns when hundreds,
	"0100" & i_tens when tens,
	"0100" & i_ones when ones,
	"0100" & i_onesth when onesth,
	"0100" & i_tensth when tensth,
	"11011111" when char_degree,
	"01000011" when char_C,
	"11111110" when space,
	"00000000" when others;
	
with i_data_out_sel select i_DataIn <=
		"01010100" 	when "0000",		-- T character
		"01100101" 	when "0001", 		-- e character
		"01101101" 	when "0010", 		-- m character
		"01110000" 	when "0011", 		-- p character
		"00111010" 	when "0100", 		-- : character
		"00101100" 	when "0101",		-- space character	
		i_thous 		when "0110",		-- thousands
		i_huns 		when "0111",		-- hundreds			
		i_tens 		when "1000",		-- tens
		i_ones 		when "1001",		-- ones
		"00101110" 	when "1010",    	-- decimal character
		i_onesth 	when "1011",		-- onesth
		i_tensth 	when "1100",		-- tensth 
		"01000011" 	when "1101",	  	-- Celsius (C) character
		"00001010" 	when "1110",		-- new line
		"00001101" 	when "1111",		-- Carriage Return
		(others => 'X') when others;	
--process for display
process(Clock, Reset)
begin
	if Clock'event and Clock='1' then 
		if Reset='1' then
			cur_state <= function_set;
		elsif Display = '1' then 
			case cur_state is
				when init =>
					if init_done = '1' then
						cur_state <= function_set;
					else
						cur_state <= init;
					end if;
				--every other state but pause uses the transmit state machine
				when function_set =>
					if i2 = 2000 then		--11111010000
						cur_state <= entry_set;
					else
						cur_state <= function_set;
					end if;
				when entry_set =>
					if i2 = 2000 then
						cur_state <= set_display;
					else
						cur_state <= entry_set;
					end if;
				when set_display =>
					if i2 = 2000 then
						cur_state <= clr_display;
					else
						cur_state <= set_display;
					end if;
				when clr_display =>
					i3 <= (others => '0');
					if i2 = 2000 then
						cur_state <= pause;
					else
						cur_state <= clr_display;
					end if;
				when pause =>
					if i3 = 82000 then		--10100000001010000
						cur_state <= set_addr;
						i3 <= (others => '0');
					else
						cur_state <= pause;
						i3 <= i3 + 1;
					end if;
				when set_addr =>
					if i2 = 2000  then
						cur_state <= write_char;
					else
						cur_state <= set_addr;
					end if;
				when write_char =>
					if i2 = 2000 then
						cur_state <= stRepeat;
					else
						cur_state <= write_char;
					end if;
				when stRepeat =>
						i_data_out_sel <= i_data_out_sel + '1';
						if iClockWordCount = "10000" then
							nextState <= done;
						else
							nextState <= write_char;
					end if;
				when done =>
					cur_state <= done;
			end case;
		end if;
	end if;	
end process;

with mux select
	--transmit
	SF_D <= SF_D0 when '0',
	--initialize
	SF_D1 when others;
	
with mux select
	--transmit
	LCD_En <= LCD_E0 when '0',
	--initialize
	LCD_E1 when others;
	
--timing constraint of the LCD
process(Clock, reset, tx_init)
begin

	if Clock'event and Clock='1' then 
		if reset='1' then
	
			tx_state <= done;
		
		else
			case tx_state is
				when high_setup => --40ns
					LCD_E0 <= '0';
					SF_D0 <= tx_byte(7 downto 4);
					if i2 = 2  then
					
						tx_state <= high_hold;
						i2 <= (others => '0');
						
					else
					
						tx_state <= high_setup;
						i2 <= i2 + 1;
					end if;
				when high_hold => --230ns
					LCD_E0 <= '1';
					SF_D0 <= tx_byte(7 downto 4);
					if i2 = 12 then
				
						tx_state <= oneus;
						i2 <= (others => '0');
						
					else
					
						tx_state <= high_hold;
						i2 <= i2 + 1;
					end if;
				when oneus =>
					LCD_E0 <= '0';
					if i2 = 50 then
					
						tx_state <= low_setup;
						i2 <= (others => '0');
						
					else
					
						tx_state <= oneus;
						i2 <= i2 + 1;
					end if;
				when low_setup =>
					LCD_E0 <= '0';
					SF_D0 <= tx_byte(3 downto 0);
					if i2 = 2 then
					
						tx_state <= low_hold;
						i2 <= (others => '0');
						
					else
					
						tx_state <= low_setup;
						i2 <= i2 + 1;
					end if;
				when low_hold =>
					LCD_E0 <= '1';
					SF_D0 <= tx_byte(3 downto 0);
					if(i2 = 12) then
					
						tx_state <= fortyus;
						i2 <= (others => '0');
						
					else
					
						tx_state <= low_hold;
						i2 <= i2 + 1;
					end if;
				when fortyus =>
					LCD_E0 <= '0';
					if i2 = 2000  then
					
						tx_state <= done;
						i2 <= (others => '0');
						
					else
					
						tx_state <= fortyus;
						i2 <= i2 + 1;
					end if;
				when done =>
					LCD_E0 <= '0';
					if tx_init = '1'  then
					
						tx_state <= high_setup;
						i2 <= (others => '0');
						
					else
						tx_state <= done;
						i2 <= (others => '0');
					end if;
			end case;
		end if;
	end if;
end process;

--initialization of LCD
process(Clock, reset, init_init)
begin

	if Clock'event and Clock='1' then 
		if reset='1' then
	
		init_state <= idle;
		init_done <= '0';
		
		else
			case init_state is
				when idle =>
					init_done <= '0';
					if init_init = '1' then
					
						init_state <= fifteenms;
						i <= (others => '0');
						
					else
					
						init_state <= idle;
						i <= i + 1;	
					end if;
				when fifteenms =>
					init_done <= '0';
					if i = 750000 then
					
						init_state <= one;
						i <= (others => '0');
						
					else
					
						init_state <= fifteenms;
						i <= i + 1;
				end if;
				when one =>
					SF_D1 <= "0011";
					LCD_E1 <= '1';
					init_done <= '0';
					if i = 11 then
					
						init_state<=two;
						i <= (others => '0');
						
					else
					
						init_state<=one;
						i <= i + 1;
					end if;
				when two =>
				
					LCD_E1 <= '0';
					init_done <= '0';
					if i = 205000 then
					
						init_state<=three;
						i <= (others => '0');
						
					else
					
						init_state<=two;
						i <= i + 1;
					end if;
				when three =>
					SF_D1 <= "0011";
					LCD_E1 <= '1';
					init_done <= '0';
					if i = 11 then
					
						init_state<=four;
						i <= (others => '0');
						
					else
					
						init_state<=three;
						i <= i + 1;
					end if;
				when four =>
					LCD_E1 <= '0';
					init_done <= '0';
					if i = 5000 then
					
						init_state<=five;
						i <= (others => '0');
					else
					
						init_state<=four;
						i <= i + 1;
					end if;
				when five =>
					SF_D1 <= "0011";
					LCD_E1 <= '1';
					init_done <= '0';
					if i = 11 then
					
						init_state<=six;
						i <= (others => '0');
						
					else
					
						init_state<=five;
						i <= i + 1;
					end if;
				when six =>
					LCD_E1 <= '0';
					init_done <= '0';
					if i = 2000 then
					
						init_state<=seven;
						i <= (others => '0');
						
					else
					
						init_state<=six;
						i <= i + 1;
						
					end if;
					
				when seven =>
					SF_D1 <= "0010";
					LCD_E1 <= '1';
					init_done <= '0';
					if i = 11 then
					
						init_state<=eight;
						i <= (others => '0');
						
					else
					
						init_state<=seven;
						i <= i + 1;
					end if;
				when eight =>
					LCD_E1 <= '0';
					init_done <= '0';
					if i = 2000 then
					
						init_state<=done;
						i <= (others => '0');
						
					else
					
						init_state<=eight;
						i <= i + 1;
					end if;
				when done =>
					init_state <= done;
					init_done <= '1';
			end case;
		end if;
	end if;
end process;
	
end Behavioral;