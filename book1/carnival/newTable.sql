CREATE TABLE vehiclebodytype (
vehicle_body_type_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
name VARCHAR(20)
);
CREATE TABLE vehiclemodel (
vehicle_model_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
name VARCHAR(20)
);
CREATE TABLE vehiclemake (
vehicle_make_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
name VARCHAR(20)
);

UPDATE vehicleTypes 
SET body_type =  CASE  
					WHEN body_type = 'Car' THEN '1' 
					WHEN body_type = 'Truck' THEN '2'
					WHEN body_type = 'Van' THEN '3'
					WHEN body_type = 'SUV' THEN '4'
					ELSE null
                 END ;
				 
UPDATE vehicleTypes 				 
SET      make = CASE  
					WHEN make = 'Chevrolet' THEN '1' 
					WHEN make = 'Mazda' THEN '2'
					WHEN make = 'Nissan' THEN '3'
					WHEN make = 'Ford' THEN '4'
					WHEN make = 'Volkswagen' THEN '5'
					ELSE null
				  END ;
				  
UPDATE vehicleTypes 
SET     model =  CASE  
					WHEN model = 'Corvette' THEN '1' 
					WHEN model = 'Blazer' THEN '2'
					WHEN model = 'Silverado' THEN '3'
					WHEN model = 'MX-5 Miata' THEN '4'
					WHEN model = 'CX-5' THEN '5'
					WHEN model = 'CX-9' THEN '6' 
					WHEN model = 'Maxima' THEN '7'
					WHEN model = 'Altima' THEN '8'
					WHEN model = 'Titan' THEN '9'
					WHEN model = 'Fusion' THEN '10'
					WHEN model = 'EcoSport' THEN '11'
					WHEN model = 'F-250' THEN '12'
					WHEN model = 'Beetle' THEN '13'
					WHEN model = 'Passat' THEN '14'
					WHEN model = 'Atlas' THEN '15'
					WHEN model = 'Transit-150 Cargo' THEN '16'
					ELSE null
				 END ;

ALTER TABLE vehicletypes ALTER COLUMN body_type TYPE INTEGER USING (body_type::integer);

ALTER TABLE vehicletypes ALTER COLUMN make TYPE INTEGER USING (make::integer);

ALTER TABLE vehicletypes ALTER COLUMN model TYPE INTEGER USING (model::integer);
	
ALTER TABLE vehicletypes	
	ADD CONSTRAINT constraint_fk_1 FOREIGN KEY (body_type) REFERENCES vehiclebodytype (vehicle_body_type_id),
	ADD CONSTRAINT constraint_fk_2 FOREIGN KEY (make) REFERENCES vehiclemake (vehicle_make_id),
	ADD CONSTRAINT constraint_fk_3 FOREIGN KEY (model) REFERENCES vehiclemodel (vehicle_model_id);
	
ALTER TABLE vehicletypes
	DROP CONSTRAINT constraint_fk_1,
	DROP CONSTRAINT constraint_fk_2,
	DROP CONSTRAINT constraint_fk_3;
	
ALTER TABLE vehicles
	ADD CONSTRAINT constraint_fk_4 FOREIGN KEY (vehicle_type_id) REFERENCES VehicleTypes (vehicle_type_id);
	
ALTER TABLE vehicles
	DROP CONSTRAINT vehicles_vehicle_type_id_fkey;

DROP TABLE vehicletypes

create table VehicleTypes (
  vehicle_type_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  body_type VARCHAR(5),
  make VARCHAR(50),
  model VARCHAR(50)
);

ALTER TABLE vehicles
	ADD CONSTRAINT vehicles_vehicle_type_id_fkey FOREIGN KEY (vehicle_type_id) REFERENCES VehicleTypes (vehicle_type_id);
	
	
	