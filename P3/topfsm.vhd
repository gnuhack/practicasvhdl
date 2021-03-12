library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity topfsm is
  port (
    clk    : in std_logic;
    rst    : in std_logic;
    button : in std_logic
    );
end topfsm;

  architecture topfsm_arch of topfsm is

--    signal clk, button, rst, tx : std_logic;
    signal tx : std_logic;
    signal addr : std_logic_vector (3 downto 0);    
    signal direcc : std_logic_vector (3 downto 0);
    signal data : std_logic_vector (7 downto 0);

      component fsm is
          generic (ancho_bus_dir      : integer := 4;
                     VAL_SAT_CONT     : integer := 20000;
                       ANCHO_CONTADOR : integer := 20);
            port (clk            : in  std_logic;
                    rst          : in  std_logic;
                      button     : in  std_logic;
                        data     : in  std_logic_vector(7 downto 0);
                          direcc : out std_logic_vector(ancho_bus_dir-1 downto 0);
                            TX   : out std_logic);
        end component;

      component mirom is
          port(rst        : in  std_logic;
                 clk      : in  std_logic;
                   addr   : in  std_logic_vector (3 downto 0);
                     data : out std_logic_vector (7 downto 0)
                 );
        end component;

begin

  fsmi : fsm
    generic map(ancho_bus_dir  => 4,
                VAL_SAT_CONT   => 20000,
                ANCHO_CONTADOR => 20)
    port map (clk => clk,
              rst => rst,
              button => button,
              data => data,
              direcc => addr,
              TX => TX
              );

    miromi : mirom
    port map(rst => rst,
             clk => clk,
             addr => direcc,
             data => data
             );

end topfsm_arch;
