CREATE VIEW estatisticas_musicais AS
   SELECT MAX(m.musica_id) AS cancoes, MAX(a.artista_id) AS artistas, MAX(al.album_id) AS albuns 
   FROM SpotifyClone.musicas AS m
   JOIN SpotifyClone.albuns AS al
   JOIN SpotifyClone.artistas AS a;
