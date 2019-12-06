----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:56:15 11/22/2019 
-- Design Name: 
-- Module Name:    proj_vending_mod - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity proj_vending_mod is 
	port(ck : in std_logic;
		  rst : in std_logic;
		  rtn : in std_logic;
		  coin50, coin100, coin500, paper1000 : in std_logic;
		  coffee_button : in std_logic;
		  yulmoo_button : in std_logic;
		  coffee_psb : out std_logic;
		  yulmoo_psb : out std_logic;
		  coffee_out : out std_logic;
		  yulmoo_out : out std_logic;
		  rtn50, rtn100, rtn500, rtn1000 : out std_logic);
end proj_vending_mod;

architecture Behavioral of proj_vending_mod is
	
	type coinstate is (s0,s50,s100,s150,s200,s250,s300,s350,s400,s450,s500,
				s550,s600,s650,s700,s750,s800,s850,s900,s950,s1000, rtnstate, rtns50, rtns100, rtns500, rtns1000);
	
	signal state : coinstate;

begin 
	process(ck,rst,rtn,coin50,coin100,coin500,paper1000,coffee_button,yulmoo_button)
			variable returncoin50,returncoin100,returncoin500,returnpaper1000 : integer:=0;	
					begin
						if(rst='1') then
							state <= s0;
						elsif(ck'event and ck='1') then
							
							case state is
								
								when s0 => coffee_out <= '0';  
								coffee_psb <= '0';		
								yulmoo_out <= '0';
								yulmoo_psb <= '0';
								returncoin50 := 0;
								returncoin100 := 0;
								returncoin500 := 0;
								returnpaper1000 := 0;
								
									if(coin50 = '1') then 	
										state <= s50;
							
									elsif(coin100 = '1') then	
										state <= s100;
							
									elsif(coin500 = '1') then	
										state <= s500;
									
									elsif(paper1000 = '1') then		
										state <= s1000;
									
									else state <= s0;		
										  
									end if;
									
								when s50 => coffee_out <= '0';
								coffee_psb <= '0';
								yulmoo_out <= '0';
								yulmoo_psb <= '0';	
								returncoin50 := 1;
								returncoin100 := 0;
								returncoin500 := 0;
								returnpaper1000 := 0;
								
									if(coin50 = '1') then 
										state <= s100;
							
									elsif(coin100 = '1') then
										state <= s150;
							
									elsif(coin500 = '1') then
										state <= s550;
									
									elsif(paper1000 = '1') then		
										returnpaper1000 := 1;
										state <= rtnstate;
									
									elsif(rtn = '1') then	
										state <= rtnstate;
							
									else state <= s50;
										  
									end if;

								when s100 => coffee_out <= '0';
								coffee_psb <= '0';
								yulmoo_out <= '0';
								yulmoo_psb <= '0';	
								returncoin50 := 0;
								returncoin100 := 1;
								returncoin500 := 0;
								returnpaper1000 := 0;
								
									if(coin50 = '1') then 
										state <= s150;
							
									elsif(coin100 = '1') then
										state <= s200;
							
									elsif(coin500 = '1') then
										state <= s600;
										
									elsif(paper1000 = '1') then
										returnpaper1000 := 1;	
										state <= rtnstate;	
							 
									elsif(rtn = '1') then	
										state <= rtnstate;
							
									else state <= s100;
										  
									end if;			
								
								when s150 => coffee_out <= '0';
								coffee_psb <= '0';
								yulmoo_out <= '0';
								yulmoo_psb <= '1';	
								returncoin50 := 1;
								returncoin100 := 1;
								returncoin500 := 0;
								returnpaper1000 := 0;
								
									if(coin50 = '1') then 
										state <= s200;
							
									elsif(coin100 = '1') then
										state <= s250;
							
									elsif(coin500 = '1') then
										state <= s650;
									
									elsif(paper1000 = '1') then		
										returnpaper1000 := 1;
										state <= rtnstate;
							 
									elsif(rtn = '1') then	
										state <= rtnstate;
							
									elsif(yulmoo_button = '1') then
										state <= s0;
										yulmoo_out <= '1';
											
									else state <= s150;
										  
									end if;
									
								when s200 => coffee_out <= '0';
								coffee_psb <= '1';
								yulmoo_out <= '0';
								yulmoo_psb <= '1';	
								returncoin50 := 0;
								returncoin100 := 2;
								returncoin500 := 0;
								returnpaper1000 := 0;
								
									if(coin50 = '1') then 
										state <= s250;
							
									elsif(coin100 = '1') then
										state <= s300;
							
									elsif(coin500 = '1') then
										state <= s700;
									
									elsif(paper1000 = '1') then		
										returnpaper1000 := 1;
										state <= rtnstate;
									
									elsif(rtn = '1') then	
										state <= rtnstate;
									
									elsif(yulmoo_button = '1') then
										state <= s50;
										yulmoo_out <= '1';
									
									elsif(coffee_button = '1') then
										state <= s0;
										coffee_out <= '1';
									
									else state <= s200;
										  
									end if;	
									
								when s250 => coffee_out <= '0';
								coffee_psb <= '1';
								yulmoo_out <= '0';
								yulmoo_psb <= '1';	
								returncoin50 := 1;
								returncoin100 := 2;
								returncoin500 := 0;
								returnpaper1000 := 0;
								
									if(coin50 = '1') then 
										state <= s300;
							
									elsif(coin100 = '1') then
										state <= s350;
							
									elsif(coin500 = '1') then
										state <= s750;
										
									elsif(paper1000 = '1') then		
										returnpaper1000 := 1;
										state <= rtnstate;
									
									elsif(rtn = '1') then	
										state <= rtnstate;
									
									elsif(yulmoo_button = '1') then
										state <= s100;
										yulmoo_out <= '1';
									
									elsif(coffee_button = '1') then
										state <= s50;
										coffee_out <= '1';
									
									else state <= s250;
										  
									end if;	
								
								when s300 => coffee_out <= '0';
								coffee_psb <= '1';
								yulmoo_out <= '0';
								yulmoo_psb <= '1';	
								returncoin50 := 0;
								returncoin100 := 3;
								returncoin500 := 0;
								returnpaper1000 := 0;
								
									if(coin50 = '1') then 
										state <= s350;
							
									elsif(coin100 = '1') then
										state <= s400;
							
									elsif(coin500 = '1') then
										state <= s800;

									elsif(paper1000 = '1') then		
										returnpaper1000 := 1;
										state <= rtnstate;
							 
									elsif(rtn = '1') then	
										state <= rtnstate;
									
									elsif(yulmoo_button = '1') then
										state <= s150;
										yulmoo_out <= '1';
									
									elsif(coffee_button = '1') then
										state <= s100;
										coffee_out <= '1';
									
									else state <= s300;
										  
									end if;		

								when s350 => coffee_out <= '0';
								coffee_psb <= '1';
								yulmoo_out <= '0';
								yulmoo_psb <= '1';	
								returncoin50 := 1;
								returncoin100 := 3;
								returncoin500 := 0;
								returnpaper1000 := 0;
								
									if(coin50 = '1') then 
										state <= s400;
							
									elsif(coin100 = '1') then
										state <= s450;
							
									elsif(coin500 = '1') then
										state <= s850;
							
									elsif(paper1000 = '1') then		
										returnpaper1000 := 1;
										state <= rtnstate;

									elsif(rtn = '1') then	
										state <= rtnstate;
									
									elsif(yulmoo_button = '1') then
										state <= s200;
										yulmoo_out <= '1';
									
									elsif(coffee_button = '1') then
										state <= s250;
										coffee_out <= '1';
									
									else state <= s350;
										  
									end if;		

								when s400 => coffee_out <= '0';
								coffee_psb <= '1';
								yulmoo_out <= '0';
								yulmoo_psb <= '1';	
								returncoin50 :=0;
								returncoin100 := 4;
								returncoin500 := 0;
								returnpaper1000 := 0;
								
									if(coin50 = '1') then 
										state <= s450;
							
									elsif(coin100 = '1') then
										state <= s500;
							
									elsif(coin500 = '1') then
										state <= s900;
									
									elsif(paper1000 = '1') then		
										returnpaper1000 := 1;
										state <= rtnstate;
		
									elsif(rtn = '1') then	
										state <= rtnstate;
									
									elsif(yulmoo_button = '1') then
										state <= s250;
										yulmoo_out <= '1';
									
									elsif(coffee_button = '1') then
										state <= s300;
										coffee_out <= '1';
									
									else state <= s400;
										  
									end if;								
								
								when s450 => coffee_out <= '0';
								coffee_psb <= '1';
								yulmoo_out <= '0';
								yulmoo_psb <= '1';	
								returncoin50 :=1;
								returncoin100 := 4;
								returncoin500 := 0;
								returnpaper1000 := 0;
								
									if(coin50 = '1') then 
										state <= s500;
							
									elsif(coin100 = '1') then
										state <= s550;
							
									elsif(coin500 = '1') then
										state <= s950;
		
									elsif(paper1000 = '1') then		
										returnpaper1000 := 1;
										state <= rtnstate;

									elsif(rtn = '1') then	
										state <= rtnstate;
									
									elsif(yulmoo_button = '1') then
										state <= s300;
										yulmoo_out <= '1';
									
									elsif(coffee_button = '1') then
										state <= s250;
										coffee_out <= '1';
									
									else state <= s450;
										  
									end if;

								when s500 => coffee_out <= '0';
								coffee_psb <= '1';
								yulmoo_out <= '0';
								yulmoo_psb <= '1';	
								returncoin50 :=0;
								returncoin100 := 0;
								returncoin500 := 1;
								returnpaper1000 := 0;
								
									if(coin50 = '1') then 
										state <= s550;
							
									elsif(coin100 = '1') then
										state <= s600;
							
									elsif(coin500 = '1') then
										state <= s1000;
															
									elsif(paper1000 = '1') then															
										returnpaper1000 := 1;
										state <= rtnstate;
									
									elsif(rtn = '1') then	
										state <= rtnstate;
									
									elsif(yulmoo_button = '1') then
										state <= s350;
										yulmoo_out <= '1';
									
									elsif(coffee_button = '1') then
										state <= s300;
										coffee_out <= '1';
									
									else state <= s500;
										  
									end if;

								when s550 => coffee_out <= '0';
								coffee_psb <= '1';
								yulmoo_out <= '0';
								yulmoo_psb <= '1';	
								returncoin50 :=1;
								returncoin100 := 0;
								returncoin500 := 1;
								returnpaper1000 := 0;
								
									if(coin50 = '1') then 
										state <= s600;
							
									elsif(coin100 = '1') then
										state <= s650;
							
									elsif(coin500 = '1') then
										returncoin500 := 2;
										state <= rtnstate;

									elsif(paper1000 = '1') then															
										returnpaper1000 := 1;
										state <= rtnstate;
									
									elsif(rtn = '1') then	
										state <= rtnstate;
									
									elsif(yulmoo_button = '1') then
										state <= s400;
										yulmoo_out <= '1';
									
									elsif(coffee_button = '1') then
										state <= s350;
										coffee_out <= '1';
									
									else state <= s550;
										  
									end if;				

								when s600 => coffee_out <= '0';
								coffee_psb <= '1';
								yulmoo_out <= '0';
								yulmoo_psb <= '1';	
								returncoin50 := 0;
								returncoin100 := 1;
								returncoin500 := 1;
								returnpaper1000 := 0;
								
									if(coin50 = '1') then 
										state <= s650;
							
									elsif(coin100 = '1') then
										state <= s700;
							
									elsif(coin500 = '1') then
										returncoin500 := 2;
										state <= rtnstate;

									elsif(paper1000 = '1') then															
										returnpaper1000 := 1;
										state <= rtnstate;
									
									elsif(rtn = '1') then	
										state <= rtnstate;
									
									elsif(yulmoo_button = '1') then
										state <= s450;
										yulmoo_out <= '1';
									
									elsif(coffee_button = '1') then
										state <= s400;
										coffee_out <= '1';
									
									else state <= s600;
										  
									end if;			
									
								when s650 => coffee_out <= '0';
								coffee_psb <= '1';
								yulmoo_out <= '0';
								yulmoo_psb <= '1';	
								returncoin50 := 1;
								returncoin100 := 1;
								returncoin500 := 1;
								returnpaper1000 := 0;
								
									if(coin50 = '1') then 
										state <= s700;
							
									elsif(coin100 = '1') then
										state <= s750;
							
									elsif(coin500 = '1') then
										returncoin500 := 2;
										state <= rtnstate;
							
									elsif(paper1000 = '1') then															
										returnpaper1000 := 1;
										state <= rtnstate;
									
									elsif(rtn = '1') then	
										state <= rtnstate;
									
									elsif(yulmoo_button = '1') then
										state <= s500;
										yulmoo_out <= '1';
									
									elsif(coffee_button = '1') then
										state <= s450;
										coffee_out <= '1';
									
									else state <= s650;
										  
									end if;
									
								when s700 => coffee_out <= '0';
								coffee_psb <= '1';
								yulmoo_out <= '0';
								yulmoo_psb <= '1';	
								returncoin50 := 0;
								returncoin100 := 2;
								returncoin500 := 1;
								returnpaper1000 := 0;
								
									if(coin50 = '1') then 
										state <= s750;
							
									elsif(coin100 = '1') then
										state <= s800;
							
									elsif(coin500 = '1') then
										returncoin500 := 2;
										state <= rtnstate;
							
									elsif(paper1000 = '1') then															
										returnpaper1000 := 1;
										state <= rtnstate;
							 
									elsif(rtn = '1') then	
										state <= rtnstate;
									
									elsif(yulmoo_button = '1') then
										state <= s550;
										yulmoo_out <= '1';
									
									elsif(coffee_button = '1') then
										state <= s500;
										coffee_out <= '1';
									
									else state <= s700;
										  
									end if;	
									
								when s750 => coffee_out <= '0';
								coffee_psb <= '1';
								yulmoo_out <= '0';
								yulmoo_psb <= '1';	
								returncoin50 := 1;
								returncoin100 := 2;
								returncoin500 := 1;
								returnpaper1000 := 0;
								
									if(coin50 = '1') then 
										state <= s800;
							
									elsif(coin100 = '1') then
										state <= s850;
							
									elsif(coin500 = '1') then
										returncoin500 := 2;
										state <= rtnstate;
							
									elsif(paper1000 = '1') then															
										returnpaper1000 := 1;
										state <= rtnstate;
							 
									elsif(rtn = '1') then	
										state <= rtnstate;
									
									elsif(yulmoo_button = '1') then
										state <= s600;
										yulmoo_out <= '1';
									
									elsif(coffee_button = '1') then
										state <= s550;
										coffee_out <= '1';
									
									else state <= s750;
										  
									end if;		
	
								when s800 => coffee_out <= '0';
								coffee_psb <= '1';
								yulmoo_out <= '0';
								yulmoo_psb <= '1';	
								returncoin50 := 0;
								returncoin100 := 3;
								returncoin500 := 1;
								returnpaper1000 := 0;
								
									if(coin50 = '1') then 
										state <= s850;
							
									elsif(coin100 = '1') then
										state <= s900;
							
									elsif(coin500 = '1') then
										returncoin500 := 2;
										state <= rtnstate;
							
									elsif(paper1000 = '1') then															
										returnpaper1000 := 1;
										state <= rtnstate;
							 
									elsif(rtn = '1') then	
										state <= rtnstate;
									
									elsif(yulmoo_button = '1') then
										state <= s650;
										yulmoo_out <= '1';
									
									elsif(coffee_button = '1') then
										state <= s600;
										coffee_out <= '1';
									
									else state <= s800;
										  
									end if;

								when s850 => coffee_out <= '0';
								coffee_psb <= '1';
								yulmoo_out <= '0';
								yulmoo_psb <= '1';	
								returncoin50 := 1;
								returncoin100 := 3;
								returncoin500 := 1;
								returnpaper1000 := 0;
								
									if(coin50 = '1') then 
										state <= s900;
							
									elsif(coin100 = '1') then
										state <= s950;
							
									elsif(coin500 = '1') then
										returncoin500 := 2;
										state <= rtnstate;
							
									elsif(paper1000 = '1') then															
										returnpaper1000 := 1;
										state <= rtnstate;
							 
									elsif(rtn = '1') then	
										state <= rtnstate;
									
									elsif(yulmoo_button = '1') then
										state <= s700;
										yulmoo_out <= '1';
									
									elsif(coffee_button = '1') then
										state <= s650;
										coffee_out <= '1';
									
									else state <= s850;
										  
									end if;		

								when s900 => coffee_out <= '0';
								coffee_psb <= '1';
								yulmoo_out <= '0';
								yulmoo_psb <= '1';	
								returncoin50 := 0;
								returncoin100 := 4;
								returncoin500 := 1;
								returnpaper1000 := 0;
								
									if(coin50 = '1') then 
										state <= s950;
							
									elsif(coin100 = '1') then
										state <= s1000;
							
									elsif(coin500 = '1') then
										returncoin500 := 2;
										state <= rtnstate;
							
									elsif(paper1000 = '1') then															
										returnpaper1000 := 1;
										state <= rtnstate;
							 
									elsif(rtn = '1') then	
										state <= rtnstate;
									
									elsif(yulmoo_button = '1') then
										state <= s750;
										yulmoo_out <= '1';
									
									elsif(coffee_button = '1') then
										state <= s700;
										coffee_out <= '1';
									
									else state <= s950;
										  
									end if;

								when s950 => coffee_out <= '0';
								coffee_psb <= '1';
								yulmoo_out <= '0';
								yulmoo_psb <= '1';	
								returncoin50 := 1;
								returncoin100 := 4;
								returncoin500 := 1;
								returnpaper1000 := 0;
									
									if(coin50 = '1') then 
										state <= s1000;
							
									elsif(coin100 = '1') then
										state <= s50;
										state <= rtnstate;
										state <= s1000;
							
									elsif(coin500 = '1') then
										returncoin500 := 2;
										state <= rtnstate;
							
									elsif(paper1000 = '1') then															
										returnpaper1000 := 1;
										state <= rtnstate;
							 
									elsif(rtn = '1') then	
										state <= rtnstate;
									
									elsif(yulmoo_button = '1') then
										state <= s800;
										yulmoo_out <= '1';
									
									elsif(coffee_button = '1') then
										state <= s750;
										coffee_out <= '1';
									
									else state <= s950;
										  
									end if;

								when s1000 => coffee_out <= '0';
								coffee_psb <= '1';
								yulmoo_out <= '0';
								yulmoo_psb <= '1';	
								returncoin50 := 0;
								returncoin100 := 0;
								returncoin500 := 0;
								returnpaper1000 := 1;
								
									if(coin50 = '1') then 
										returncoin50 := 1;
										state <= rtnstate;
							
									elsif(coin100 = '1') then
										returncoin100 := 1;
										state <= rtnstate;
										
									elsif(coin500 = '1') then
										returncoin500 := 1;
										state <= rtnstate;
							
									elsif(paper1000 = '1') then															
										returnpaper1000 := 2;
										state <= rtnstate;	
										
									elsif(rtn = '1') then	
										state <= rtnstate;
									
									elsif(yulmoo_button = '1') then
										state <= s850;
										yulmoo_out <= '1';
									
									elsif(coffee_button = '1') then
										state <= s800;
										coffee_out <= '1';
									
									else state <= s1000;
										  
									end if;
						
						when rtnstate => coffee_out <= '0';
							coffee_psb <= '0';
							yulmoo_out <= '0';
							yulmoo_psb <= '0';
							rtn50 <= '0';
							rtn100 <= '0';
							rtn500 <= '0';
							rtn1000 <= '0';		 		  
							
							if(returncoin50>0) then 	
								state <= rtns50;
							
							elsif(returncoin100>0) then	
								state <= rtns100;
							
							elsif(returncoin500>0) then	
								state <= rtns500;
							
							elsif(returnpaper1000>0) then
								state <= rtns1000;
							
							else state <= s0;		
										  
							end if;	
							
							
						when rtns50 => coffee_out <= '0';
							coffee_psb <= '0';
							yulmoo_out <= '0';
							yulmoo_psb <= '0';
							returncoin50 := returncoin50-1;	
							state <= rtnstate;		
							rtn50 <= '1';			
															  
						when rtns100 => coffee_out <= '0';
							coffee_psb <= '0';
							yulmoo_out <= '0';
							yulmoo_psb <= '0';
							returncoin100 := returncoin100-1;
							state <= rtnstate;			
							rtn100 <= '1';		  
						
						when rtns500 => coffee_out <= '0';
							coffee_psb <= '0';
							yulmoo_out <= '0';
							yulmoo_psb <= '0';
							returncoin500 := returncoin500-1;	
							state <= rtnstate;			
							rtn500 <= '1';	
						
						when rtns1000 => coffee_out <= '0';
							coffee_psb <= '0';
							yulmoo_out <= '0';
							yulmoo_psb <= '0';
							returnpaper1000 := returnpaper1000-1;	
							state <= rtnstate;			
							rtn1000 <= '1';				
							
						end case;		
				end if;		
		end process;	
end Behavioral;										

											
						
