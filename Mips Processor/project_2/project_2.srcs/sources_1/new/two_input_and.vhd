----------------------------------------------------------------------------------
-- Company: Rochester Institute of technology(RIT)
-- Engineer: Kushal Malhotra (kjm8374@rit.edu)
-- 
-- Create Date: 01/30/2020 08:40:35 AM
-- Design Name: two_input_and
-- Module Name: two_input_and - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity two_input_and is
PORT ( 
      A           : IN STD_LOGIC;
      we          : IN STD_LOGIC;
      output      : OUT STD_LOGIC
      );
end two_input_and;

architecture Behavioral of two_input_and is

begin

output <= A AND we;

end Behavioral;
