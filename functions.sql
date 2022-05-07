-- Create a function that receives as a parameter the number of a booth and returns the number of members of it
CREATE OR REPLACE FUNCTION get_members
(
  booth_id NUMBER
)
RETURN NUMBER IS
  number_of_members NUMBER(3,0);
BEGIN
  SELECT 
    COUNT(*) INTO number_of_members
  FROM booth
  JOIN member_of
    ON id_booth = booth_id_booth;
  RETURN number_of_members;
END get_members;
/
CREATE OR REPLACE PROCEDURE print_get_members
(
  booth_id NUMBER
)
IS
  number_of_members NUMBER(3,0);
BEGIN
  number_of_members := get_members(booth_id);
  DBMS_OUTPUT.PUT_LINE(number_of_members);
END;
/
--  Create a procedure that displays a list of all booths indicating the following fields: name of the booth, street where it is located and the booth number (id). It will receive as a parameter a character to indicate how to order the list: alphabetically ('a') or by booth number ('n').
CREATE OR REPLACE PROCEDURE list_booth
IS
  CURSOR curl IS
    SELECT
      booth.name,
      street.name,
      id_booth
    FROM booth
    JOIN street
      ON street_id_street = id_street;
  v_name VARCHAR2(50);
  v_street VARCHAR2(50);
  v_id INTEGER;
BEGIN
  OPEN curl;
    LOOP
      FETCH curl INTO v_name, v_street, v_id;
      EXIT WHEN curl%NOTFOUND;
      
      DBMS_OUTPUT.PUT_LINE
      (
        'Nombre de la caseta: '
        ||
        v_name
        ||
        '. Calle: '
        ||
        v_street
        ||
        '. Identificador: '
        ||
        v_id
      );

    END LOOP;
  CLOSE curl;
END;
/
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
