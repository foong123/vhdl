library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LCD_Controller is

	port(	Clock,Display,Reset,Display_DPRAM: in std_logic; 
			DataIn,DataInDPRAM: std_logic_vector (23 downto 0);
			SF_D: out std_logic_vector (3 downto 0);
			LCD_En,LCD_RS,LCD_RW,SF_CE0: out std_logic); 
			
end LCD_Controller;

architecture Behavioral of LCD_Controller is

	type tx_sequence is (high_setup, high_hold, oneus, low_setup, low_hold, fortyus, done);
	signal tx_state : tx_sequence;
	
	type init_sequence is (idle, fifteenms, one, two, three, four, five, six, seven, eight, done);
	signal init_state : init_sequence;
	
		type display_state is (init, function_set, entry_set, set_display, clr_display, pause, set_addr, char_sent, done);
	signal cur_state : display_state;

	signal init_init, init_done,LCD_E0, LCD_E1,mux,tx_init,iCharCountEnable: std_logic := '0';
	signal i : std_logic_vector(19 downto 0) := (others => '0');
	signal i2 : std_logic_vector(10 downto 0) := (others => '0');
	signal i3 : std_logic_vector(16 downto 0) := (others => '0');
	signal tx_byte,i_DataIn : std_logic_vector(7 downto 0);
	signal SF_D0, SF_D1,i_data_out_sel : std_logic_vector(3 downto 0):= (others => '0');
	signal i_data_in_sel: std_logic_vector(23 downto 0) := (others => '0');
	
begin

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
	-- Instruction register during write operations. Busy Flash during read operations
	LCD_RS <= '0' when function_set|entry_set|set_display|clr_display|set_addr, 	
	'1' when others;		--Data for read or write operations

--what byte to transmit to lcd, byte values are from datasheet 
with cur_state select

	tx_byte <= "00101000" when function_set,
	"00000110" 	when entry_set,
	"00001100" 	when set_display,
	"00000001" 	when clr_display,
	"10000000" 	when set_addr,
	i_DataIn 	when	char_sent,
	"00000000" when others;
	
with i_data_out_sel select i_DataIn <=
		"01010100" 	when "0000",										-- T character
		"01100101" 	when "0001", 										-- e character
		"01101101" 	when "0010", 										-- m character
		"01110000" 	when "0011", 										-- p character
		"00111010" 	when "0100", 										-- : character
		"11111110" 	when "0101",										-- space character	
		"0011" & i_data_in_sel(23 downto 20) 		when "0110",		-- thousands
		"0011" & i_data_in_sel(19 downto 16) 		when "0111",		-- hundreds			
		"0011" & i_data_in_sel(15 downto 12) 		when "1000",		-- tens
		"0011" & i_data_in_sel(11 downto 8) 		   when "1001",		-- ones
		"00101110" 	when "1010",    									-- decimal character
		"0011" & i_data_in_sel(7 downto 4) 	      when "1011",		-- onesth
		"0011" & i_data_in_sel(3 downto 0) 			when "1100",		-- tensth 
		"11011111" 	when "1101",	  									-- degree character
		"01000011" 	when "1110",										-- Celsius (C) character
		"11111110" 	when "1111",										-- space character
		(others => 'X') when others;	
	
--process for display
process(Clock)
begin

	if (Display='1' or Display_DPRAM = '1') and Reset = '0'  then
		cur_state <= function_set;
		if Display='1' and Display_DPRAM = '1' then 
			i_data_in_sel <= DataIn;	-- if both are high then SPI is chosen.
		elsif Display_DPRAM = '1' then 
			i_data_in_sel <= DataInDPRAM;
		elsif Display = '1' then 
			i_data_in_sel <= DataIn;
		end if;
	elsif Reset = '1' then 
		cur_state <= init;
	elsif Clock'event and Clock='1' then 	
		case cur_state is
			when init =>
				if init_done = '1' then
					cur_state <= function_set;
				else
					cur_state <= init;
				end if;			
			--every other state but pause uses the transmit state machine
			when function_set =>
				if i2 = 2000 then		--11111010000	/ 40us
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
				i3 <= (others => '0');		--reset the counter for the clear display
				if i2 = 2000 then
					cur_state <= pause;
				else
					cur_state <= clr_display;
				end if;
			when pause =>
				if i3 = 82000 then		--10100000001010000 /1.64ms
					cur_state <= set_addr;
					i3 <= (others => '0');
				else
					cur_state <= pause;
					i3 <= i3 + 1;
				end if;	
			when set_addr =>
				if i2 = 2000  then
					cur_state <= char_sent;
					iCharCountEnable <= '1';		--enable character counter
				else
					cur_state <= set_addr;
				end if;
			when char_sent =>
				if i2 = 2000 and i_data_out_sel = "1111" then
					--once reaches 16 chararacter or displayed 16 characters
					cur_state <= done;
				else
					cur_state <= char_sent;
				end if;
			when done =>
				cur_state <= done;
				iCharCountEnable <= '0';		--disable character counter
		end case;
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

-- Power on initialization
process(Clock,init_init)
begin
	
	if (Display='1' or Display_DPRAM = '1') and Reset = '0' then
		init_state <= idle;
		init_done <= '0';
	elsif Reset = '1' then 
		init_state <= idle;
	elsif Clock='1' and Clock'event then
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
				if i = 750000 then		--15ms
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
				if i = 11 then		--240ns
					init_state<=two;
					i <= (others => '0');
				else
					init_state<=one;
					i <= i + 1;
				end if;
			when two =>
				LCD_E1 <= '0';
				init_done <= '0';
				if i = 205000 then	--4.1ms
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
				if i = 11 then		--240ns
					init_state<=four;
					i <= (others => '0');
				else
					init_state<=three;
					i <= i + 1;
				end if;
			when four =>
				LCD_E1 <= '0';
				init_done <= '0';
				if i = 5000 then		--100us
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
				if i = 11  then		--240ns
					init_state<=six;
					i <= (others => '0');
				else
					init_state<=five;
					i <= i + 1;
				end if;
			when six =>
				LCD_E1 <= '0';
				init_done <= '0';
				if i = 2000 then		--40us
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
				if i = 11 then		--240ns
					init_state<=eight;
					i <= (others => '0');
				else
					init_state<=seven;
					i <= i + 1;
				end if;
			when eight =>
				LCD_E1 <= '0';
				init_done <= '0';
				if i = 2000 then		--40us
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
end process;

--specified by datasheet
process(Clock,tx_init,iCharCountEnable)
begin
	
	if (Display='1' or Display_DPRAM = '1') and Reset = '0' then
		tx_state <= done;
		--iCharCount <= (others => '0');		-- reset count the char
	elsif Reset = '1' then 
		tx_state <= high_setup; 
	elsif Clock='1' and Clock'event then
		case tx_state is
			when high_setup => --40ns
				LCD_E0 <= '0';
				SF_D0 <= tx_byte(7 downto 4);
				if i2 = 2 then
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
			when oneus =>	--1us
				LCD_E0 <= '0';
				if i2 = 50 then
					tx_state <= low_setup;
					i2 <= (others => '0');
				else
					tx_state <= oneus;
					i2 <= i2 + 1;
				end if;
			when low_setup =>	--40ns
				LCD_E0 <= '0';
				SF_D0 <= tx_byte(3 downto 0);
				if i2 = 2 then
					tx_state <= low_hold;
					i2 <= (others => '0');
				else
					tx_state <= low_setup;
					i2 <= i2 + 1;
				end if;
			when low_hold =>	--230ns
				LCD_E0 <= '1';
				SF_D0 <= tx_byte(3 downto 0);
				if i2 = 12 then
					tx_state <= fortyus;
					i2 <= (others => '0');
				else
					tx_state <= low_hold;
					i2 <= i2 + 1;
				end if;
			when fortyus =>	--40us
				LCD_E0 <= '0';
				if i2 = 2000 then
					tx_state <= done;
					i2 <= (others => '0');
					if iCharCountEnable = '1' then 
						--iCharCount <= iCharCount + '1';	-- count the char
						i_data_out_sel <= i_data_out_sel + '1';
					else 
						--reset the counter
						--iCharCount <= (others => '0');
						i_data_out_sel <= (others => '0');
					end if;
				else
					tx_state <= fortyus;
					i2 <= i2 + 1;
				end if;
			when done =>
				LCD_E0 <= '0';
				if tx_init = '1' then
					tx_state <= high_setup;
					i2 <= (others => '0');
				else
					tx_state <= done;
					i2 <= (others => '0');
				end if;
		end case;
	end if;
end process;
	
end Behavioral;