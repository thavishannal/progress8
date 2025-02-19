.mode box
.headers on
.import --csv ukpostcodes.csv postcode_data
.import --csv england_ks4provisional.csv dfe_data

CREATE INDEX "postcode_data_idx" ON "postcode_data" ("postcode");

CREATE VIEW "dfe_postcode_left_join"
AS
SELECT "URN", "schname", "pcode", "latitude", "longitude"
FROM (
    SELECT * FROM "dfe_data"
    WHERE "pcode" != ''
) AS "dfe_data_clean"
LEFT JOIN "postcode_data"
ON "dfe_data_clean"."pcode" = "postcode_data"."postcode"
ORDER BY "schname";

---------- Run after initial import ----------
.mode csv
.output pcodes_to_fix.csv
SELECT "URN", "schname", "pcode", "latitude", "longitude"
FROM "dfe_postcode_left_join"
WHERE "longitude" IS NULL
ORDER BY "schname";

---------- Quit, then run after fixing postcode data manually ----------
.import --csv pcodes_fixed.csv pcode_fixed
.mode box
.headers on

CREATE VIEW "pcode_coord_data"
AS
SELECT "URN", "schname", "pcode", "latitude", "longitude"
FROM (

    SELECT "URN", "schname", "pcode"
    FROM "dfe_postcode_left_join"
    WHERE "longitude" IS NOT NULL
    UNION
    SELECT "URN", "schname", "fixed_pcode"
    FROM "pcode_fixed"

) AS "dfe_postcode_fixed"
LEFT JOIN "postcode_data"
ON "dfe_postcode_fixed"."pcode" = "postcode_data"."postcode"
ORDER BY "schname";

SELECT "schname" AS "Missing Data For..."
FROM "pcode_coord_data"
WHERE "latitude" IS NULL;

---------- Final export, then quit ----------
.mode csv
.output dfe_pcode_coords.csv
SELECT * FROM "pcode_coord_data";




