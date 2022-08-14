----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2020 04:23:12 PM
-- Design Name: 
-- Module Name: clock_divider_module - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_divider_module is
    Port ( clock_input : in STD_LOGIC; -- clock signal of Basys3
           clock_output : out STD_LOGIC_VECTOR (1 downto 0); --potential anode chooser signal
           reset : in STD_LOGIC); -- reset signal
end clock_divider_module;

architecture Behavioral of clock_divider_module is
signal counter_vector : STD_LOGIC_VECTOR (19 downto 0); -- 10.5 ms counter refresher internal signal
begin
process(clock_input, reset)
begin
    if reset ='1' then
       counter_vector <= (others => '0');
       elsif rising_edge(clock_input) then
        counter_vector <= counter_vector + 1;
end if;
end process;
clock_output <= counter_vector( 19 downto 18);
end Behavioral;
