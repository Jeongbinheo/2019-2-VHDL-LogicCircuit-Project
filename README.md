# Beverage Vending Machine
> ## Introduction
  
This repository has VHDL-codes for the term-project of Digital Logic Circuit Design 

which was proceeded during 2019-2.

The codes are written for realizing simple Beverage Vending Machine through using FSM skill.

Now I'll explain how the codes operate and how the vending machine acts in a logic signal.  

> ## Condition Of Vending Machine

- 투입금액 종류 : 50원, 100원, 500원, 1000원
   
- 최대 투입 가능 금액 : 1000원 까지

- 커피 금액 : 200원

- 율무 금액 : 150원

- 버튼 종류 : 커피, 율무, 반환, Reset

 - High일 때 Reset 실행하고, Reset은 처음 state로 이동

 -  최대 금액 넘을 경우 자동 반환
 


>## How to Operate 
  - ### Simulation 1
  =>100원 2개, 500원 2개 넣고 자동반환
- How to realize clock
``` VHDL
pro1: process --ck 10ns 마다 0 1 반복하도록 하는 process
	begin
		ck <= '0'; wait for 10ns;
		ck <= '1'; wait for 10ns;
	end process pro1;
```
 - Simulation Cource
```VHDL
	rst <= 0;
	coin50<=’0’;
	coin100 <='0', '1' after 35ns, '0' after 55ns, '1' after 75ns, '0' after 95ns;
	coin500 <= '0', '1' after 105ns, '0' after 125ns, '1' after 145ns, '0' after 165ns;

	paper1000 <= ‘0’;
	coffee_button <= ‘0’;
	yulmoo_button <= ‘0’;
	rtn <= '0', '1' after 335ns,'0' after 355ns;
```
- Result of Simulation
![structure](https://blogfiles.pstatic.net/MjAxOTEyMDZfNDEg/MDAxNTc1NjQxMDk4MTgx.GA9Mlxl_c1QFqlYVBHF5VsYEG5KQawCT_ymvZNl892cg.iWPDjk75ZhO2CLmfEufITFDkZal9fzikTiXv7nxEziwg.JPEG.hdh988/%EC%8B%9C%EB%AE%AC%EB%A0%88%EC%9D%B4%EC%85%981.jpg?type=w2)


 - ### Simulation 2
=>100원 2개, 500원 1개 넣고 리셋한 후 다시 500원 넣고 커피 1개 뽑고 잔돈 반환하기
- How to realize clock
``` VHDL
pro1: process --ck 10ns 마다 0 1 반복하도록 하는 process
	begin
		ck <= '0'; wait for 10ns;
		ck <= '1'; wait for 10ns;
	end process pro1;
```
 - Simulation Cource
```VHDL
	rst <= '0', '1' after 130ns, '0' after 140ns;
	coin100 <='0', '1' after 35ns, '0' after 55ns, '1' after 75ns, '0' after 95ns;
	coin500 <= '0', '1' after 105ns, '0' after 125ns, '1' after 145ns, '0' after 165ns;
	coffee_button <= '0', '1' after 185ns, '0' after 205ns;
	rtn <= '0', '1' after 335ns,'0' after 355ns;
```
- Result of Simulation
![structure](https://blogfiles.pstatic.net/MjAxOTEyMDZfMjY3/MDAxNTc1NjQxMTYyNTQ3.VmGkrhHmdFxZ1AtDaEkJhWx2wZ5SySCsyMp1-75JHMUg.R6bzNLdRAeSrSnVXNpha7GTRlFTqchNF4-dyEju0ubYg.JPEG.hdh988/%EA%B9%83%ED%97%88%EB%B8%8C3.jpg?type=w2)

> ## Important Codes
> 1. [Reset](README.md#Reset)
>
> 2. [Returnstate](README.md#Returnstate)
>
> 3. [StateOFmoney](README.md#StateOFmoney)
>
  
  - ### **Reset**  
```VHDL 
process(ck,rst,rtn,coin50,coin100,coin500,paper1000,coffee_button,yulmoo_button)

	variable returncoin50, returncoin100, returncoin500, returnpaper1000, rtnstate2 : integer:=0;

	begin
	if(rst='1') then
	state <= s0;
```


프로세스를 시작하는 부분에 RST변수에 대한 if문을 설정하여
high 신호가 오면 s0으로 보내도록 처리함

  - ### **Returnstate**  
```VHDL 
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
```

Return에 1이 입력되면 rtnstate로 보내져 return 을 실행하는데
returncoin50, 100, 500, 1000에 들어있는 숫자만큼 모두 반환하는 코드


  - ### **StateOFmoney**  
  각 금액별 state가 있지만 900원을 예로 설명하겠습니다.
  
```VHDL 
	when s900 => coffee_out <= '0';
								coffee_psb <= '1'; -- 커피 버튼에 불 들어옴
								yulmoo_out <= '0';
								yulmoo_psb <= '1'; -- 율무 버튼에 불 들어옴	
								returncoin50 := 0;
								returncoin100 := 4; -- 반환해야하는 100원 수 
								returncoin500 := 1; -- 반환해야하는 500원 수
								returnpaper1000 := 0;
								
									if(coin50 = '1') then 
										state <= s950; -- 50원 추가되면 950원 됨
							
									elsif(coin100 = '1') then
										state <= s1000; -- 100원 추가되면 1000원 됨
							
									elsif(coin500 = '1') then
										returncoin500 := 2; -- 500원 추가되면 1400원 되서 반환해야함
										state <= rtnstate;
							
									elsif(paper1000 = '1') then															
										returnpaper1000 := 1;-- 1000원 추가되면 1900원되서 반환해야함
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

```

