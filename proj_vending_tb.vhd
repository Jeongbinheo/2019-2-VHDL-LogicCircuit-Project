--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:36:52 11/24/2019
-- Design Name:   
-- Module Name:   C:/Desktop/termproject/proj_vending_tb.vhd
-- Project Name:  termproject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: proj_vending_mod
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY proj_vending_tb IS
END proj_vending_tb;
 
ARCHITECTURE behavior OF proj_vending_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT proj_vending_mod
    PORT(
         ck : IN  std_logic;
         rst : IN  std_logic;
         rtn : IN  std_logic;
         coin50 : IN  std_logic;
         coin100 : IN  std_logic;
         coin500 : IN  std_logic;
         paper1000 : IN  std_logic;
         coffee_button : IN  std_logic;
         yulmoo_button : IN  std_logic;
         coffee_psb : OUT  std_logic;
         yulmoo_psb : OUT  std_logic;
         coffee_out : OUT  std_logic;
         yulmoo_out : OUT  std_logic;
         rtn50 : OUT  std_logic;
         rtn100 : OUT  std_logic;
         rtn500 : OUT  std_logic;
         rtn1000 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ck : std_logic := '0';
   signal rst : std_logic := '0';
   signal rtn : std_logic := '0';
   signal coin50 : std_logic := '0';
   signal coin100 : std_logic := '0';
   signal coin500 : std_logic := '0';
   signal paper1000 : std_logic := '0';
   signal coffee_button : std_logic := '0';
   signal yulmoo_button : std_logic := '0';

 	--Outputs
   signal coffee_psb : std_logic;
   signal yulmoo_psb : std_logic;
   signal coffee_out : std_logic;
   signal yulmoo_out : std_logic;
   signal rtn50 : std_logic;
   signal rtn100 : std_logic;
   signal rtn500 : std_logic;
   signal rtn1000 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: proj_vending_mod PORT MAP (ck,rst,rtn,coin50,coin100,coin500,paper1000,coffee_button,
          yulmoo_button,coffee_psb,yulmoo_psb,coffee_out,yulmoo_out,rtn50,rtn100,rtn500,rtn1000);
	
	--	pro1: process   --ck 10ns 마다 0 1 반복하도록 하는 process
	--		begin 
	--			ck <= '0'; wait for 10ns;
	--			ck <= '1'; wait for 10ns;
	--		end process pro1;

	--	rst <= '0';	
	--	coin50<='0';
	--	coin100 <='0', '1' after 35ns, '0' after 55ns, '1' after 75ns, '0' after 95ns;
	--	coin500 <= '0', '1' after 105ns, '0' after 125ns, '1' after 145ns, '0' after 165ns;
	--	paper1000 <= '0';
	--	coffee_button <= '0';
	--	yulmoo_button <= '0';	
	--	rtn <= '0';
	
	-- pro1: process 
	--		begin 
	--			ck <= '0'; wait for 10ns;
	--			ck <= '1'; wait for 10ns;
	--		end process pro1;
			
	--		rst <= '0', '1' after 130ns, '0' after 140ns; 
	--		coin100 <='0', '1' after 35ns, '0' after 55ns, '1' after 75ns, '0' after 95ns;
	--		coin500 <= '0', '1' after 105ns, '0' after 125ns, '1' after 145ns, '0' after 165ns;
	--		coffee_button <= '0', '1' after 185ns, '0' after 205ns; 
	--		rtn <= '0', '1' after 335ns,'0' after 355ns;
		
		pro1: process
			begin 
				ck <= '0'; wait for 10ns;
				ck <= '1'; wait for 10ns;
			end process pro1;
			
			rst <= '0';
			coin50<='0';
			coin100 <='0';		
			paper1000 <='0', '1' after 35ns, '0' after 55ns;
			coffee_button <= '0', '1' after 75ns, '0' after 95ns; 
			coin500 <= '0', '1' after 125ns, '0' after 145ns; 
			rtn <= '0';
		
END;
