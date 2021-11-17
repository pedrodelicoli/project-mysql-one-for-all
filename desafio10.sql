USE SpotifyClone
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(usuario INT)
RETURNS INT READS SQL DATA
BEGIN 
    DECLARE qts_musicas INT;
    SELECT COUNT(*) 
    FROM SpotifyClone.historico_reproducao 
    WHERE usuario_id = usuario INTO @qtd_musicas;
    RETURN @qtd_musicas;    
END $$ 
