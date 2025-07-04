CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `most_booked_parking_space` AS
    SELECT 
        `p`.`parking_space_id` AS `parking_space_id`,
        `p`.`type_of_parking` AS `type_of_parking`,
        `p`.`hourly_rate` AS `hourly_rate`,
        `p`.`how_many_cars` AS `how_many_cars`,
        COUNT(`r`.`reservation_id`) AS `num_reservations`
    FROM
        (`parking_space` `p`
        JOIN `reservation` `r` ON ((`p`.`parking_space_id` = `r`.`parking_space_id`)))
    GROUP BY `p`.`parking_space_id`
    ORDER BY `num_reservations` DESC