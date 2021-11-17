CREATE VIEW top_2_hits_do_momento AS
    SELECT m.musica AS cancao, COUNT(*) AS reproducoes
    FROM SpotifyClone.musicas AS m
    INNER JOIN SpotifyClone.historico_reproducao AS hr
    ON m.musica_id = hr.musica_id
    GROUP BY m.musica
    HAVING reproducoes > 1
    ORDER BY reproducoes DESC, cancao;
