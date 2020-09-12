# find the average rent of an apartment in each city:

SELECT buildings.city, apartments.rent
FROM apartments
JOIN buildings ON apartments.building_id = buildings.building_id
GROUP BY buildings.city
ORDER BY apartments.rent DESC;


# Find the top 10 tenants with the largest income to rent ratio:

SELECT tenants.tenant_name, (tenants.renter_income / apartments.rent) AS “Rent_Ratio”,
apartments.rent, tenants.renter_income AS "income"
FROM tenants
JOIN apartments on tenants.apartment_id = apartments.apartment_id
ORDER BY “Rent_Ratio” DESC
LIMIT 10;


# Which city has the greatest number of vacant apartments?

SELECT buildings.city, COUNT(apartments.vacant_status) AS “Vacants”
FROM buildings
JOIN apartments
ON buildings.building_id = apartments.building_id
WHERE apartments.vacant_status = 1
GROUP BY buildings.city
ORDER BY “Vacants” DESC;


# Which city has the most pet friendly apartments?

SELECT buildings.city, COUNT(apartments.apartment_id) AS "Dog friendly apts"
FROM buildings
JOIN apartments ON buildings.building_id = apartments.building_id
WHERE apartments.pet_friendly = 0
GROUP BY buildings.city
ORDER BY COUNT(apartments.apartment_id) DESC;


# How many apartments in each city have an address that contains "Rd" or "Road"?

SELECT buildings.city, COUNT(apartments.apartment_ID) AS "Apts on a 'Road'"
FROM buildings
JOIN apartments
ON buildings.building_id = apartments.building_id
WHERE buildings.building_address LIKE "%Rd"
	OR buildings.building_address LIKE "%Road"
GROUP BY buildings.city
ORDER BY COUNT(apartments.apartment_ID) DESC;


# Use DISTINCT to find the unique tenant names that live in pet-friendly apartments.
 
SELECT DISTINCT(tenants.tenant_name)
FROM tenants
JOIN apartments
ON tenants.apartment_id = apartments.apartment_id
WHERE apartments.pet_friendly = 1
ORDER BY tenants.tenant_name;


# Find all the neighbors of each dog friendly apartment
 
SELECT tenants.tenant_name, (tenants.apartment_id + 1) AS "Right Neighbor",
(tenants.apartment_id - 1) AS "Left Neighbor"
FROM tenants
JOIN apartments
ON tenants.apartment_id = apartments.apartment_id
WHERE apartments.pet_friendly = 1;


# Use UNION to combine two queries in the table tenants
 
SELECT tenant_name, apartment_id, renter_income
FROM tenants
WHERE renter_income > 219000
UNION
SELECT tenant_name, apartment_id, renter_income
FROM tenants
WHERE apartment_id IN (100, 200, 300, 400, 500)
ORDER BY apartment_id;


#Use VIEW to create a view of only apartments in Boulder, CO with rent > 5400
 
CREATE VIEW boulder_apts AS
SELECT apartments.apartment_id, apartments.rent
FROM apartments
JOIN buildings
ON apartments.building_id = buildings.building_id
WHERE buildings.city = "Boulder"
	AND apartments.rent > 5400
ORDER BY apartments.rent DESC;

SELECT * FROM boulder_apts;

 
# Use ALTER TABLE to create an apartment_notes column in table apartments
 
ALTER TABLE apartments
ADD apartment_notes VARCHAR(100);


# Use MODIFY to extend the amount of characters a building address can have

ALTER TABLE buildings
MODIFY building_address VARCHAR(200);


# Use UPDATE to update the rent and pet friendly status of apartment 1
 
UPDATE apartments
SET pet_friendly = 1, rent = 2595
WHERE apartment_id = 1;


# Use COUNT to find the number of duplicate names in tenants

SELECT tenant_name, COUNT(tenant_name)
FROM tenants
GROUP BY tenant_name
ORDER BY COUNT(tenant_name) DESC;
 