library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity Top_Level_RS232 is
	port ( 	Rxd: in std_logic;
				Reset: in std_logic;
				SystemClock: in std_logic;
				Send: in std_logic;
				DataIn: in std_logic_vector (7 downto 0);
				An: out std_logic_vector (3 downto 0);
				Txd: out std_logic;
				Ca, Cb, Cc, Cd, Ce, Cf, Cg: out std_logic
				);
 
 end Top_Level_RS232; 
 
 
architecture Behavioral of Top_Level_RS232 is 
 
	component RS232
  port( 	Reset, Clock16x, Rxd, Send: in std_logic;
			DataIn: std_logic_vector (7 downto 0);
			Txd: out std_logic;
			DataOut1, DataOut2: out std_logic_vector (7 downto 0)
			);

	end component; 
 
	component D4to7
  port ( Q: in std_logic_vector (3 downto 0);
			Seg: out std_logic_vector (6 downto 0));

  end component; 
  
  
	component scan4digit
 port ( 	Digit3, Digit2, Digit1, Digit0: in std_logic_vector(6 downto 0); 
			Clock: in std_logic;
			An : out std_logic_vector(3 downto 0);
			Ca, Cb, Cc, Cd, Ce, Cf, Cg: out std_logic);

	end component; 
	  
 signal iClock16x: std_logic; 
 signal iDigitOut3, iDigitOut2, iDigitOut1, iDigitOut0: std_logic_vector (6 downto 0);
 signal iDataOut1: std_logic_vector (7 downto 0);
 signal iDataOut2: std_logic_vector (7 downto 0); 
 signal iCount9: std_logic_vector (8 downto 0) := (others=>'0');
 
 begin 
 
	process (SystemClock)
	
	begin
	
	if SystemClock'event and SystemClock = '1' then
		if Reset = '1' then
						iCount9 <= (others=>'0');
		elsif
						iCount9 = "101000101" then -- the divider is 325, or "101000101"
						iCount9 <= (others=>'0');
		else iCount9 <= iCount9 + '1';
		end if;
	end if;
	
	end process;
 
 iClock16x <= iCount9(8);
 
 U1: RS232 port map (
		Reset => Reset,
		Clock16x => iClock16x,
		Rxd => Rxd,
		Send => Send,
		DataIn => DataIn,
		Txd => Txd,
		DataOut1 => iDataOut1,
		DataOut2 => iDataOut2
		);
 
 
 U2: D4to7 port map (
		Q => iDataOut1(3 downto 0),
		Seg => iDigitOut0);  
 
 
 U3: D4to7 port map (
		Q => iDataOut1(7 downto 4),
		Seg => iDigitOut1);


 U4: D4to7 port map ( 
		Q => iDataOut2(3 downto 0),
		Seg => iDigitOut2);
	 
	 
 U5: D4to7 port map ( 
		Q => iDataOut2(7 downto 4),
		Seg => iDigitOut3);     
 
 
 U6: scan4digit port map (
		Digit3 => iDigitOut3,
		Digit2 => iDigitOut2,
		Digit1 => iDigitOut1,
		Digit0 => iDigitOut0,
		Clock => SystemClock,
		An => An,
		Ca => Ca,
		Cb => Cb,
		Cc => Cc,
		Cd => Cd,
		Ce => Ce,
		Cf => Cf,
		Cg => Cg);
		
		
end Behavioral;