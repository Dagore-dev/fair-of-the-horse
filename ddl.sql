CREATE TABLE booth (
    id_booth         INTEGER NOT NULL,
    name            VARCHAR2(50 CHAR) NOT NULL,
    square_meters    NUMBER(5, 2) NOT NULL,
    street_id_street INTEGER NOT NULL
);

ALTER TABLE booth ADD CONSTRAINT booth_pk PRIMARY KEY ( id_booth );

CREATE TABLE brotherhood (
    booth_id_booth  INTEGER NOT NULL,
    booth_id_booth1 INTEGER NOT NULL
);

ALTER TABLE brotherhood ADD CONSTRAINT brotherhood_pk PRIMARY KEY ( booth_id_booth,
                                                                    booth_id_booth1 );

CREATE TABLE drink (
    id_drink     INTEGER NOT NULL,
    denomination VARCHAR2(50 CHAR) NOT NULL
);

ALTER TABLE drink ADD CONSTRAINT drink_pk PRIMARY KEY ( id_drink );

CREATE TABLE member (
    id_member    INTEGER NOT NULL,
    first_name   VARCHAR2(20 CHAR) NOT NULL,
    surname      VARCHAR2(20 CHAR) NOT NULL,
    phone_number CHAR(9) NOT NULL
);

ALTER TABLE member ADD CONSTRAINT member_pk PRIMARY KEY ( id_member );

CREATE TABLE member_of (
    member_id_member INTEGER NOT NULL,
    booth_id_booth   INTEGER NOT NULL,
    guess_passes     INTEGER NOT NULL
);

ALTER TABLE member_of ADD CONSTRAINT member_of_pk PRIMARY KEY ( member_id_member,
                                                                booth_id_booth );

CREATE TABLE prices (
    booth_id_booth INTEGER NOT NULL,
    drink_id_drink INTEGER NOT NULL,
    unit_price     NUMBER(6, 2) NOT NULL
);

CREATE TABLE awards (
    award_id INTEGER NOT NULL,
    description VARCHAR(50),
    booth_id_booth INTEGER
);

ALTER TABLE awards ADD CONSTRAINT awards_pk PRIMARY KEY (award_id);
ALTER TABLE awards 
    ADD CONSTRAINT award_booth_fk FOREIGN KEY (booth_id_booth)
        REFERENCES booth (id_booth);

ALTER TABLE prices ADD CONSTRAINT prices_pk PRIMARY KEY ( booth_id_booth,
                                                          drink_id_drink );

CREATE TABLE street (
    id_street INTEGER NOT NULL,
    name      VARCHAR2(20 CHAR) NOT NULL
);

ALTER TABLE street ADD CONSTRAINT street_pk PRIMARY KEY ( id_street );

ALTER TABLE booth
    ADD CONSTRAINT booth_street_fk FOREIGN KEY ( street_id_street )
        REFERENCES street ( id_street );

ALTER TABLE brotherhood
    ADD CONSTRAINT brotherhood_booth_fk FOREIGN KEY ( booth_id_booth )
        REFERENCES booth ( id_booth );

ALTER TABLE brotherhood
    ADD CONSTRAINT brotherhood_booth_fkv1 FOREIGN KEY ( booth_id_booth1 )
        REFERENCES booth ( id_booth );

ALTER TABLE member_of
    ADD CONSTRAINT member_of_booth_fk FOREIGN KEY ( booth_id_booth )
        REFERENCES booth ( id_booth );

ALTER TABLE member_of
    ADD CONSTRAINT member_of_member_fk FOREIGN KEY ( member_id_member )
        REFERENCES member ( id_member );

ALTER TABLE prices
    ADD CONSTRAINT prices_booth_fk FOREIGN KEY ( booth_id_booth )
        REFERENCES booth ( id_booth );

ALTER TABLE prices
    ADD CONSTRAINT prices_drink_fk FOREIGN KEY ( drink_id_drink )
        REFERENCES drink ( id_drink );
