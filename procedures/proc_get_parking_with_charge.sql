CREATE DEFINER=`root`@`localhost` PROCEDURE `get_parking_spaces_with_charging`()
BEGIN
  SELECT parking_space.parking_space_id, parking_space.type_of_parking, parking_space.how_many_cars, parking_space.type_of_vehicle_accomodated, parking_space.hourly_rate, parking_space.date_listed, parking_space.address_id
  FROM parking_space
  WHERE parking_space.charging_available = 'YES';
END