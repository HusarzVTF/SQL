### Petrol Station

    Simplified simulation of petrol station.

### Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Features](#features)
* [Setup](#setup)
* [Acknowledgements](#Acknowledgements)
* [Extras](#Extras)

### General info
* Database diagram 

![Database diagram](./Database_Diagram.jpg) 

### Features

### Stored Procedures -> Time period for analysis presented on screenshots examples: years 2020-2022
* ![Sales & Purchase Report](<Schematy/Ope/Stored Procedures/uspZakupy_Sprzedaz_Raport>)


  ![Screenshot example](./Schematy/Ope/Raport_zbiorczy.JPG)


* ![Simplified profit and loss statment](<Schematy/Ope/Stored Procedures/_ALTER_uspZrobWynik>)

  ![Screenshot example](./Schematy/Ope/Wynik_Operacyjny.JPG)
  
  
* ![Simplified cash flow statment](<Schematy/Ope/Stored Procedures/uspCashFlow>)

 Cash flow is divided into two periods: past and future (forecast). If user provide data only from the past column 'Prognoza' will be empty.
 If user provide data only from future column 'Realny' will be empty.
 If user provide data which starts in past and ends in future cash flow will be divided appropriately into this two columns ('Realny','Prognoza').  

  ![Screenshot example](./Schematy/Ope/Casf_Flow.JPG)
    

* ![Simplified financial analysis based on basic indicators](<Schematy/Ope/Stored Procedures/uspAnaliza_Fin>)

  ![Screenshot example](./Schematy/Ope/Analiza_fin_2020-2022.JPG)

* ![Stock analysis](<Schematy/Ope/Stored Procedures/uspAnaliza_Zapasow>)

* ![Aging: receivables, labilities](<Schematy/Ope/Stored Procedures/uspWiekowanie>)


  ![Screenshot example for aging receivables](./Schematy/Ope/Wiekowanie_Naleznosci_total.JPG)

  ![Screenshot example for aging labilities](./Schematy/Ope/Wiekowanie_Zobowiazan_total.JPG)

* ![Break even point calculator](<Schematy/Ope/Stored Procedures/uspBEP_Kalkulator>)

 Break event point gives answer how much a company needs to sell to cover all costs (fixed and variable which refers to the volume of production).
 When production is greater then estimated by BEP company is earning profit.
 In some cases it is good to have a better precision and more flexible simulation.
 Especially when we have more than one product with different margin levels and supply prices.
 All calculations are in current margin levels, supply prices and costs.
 BEP calculator is useful tool to answer questions like:
 "How much litres of fuel type one we need to sell in current prices and in provided period of time,
 if we sell one hundred litres of fuel type two and three or if we want to cover half costs by selling fuel two."
 We are able to provide such parameters: 
 - period of time
 - fuel/s
 - quantity for fuels or percentage of costs to cover
 
 Which are represented by such parameters in BEP_Kalk stored procedure:
 
 	@od = '2020-03-01',
	@do = '2024-12-31',
	@typ = N'Benzyna',
	@il = 2000,
	@ks_pro = NULL,
	@typ_1 = N'Gaz',
	@il_1 = NULL,
	@ks_pro_1 = 0.40
		
Which means that we wanted to know how much oil do we need to sell if we sell 105 999 litres of petrol 
and we will simulate that we want to cover 45% of costs by selling gas. 
We are able to change the question flexible with parameters like costs level to cover and
quantity to sell. We can mix it like that:
 - we provide quantity for two fuels
 - we provide quantity for one fuel and costs percentage to cover for second fuel
 - we provide percentage costs to cover for two fuels
 In every case we are able to provide data for two fules out of three.
 
 The result of such query is shown on below screenshot:
 
 ![Screenshot example](./Schematy/Ope/BEP_calc.JPG)
 
 In this case we see that we don't have enough gas in stocks if we want to keep strategy
 with provided parameters. In this case we need to change margin levels to higher
 or buy more gas or combine all off it.
 


* ![Customers segmentation](<Schematy/Ope/Stored Procedures/uspKlasyfikacja_klientow>)

 The idea of customer segmentation is to choose correct parameters to describe real value of customers.
 Choosen parameters are (in order from left to right according to below screenshot): 
 - income from invoices
 - percentage of unpaid income from invoices calculated as unpaid income divided by income
 - percentage of unpaid and overdue income calculated as unpaid and overdue income divided by income
 - number of invoices
 - number of bought fuels


  ![Customers segmentation](./Schematy/Ope/Klasyfikacja_klientow.JPG)

* ![Transactions](<Schematy/Ope/Stored Procedures/usp_Transakcje>)
  
* ![Fuel_Sales Rank](<Schematy/Ope/Stored Procedures/uspSprz_Rank_Paliwa>)

  ![Fuel_Sales Rank](./Schematy/Ope/Sprzedaz_paliw_Rank.JPG)

* ![Fuel_Supply Rank](<Schematy/Ope/Stored Procedures/uspDst_Rank_Paliwa>) 

  ![Fuel_Supply Rank](./Schematy/Ope/Dostawy_Paliw_Rank.JPG)


### Functions
* ![Function to calculate netto payroll costs](Schematy/Ope/Functions/ufKsztWyplaty)
* ![Function to calculate days in year](Schematy/Czas/uDni_Rok)
* ![Function to check payments conditions of customers](Schematy/Ope/Functions/ufWarunkiSprzedazy)
* ![Function to calculate gross amount for provided product id, quantity and customerid](Schematy/Ope/Functions/ufSpKWBrutto)



### Views
* ![Delivery transactions](Schematy/Ope/Views/V_ListaDostaw)

![Delivery transactions](Schematy/Ope/Views/V_Lista_Dostaw.jpg)

* ![Sales transactions](Schematy/Ope/Views/V_ListaSprzedazy)

![Sales transactions](Schematy/Ope/Views/V_Lista_Sprzedazy.jpg)

* ![Differences in payments conditions](Schematy/Ope/Views/V_Rozb_w_TermDostaw)

![Differences in payments conditions](Schematy/Ope/Views/V_War_Rozb.jpg)


### Automated pricing system 

It's a mechanism to ensure gross margin (without substracting costs like wages etc.) on desirable level. Sales price is caluclated from 
average fuel purchase price and margin. Every fuel has his own purhcase price which is average price for measure unit example litr, m3. 
Average price is result of dividing all net sum from supply invoices divided by all bought quantinty in measure units for every fuel.
Desirable margin level is stored in column Marza in table ![Zbiorniki](Schematy/Ope/Tables_%26_Triggers/Zbiorniki/Zbiorniki_%26_CenySprzPaliw). 
It can be updated by ![Zmien_Marze](<./Schematy/Ope/Stored Procedures/uspZmien_Marze>). The formula for sales price is:
average purchase price for fuel multiplied by (1 +margin for this fuel).
After every supply of fuel which is represented in ![Dostawy](Schematy/Ope/Tables_%26_Triggers/Dostawy_%26_Klienci/Dostawy), trigger trOilINZbior (code
also available in ![Dostawy](Schematy/Ope/Tables_%26_Triggers/Dostawy_%26_Klienci/Dostawy)) changes current levels of fuels flow in table
![Zbiorniki](Schematy/Ope/Tables_%26_Triggers/Zbiorniki/Zbiorniki_%26_CenySprzPaliw).
After every DML event (without merge) made on table Zbiorniki trigger ![trMar](Schematy/Ope/Tables_%26_Triggers/Zbiorniki/Zbiorniki_%26_CenySprzPaliw) updates
sales prices to current level in table ![CenyPa](Schematy/Ope/Tables_%26_Triggers/Zbiorniki/Zbiorniki_%26_CenySprzPaliw).
If new fuel will be added to table Zbiorniki trigger ![trNEWCenPaliwa](Schematy/Ope/Tables_%26_Triggers/Zbiorniki/Zbiorniki_%26_CenySprzPaliw)
will update table CenyPa with new fuel.
When sales invoice is made function ![uspWstawFV_Sprzedaz](<Schematy/Ope/Stored Procedures/uspWstawFV_Sprzedaz>) calculates net amount and function
![Ope.ufSpKWBrutto](Schematy/Ope/Functions/ufSpKWBrutto) calculates gross amount.




### Scripts
* ![Script to generate kalendar data](Schematy/Czas/Kalendarz_2024)

	
### Technologies
Project created in:
* Microsoft SQL Server Express 2014 and 2022 

### Acknowledgements
Inspiration to this project was to join working experiance as financial analyst and  knowledge and also experience  in field of
SQL databases to show some examples of my skills.

	
### Setup
### Extras


