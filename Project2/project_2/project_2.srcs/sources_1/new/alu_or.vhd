----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/20/2020 12:18:12 PM
-- Design Name: 
-- Module Name: alu_or - Behavioral
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
use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu_or is
GENERIC (N : INTEGER := 4);
    PORT (
            A : IN STD_LOGIC_VECTOR(N-1 downto 0);
            B : IN STD_LOGIC_VECTOR(N-1 downto 0);
            Y : OUT STD_LOGIC_VECTOR(N-1 downto 0)
         );

end alu_or;

architecture Behavioral of alu_or is

begin

Y <= A or B;

end Behavioral;
