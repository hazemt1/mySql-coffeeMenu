-- @Block
CREATE DATABASE drinkMenu;
-- @Block
USE drinkMenu;
-- @Block
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
-- @Block
LOAD DATA INFILE 'C:\\Users\\thaze\\OneDrive\\Desktop\\et3Mysql\\drinkMenu.csv' INTO TABLE menu FIELDS TERMINATED BY ',' IGNORE 1 ROWS (
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
-- @Block
SELECT *
FROM menu;
-- @Block
SELECT *
FROM menu
ORDER BY Calories DESC
LIMIT 1;
-- @Block
SELECT AVG(Calories)
FROM menu;
-- @Block
SELECT *
FROM menu
WHERE Calories < (
        SELECT AVG(Calories)
        FROM menu
    );