CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `cheapest_parking` AS
    SELECT 
        `a`.`city` AS `city`,
        `a`.`post_code` AS `post_code`,
        `ps`.`hourly_rate` AS `hourly_rate`,
        `ps`.`type_of_parking` AS `type_of_parking`
    FROM
        (`parking_space` `ps`
        JOIN `address` `a`)
    ORDER BY `ps`.`hourly_rate`
    LIMIT 10