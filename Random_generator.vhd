library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;
entity RandomGenerator is
Port ( clock : in STD_LOGIC;
	reset : in STD_LOGIC;
	en : in STD_LOGIC;
	Q : out STD_LOGIC_VECTOR (7 downto 0);
	Q2: out STD_LOGIC_VECTOR (6 downto 0);
	check: out STD_LOGIC);
end RandomGenerator;

architecture Behavioral of RandomGenerator is

signal Qt: STD_LOGIC_VECTOR(7 downto 0) := x"01";

begin

	PROCESS(clock)
	variable tmp : STD_LOGIC := '0';
	BEGIN
	IF rising_edge(clock) THEN
		IF (reset='1') THEN
			Qt <= x"01";
		ELSIF en = '1' THEN
			tmp := Qt(4) XOR Qt(3) XOR Qt(2) XOR Qt(0);
			Qt <= tmp & Qt(7 downto 1);
		END IF;
	END IF;
	END PROCESS;

check <= Qt(7);
Q<= Qt;
Q2<=Qt(7 downto 1);
end Behavioral;
