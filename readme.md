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

![Database diagram](./Database_Diagram(Stacja_Paliw).JPG) 

### Features

### Stored Procedures -> Time period for analysis presented on screenshots examples: years 2020-2022
* ![Summary Report](Schematy/Ope/uspRaport_Zbiorczy)


  ![Screenshot example](./Schematy/Ope/Raport_zbiorczy.JPG)


* ![Simplified profit and loss statment](Schematy/Ope/_ALTER_uspZrobWynik)

  ![Screenshot example](./Schematy/Ope/Wynik_Operacyjny.JPG)
  
  
* ![Simplified cash flow statment](Schematy/Ope/uspCash_Flow)

 Cash flow is divided into two periods: past and future (forecast). If user provide data only from the past column 'Prognoza' will be empty.
 If user provide data only from future column 'Realny' will be empty.
 If user provide data which starts in past and ends in future cash flow will be divided appropriately into this two columns ('Realny','Prognoza').  

  ![Screenshot example](./Schematy/Ope/Casf_Flow.JPG)
    

* ![Simplified financial analysis based on basic indicators](Schematy/Ope/uspAnaliza_Fin-ALTER)

  ![Screenshot example](./Schematy/Ope/Analiza_fin_2020-2022.JPG)

* ![Aging: receivables, labilities](Schematy/Ope/uspWiekowanie)


  ![Screenshot example for aging receivables](./Schematy/Ope/Wiekowanie_Naleznosci_total.JPG)

  ![Screenshot example for aging labilities](./Schematy/Ope/Wiekowanie_Zobowiazan_total.JPG)

* ![Break even point calculator](Schematy/Ope/BEP_Kalk_krzyz)

 BEP calculator is useful tool to answer questions like:
 "How much litres of fuel one we need to sell in current prices and in provided period of time,
 if we sell one hundred litres of fuel two and three or if we want to cover half costs by selling fuel two."
 We are able to provide such parameters: 
 - period of time
 - fuel/s
 - quantity for fuels or percentage of costs to cover


* ![Customers segmentation](Schematy/Ope/uspKlasfikacja_klientow)

 The idea of customer segmentation is to choose correct parameters to describe real value of customers.
 Choosen parameters are (in order from left to right according to below screenshot): 
 - income from invoices
 - percentage of unpaid income from invoices calculated as unpaid income divided by income
 - percentage of unpaid and overdue income calculated as unpaid and overdue income divided by income
 - number of invoices
 - number of bought fuels


  ![Customers segmentation](./Schematy/Ope/Klasyfikacja_klientow.JPG)

* ![Transactions](Schematy/Ope/PROC_Transakcje)
* ![Fuel_Sales Rank](Schematy/Ope/uspSprz_Rank_Paliwa)

  ![Fuel_Sales Rank](./Schematy/Ope/Sprzedaz_paliw_Rank.JPG)

* ![Fuel_Supply Rank](Schematy/Ope/uspDst_Rank_Paliwa) 

  ![Fuel_Supply Rank](./Schematy/Ope/Dostawy_Paliw_Rank.JPG)


### Functions
* ![Function to calculate netto payroll costs](Schematy/Ope/LiczWyn)
* ![Function to calculate days in year](Schematy/Czas/uDni_Rok)
* ![Function to check payments conditions of customers](Schematy/Ope/ufWarunkiSprzedazy)
* ![Function to calculate gross amount for provided product id and quantity](Schematy/Ope/SpKWBrutto-ALTER)



### Views
* ![Delivery transactions](Schematy/Ope/V_ListaDostaw)

![Delivery transactions](./Schematy/Ope/V_Lista_Dostaw.JPG)

* ![Sales transactions](Schematy/Ope/V_ListaSprzedazy)

![Sales transactions](./Schematy/Ope/V_Lista_Sprzedazy.JPG)

* ![Differences in payments conditions](Schematy/Ope/V_Rozb_w_TermDostaw)

![Differences in payments conditions](./Schematy/Ope/V_War_Rozb.JPG)


### Automated pricing system 

It's a mechanism to ensure gross margin (without substracting costs) on desirable level. Sales price is caluclated from 
average fuel purchase price and margin. Every fuel has his own purhcase price which is average price for measure unit example litr, m3. 
Average price is result of dividing all net sum from supply invoices divided by all bought quantinty in measure units for every fuel.
Desirable margin level is stored in column Marza in table ![Zbiorniki](./Schematy/Ope/Zbiorniki_&_CenySprzPaliw). 
It can be updated by ![Zmien_Marze](./Schematy/Ope/uspZmien_Marze). The formula for sales price is:
average purchase price for fuel multiplied by (1 +margin for this fuel).
After every supply of fuel which is represented in ![Dostawy](./Schematy/Ope/Dostawy), trigger trOilINZbior (code
also available in ![Dostawy](./Schematy/Ope/Dostawy)) changes current levels of fuels flow in table ![Zbiorniki](./Schematy/Ope/Zbiorniki_&_CenySprzPaliw).
After every DML event (without merge) made on table Zbiorniki trigger ![trMar](./Schematy/Ope/Ope.trMar) updates
sales prices to current level in table ![CenyPa](./Schematy/Ope/Zbiorniki_&_CenySprzPaliw).
When sales invoice is made function ![Ope.WSprz](./Schematy/Ope/Sprzedaz) calculates net amount and function ![Ope.SpKWBrutto](./Schematy/Ope/SpKWBrutto-ALTER)
calculates gross amount.




### Scripts
* ![Script to generate kalendar data](Schematy/Czas/Kalendarz-2022)

	
### Technologies
Project is created with:
* Microsoft SQL Server 2014 

### Acknowledgements
Inspiration to this project was to join working experiance as financial analyst and  knowledge and also experience  in field of
SQL databases to show some examples of my skills.

	
### Setup
### Extras


