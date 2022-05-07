-- Create a view of prices that contains the different drinks (id) and the average price of that drink in the different booths of the fair (average).
CREATE OR REPLACE VIEW drinks_average_price
(
  id,
  drink,
  average_price
)
AS
SELECT
    id_drink,
    denomination,
    AVG(unit_price) AS mean_price
FROM drink
JOIN prices
    ON id_drink = drink_id_drink
GROUP BY id_drink, denomination;
