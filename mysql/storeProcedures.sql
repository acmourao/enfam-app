CREATE DEFINER=`root`@`%` PROCEDURE `buscaUser`(s char(20) )
begin
SELECT * FROM educaenfam.vwUsuarios
where nome LIKE concat('%',s,'%');
end
