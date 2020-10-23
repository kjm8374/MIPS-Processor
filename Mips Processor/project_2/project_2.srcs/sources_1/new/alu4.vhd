-----------------------------------------------------
-- Company:   Rochester  Institute  of  Technology (RIT)
 -- Engineer: <YOUR_NAME_HERE > (<YOUR_EMAIL_HERE >)
 ---- Create  Date:     <CREATION_TIME_HERE >
 -- Design  Name:     sllN
 -- Module  Name:     sllN - behavioral
 -- Project  Name:    <PROJECT_NAME_HERE >
 -- Target  Devices: Basys3
 ---- Description: N-bit  logical  left  shift (SLL) unit
 ------------------------------------------------------
 library  IEEE;
 use  IEEE.STD_LOGIC_1164.ALL;
 use  IEEE.NUMERIC_STD.ALL;
 
 entity  alu4 is
 GENERIC (N : INTEGER  := 32;
          Depth : INTEGER := 2); --bit  width
 PORT (in1           : IN  std_logic_vector(N-1  downto  0);
       in2            : IN  std_logic_vector(N-1  downto  0);
       control           : IN std_logic_vector(3 downto 0);
       out1            : OUT  std_logic_vector(N-1  downto  0));
 end  alu4;
 
architecture  structural  of alu4 is


   
   Component alu_and is
            GENERIC (N : INTEGER := 4);
       PORT(
           A : IN std_logic_vector(N-1 downto 0);
           B : IN std_logic_vector(N-1 downto 0);
           Y : OUT std_logic_vector(N-1 downto 0)
       );
end  Component;

   Component alu_or is
            GENERIC (N : INTEGER := 4);
       PORT(
           A : IN std_logic_vector(N-1 downto 0);
           B : IN std_logic_vector(N-1 downto 0);
           Y : OUT std_logic_vector(N-1 downto 0)
       );
end  Component;

   Component alu_xor is
            GENERIC (N : INTEGER := 4);
       PORT(
           A : IN std_logic_vector(N-1 downto 0);
           B : IN std_logic_vector(N-1 downto 0);
           Y : OUT std_logic_vector(N-1 downto 0)
       );
end  Component;
   
   Component sllN is
      GENERIC (N : INTEGER  := 4;
            Depth : INTEGER := 5); --bit  width        
      PORT (A           : IN  std_logic_vector(N-1  downto  0);
           SHIFT_AMT    : IN  std_logic_vector(Depth-1   downto  0);
            Y           : OUT  std_logic_vector(N-1  downto  0)
           );
end  Component;
    
   Component srlN is
       GENERIC (N : INTEGER  := 4;
            Depth : INTEGER := 5); --bit  width         
       PORT (A           : IN  std_logic_vector(N-1  downto  0);
            SHIFT_AMT    : IN  std_logic_vector(Depth-1  downto  0);
             Y           : OUT  std_logic_vector(N-1  downto  0)
            );
end  Component;
     
    Component sraN is
       GENERIC (N : INTEGER  := 4;
             Depth : INTEGER := 5); --bit  width          
        PORT (A           : IN  std_logic_vector(N-1  downto  0);
             SHIFT_AMT    : IN  std_logic_vector(Depth-1  downto  0);
              Y           : OUT  std_logic_vector(N-1  downto  0)
             );
end  Component;

Component RippleCarryFullAdder is
  generic( N : integer:= 32);
  Port ( 
         A   : IN std_logic_vector(N-1 downto 0);
         B   : IN std_logic_vector(N-1 downto 0);
         OP  : IN std_logic;
         Sum : OUT std_logic_vector(N-1 downto 0)   
  );
end Component;

Component Multiplier is
  generic (N : integer := 32);
  Port (
        A : IN std_logic_vector((N/2) - 1 downto 0); 
        B : IN std_logic_vector((N/2)-1 downto 0);
        Product : OUT std_logic_vector(N-1 downto 0)  
       );
end Component;

signal not_result : std_logic_vector(N-1 downto 0);
signal sll_result : std_logic_vector(N-1 downto 0);
signal srl_result : std_logic_vector(N-1 downto 0);
signal sra_result : std_logic_vector(N-1 downto 0);
signal and_result : std_logic_vector(N-1 downto 0);
signal or_result  : std_logic_vector(N-1 downto 0);
signal xor_result : std_logic_vector(N-1 downto 0);
signal full_add_result : std_logic_vector(N-1 downto 0);
signal Multiplier_result : std_logic_vector(N-1 downto 0);

begin
    
 sll_comp: sllN
        generic map ( N => 32,Depth =>5)
        port map ( A => in1, SHIFT_AMT => in2(Depth-1 downto 0), Y => sll_result );
        
 srl_comp: srlN
        generic map ( N => 32,Depth=>5)
        port map ( A => in1, SHIFT_AMT => in2(Depth-1 downto 0), Y => srl_result );
               
 sra_comp: sraN
        generic map ( N => 32,Depth=>5)
        port map ( A => in1, SHIFT_AMT => in2(Depth-1 downto 0), Y => sra_result );
                      
 and_comp: alu_and
        generic map ( N => 32)
        port map ( A => in1, B => in2, Y => and_result );
        
 or_comp: alu_or
        generic map ( N => 32)
        port map ( A => in1, B => in2, Y => or_result );
               
 xor_comp: alu_xor
        generic map ( N => 32)
        port map ( A => in1, B => in2, Y => xor_result );
                      
addorsub : RippleCarryFullAdder 
       generic map ( N => 32)
       port map ( A => in1, B => in2, OP => Control(0), Sum =>  full_add_result);

multiply : Multiplier
       generic map (N => 32)
       port map (A => in1((N/2) - 1 downto 0),B=> in2((N/2)-1 downto 0),Product=> Multiplier_result);
        
       out1 <= or_result    when control = "1000" else 
            and_result      when control = "1010" else
            xor_result      when control = "1011" else
            sll_result      when control = "1100" else
            srl_result      when control = "1101" else
            sra_result      when control = "1110" else
            full_add_result when control = "0100" else -- Add
            full_add_result when control = "0101" else --Sub
            Multiplier_result;
            
end structural;
