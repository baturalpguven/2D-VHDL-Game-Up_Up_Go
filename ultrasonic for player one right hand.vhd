
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ultrasonic_right_hand_for_plyr_one is
	port(
	CLOCK: in std_logic;
	out_right: out std_logic;
	TRIG_right: out std_logic;
	ECHO_right: in std_logic
	);
end ultrasonic_right_hand_for_plyr_one;

architecture rtl of ultrasonic_right_hand_for_plyr_one is

signal microseconds: std_logic;
signal counter: std_logic_vector(17 downto 0);
signal leds: std_logic;
signal trigger_right: std_logic;

begin
	
	process(CLOCK)
	variable count0: integer range 0 to 101;
	begin
		if rising_edge(CLOCK) then
			if count0 = 99 then
				count0 := 0;
			else
				count0 := count0 + 1;
			end if;
			if count0 = 0 then
				microseconds <= not microseconds;
			end if;
		end if;
	end process;
	
	process(microseconds)
	variable count1: integer range 0 to 262143;
	begin
		if rising_edge(microseconds) then
			if count1 = 0 then
				counter <= "000000000000000000";
				trigger_right <= '1';
			elsif count1 = 10 then
				trigger_right <= '0';
			end if;
			if ECHO_right = '1' then
				counter <= counter + 1;
			end if;
			if count1 = 249999 then
				count1 := 0;
			else
				count1 := count1 + 1;
			end if;
		end if;
	end process;
	
	process(ECHO_right)
	begin
		if falling_edge(ECHO_right) then
			if counter < 2031 then
				leds <= '1';
			else
				leds <= '0';
			end if;
		end if;
	end process;
	
	out_right <= leds;
	TRIG_right <= trigger_right;
	
end rtl;


