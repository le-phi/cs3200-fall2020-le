CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `developer_roles_and_privileges` AS
    SELECT 
        `p`.`first_name` AS `first_name`,
        `p`.`last_name` AS `last_name`,
        `p`.`username` AS `username`,
        `p`.`email` AS `email`,
        `w`.`name` AS `website_name`,
        `w`.`visits` AS `visits`,
        `w`.`updated` AS `website_updated`,
        `wr`.`role` AS `website_role`,
        `wp`.`priviledge` AS `website_priviledge`,
        `pg`.`title` AS `title`,
        `pg`.`views` AS `views`,
        `pg`.`updated` AS `page_updated`,
        `pr`.`role` AS `page_role`,
        `pp`.`priviledge` AS `page_priviledge`
    FROM
        (((((((`persons` `p`
        JOIN `developers` `d` ON ((`p`.`id` = `d`.`id`)))
        JOIN `website_roles` `wr` ON ((`d`.`id` = `wr`.`developer_id`)))
        JOIN `website_priviledges` `wp` ON ((`d`.`id` = `wp`.`developer_id`)))
        JOIN `websites` `w` ON ((`w`.`id` = `wr`.`website_id`)))
        JOIN `page_roles` `pr` ON ((`d`.`id` = `pr`.`developer_id`)))
        JOIN `page_priviledges` `pp` ON ((`d`.`id` = `pp`.`developer_id`)))
        JOIN `pages` `pg` ON ((`w`.`id` = `pg`.`website_id`)))