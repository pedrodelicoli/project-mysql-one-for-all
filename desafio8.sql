USE SpotifyClone
DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
    BEFORE DELETE
    ON usuarios FOR EACH ROW
BEGIN
    DELETE FROM historico_reproducao 
    WHERE historico_reproducao.usuario_id = OLD.usuario_id;
    DELETE FROM artistas_seguidos 
    WHERE artistas_seguidos.usuario_id = OLD.usuario_id;
END $$    
DELIMITER ;
