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

### Stored Procedures
* ![Summary Report](Schematy/Ope/uspRaport_Zbiorczy)
* ![Screenshot example](./Schematy/Ope/Raport_zbiorczy.JPG)
* ![Simplified financial analysis based on basic indicators](Schematy/Ope/uspAnaliza_Fin-ALTER)
  ![Screenshot example](./Schematy/Ope/Analiza_fin_2020-2022.JPG)
* ![Aging: receivables, labilities](Schematy/Ope/uspWiekowanie)
  ![Screenshot example for aging receivables](./Schematy/Ope/Wiekowanie_Naleznosci_total.JPG)
  ![Screenshot example for aging labilities](./Schematy/Ope/Zobowiazanie_Wiekowanie_total.JPG)
* ![Break even point calculator](Schematy/Ope/BEP_Kalk_krzyz)
* ![Customers segmentation](Schematy/Ope/uspKlasfikacja_klientow)
* ![Transactions](Schematy/Ope/PROC_Transakcje)
* ![Sales Rank](Schematy/Ope/usp_SprzedazRanking)
* ![Supply Rank](Schematy/Ope/usp_DostawRanking) 


### Functions
* ![Function to calculate netto payroll costs](Schematy/Ope/LiczWyn)
* ![Function to calculate days in year](Schematy/Czas/uDni_Rok)
* ![Function to check payments conditions of customers](Schematy/Ope/ufWarunkiSprzedazy)
* ![Function to calculate gross amount for provided productid and quantity](Schematy/Ope/SpKWBrutto-ALTER)



### Views
* ![Delivery transactions](Schematy/Ope/V_ListaDostaw)
* ![Sales transactions](Schematy/Ope/V_ListaSprzedazy)
* ![Differences in payments conditions](Schematy/Ope/V_Rozb_w_TermDostaw)

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

