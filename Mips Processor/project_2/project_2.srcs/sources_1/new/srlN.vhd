----------------------------------------------------------------------------------
-- Company:  Rochester  Institute  of  Technology (RIT)
-- Engineer: Kushal Malhotra (kjm8374@rit.edu)
-- 
-- Create Date: 01/20/2020 12:24:43 PM
-- Design Name: srlN
-- Module Name: srlN - Behavioral
-- Project Name: 
-- Target Devices: Basys3
-- Tool Versions: 
-- Description: N-bit right shift register
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
use  IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity srlN is
 GENERIC (N : INTEGER  := 4;
          Depth : INTEGER := 5); --bit  width
PORT (A           : IN  std_logic_vector(N-1  downto  0);
     SHIFT_AMT    : IN  std_logic_vector(Depth -1  downto  0);
     Y           : OUT  std_logic_vector(N-1  downto  0));
end srlN;

architecture Behavioral of srlN is

type  shifty_array  is  array(N-1  downto  0) of  std_logic_vector(N-1 downto  0);
signal  aSRL : shifty_array;

begin

generateSRL: for i in 0 to N-1  generate
    aSRL(i)(N-1-i  downto 0) <= A(N-1 downto  i);
    right_fill: if i > 0 generate
    aSRL(i)(N-1  downto  N-i)  <= (others =>  '0');
   end generate right_fill;
 end generate generateSRL;
 
   Y <= aSRL(to_integer(unsigned(shift_AMT)));

end Behavioral;
