## Petrol Station

    Simplified simulation of petrol station.

## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Features](#features)
* [Setup](#setup)
* [Acknowledgements](#Acknowledgements)
* [Extras](#Extras)

## General info
* Database diagram 

![Database diagram](./Database_Diagram(Stacja_Paliw).JPG) 

## Features

### Stored Procedures -> Time period for analysis presented on screenshots examples: years 2020-2022
* ![Summary Report](Schematy/Ope/uspRaport_Zbiorczy)


  ![Screenshot example](./Schematy/Ope/Raport_zbiorczy.JPG)


* ![Simplified profit and loss statment](Schematy/Ope/_ALTER_uspZrobWynik)

  ![Screenshot example](./Schematy/Ope/Wynik_Operacyjny.JPG)
  
  
* ![Simplified cash flow statment](Schematy/Ope/uspCash_Flow)

### Cash flow is divided into two periods: past and future (forecast). If user provide data only from the past column 'Prognoza' will be empty.
### If user provide data only from future column 'Realny' will be empty.
### If user provide data which starts in past and ends in future cash flow will be divided appropriately into this two columns ('Realny','Prognoza').  

  ![Screenshot example](./Schematy/Ope/Casf_Flow.JPG)
    

* ![Simplified financial analysis based on basic indicators](Schematy/Ope/uspAnaliza_Fin-ALTER)

  ![Screenshot example](./Schematy/Ope/Analiza_fin_2020-2022.JPG)

* ![Aging: receivables, labilities](Schematy/Ope/uspWiekowanie)


  ![Screenshot example for aging receivables](./Schematy/Ope/Wiekowanie_Naleznosci_total.JPG)

  ![Screenshot example for aging labilities](./Schematy/Ope/Wiekowanie_Zobowiazan_total.JPG)

* ![Break even point calculator](Schematy/Ope/BEP_Kalk_krzyz)


* ![Customers segmentation](Schematy/Ope/uspKlasfikacja_klientow)


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

### Scripts
* ![Script to generate kalendar data](Schematy/Czas/Kalendarz-2022)

	
## Technologies
Project is created with:
* Microsoft SQL Server 2014 

## Acknowledgements
Inspiration to this project was to join working experiance as financial analyst and  knowledge and also experience  in field of
SQL databases to show some examples of my skills.

	
## Setup
## Extras
*Automated pricing system 

