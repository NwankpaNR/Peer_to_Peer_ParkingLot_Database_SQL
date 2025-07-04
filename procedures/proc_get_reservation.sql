CREATE DEFINER=`root`@`localhost` PROCEDURE `get_reservations_by_driver`(IN driver_email varchar(45))
BEGIN
	SELECT reservation.reservation_id, parking_space.type_of_parking, parking_space.address_id, reservation.booking_date, reservation.parking_start_time, reservation.parking_end_time
	FROM reservation
	JOIN driver ON reservation.driver_id = driver.driver_id
	JOIN parking_space ON reservation.parking_space_id = parking_space.parking_space_id
	WHERE driver.email_address = driver_email;
END