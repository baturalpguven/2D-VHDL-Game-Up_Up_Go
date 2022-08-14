----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2020 04:32:08 PM
-- Design Name: 
-- Module Name: Display_choser - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Display_choser is
    Port ( choser_input : in STD_LOGIC_VECTOR (1 downto 0); -- output of the clock which is 2 bit anode choser signal
           choser_out : out STD_LOGIC_VECTOR (3 downto 0)); -- output of the display choser which is 4 bit signal that determines which 7- segment will be on
end Display_choser;

architecture Behavioral of Display_choser is

begin
process (choser_input)

begin

    if choser_input = "00" then 
        choser_out <= "1110";
    elsif choser_input = "01" then
        choser_out <= "1101";
    elsif choser_input = "10" then
        choser_out <= "1011";
    else
        choser_out <= "0111";
    end if;
end process;
end Behavioral;

