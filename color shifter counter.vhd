library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity color_shifter_counter is
Port ( clk : in STD_LOGIC;
color: out STD_LOGIC_vector (11 downto 0));
end color_shifter_counter;

architecture Behavioral of color_shifter_counter is
signal counter: integer := 0;
signal rgb: std_logic_vector(11 downto 0) := "000000000001";
--The following component is your design.
--untoggle the component and also port map and change the inputs/outputs and connections according to your design

begin

process(CLK)
begin
if rising_edge(CLK) then
    if counter < 50000000 then -- This is a slow counter, you can change (increase or decrease) the speed of counter by changing the '50000000'
    counter <= counter + 1;
    else
    counter <= 0;
    rgb <= rgb + 1;
        if rgb="111111111111" then
            rgb<="000000000001";
        end if;
    end if;
end if;
end process;
color<=rgb;
end Behavioral;
