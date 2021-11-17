CREATE VIEW cancoes_premium AS
   SELECT m.musica AS nome, COUNT(*) AS reproducoes 
   FROM SpotifyClone.musicas AS m
   INNER JOIN SpotifyClone.historico_reproducao AS hr
   ON m.musica_id = hr.musica_id
   INNER JOIN SpotifyClone.usuarios AS u
   ON hr.usuario_id = u.usuario_id
   WHERE u.plano_id IN (2, 3)
   GROUP BY m.musica
   ORDER BY m.musica;
