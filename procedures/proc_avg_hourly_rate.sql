CREATE DEFINER=`root`@`localhost` PROCEDURE `get_avg_hourly_rate_for_owner`(IN owner_email varchar(45))
BEGIN
  SELECT AVG(parking_space.hourly_rate)
  FROM parking_space
  JOIN parking_space_owner ON parking_space.owner_id = parking_space_owner.owner_id
  WHERE parking_space_owner.email_address = owner_email;
END