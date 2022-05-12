-- Create a view that shows the description of the prize (prize), the name of the booth (booth) and its location, indicating street and number separated by a comma (location).
CREATE OR REPLACE VIEW award_list
(
  description,
  booth,
  location
)
AS
SELECT
  description,
  booth.name,
  CONCAT(CONCAT(street.name, ', '), booth.street_id_street)
FROM awards
JOIN booth
  ON booth_id_booth = id_booth
JOIN street
  ON street_id_street = id_street;
  