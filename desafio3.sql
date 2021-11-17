CREATE VIEW historico_reproducao_usuarios AS
    SELECT u.usuario AS usuario, m.musica AS nome
    FROM SpotifyClone.usuarios AS u
    INNER JOIN SpotifyClone.historico_reproducao AS hr
    ON u.usuario_id = hr.usuario_id
    INNER JOIN SpotifyClone.musicas AS m
    ON hr.musica_id = m.musica_id
    ORDER BY u.usuario, m.musica;
