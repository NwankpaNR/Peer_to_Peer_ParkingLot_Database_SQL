CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `combi_view` AS
    SELECT 
        `expensive_parking`.`city` AS `city`,
        `expensive_parking`.`post_code` AS `post_code`,
        `expensive_parking`.`hourly_rate` AS `hourly_rate`,
        `expensive_parking`.`type_of_parking` AS `type_of_parking`
    FROM
        `expensive_parking` 
    UNION ALL SELECT 
        `cheapest_parking`.`city` AS `city`,
        `cheapest_parking`.`post_code` AS `post_code`,
        `cheapest_parking`.`hourly_rate` AS `hourly_rate`,
        `cheapest_parking`.`type_of_parking` AS `type_of_parking`
    FROM
        `cheapest_parking`