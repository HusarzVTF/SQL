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
(./Schematy/Ope/Analiza_fin_2020-2022.JPG)
* ![Simplified financial analysis based on basic indicators](Schematy/Ope/uspAnaliza_Fin-ALTER)
* ![Aging: receivables, labilities](Schematy/Ope/uspWiekowanie)
* ![Break even point calculator](Schematy/Ope/BEP_Kalk_krzyz)
* ![Customers segmentation](Schematy/Ope/uspKlasfikacja_klientow)
* ![Transactions](Schematy/Ope/PROC_Transakcje)
* ![Sales Rank](Schematy/Ope/usp_SprzedazRanking)
* ![Supply Rank](Schematy/Ope/usp_DostawRanking) 


### Functions
* ![Function to calculate netto payroll costs](Schematy/Ope/LiczWyn)
* ![Function to calculate days in year](Schematy/Czas/uDni_Rok)
* ![Function to check payments conditions of customers](Schematy/Ope/ufWarunkiSprzedazy)



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

