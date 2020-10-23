----------------------------------------------------------------------------------
-- Company: Rochester Institute of Technology(RIT)
-- Engineer: Kushal Malhotra(kjm8374@rit.edu)
-- 
-- Create Date: 02/27/2020 08:54:36 AM
-- Design Name: RippleCarryFullAdder
-- Module Name: RippleCarryFullAdder - Behavioral
-- Project Name: ALU
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

entity RippleCarryFullAdder is
  generic( N : integer:= 32);
  Port ( 
         A   : IN std_logic_vector(N-1 downto 0);
         B   : IN std_logic_vector(N-1 downto 0);
         OP  : IN std_logic;
         Sum : OUT std_logic_vector(N-1 downto 0)   
  );
end RippleCarryFullAdder;

architecture Behavioral of RippleCarryFullAdder is

Component FullAdder is
  Port ( 
        A    : IN std_logic;
        B    : IN std_logic;
        Cin  : IN std_logic;
        Sum  : OUT std_logic; 
        Cout : OUT std_logic
       );
end Component;

signal carry_in : std_logic_vector(N-1 downto 0);
signal Add_or_Sub : std_logic_vector(N-1 downto 0);

begin

AddSub  : FOR I IN 0 TO N-1 GENERATE
        Add_or_Sub(I) <= B(I) XOR OP;
end generate AddSub;

full_add0 : FullAdder 
PORT MAP( A   => A(0),
          B   => Add_or_Sub(0),
          Cin => OP,
          Sum => Sum(0),
          Cout => carry_in(0)
          );
                        
gen_add  : FOR I IN 1 TO N-1 GENERATE
    full_add : FullAdder 
        PORT MAP( A    => A(I),
                  B    => Add_or_Sub(I),
                  Cin  => carry_in(I-1),
                  Sum  => Sum(I),
                  Cout => carry_in(I)
                  );
end GENERATE gen_add;
     


end Behavioral;
