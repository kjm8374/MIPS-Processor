----------------------------------------------------------------------------------
-- Company: Rochester Institute of Technology (RIT)
-- Engineer: Kushal Malhotra(kjm8374@rit.edu)
-- 
-- Create Date: 01/23/2020 08:47:19 AM
-- Design Name: genericDecoder
-- Module Name: genericDecoder - Behavioral
-- Project Name: 
-- Target Devices: Basys3
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity genericDecoder is
	generic(
    LOG_PORT_DEPTH : integer := 3);
Port (
      Addr_3        : IN std_logic_vector(LOG_PORT_DEPTH-1 downto 0);
      output_to_and : OUT std_logic_vector(2**LOG_PORT_DEPTH-1 downto 0)
     );
end genericDecoder;

architecture Behavioral of genericDecoder is

--signal output : std_logic_vector(2**LOG_PORT_DEPTH-1 downto 0);

begin

process(Addr_3)
begin
output_to_and <= (others => '0');
output_to_and(to_integer(unsigned(Addr_3))) <= '1';
end process;                 

                 
-- generate_inputs : for i in 0 to 2**LOG_PORT_DEPTH-1 generate         
--        and_output(i) <= output_to_and(i) and we;
-- end generate;

end Behavioral;
