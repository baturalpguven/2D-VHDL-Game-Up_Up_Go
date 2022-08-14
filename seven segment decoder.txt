----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2020 08:51:32 PM
-- Design Name: 
-- Module Name: seven_segment_decoder - Behavioral
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

entity seven_segment_decoder is
    Port ( binary_input : in STD_LOGIC_VECTOR (2 downto 0); --3 bit binary input that has assigned for one 7-segment display
           octa_output : out STD_LOGIC_VECTOR (6 downto 0)); -- 7 bit signal that determines the octa decimal figure on the 7-segment display
end seven_segment_decoder;

architecture Behavioral of seven_segment_decoder is


begin
process( binary_input)

    begin
    case binary_input is
    when "000" => octa_output <= "1000000"; --0
    when "001" => octa_output <= "1111001"; --1
    when "010" => octa_output <= "0100100"; --2
    when "011" => octa_output <= "0110000"; --3
    when "100" => octa_output <= "0011001"; --4
    when "101" => octa_output <= "0010010"; --5
    when "110" => octa_output <= "0000010"; --6
    when others => octa_output <= "1111000"; --7
    end case;
end process;

end Behavioral;
