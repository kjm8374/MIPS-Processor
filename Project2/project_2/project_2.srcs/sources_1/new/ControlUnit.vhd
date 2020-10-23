----------------------------------------------------------------------------------
-- Company: Rochester Institute of Technology(RIT)
-- Engineer: Kushal Malhotra(kjm8374@rit.edu)
-- 
-- Create Date: 02/14/2020 06:50:56 PM
-- Design Name: ControlUnit
-- Module Name: ControlUnit - Behavioral
-- Project Name: InstrucDecode
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

entity ControlUnit is
Port ( Opcode     : IN std_logic_vector(5 downto 0);
       Funct      : IN std_logic_vector(5 downto 0);
       RegWrite   : OUT std_logic;
       MemtoReg   : OUT std_logic;
       MemWrite   : OUT std_logic;
       ALUControl : OUT std_logic_vector(3 downto 0);
       ALUSrc     : OUT std_logic;
       RegDst     : OUT std_logic
     );
end ControlUnit;

architecture Behavioral of ControlUnit is

begin

MemtoReg_proc: process(Opcode, Funct)
begin
Case Opcode is 
    when "100011" => MemtoReg <= '1'; --LW
    when others   => MemtoReg <= '0'; 
end case;
end process;

MemWrite_proc: process(Opcode, Funct)
begin
Case Opcode is
    when "101011" => MemWrite <= '1'; --SW
    when others   => MemWrite <= '0';
end case;
end process;

ALUControl_proc: process(Opcode, Funct)
begin
Case Opcode is
    when "000000" =>
        Case Funct is
            when "100000" => ALUControl <= "0100";
            when "100100" => ALUControl <= "1010"; 
            when "011001" => ALUControl <= "0110"; 
            when "100101" => ALUControl <= "1000"; 
            when "000000" => ALUControl <= "1100"; 
            when "000011" => ALUControl <= "1110"; 
            when "000010" => ALUControl <= "1101"; 
            when "100010" => ALUControl <= "0101"; 
            when "100110" => ALUControl <= "1011"; 
            when others   => ALUControl <= "0000";
         end case;
    when "001000" => ALUControl <= "0100"; 
    when "001100" => ALUControl <= "1010"; 
    when "001101" => ALUControl <= "1000"; 
    when "001110" => ALUControl <= "1011"; 
    when others   => ALUControl <= "0000"; 
end case;
end process;

AluSrc_proc: process(Opcode, Funct)
begin
Case Opcode is
    when "001000" => AluSrc <= '1'; -- ADDI
    when "001100" => AluSrc <= '1'; -- ANDI
    when "001101" => AluSrc <= '1'; -- ORI
    when "001110" => AluSrc <= '1'; --XORI
    when "101011" => AluSrc <= '1'; --SW
    when "100011" => AluSrc <= '1'; --LW
    when others   => AluSrc <= '0';
end case;
end process;

RegDst_proc: process(Opcode, Funct)
begin
Case Opcode is
    when "001000" => RegDst <= '0';
    when "001100" => RegDst <= '0';
    when "001101" => RegDst <= '0';
    when "001110" => RegDst <= '0';
    when "101011" => RegDst <= '0';
    when "100011" => RegDst <= '0';--LW
    when others   => RegDst <= '1'; 
end case;
end process;

RegWrite_proc: process(Opcode, Funct)
begin
Case Opcode is
    when "101011" => RegWrite <= '0';
    when others   => RegWrite <= '1'; 
end case;
end process;

end Behavioral;
