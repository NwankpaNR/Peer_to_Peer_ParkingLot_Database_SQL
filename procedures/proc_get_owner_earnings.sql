CREATE DEFINER=`root`@`localhost` PROCEDURE `get_owner_earnings`(IN owner_id INT)
BEGIN
	SELECT 
        `space`.`parking_space_id` AS `parking_space_id`,
        `space`.`hourly_rate` AS `hourly_rate`,
        SUM(`res`.`number_of_hours`) AS `total_hours`,
        `space`.`charging_fee_per_hour` AS `charging_fee_per_hour`,
        SUM(((`res`.`number_of_hours` * `space`.`hourly_rate`) + IF((`res`.`charging_option` = 'YES'),
            (`res`.`number_of_hours` * `space`.`charging_fee_per_hour`),
            0))) AS `total_earnings`
    FROM
        (`parking_space_owner` `owner`
        JOIN `parking_space` `space` ON ((`owner`.`owner_id` = `space`.`owner_id`)))
        JOIN `reservation` `res` ON ((`space`.`parking_space_id` = `res`.`parking_space_id`))
    WHERE `owner`.`owner_id` = owner_id
    GROUP BY `space`.`parking_space_id`;
END