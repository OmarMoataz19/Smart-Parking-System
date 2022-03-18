library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.round;


entity servo is
  generic (
    clk_hz : real;
    pulse_hz : real; -- PWM pulse frequency
    min_pulse_us : real; -- uS pulse width at min position
    max_pulse_us : real; -- uS pulse width at max position
    step_count : positive -- Number of steps from min to max
  );
  port (
    clk : in std_logic;
    rst : in std_logic;
    position : in integer range 0 to step_count - 1;
    pwm : out std_logic
  );
end servo;
ARCHITECTURE serve OF servo IS

function cycles_per_us (us_count : real) return integer is
begin
  return integer(round(clk_hz / 1.0e6 * us_count));
end function;


constant min_count : integer := cycles_per_us(min_pulse_us);
constant max_count : integer := cycles_per_us(max_pulse_us);
constant min_max_range_us : real := max_pulse_us - min_pulse_us;
constant step_us : real := min_max_range_us / real(step_count - 1);
constant cycles_per_step : positive := cycles_per_us(step_us);


constant counter_max : integer := integer(round(clk_hz / pulse_hz)) - 1;
signal counter : integer range 0 to counter_max;
 
signal duty_cycle : integer range 0 to max_count;

begin



COUNTER_PROC : process(clk)
begin
  if rising_edge(clk) then
    if rst = '1' then
      counter <= 0;
 
    else
      if counter < counter_max then
        counter <= counter + 1;
      else
        counter <= 0;
      end if;
 
    end if;
  end if;
end process;



PWM_PROC : process(clk)
begin
  if rising_edge(clk) then
    if rst = '1' then
      pwm <= '0';
 
    else
      pwm <= '0';
 
      if counter < duty_cycle then
        pwm <= '1';
      end if;
 
    end if;
  end if;
end process;	



DUTY_CYCLE_PROC : process(clk)
begin
  if rising_edge(clk) then
    if rst = '1' then
      duty_cycle <= min_count;
 
    else
      duty_cycle <= position * cycles_per_step + min_count;
 
    end if;
  end if;
end process;
end serve;