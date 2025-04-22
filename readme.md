### Petrol Station

    Simplified simulation of petrol station.

### Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Features](#features)
* [Setup](#setup)
* [Acknowledgements](#Acknowledgements)

### General info
* Database diagram 

![Database diagram](./Database_Diagram.jpg) 
* Schemas: <br />
  
  Czas - represents time dimension <br />
  
  Lokacje - represents geographical dimension <br />
  
  Ope - represents operational activity of Petrol Station <br />
  
* Main tables in Czas Schema: <br />

  Czas.Kalendarz - Calendar table with dates and holidays <br />
  
* Main tables in Lokacje Schema: <br />

  Lokacje.Miejscowosc - table with Cities <br />
  
* Main tables in Ope Schema: <br />

  Ope.Zbiorniki - table with fuels <br />
  
  Ope.Klienci - table with customers data <br />
  
  Ope.Dostawcy - table with fuel suppliers data <br />
  
  Ope.Pracownicy - table with employees data <br />
  
  Ope.Sprzedaz - table with sales data <br />
  
  Ope.Dostawy - table with fuel's purchase data <br />
  
### Features

### Stored Procedures -> Time period for analysis presented on screenshots examples: years 2020-2024
* ![Sales & Purchase Report](<Schematy/Ope/Stored Procedures/uspZakupy_Sprzedaz_Raport>)

  ![Screenshot example](<Schematy/Ope/Stored Procedures/uspZakupy_Sprzedaz_Raport.jpg>)

* ![Simplified profit and loss statment](<Schematy/Ope/Stored Procedures/_ALTER_uspZrobWynik>)

  ![Screenshot example](<Schematy/Ope/Stored Procedures/uspZrobWynik.jpg>)
    
* ![Simplified cash flow statment](<Schematy/Ope/Stored Procedures/uspCashFlow>)

 Cash flow is divided into two periods: past and future (forecast). <br />
 If user provide data only from the past column 'Prognoza' will be empty. <br />
 If user provide data only from future column 'Realny' will be empty. <br />
 If user provide data which starts in past and ends in future cash flow <br /> 
 will be divided appropriately into this two columns ('Realny','Prognoza').  <br />

  ![Screenshot example](<Schematy/Ope/Stored Procedures/uspCashflow.jpg>)
    
* ![Simplified financial analysis based on basic indicators](<Schematy/Ope/Stored Procedures/uspAnaliza_Fin>)

  ![Screenshot example](<Schematy/Ope/Stored Procedures/uspAnaliza_Fin.jpg>)

 Only short term debt including in measures.

* ![Stock analysis](<Schematy/Ope/Stored Procedures/uspAnaliza_Zapasow>)

  ![Screenshot example](<Schematy/Ope/Stored Procedures/usp_Analiza_Zapasow.jpg>)

* ![Aging: receivables, labilities](<Schematy/Ope/Stored Procedures/uspWiekowanie>)

* ![Break even point calculator](<Schematy/Ope/Stored Procedures/uspBEP_Kalkulator>)

 Break event point gives answer how much a company needs to sell to cover <br />
 all costs (fixed and variable which refers to the volume of production). <br />
 When production is greater then estimated by BEP company is earning profit. <br />
 In some cases it is good to have a better precision and more flexible simulation. <br />
 Especially when we have more than one product with different margin levels and supply prices. <br />
 All calculations are in current margin levels, supply prices and costs. <br />
 BEP calculator is useful tool to answer questions like: <br />
 "How much litres of fuel type one we need to sell in current prices and in provided period of time, <br />
 if we sell one hundred litres of fuel type two and three or if we want to cover half fixed costs by selling fuel two." <br />
 We are able to provide such parameters:  <br />
 - period of time <br />
 - fuel/s <br />
 - quantity for fuels or percentage of costs to cover <br />
 
 Which are represented by such parameters in BEP_Kalk stored procedure: <br />
 
 	@od = '2020-03-01',
	@do = '2024-12-31',
	@typ = N'Benzyna',
	@il = 2000,
	@ks_pro = NULL,
	@typ_1 = N'Gaz',
	@il_1 = NULL,
	@ks_pro_1 = 0.40
		
Which means that we wanted to know how much oil do we need to sell if we sell 2000 litres of petrol  <br />
and we will simulate that we want to cover 40% of costs by selling gas.  <br />
We are able to change the question flexible with parameters like costs level to cover and <br />
quantity to sell. We can mix it like that: <br />
 - we provide quantity for two fuels <br />
 - we provide quantity for one fuel and costs percentage to cover for second fuel <br />
 - we provide percentage costs to cover for two fuels <br />
 In every case we are able to provide data for two fules out of three. <br />
 
 The result of such query is shown on below screenshot:
 
 ![Screenshot example](<Schematy/Ope/Stored Procedures/uspBEP_Kalkulator.jpg>)
 
 In this case we see that we don't have enough gas and oil in stocks if we want to keep strategy <br />
 with provided parameters. In this case we need to change margin levels to higher <br />
 or buy more gas and oil or combine all off it. <br />
 
* ![Customers segmentation](<Schematy/Ope/Stored Procedures/uspKlasyfikacja_klientow>)

 The idea of customer segmentation is to choose correct parameters to describe real value of customers. <br />
 Choosen parameters are (in order from left to right according to below screenshot): <br />
 - income from invoices <br />
 - percentage of unpaid income from invoices calculated as unpaid income divided by income <br />
 - percentage of unpaid and overdue income calculated as unpaid and overdue income divided by income <br />
 - number of invoices <br />
 - number of bought fuels <br />

  ![Customers segmentation](<Schematy/Ope/Stored Procedures/uspKlasyfikacja_klientow.jpg>)

* ![Transactions](<Schematy/Ope/Stored Procedures/usp_Transakcje>)

  ![Transactions](<Schematy/Ope/Stored Procedures/usp_Trans.jpg>)
  
* ![Fuel_Sales Rank](<Schematy/Ope/Stored Procedures/uspSprz_Rank_Paliwa>)

  ![Fuel_Sales Rank](<Schematy/Ope/Stored Procedures/uspPaliwa_SprzRanking.jpg>)

* ![Fuel_Supply Rank](<Schematy/Ope/Stored Procedures/uspDst_Rank_Paliwa>) 

  ![Fuel_Supply Rank](<Schematy/Ope/Stored Procedures/uspDostRanking_Paliwa.jpg>)

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

It's a mechanism to ensure gross margin (without substracting costs like wages etc.) on desirable level. Sales price is caluclated from <br />
average fuel purchase price and margin. Every fuel has his own purhcase price which is average price for measure unit example litr, m3.  <br />
Average price is result of dividing all net sum from supply invoices divided by all bought quantinty in measure units for every fuel. <br />
Desirable margin level is stored in column Marza in table ![Zbiorniki](Schematy/Ope/Tables_%26_Triggers/Zbiorniki/Zbiorniki_%26_CenySprzPaliw). 
It can be updated by ![Zmien_Marze](<./Schematy/Ope/Stored Procedures/uspZmien_Marze>). The formula for sales price is: 
average purchase price for fuel multiplied by (1 + margin for this fuel). <br />
After every supply of fuel which is represented in ![Dostawy](Schematy/Ope/Tables_%26_Triggers/Dostawy_%26_Klienci/Dostawy), trigger trOilINZbior (code 
also available in ![Dostawy](Schematy/Ope/Tables_%26_Triggers/Dostawy_%26_Klienci/Dostawy)) changes current levels of fuels flow in table 
![Zbiorniki](Schematy/Ope/Tables_%26_Triggers/Zbiorniki/Zbiorniki_%26_CenySprzPaliw). <br />
After every DML event (without merge) made on table Zbiorniki trigger ![trMar](Schematy/Ope/Tables_%26_Triggers/Zbiorniki/Zbiorniki_%26_CenySprzPaliw) updates 
sales prices to current level in table ![CenyPa](Schematy/Ope/Tables_%26_Triggers/Zbiorniki/Zbiorniki_%26_CenySprzPaliw).
If new fuel will be added to table Zbiorniki trigger ![trNEWCenPaliwa](Schematy/Ope/Tables_%26_Triggers/Zbiorniki/Zbiorniki_%26_CenySprzPaliw)
will update table CenyPa with new fuel. <br />
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
