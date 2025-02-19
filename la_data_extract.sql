------Extracts and exports LA data. Quit afterwards ------
.import --csv england_ks4provisional.csv dfe_data
.mode csv
.output LEA_P8_data.csv
SELECT 
    "LEA",
    "P8PUP" AS "P8PUP_LEA",
    "P8MEA" AS "P8MEA_LEA",
    "P8CILOW" AS "P8CILOW_LEA",
    "P8CIUPP" AS "P8CIUPP_LEA"
FROM "dfe_data"
WHERE "RECTYPE" = '4'
AND "P8PUP_LEA" IS NOT NULL;

--------- Sanity check for Tableau's IQR -----------
.mode box
.headers on
CREATE TABLE dfe_formatted(
    "URN" INTEGER,
    "P8MEA" REAL
);

INSERT INTO dfe_formatted ("URN", "P8MEA")
SELECT "URN", "P8MEA"
FROM "dfe_data"
WHERE "RECTYPE" = '1';

SELECT COUNT("URN")
FROM "dfe_formatted"
WHERE typeof("P8MEA") = "real"
AND "P8MEA" BETWEEN -0.34 and 0.34;


