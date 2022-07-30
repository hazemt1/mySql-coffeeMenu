
# CoffeeMenu

Coffee Menu Database using MySQL imported from csv file.


## Instructions 

To deploy this project you must have MySQL, then open MySQL Command Line and Run:

```bash
  CREATE DATABASE drinkMenu;
```
To create the DATABASE,then :
```bash
  USE drinkMenu;
```
To use it, then:
```bash
  CREATE TABLE menu(
    Beverage_category VARCHAR(255),
    Beverage VARCHAR(255),
    Beverage_prep VARCHAR(255),
    Calories INT,
    Total_Fat DECIMAL,
    Trans_Fat DECIMAL,
    Saturated_Fat DECIMAL,
    Sodium DECIMAL,
    Total_Carbohydrates DECIMAL,
    Cholesterol DECIMAL,
    Dietary_Fibre DECIMAL,
    Sugars DECIMAL,
    Protein DECIMAL,
    Vitamin_A DECIMAL,
    Vitamin_C DECIMAL,
    Calcium DECIMAL,
    Iron DECIMAL,
    Caffeine VARCHAR(255)
);
```
To create menu table,then:
```bash
  LOAD DATA INFILE '{Path}' INTO TABLE menu FIELDS TERMINATED BY ',' IGNORE 1 ROWS (
    Beverage_category,
    Beverage,
    Beverage_prep,
    Calories,
    @Total_Fat,
    Trans_Fat,
    Saturated_Fat,
    Sodium,
    Total_Carbohydrates,
    Cholesterol,
    Dietary_Fibre,
    Sugars,
    Protein,
    @Vitamin_A,
    @Vitamin_C,
    @Calcium,
    @Iron,
    Caffeine
)
SET Total_Fat = CAST(@Total_Fat AS DECIMAL),
    Vitamin_A = LEFT(@Vitamin_A, LENGTH(@Vitamin_A) -1),
    Vitamin_C = LEFT(@Vitamin_C, LENGTH(@Vitamin_C) -1),
    Calcium = LEFT(@Calcium, LENGTH(@Calcium) -1),
    Iron = LEFT(@Iron, LENGTH(@Iron) -1);
```
You should replace {Path} with the csv file full path


## Questions
1- To get all the table data Run:
```bash
    SELECT * FROM menu;
```
2- To get the highest Calorie Item:
```bash
    SELECT * FROM menu
    ORDER BY Calories DESC
    LIMIT 1;
```
![Highest Calorie](https://github.com/hazemt1/mySql-coffeeMenu/blob/master/Screenshot%202022-07-30%20200045.jpg?raw=true)
3- To get the average Calories of items:
```bash
    SELECT AVG(Calories) FROM menu;
```
![Average Calories](https://github.com/hazemt1/mySql-coffeeMenu/blob/master/Screenshot%202022-07-30%20200128.jpg?raw=true)

4- To get all the item that is lower than the average Calories:
```bash
    SELECT * FROM menu
    WHERE Calories < (
        SELECT AVG(Calories)
        FROM menu
    );
```
![Lower than average](https://github.com/hazemt1/mySql-coffeeMenu/blob/master/Screenshot%202022-07-30%20200214.jpg?raw=true)
