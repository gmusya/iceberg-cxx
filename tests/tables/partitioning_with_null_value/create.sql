-- Engine: Trino 471
CREATE SCHEMA IF NOT EXISTS warehouse.example_schema WITH (location = 's3a://warehouse/example');

CREATE TABLE warehouse.example_schema.my_table476_1 (c1 INTEGER, c2 INTEGER) WITH (
    format = 'PARQUET',
    location = 's3a://warehouse/my_table476_1'
);

INSERT INTO
    warehouse.example_schema.my_table476_1
VALUES
    (0, 12),
    (1, 123),
    (2, 2314),
    (3, 9),
    (4, 1292),
    (5, 12831),
    (6, 12381),
    (7, 123999);

INSERT INTO
    warehouse.example_schema.my_table476_1
VALUES
    (8, 12318231),
    (9, 999),
    (10, 1010),
    (11, 11),
    (12, 1212),
    (13, 1313),
    (14, 91121),
    (15, 182222);

SELECT *, "$file_modified_time" FROM warehouse.example_schema.my_table476_1;

DELETE FROM
    warehouse.example_schema.my_table476_1
WHERE
    c1 % 3 = 0;

SELECT *, "$file_modified_time" FROM warehouse.example_schema.my_table476_1;

SELECT * FROM warehouse.example_schema."my_table476_1$files";

ALTER TABLE warehouse.example_schema.my_table476_1 EXECUTE optimize WHERE "$file_modified_time" > cast('2025-08-26 13:31:05.000' AS TIMESTAMP WITH TIME ZONE);

SELECT * FROM warehouse.example_schema."my_table476_1$files";

ALTER TABLE warehouse.example_schema.my_table476_1 EXECUTE optimize;

SELECT * FROM warehouse.example_schema."my_table476_1$files";