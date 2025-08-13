create database local_food_wastage_management;
use local_food_wastage_management;
select * from providers_data;
select * from receivers_data;
select * from claims_data;
select * from food_listings_data;

-- #FOOD PROVIDERS AND RECEIVERS# 
-- Q1. PROVIDERS AND RECEIVERS IN EACH CITY
select count(Provider_ID), City from providers_data group by City;
select count(Receiver_ID), City from receivers_data group by City;

-- Q2. MOST POPULAR FOOD PROVIDER TYPE
select Provider_Type,count(Provider_Type) as Number_Of_Orders from food_listings_data group by Provider_Type order by count(Provider_Type) desc;

-- Q3. CONTACT INFORMATION OF PROVIDERS IN A SPECIFIC CITY
select name,Address,Contact,City from providers_data ;

-- Q4. RECEIVERS CLAIMED MOST FOOD
select count(Receiver_ID) as Orders_Received , Name from receivers_data group by Name ;

-- #FOOD LISTINGS AND AVAILABILITY#
-- Q5. QUANTITY OF FOOD AVAILABLE FROM ALL PROVIDERS
select distinct(Provider_Type),sum(Quantity) as Total_Quantity from food_listings_data group by Provider_Type ;

-- Q6. CITY WITH HIGHEST NUMBER OF FOOD LISTINGS
select distinct(Location) as City,count(Food_ID) as Number_Of_Food_Listings from food_listings_data group by Location;

-- Q7. MOST COMMON FOOD TYPES
select distinct(Food_Type),count(Food_Type) as number_of_food_types from food_listings_data group by Food_Type;

-- Q8.FOOD CLAIMS MADE FOR EACH FOOD ITEM
select distinct(f.Food_Name),count(c.Claim_ID) as number_of_claims from claims_data c join food_listings_data f on c.Food_ID=f.Food_ID group by f.Food_Name;

-- Q9.PROVIDER WITH HIGHEST NUMBER OF FOOD CLAIMS
select distinct(f.Provider_Type),count(c.Claim_ID) as successful_claims from food_listings_data f join claims_data c on f.Food_ID=c.Food_ID where c.Status="Completed"  group by f.Provider_Type ;

-- Q10. PERCENTAGE OF FOOD CLAIMS ARE COMPLETED VS. PENDING VS. CANCELLED
select distinct(Status),count(Status)*100/sum(count(Status))over() as "Food Claims %" from claims_data group by Status;

-- Q11. AVERAGE QUANTITY OF FOOD CLAIMED PER RECEIVER
select distinct(c.Receiver_ID) , avg(f.Quantity) as Average_Quantity from claims_data c join food_listings_data f on c.Food_ID=f.Food_ID group by c.Receiver_ID;

-- Q12. MOST CLAIMED MEAL TYPE
select distinct(Meal_Type),count(Meal_Type) as number_of_meal_types from food_listings_data group by Meal_Type ;

-- Q13. TOTAL QUANTITY OF FOOD DONATED BY EACH PROVIDER
select distinct(f.Provider_ID),sum(f.Quantity) as "Total Quantity",p.Name from food_listings_data f join providers_data p on f.Provider_ID=p.Provider_ID group by p.Provider_ID;



