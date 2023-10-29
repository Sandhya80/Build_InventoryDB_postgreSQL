

-- Improving Parts Tracking
-- Task 1:
SELECT* FROM parts
LIMIT 10;

-- Task 2:
ALTER TABLE parts
ALTER column code SET NOT NULL;

ALTER TABLE parts
ADD UNIQUE(code);

-- Task 3:
UPDATE parts
SET description = 'Non Available'
WHERE description IS NULL;

CREATE TABLE part_descriptions (
  id integer PRIMARY KEY,
  description text
);

INSERT INTO part_descriptions 
VALUES 
(1, '5V resistor'),
(2, '3V resistor'),
(3, '4V resistor');

UPDATE parts
SET description = part_descriptions.description
FROM part_descriptions
WHERE part_descriptions.id = parts.id
AND parts.description IS NULL;

-- task 4:
ALTER TABLE parts
ALTER COLUMN description SET NOT NULL;

-- task 5 (testing the constraints):
/*INSERT INTO parts(id, code, manufacturer_id)
VALUES (54, 'V1-009', 9);*/

INSERT INTO parts(id, description, code, manufacturer_id)
VALUES (54, 'motion sensor', 'V1-009', 9);

-- Improving Reordering Options
-- task 6:
ALTER TABLE reorder_options
ALTER COLUMN price_usd SET NOT NULL;

-- task 7:
ALTER TABLE reorder_options
ADD CHECK (price_usd > 0 AND quantity > 0);

-- task 8:
ALTER TABLE reorder_options
ADD CHECK (price_usd/quantity > 0.02 AND price_usd/quantity < 25);

-- task 9:
ALTER TABLE parts
ADD PRIMARY KEY (id);

ALTER TABLE reorder_options
ADD FOREIGN KEY (part_id) REFERENCES parts(id);

-- Improving Location
-- task 10:
ALTER TABLE locations
ADD CHECK (qty > 0);

-- task 11:
ALTER TABLE locations
ADD UNIQUE (part_id, location);

-- task 12:
ALTER TABLE locations
ADD FOREIGN KEY (part_id) REFERENCES parts(id); 

/*SELECT * FROM locations; */

-- task 13:
ALTER TABLE parts
ADD FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(id);

-- task 14:
INSERT INTO manufacturers(name, id)
VALUES('Pip_NNC Industrial', 11);

SELECT * FROM manufacturers;

-- task 15:
/*UPDATE parts
SET manufacturer_id = 11
WHERE manufacturer_id IN (SELECT id FROM manufacturers WHERE name IN ('Pip Industrial', 'NNC Manufacturing')); */

-- OR

UPDATE parts
SET manufacturer_id = 11
WHERE manufacturer_id = 1
OR manufacturer_id = 2;









