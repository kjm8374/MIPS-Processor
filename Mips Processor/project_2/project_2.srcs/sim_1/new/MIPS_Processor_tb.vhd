----------------------------------------------------------------------------------
-- Company: Rochester Institute of Technology (RIT)
-- Engineer: Kushal Malhotra (kjm8374@rit.edu)
-- 
-- Create Date: 04/15/2020 11:12:58 AM
-- Design Name: MIPS_Processor
-- Module Name: MIPS_Processor_tb - Behavioral
-- Project Name: Project1
-- Target Devices: Basys3
-- Tool Versions: 
-- Description:  Test Bench for testing the MIPS Pipeline
-- 
-- Dependencies: 
-- 
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------



library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity MIPS_Processor_tb is
end;

architecture bench of MIPS_Processor_tb is

  component MIPS_Processor
  Port (
         clk             : IN std_logic;
         rst             : IN std_logic;
         switches        : IN std_logic_vector(15 downto 0);
         SevenSegDisplay : OUT std_logic_vector(6 downto 0);
         ALUResult       : OUT std_logic_vector(31 downto 0)
        );
  end component;

  signal clk: std_logic := '0';
  signal rst: std_logic := '1';
  signal switches: std_logic_vector(15 downto 0) :=x"0000";
  signal SevenSegDisplay: std_logic_vector(6 downto 0);
  signal ALUResult: std_logic_vector(31 downto 0) ;

  constant period: time := 10 ns;
  

begin

  uut: MIPS_Processor
                         port map ( clk             => clk,
                                    rst             => rst,
                                    switches        => switches,
                                    SevenSegDisplay => SevenSegDisplay,
                                    ALUResult       => ALUResult );

  stimulus: process
  begin
       wait for period;
       WAIT until clk = '1';
       rst <= '0';
       wait until clk = '0';
       rst <= '0';
       for i in 0 to 30 loop
          wait until clk = '1';
       end loop;

    wait for 2*period;
    wait;
  end process;

  clock: process
  begin
    clk <= not clk;
    wait for period/2;
end process; 

end;
