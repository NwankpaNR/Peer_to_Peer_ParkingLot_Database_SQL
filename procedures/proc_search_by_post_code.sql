CREATE DEFINER=`root`@`localhost` PROCEDURE `search_parking_spaces_by_postcode`(IN postcode varchar(10))
BEGIN
    SELECT 
        p.parking_space_id,
        p.type_of_parking,
        p.type_of_vehicle_accomodated,
        p.hourly_rate,
        a.post_code,
        a.house_no,
        a.street_name,
        a.city
    FROM 
        parking_space p
        INNER JOIN address a ON p.address_id = a.address_id
    WHERE 
        a.post_code = postcode;
END