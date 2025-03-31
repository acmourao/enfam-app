CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `vwUsuarios` AS
    SELECT 
        `usuarios`.`id` AS `id`,
        `usuarios`.`nome` AS `nome`,
        `usuarios`.`email` AS `email`,
        `usuarios`.`cpf` AS `cpf`,
        `usuarios`.`telefone` AS `telefone`,
        `usuarios`.`nascimento` AS `nascimento`
    FROM
        `usuarios`
