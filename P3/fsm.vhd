library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity fsm is
  generic (ancho_bus_dir  : integer := 4;
           VAL_SAT_CONT   : integer := 20000;
           ANCHO_CONTADOR : integer := 20);
  port (clk    : in  std_logic;
        rst    : in  std_logic;
        button : in  std_logic;
        data   : in  std_logic_vector(7 downto 0);
        direcc : out std_logic_vector(ancho_bus_dir-1 downto 0);
        TX     : out std_logic);
end fsm;

  architecture fsm_arch of fsm is

  type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13);
  signal state : state_type;

--  signal clk, enable, rst, button, TX : std_logic;
--  signal data                         : std_logic_vector(7 downto 0);
--  signal direcc                       : std_logic_vector(3 downto 0);
    signal reset, enable, resets : std_logic;
    signal p_dir,dir : std_logic_vector (3 downto 0);
    signal p_cont,cont : std_logic_vector (7 downto 0);
    
  component contador is
    generic (Nbit : integer := 8);
    port (clk    : in  std_logic;
          reset  : in  std_logic;
          enable : in  std_logic;
          resets : in  std_logic;
          Q      : out std_logic_vector (Nbit-1 downto 0));
  end component;

  begin

    contdir : contador
      generic map(
        Nbit => 20
        )
      port map(
        clk    => clk,
        reset  => reset,
        enable => enable,
        resets => resets,
        Q => p_dir
        );

      contdato : contador
      generic map(
        Nbit => 20
        )
      port map(
        clk => clk,
        reset => reset,
        enable => enable,
        resets => resets,
        Q => p_cont
        );


      mde : process(clk, reset)
      begin

        if reset = '1' then
          state <= s0;
        elsif (rising_edge(clk)) then
          case state is
            when s0 =>
              tx     <= '1';
              p_dir  <= "0000";
              p_cont <= "00000000";

              if (button = '1') then
                state <= s1;
              else
                state <= s0;
              end if;
            when s1 =>
              if (true) then
                state <= s2;
              else
                state <= s1;
              end if;
            when s2 =>
              if (data /= "00000000") then
                state <= s3;
              elsif (data = "00000000") then
                state <= s0;
              else
                state <= s2;
              end if;
            when s3 =>
              tx     <= '0';              
              p_cont <= std_logic_vector(unsigned(cont)+1);
              if (to_integer(unsigned(cont)) = val_sat_cont) then
                p_cont <= "00000000";
                state  <= s4;
              else
                state <= s3;
              end if;
            when s4 =>
              tx     <= data(0);
              p_cont <= std_logic_vector(unsigned(cont)+1);
              if (to_integer(unsigned(cont)) = val_sat_cont) then
                p_cont <= "00000000";
                state  <= s5;
              else
                state <= s4;
              end if;
            when s5 =>
              tx     <= data(1);
              p_cont <= std_logic_vector(unsigned(cont)+1);
              if (to_integer(unsigned(cont)) = val_sat_cont) then
                p_cont <= "00000000";
                state  <= s6;
              else
                state <= s5;
              end if;
            when s6 =>
              tx     <= data(2);
              p_cont <= std_logic_vector(unsigned(cont)+1);
              if (to_integer(unsigned(cont)) = val_sat_cont) then
                p_cont <= "00000000";
                state  <= s6;
              else
                state <= s5;
              end if;
            when s7 =>
              tx     <= data(3);
              p_cont <= std_logic_vector(unsigned(cont)+1);
              if (to_integer(unsigned(cont)) = val_sat_cont) then
                p_cont <= "00000000";
                state  <= s8;
              else
                state <= s7;
              end if;
            when s8 =>
              tx     <= data(4);
              p_cont <= std_logic_vector(unsigned(cont)+1);
              if (to_integer(unsigned(cont)) = val_sat_cont) then
                p_cont <= "00000000";
                state  <= s9;
              else
                state <= s8;
              end if;
            when s9 =>
              tx     <= data(5);
              p_cont <= std_logic_vector(unsigned(cont)+1);
              if (to_integer(unsigned(cont)) = val_sat_cont) then
                p_cont <= "00000000";
                state  <= s10;
              else
                state <= s9;
              end if;
            when s10 =>
              tx     <= data(6);
              p_cont <= std_logic_vector(unsigned(cont)+1);
              if (to_integer(unsigned(cont)) = val_sat_cont) then
                p_cont <= "00000000";
                state  <= s11;
              else
                state <= s10;
              end if;
            when s11 =>
              tx     <= data(7);
              p_cont <= std_logic_vector(unsigned(cont)+1);
              if (to_integer(unsigned(cont)) = val_sat_cont) then
                p_cont <= "00000000";
                state  <= s12;
              else
                state <= s11;
              end if;
            when s12 =>
              tx     <= data(0) xor data(1) xor data(2) xor data(3) xor data(4) xor data(5) xor data(6) xor data(7);
              p_cont <= std_logic_vector(unsigned(cont)+1);
              if (to_integer(unsigned(cont)) = val_sat_cont) then
                p_cont <= "00000000";
                state  <= s13;
              else
                state <= s12;
              end if;
            when s13 =>
              tx     <= '1';
              p_cont <= std_logic_vector(unsigned(cont)+1);
              if (to_integer(unsigned(cont)) = val_sat_cont) then
                p_cont <= "00000000";
                p_dir  <= std_logic_vector(unsigned(dir)+1);
                state  <= s1;
              else
                state <= s13;
              end if;
        end case;
        end if;
      end process;


      mdeout : process(state)
      begin

        case state is
          when s13 =>
            direcc <= p_dir;
        when others =>
          
            end case;
      end process;



      end fsm_arch;



