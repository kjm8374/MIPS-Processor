----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/29/2020 06:06:11 PM
-- Design Name: 
-- Module Name: Mux - Behavioral
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

entity Mux is
    generic( N: INTEGER := 4);
    Port ( A   : in STD_LOGIC_VECTOR (N-1 downto 0);
           B   : in STD_LOGIC_VECTOR (N-1 downto 0);
           Sel : in STD_LOGIC;
           Y   : out STD_LOGIC_VECTOR (N-1 downto 0));
end Mux;

architecture Behavioral of Mux is

begin

process(A,B,Sel) is
begin

Case Sel is
    when '0' => Y <= A;
    when '1' => Y <= B;
    when others => Y <= (others => '0');
end case;
end process;
end Behavioral;
