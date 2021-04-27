library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity comparador is
  generic (Nbit: integer:= 10;
           End_Of_Screen: integer:= 10;
           Start_Of_Pulse: integer:= 20;
           End_Of_Pulse: integer:= 30;
           End_Of_Line: integer:= 40
           );
  port (reset : in std_logic;
        clk     : in std_logic;
        data    : in std_logic_vector(Nbit-1 downto 0);
        O1      : out std_logic;
        O2      : out std_logic;
        O3      : out std_logic
        );
  end comparador;

  architecture Behavioral of comparador is

    signal p_o1, p_o2, p_o3 : std_logic;

  begin

    comb : process (data)
    begin
      if (To_integer(unsigned(data)) > End_Of_Screen)  then
        p_o1 <='1';
      else
        p_o1 <='0';
      end if;

      if (Start_Of_Pulse < To_integer(unsigned(data))  and To_integer(unsigned(data)) < End_Of_Pulse) then
        p_o2 <='0';--Los valores son inversos
      else
        p_o2 <='1';
      end if;

      if (To_integer(unsigned(data)) = End_Of_Line) then
        p_o3 <='1';
      else
        p_o3 <='0';
      end if;

      end process;
      sinc : process(reset,p_o1,p_o2,p_o3)
      begin
        if (reset = '1') then
          O1<='0';
          O2<='1'; --El reset es con el valor activo
          O3<='0';
        elsif rising_edge(clk) then
          O1 <= p_o1;
          O2 <= p_o2;
          O3 <= p_o3;
          end if;
        end process;

    end Behavioral;
