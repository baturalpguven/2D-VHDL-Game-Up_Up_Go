

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;




entity CL1_wrapper is
    Port ( clk: in STD_LOGIC;
        reset: in std_logic;
        enable : in STD_LOGIC;
           out_1:out std_logic_vector(11 downto 0)
           );
end CL1_wrapper;

architecture Behavioral of CL1_wrapper is

signal counter: integer := 0;
signal sc: std_logic_vector(11 downto 0) := (others => '0');






begin
process(CLK)
begin
  if rising_edge(CLK) then
   if reset='1' then
        counter <= 0;
        sc <= (others => '0');
   elsif enable = '1' THEN
    if counter < 50000000 then    -- This is a slow counter, you can change (increase or decrease) the speed of counter by changing the '50000000'
      counter <= counter + 1;
    else
      counter <= 0;
      sc <= sc + 1;
    end if;
    end if;
  end if;
end process;



out_1<=sc;

end Behavioral;
