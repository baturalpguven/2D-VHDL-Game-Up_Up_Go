----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2020 04:59:17 PM
-- Design Name: 
-- Module Name: three_to_one_MUX - Behavioral
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

entity three_to_one_MUX is
    Port ( mux_out : out STD_LOGIC_VECTOR (2 downto 0);-- 3 bit binary output signal that will be related with one one 7-segment display
           two_bit_in : in STD_LOGIC_VECTOR (1 downto 0);-- two bit signal that originated from the clock output this sinal determine wihch output pass which does not
           in1 : in STD_LOGIC_VECTOR (2 downto 0); -- 3 bit binary input which will be provided by switches
           in2 : in STD_LOGIC_VECTOR (2 downto 0);--3 bit binary input which will be provided by switches
           in3 : in STD_LOGIC_VECTOR (2 downto 0);-- 3 bit binary input which will be provided by switches
           in4 : in STD_LOGIC_VECTOR (2 downto 0));-- 3 bit binary input which will be provided by switches
end three_to_one_MUX;

architecture Behavioral of three_to_one_MUX is

begin
process (two_bit_in )
    begin
    case two_bit_in is
    when "00" => mux_out <= in1;
    when "01" => mux_out <= in2;
    when "10" => mux_out <= in3;
    when others => mux_out <= in4;
    end case;

end process;
    
    



end Behavioral;
