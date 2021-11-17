CREATE VIEW top_3_artistas AS
    SELECT a.artista AS artista, COUNT(*) AS seguidores
    FROM SpotifyClone.artistas AS a
    INNER JOIN SpotifyClone.artistas_seguidos AS ars
    ON a.artista_id = ars.artista_id
    GROUP BY a.artista
    HAVING seguidores >= 2
    ORDER BY seguidores DESC, a.artista;
