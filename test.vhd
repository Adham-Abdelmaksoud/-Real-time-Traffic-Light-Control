LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity test is
end entity;

architecture tb of test is
  signal Trafficlights : std_logic_vector (11 downto 0);
  signal Clck,Reset,button1,button2 : std_logic;
begin
  
  DUT : ENTITY work.TLC
  PORT MAP(Trafficlights=>Trafficlights, Clck=>Clck, Reset=>Reset, button1=>button1, button2=>button2);
  
  Clock : process
  begin
    Clck <= '0';
    wait for 10 ns;
    Clck <= '1';
    wait for 10 ns;
  end process;
  
  stimulis : process
  begin
    report("Starting simulation");
    Reset <= '1'; wait for 10 ns;
    Reset <= '0'; wait for 25 ns;
    button2 <= '1'; wait for 5 ns;
    button2 <= '0'; wait for 145 ns;
    button1 <= '1'; wait for 5 ns;
    button1 <= '0'; wait for 2000 ns;
    report("End simulation");
  end process;
end architecture;