SELECT * FROM educaenfam.usuarios where cpf = '30595010253';

SELECT * FROM educaenfam.usuario_roles where usuario_id = 87305;

INSERT INTO educaenfam.usuario_roles (usuario_id,role_id) VALUES (87305, 1);

SELECT * FROM educaenfam.usuario_roles where role_id = 1;

SELECT * FROM educaenfam.usuario_roles where usuario_id = 87305;



update educaenfam.usuarios SET nome = substring(email,1,LOCATE('@',email)-1) where nome = CPF;

update educaenfam.usuarios SET nome = substring(email,1,LOCATE('@',email)-1) where id in (108620,98099,116789);

SELECT * FROM educaenfam.usuarios WHERE nome REGEXP '[0-9]{5}' order by nome;

SELECT * FROM educaenfam.usuarios where id=128777;

SELECT * FROM educaenfam.usuarios order by nome;

SELECT id,nome, email, substring(email,1,LOCATE('@',email)-1) FROM educaenfam.usuarios where nome = CPF order by email;

CALL `educaenfam`.`buscaUser`('test');

SELECT * FROM educaenfam.vwUsuarios where nome LIKE '%teste%';

delete FROM educaenfam.vwUsuarios where nome LIKE '%teste%';

SELECT id, nome, REGEXP_INSTR(nome,'[0-9,(]') as pos09 FROM educaenfam.usuarios WHERE nome REGEXP '[0-9]{5}' order by nome;

SELECT id,nome, substring(nome,1,REGEXP_INSTR(nome,'[0-9,(]')-1) as nome2 FROM educaenfam.usuarios WHERE nome REGEXP '[0-9]{5}' order by nome;

update educaenfam.usuarios SET nome = substring(nome,1,REGEXP_INSTR(nome,'[0-9,(]')-1) WHERE nome REGEXP '[0-9]{5}';

SELECT * FROM educaenfam.usuarios WHERE nome REGEXP '[0-9]' order by nome;

SELECT id,nome, substring(nome,1,REGEXP_INSTR(nome,'[0-9,(@]')-1) as nome2 FROM educaenfam.usuarios WHERE nome REGEXP '[0-9{2},@(]' order by nome;

update educaenfam.usuarios SET nome = substring(nome,1,REGEXP_INSTR(nome,'[0-9,(@]')-1) WHERE nome REGEXP '[0-9{2},@(]';

update educaenfam.usuarios SET nome = substring(email,1,LOCATE('@',email)-1) where id = 88305;

SELECT * FROM educaenfam.usuarios where char_length(nome) < 3 order by nome;

