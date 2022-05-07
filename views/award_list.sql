-- Create a view that shows the description of the prize (prize), the name of the booth (booth) and its location, indicating street and number separated by a comma (location).
CREATE OR REPLACE VIEW award_list
(
  award,
  description,
  booth
)
AS
SELECT
  award_id,
  description,
  CONCAT(CONCAT(owner, ', '), id_booth)
FROM awards
JOIN booth
  ON booth_id_booth = id_booth;
  