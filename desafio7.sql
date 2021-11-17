CREATE VIEW perfil_artistas AS
    SELECT ANY_VALUE(a.artista) AS artista, al.album AS album, COUNT(*) AS seguidores
    FROM SpotifyClone.artistas AS a
    INNER JOIN SpotifyClone.albuns AS al
    ON a.artista_id = al.artista_id
    INNER JOIN SpotifyClone.artistas_seguidos AS ars
    ON a.artista_id = ars.artista_id
    GROUP BY al.album
    ORDER BY seguidores DESC, artista;
