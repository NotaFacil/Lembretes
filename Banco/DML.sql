use notafacil;

insert into usuario (usu_nome, usu_email, usu_celular, usu_login, usu_senha)
values ("Administrador","admin@notafacil.com", "9 1234 5678", "admin", "1234");

insert into lembrete (usu_id, lem_dh_insercao, lem_dh_inicio, lem_dh_fim, lem_dh_lembrar, lem_titulo, lem_descricao, lem_local)
values (2, now(), now(), now(), now(), 'nota 1', 'Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.','aqui');

insert into lembrete (usu_id, lem_dh_insercao, lem_dh_inicio, lem_dh_fim, lem_dh_lembrar, lem_titulo, lem_descricao, lem_local)
values (2, now(), now(), now(), now(), 'nota 2', 'Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.','lá');

insert into lembrete (usu_id, lem_dh_insercao, lem_dh_inicio, lem_dh_fim, lem_dh_lembrar, lem_titulo, lem_descricao, lem_local)
values (2, now(), now(), now(), now(), 'nota 3', 'Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.','cá');

insert into lembrete (usu_id, lem_dh_insercao, lem_dh_inicio, lem_dh_fim, lem_dh_lembrar, lem_titulo, lem_descricao, lem_local)
values (2, now(), now(), now(), now(), 'nota 4', 'Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.','em casa');
