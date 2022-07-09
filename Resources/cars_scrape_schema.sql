DROP TABLE car_scrape
CREATE TABLE car_scrape (
vin VARCHAR(20) PRIMARY KEY,
mrsp INT,
price INT,
make VARCHAR,
model VARCHAR,
year INT,
transmission VARCHAR,
mileage VARCHAR,
dealer_name VARCHAR,
dealer_address VARCHAR,
dealer_state VARCHAR,
dealer_zipcode VARCHAR,
lat FLOAT,
lng FLOAT
	
);





UPDATE car_scrape SET mileage= replace("mileage", ' miles', '');
UPDATE car_scrape SET mileage= replace("mileage", ' mile', '');
UPDATE car_scrape SET mileage= replace("mileage", '---', '0');
UPDATE car_scrape SET mileage= replace("mileage", ',', '');
ALTER TABLE car_scrape ALTER COLUMN mileage TYPE INTEGER USING (mileage::INTEGER);

SELECT * FROM car_scrape
order by mileage