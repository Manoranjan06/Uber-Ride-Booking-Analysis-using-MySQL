create database	bookings;
use bookings;

-- 1. Retrieve all successful booking
select *
from booking
where booking_status = 'success';

-- 2. Find the average ride distance for each vehicle type
select vehicle_type, avg(ride_distance) as avg_distance
from booking
group by vehicle_type;

-- 3. Get the total number of cancelled rides by customers
select count(*) as total_cancelled_by_customer
from booking
where booking_status = 'cancelled by customer';

-- 4. List the top 5 customers who booked the highest number of rides
select customer_id, count(booking_id) as total_rides
from booking
group by customer_id
order by total_rides desc
limit 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues
select count(*) as total_cancelled_by_driver
from booking
where canceled_rides_by_driver =  'personal & car related issue';

-- 6. Find the maximum and minimum driver ratings for prime sedan booking
select max(driver_ratings) as max_rating,
       min(driver_ratings) as min_rating
from booking
where vehicle_type = 'prime sedan';

-- 7. Retrieve all rides where payment was made using upi
select *
from booking
where payment_method = 'upi';

-- 8. Find the average customer rating per vehicle type
select vehicle_type, avg(customer_rating) as avg_customer_rating
from booking
group by vehicle_type;

-- 9. Calculate the total booking value of rides completed successfully
select sum(booking_value) as total_successful_value
from booking
where booking_status = 'success';

-- 10. List all incomplete rides along with the reason
select booking_id, incomplete_rides_reason
from booking
where incomplete_rides = 'yes';

-- used the view method to analyze the data

-- 1. Retrieve all successful booking:
create view successful_booking as
select *
from booking
where booking_status = 'success';

-- 2. Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle as
select vehicle_type, avg(ride_distance) as avg_distance
from booking
group by vehicle_type;

-- 3. Get the total number of cancelled rides by customers:
create view cancelled_rides_by_customers as
select count(*) as total_cancelled_rides
from booking
where booking_status = 'cancelled by customer';

-- 4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers as
select customer_id, count(booking_id) as total_rides
from booking
group by customer_id
order by total_rides desc
limit 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view rides_cancelled_by_drivers_p_c_issues as
select count(*) as total_cancelled_rides
from booking
where canceled_rides_by_driver = 'personal & car related issue';

-- 6. Find the maximum and minimum driver ratings for prime sedan booking:
create view max_min_driver_rating as
select max(driver_ratings) as max_rating,
       min(driver_ratings) as min_rating
from booking
where vehicle_type = 'prime sedan';

-- 7. Retrieve all rides where payment was made using upi:
create view upi_payment as
select *
from booking
where payment_method = 'upi';

-- 8. Find the average customer rating per vehicle type:
create view avg_cust_rating as
select vehicle_type, avg(customer_rating) as avg_customer_rating
from booking
group by vehicle_type;

-- 9. Calculate the total booking value of rides completed successfully:
create view total_successful_ride_value as
select sum(booking_value) as total_successful_ride_value
from booking
where booking_status = 'success';

-- 10. List all incomplete rides along with the reason:
create view incomplete_rides_reason as
select booking_id, incomplete_rides_reason
from booking
where incomplete_rides = 'yes';

-- 1. Retrieve all successful booking:
select * from successful_booking;

-- 2. Find the average ride distance for each vehicle type:
select * from ride_distance_for_each_vehicle;

-- 3. Get the total number of cancelled rides by customers:
select * from cancelled_rides_by_customers;

-- 4. List the top 5 customers who booked the highest number of rides:
select * from top_5_customers;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select * from rides_cancelled_by_drivers_p_c_issues;

-- 6. Find the maximum and minimum driver ratings for prime sedan booking:
select * from max_min_driver_rating;

-- 7. Retrieve all rides where payment was made using upi:
select * from upi_payment;

-- 8. Find the average customer rating per vehicle type:
select * from avg_cust_rating;

-- 9. Calculate the total booking value of rides completed successfully:
select * from total_successful_ride_value;

-- 10. List all incomplete rides along with the reason:
select * from incomplete_rides_reason;