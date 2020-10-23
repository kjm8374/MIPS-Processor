----------------------------------------------------------------------------------
-- Company: Rochester Institute of Technology(RIT)
-- Engineer: Kushal Malhotra
-- 
-- Create Date: 01/20/2020 12:05:44 PM
-- Design Name: alu_and
-- Module Name: alu_and - Behavioral
-- Project Name: Lab1
-- Target Devices: BASYS3
-- Tool Versions: 
-- Description: N-bit AND gate
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
use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu_and is
    GENERIC (N : INTEGER := 4);
    PORT (
            A : IN STD_LOGIC_VECTOR(N-1 downto 0);
            B : IN STD_LOGIC_VECTOR(N-1 downto 0);
            Y : OUT STD_LOGIC_VECTOR(N-1 downto 0)
         );

end alu_and;

architecture Behavioral of alu_and is

begin

Y <= A and B;

end Behavioral;

