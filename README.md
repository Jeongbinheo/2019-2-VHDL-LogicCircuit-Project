# Beverage Vending Machine
> ## Introduction
  
This repository has VHDL-codes for the term-project of Digital Logic Circuit Design which was proceeded during 2019-2.

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
