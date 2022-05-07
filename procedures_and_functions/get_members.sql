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
