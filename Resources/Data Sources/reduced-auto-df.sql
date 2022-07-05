-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Sections here should not all be run at the same time!  Refer to comments for order.

-- start 1
CREATE TABLE "sales" (
    "MSRP" INT,
    "Selling_Price" INT,
    "Mileage" INT,
    "Cruise_Control" INT,
    "AutoReverseSystem" int,
    "PedestrianAlertingSoundint" int,
    "Axles" int,
    "BasePrice" int,
    "BedLengthIN" int,
    "BedType" varchar,
    "BlindSpotMon" int,
    "BodyCabType" varchar(45),
    "BodyClass" varchar,
    "Doors" int,
    "DriveType" varchar,
    "EngineHP" int,
    "ForwardCollisionWarning" int,
    "KeylessIgnition" int,
    "Make" varchar,
    "Model" varchar,
    "ModelYear" int,
    "PedAutoEBrake" int,
    "TopSpeedMPH" int,
    "TransmissionSpeeds" float,
    "TransmissionStyle" varchar,
    "VehicleType" varchar
    
);

CREATE TABLE "options" (
    "id" int   NOT NULL,
    "option" varchar   NOT NULL,
    CONSTRAINT "pk_options" PRIMARY KEY (
        "id"
     )
);

-- this table saves space for data because of high repetition of data
INSERT INTO "options" (id, option)
VALUES (0, 'Not Available'),
(1, 'Optional'),
(2, 'Standard');

SELECT * FROM sales;

-- end 1

-- start 2
-- id must be added after importation of csv
ALTER TABLE sales
	ADD COLUMN id SERIAL PRIMARY KEY;


-- transmission speeds should be discreet numbers
ALTER TABLE sales ALTER COLUMN "TransmissionSpeeds" TYPE INT;

-- end 2

-- start 3
ALTER TABLE "sales" ADD CONSTRAINT "fk_sales_Cruise_Control" FOREIGN KEY("Cruise_Control")
REFERENCES "options" ("id");

ALTER TABLE "sales" ADD CONSTRAINT "fk_sales_AutoReverseSystem" FOREIGN KEY("AutoReverseSystem")
REFERENCES "options" ("id");

ALTER TABLE "sales" ADD CONSTRAINT "fk_sales_PedestrianAlertingSoundint" FOREIGN KEY("PedestrianAlertingSoundint")
REFERENCES "options" ("id");

ALTER TABLE "sales" ADD CONSTRAINT "fk_sales_BlindSpotMon" FOREIGN KEY("BlindSpotMon")
REFERENCES "options" ("id");

ALTER TABLE "sales" ADD CONSTRAINT "fk_sales_ForwardCollisionWarning" FOREIGN KEY("ForwardCollisionWarning")
REFERENCES "options" ("id");

ALTER TABLE "sales" ADD CONSTRAINT "fk_sales_KeylessIgnition" FOREIGN KEY("KeylessIgnition")
REFERENCES "options" ("id");

ALTER TABLE "sales" ADD CONSTRAINT "fk_sales_PedAutoEBrake" FOREIGN KEY("PedAutoEBrake")
REFERENCES "options" ("id");
-- end 3

-- start 4
-- check transmission types
SELECT DISTINCT "TransmissionStyle" FROM sales;

-- "Dual-clutch Transmission (DCT)"
-- "Continuously Variable Transmission (CVT)"
-- "Electronic Continuously Variable (e-CVT)"
-- "Automated Manual Transmission (AMT)"
-- "0"
-- "Automatic"
-- "Manual/Standard"



CREATE TABLE "TransmissionStyle" (
"id" SERIAL,
"type" VARCHAR(50),
CONSTRAINT "pk_transmissionstyle" PRIMARY KEY ("id")
);

INSERT INTO "TransmissionStyle" (type)
VALUES
('Dual-clutch Transmission (DCT)'),
('Continuously Variable Transmission (CVT)'),
('Electronic Continuously Variable (e-CVT)'),
('Automated Manual Transmission (AMT)'),
('0'),
('Automatic'),
('Manual/Standard');

SELECT * FROM "TransmissionStyle";

-- 1	"Dual-clutch Transmission (DCT)"
-- 2	"Continuously Variable Transmission (CVT)"
-- 3	"Electronic Continuously Variable (e-CVT)"
-- 4	"Automated Manual Transmission (AMT)"
-- 5	"0"
-- 6	"Automatic"
-- 7	"Manual/Standard"

-- BEGIN CONVERSION TO USING FOREIGN KEY TO SAVE SPACE
UPDATE "sales" SET "TransmissionStyle" = replace("TransmissionStyle", 'Dual-clutch Transmission (DCT)', '1');
UPDATE "sales" SET "TransmissionStyle" = replace("TransmissionStyle", 'Continuously Variable Transmission (CVT)', '2');
UPDATE "sales" SET "TransmissionStyle" = replace("TransmissionStyle", 'Electronic Continuously Variable (e-CVT)', '3');
UPDATE "sales" SET "TransmissionStyle" = replace("TransmissionStyle", 'Automated Manual Transmission (AMT)', '4');
UPDATE "sales" SET "TransmissionStyle" = replace("TransmissionStyle", '0', '5');
UPDATE "sales" SET "TransmissionStyle" = replace("TransmissionStyle", 'Automatic', '6');
UPDATE "sales" SET "TransmissionStyle" = replace("TransmissionStyle", 'Manual/Standard', '7');

ALTER TABLE sales ALTER COLUMN "TransmissionStyle" TYPE INTEGER USING ("TransmissionStyle"::INTEGER);

ALTER TABLE "sales" ADD CONSTRAINT "fk_sales_TransmissionStyle" FOREIGN KEY("TransmissionStyle")
REFERENCES "TransmissionStyle" ("id");
-- end 4

-- start 5
SELECT DISTINCT "BodyClass" FROM sales;
-- "Cargo Van"
-- "Crossover Utility Vehicle (CUV)"
-- "Convertible"
-- "Hatchback"
-- "SUV"
-- "Sedan"
-- "Incomplete - Motor Home Chassis"
-- "Pickup"
-- "Wagon"
-- "Roadster"
-- "0"
-- "Coupe"
-- "Van"

CREATE TABLE "BodyClass" (
"id" SERIAL,
"type" VARCHAR(50),
CONSTRAINT "pk_bodyclass" PRIMARY KEY ("id")
);

INSERT INTO "BodyClass" (type)
VALUES
('Cargo Van'),
('Crossover Utility Vehicle (CUV)'),
('Convertible'),
('Hatchback'),
('SUV'),
('Sedan'),
('Incomplete - Motor Home Chassis'),
('Pickup'),
('Wagon'),
('Roadster'),
('0'),
('Coupe'),
('Van');

SELECT * FROM "BodyClass";

UPDATE "sales" SET "BodyClass" = replace("BodyClass", 'Cargo Van', '1');
UPDATE "sales" SET "BodyClass" = replace("BodyClass", 'Crossover Utility Vehicle (CUV)', '2');
UPDATE "sales" SET "BodyClass" = replace("BodyClass", 'Convertible', '3');
UPDATE "sales" SET "BodyClass" = replace("BodyClass", 'Hatchback', '4');
UPDATE "sales" SET "BodyClass" = replace("BodyClass", 'SUV', '5');
UPDATE "sales" SET "BodyClass" = replace("BodyClass", 'Sedan', '6');
UPDATE "sales" SET "BodyClass" = replace("BodyClass", 'Incomplete - Motor Home Chassis', '7');
UPDATE "sales" SET "BodyClass" = replace("BodyClass", 'Pickup', '8');
UPDATE "sales" SET "BodyClass" = replace("BodyClass", 'Wagon', '9');

UPDATE "sales" SET "BodyClass" = replace("BodyClass", '0', '11');
UPDATE "sales" SET "BodyClass" = replace("BodyClass", 'Coupe', '12');
UPDATE "sales" SET "BodyClass" = replace("BodyClass", 'Van', '13');
UPDATE "sales" SET "BodyClass" = replace("BodyClass", 'Roadster', '10');


ALTER TABLE sales ALTER COLUMN "BodyClass" TYPE INTEGER USING ("BodyClass"::INTEGER);

SELECT DISTINCT "BodyClass" FROM "sales"
ORDER BY "BodyClass";


ALTER TABLE "sales" ADD CONSTRAINT "fk_sales_BodyClass" FOREIGN KEY("BodyClass")
REFERENCES "BodyClass" ("id");
-- END 5

-- START 6
SELECT * FROM "sales";
SELECT DISTINCT "BodyCabType" FROM "sales";
-- 'Mega'
-- 'Regular'
-- '0'
-- 'Extra/Super/ Quad/Double/King/Extended'
-- 'Crew/ Super Crew/ Crew Max'

CREATE TABLE "BodyCabType" (
"id" SERIAL,
"type" VARCHAR(50),
CONSTRAINT "pk_bodycabtype" PRIMARY KEY ("id")
);

INSERT INTO "BodyCabType" (type)
VALUES
('Mega'),
('Regular'),
('0'),
('Extra/Super/ Quad/Double/King/Extended'),
('Crew/ Super Crew/ Crew Max');

SELECT * FROM "BodyCabType";

UPDATE "sales" SET "BodyCabType" = replace("BodyCabType", 'Mega', '1');
UPDATE "sales" SET "BodyCabType" = replace("BodyCabType", 'Regular', '2');
UPDATE "sales" SET "BodyCabType" = replace("BodyCabType", '0', '3');
UPDATE "sales" SET "BodyCabType" = replace("BodyCabType", 'Extra/Super/ Quad/Double/King/Extended', '4');
UPDATE "sales" SET "BodyCabType" = replace("BodyCabType", 'Crew/ Super Crew/ Crew Max', '5');

ALTER TABLE sales ALTER COLUMN "BodyCabType" TYPE INTEGER USING ("BodyCabType"::INTEGER);

ALTER TABLE "sales" ADD CONSTRAINT "fk_sales_BodyCabType" FOREIGN KEY("BodyCabType")
REFERENCES "BodyCabType" ("id");
-- END 6

-- START 7
SELECT DISTINCT "Make" FROM "sales";
-- 'GMC'
-- 'VOLKSWAGEN'
-- 'ALFA ROMEO'
-- 'DODGE'
-- 'FORD'
-- 'CHRYSLER'
-- 'INFINITI'
-- 'NISSAN'
-- 'MINI'
-- 'CADILLAC'
-- 'SUBARU'
-- 'LEXUS'
-- 'RAM'
-- 'TOYOTA'
-- 'MERCEDES-BENZ'
-- 'JEEP'
-- 'AUDI'
-- 'CHEVROLET'
-- 'PORSCHE'
-- 'MITSUBISHI'
-- 'LINCOLN'
-- 'KIA'
-- 'MAZDA'
-- 'HONDA'
-- 'ACURA'
-- 'BUICK'
-- 'GENESIS'
-- 'FIAT'
-- 'NISSAN INFINITI'
-- 'BMW'
-- 'VOLVO'
-- 'HYUNDAI'

CREATE TABLE make (
"id" SERIAL,
"make" VARCHAR(50),
CONSTRAINT "pk_make" PRIMARY KEY ("id")
);

INSERT INTO make (make)
VALUES
('GMC'),
('VOLKSWAGEN'),
('ALFA ROMEO'),
('DODGE'),
('FORD'),
('CHRYSLER'),
('INFINITI'),
('NISSAN'),
('MINI'),
('CADILLAC'),
('SUBARU'),
('LEXUS'),
('RAM'),
('TOYOTA'),
('MERCEDES-BENZ'),
('JEEP'),
('AUDI'),
('CHEVROLET'),
('PORSCHE'),
('MITSUBISHI'),
('LINCOLN'),
('KIA'),
('MAZDA'),
('HONDA'),
('ACURA'),
('BUICK'),
('GENESIS'),
('FIAT'),
('NISSAN INFINITI'),
('BMW'),
('VOLVO'),
('HYUNDAI');

UPDATE "sales" SET "Make" = replace("Make", 'GMC', '1');
UPDATE "sales" SET "Make" = replace("Make", 'VOLKSWAGEN', '2');
UPDATE "sales" SET "Make" = replace("Make", 'ALFA ROMEO', '3');
UPDATE "sales" SET "Make" = replace("Make", 'DODGE', '4');
UPDATE "sales" SET "Make" = replace("Make", 'FORD', '5');
UPDATE "sales" SET "Make" = replace("Make", 'CHRYSLER', '6');
UPDATE "sales" SET "Make" = replace("Make", 'INFINITI', '7');
UPDATE "sales" SET "Make" = replace("Make", 'NISSAN', '8');
UPDATE "sales" SET "Make" = replace("Make", 'MINI', '9');
UPDATE "sales" SET "Make" = replace("Make", 'CADILLAC', '10');
UPDATE "sales" SET "Make" = replace("Make", 'SUBARU', '11');
UPDATE "sales" SET "Make" = replace("Make", 'LEXUS', '12');
UPDATE "sales" SET "Make" = replace("Make", 'RAM', '13');
UPDATE "sales" SET "Make" = replace("Make", 'TOYOTA', '14');
UPDATE "sales" SET "Make" = replace("Make", 'MERCEDES-BENZ', '15');
UPDATE "sales" SET "Make" = replace("Make", 'JEEP', '16');
UPDATE "sales" SET "Make" = replace("Make", 'AUDI', '17');
UPDATE "sales" SET "Make" = replace("Make", 'CHEVROLET', '18');
UPDATE "sales" SET "Make" = replace("Make", 'PORSCHE', '19');
UPDATE "sales" SET "Make" = replace("Make", 'MITSUBISHI', '20');
UPDATE "sales" SET "Make" = replace("Make", 'LINCOLN', '21');
UPDATE "sales" SET "Make" = replace("Make", 'KIA', '22');
UPDATE "sales" SET "Make" = replace("Make", 'MAZDA', '23');
UPDATE "sales" SET "Make" = replace("Make", 'HONDA', '24');
UPDATE "sales" SET "Make" = replace("Make", 'ACURA', '25');
UPDATE "sales" SET "Make" = replace("Make", 'BUICK', '26');
UPDATE "sales" SET "Make" = replace("Make", 'GENESIS', '27');
UPDATE "sales" SET "Make" = replace("Make", 'FIAT', '28');
UPDATE "sales" SET "Make" = replace("Make", 'NISSAN INFINITI', '29');
UPDATE "sales" SET "Make" = replace("Make", 'BMW', '30');
UPDATE "sales" SET "Make" = replace("Make", 'VOLVO', '31');
UPDATE "sales" SET "Make" = replace("Make", 'HYUNDAI', '32');

-- noticed there are makes: 'Nissan', 'Infiniti', 'Nissan Infiniti'.
SELECT DISTINCT "Make" from sales;

SELECT "Make", "Model" FROM "sales"
WHERE "Make" = '8 7';

UPDATE "sales" SET "Make" = replace("Make", '8 7', '7');

ALTER TABLE sales ALTER COLUMN "Make" TYPE INTEGER USING ("Make"::INTEGER);

ALTER TABLE "sales" ADD CONSTRAINT "fk_sales_Make" FOREIGN KEY("Make")
REFERENCES "make" ("id");
-- END 7

