--  Create a procedure that displays a list of all booths indicating the following fields: name of the booth, street where it is located and the booth number (id). It will receive as a parameter a character to indicate how to order the list: alphabetically ('a') or by booth number ('n').
CREATE OR REPLACE PROCEDURE list_booth_a
IS
  CURSOR curl IS
    SELECT
      booth.name,
      street.name,
      id_booth
    FROM booth
    JOIN street
      ON street_id_street = id_street
    ORDER BY booth.name;
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
CREATE OR REPLACE PROCEDURE list_booth_n
IS
  CURSOR curl IS
    SELECT
      booth.name,
      street.name,
      id_booth
    FROM booth
    JOIN street
      ON street_id_street = id_street
    ORDER BY id_booth;
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
CREATE OR REPLACE PROCEDURE list_booth
(
  ordering CHAR
)
AS
BEGIN
  CASE ordering
    WHEN 'a' THEN
      list_booth_a();
    WHEN 'n' THEN
      list_booth_n();
    ELSE
      DBMS_OUTPUT.PUT_LINE('Missing parameter');
  END CASE;
END;
/