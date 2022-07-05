-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "sales" (
    "id" int   NOT NULL,
    "MSRP" int   NOT NULL,
    "Selling_Price" int   NOT NULL,
    "Mileage" int   NOT NULL,
    "Cruise_Control" int   NOT NULL,
    "AutoReverseSystem" int   NOT NULL,
    "PedestrianAlertingSoundint" int   NOT NULL,
    "Axles" int   NOT NULL,
    "BasePrice" int   NOT NULL,
    "BedLengthIN" int   NOT NULL,
    "BedType" varchar   NOT NULL,
    "BlindSpotMon" int   NOT NULL,
    "BodyCabType" varchar   NOT NULL,
    "BodyClass" varchar   NOT NULL,
    "Doors" int   NOT NULL,
    "DriveType" varchar   NOT NULL,
    "EngineHP" int   NOT NULL,
    "ForwardCollisionWarning" int   NOT NULL,
    "KeylessIgnition" int   NOT NULL,
    "Make" varchar   NOT NULL,
    "Model" varchar   NOT NULL,
    "ModelYear" int   NOT NULL,
    "PedAutoEBrake" int   NOT NULL,
    "TopSpeedMPH" int   NOT NULL,
    "TransmissionSpeeds" int   NOT NULL,
    "TransmissionStyle" varchar   NOT NULL,
    "VehicleType" varchar   NOT NULL,
    CONSTRAINT "pk_sales" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "options" (
    "id" int   NOT NULL,
    "option" varchar   NOT NULL,
    CONSTRAINT "pk_options" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "sales" ADD CONSTRAINT "fk_sales_Cruise_Control" FOREIGN KEY("Cruise_Control")
REFERENCES "options" ("id");

ALTER TABLE "sales" ADD CONSTRAINT "fk_sales_AutoReverseSystem" FOREIGN KEY("AutoReverseSystem")
REFERENCES "options" ("id");

ALTER TABLE "sales" ADD CONSTRAINT "fk_sales_PedestrianAlertingSoundint" FOREIGN KEY("PedestrianAlertingSoundint")
REFERENCES "options" ("id");

ALTER TABLE "sales" ADD CONSTRAINT "fk_sales_BlindSpotMon" FOREIGN KEY("BlindSpotMon")
REFERENCES "options" ("id");

ALTER TABLE "sales" ADD CONSTRAINT "fk_sales_Doors" FOREIGN KEY("Doors")
REFERENCES "options" ("id");

ALTER TABLE "sales" ADD CONSTRAINT "fk_sales_ForwardCollisionWarning" FOREIGN KEY("ForwardCollisionWarning")
REFERENCES "options" ("id");

ALTER TABLE "sales" ADD CONSTRAINT "fk_sales_KeylessIgnition" FOREIGN KEY("KeylessIgnition")
REFERENCES "options" ("id");

ALTER TABLE "sales" ADD CONSTRAINT "fk_sales_PedAutoEBrake" FOREIGN KEY("PedAutoEBrake")
REFERENCES "options" ("id");

