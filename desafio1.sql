DROP DATABASE IF EXISTS SpotifyClone;


CREATE DATABASE SpotifyClone;

USE SpotifyClone;

-- -----------------------------------------------------
-- Table SpotifyClone.planos
-- -----------------------------------------------------

CREATE TABLE SpotifyClone.planos (
    plano_id INT NOT NULL AUTO_INCREMENT,
    plano VARCHAR(50) NOT NULL,
    valor DECIMAL(5, 2) NOT NULL, 
    PRIMARY KEY (plano_id)   
);

INSERT INTO planos (plano, valor)
VALUES
  ('Gratuíto', 0.00),
  ('Universitário', 5.99),
  ('Familiar', 7.99);

-- -----------------------------------------------------
-- Table SpotifyClone.usuarios
-- -----------------------------------------------------

CREATE TABLE SpotifyClone.usuarios (
    usuario_id INT NOT NULL AUTO_INCREMENT,
    usuario VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    PRIMARY KEY (usuario_id),
    FOREIGN KEY (plano_id) REFERENCES SpotifyClone.planos (plano_id)
);

INSERT INTO usuarios (usuario, idade, plano_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 3),
  ('Bill', 20, 2),
  ('Roger', 45, 1);
  
-- -----------------------------------------------------
-- Table SpotifyClone.artistas
-- -----------------------------------------------------

CREATE TABLE SpotifyClone.artistas (
    artista_id INT NOT NULL AUTO_INCREMENT,
    artista VARCHAR(50) NOT NULL,
    PRIMARY KEY (artista_id)
);

INSERT INTO `artistas` (`artista`)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');
  
-- -----------------------------------------------------
-- Table SpotifyClone.albums
-- -----------------------------------------------------

CREATE TABLE SpotifyClone.albuns (
    album_id INT NOT NULL AUTO_INCREMENT,
    album VARCHAR(50) NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY (album_id),
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas (artista_id)         
);

INSERT INTO albuns (album, artista_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

-- -----------------------------------------------------
-- Table SpotifyClone.musicas
-- -----------------------------------------------------

CREATE TABLE SpotifyClone.musicas (
    musica_id INT NOT NULL AUTO_INCREMENT,
    musica VARCHAR(100) NOT NULL,
    artista_id INT NOT NULL,
    album_id INT NOT NULL,
    PRIMARY KEY (musica_id),
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas (artista_id),
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.albuns (album_id)
);

INSERT INTO musicas (musica, artista_id,album_id)
VALUES
  ('Soul For Us', 1, 1),
  ('Reflections Of Magic', 1, 1),
  ('Dance With Her Own', 1, 1),
  ('Troubles Of My Inner Fire', 1, 2),
  ('Time Fireworks', 1, 2),
  ('Magic Circus', 2, 3),
  ('Honey, So Do I', 2, 3),
  ("Sweetie, Let's Go Wild", 2, 3),  
  ('She Knows', 2, 3),
  ('Fantasy For Me', 3, 4), 
  ('Celebration Of More', 3, 4), 
  ('Rock His Everithing', 3, 4), 
  ('Home Forever', 3, 4), 
  ('Diamond Power', 3, 4), 
  ("Honey, Let's Be Silly", 3, 4),
  ('Thang Of Thunder', 4, 5),
  ('Words Of Her Life', 4, 5),
  ('Without My Streets', 4, 5);

-- -----------------------------------------------------
-- Table SpotifyClone.artistas_seguidos
-- -----------------------------------------------------

CREATE TABLE SpotifyClone.artistas_seguidos (
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,    
    PRIMARY KEY (artista_id, usuario_id),
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas (artista_id),
    FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios (usuario_id)        
);

INSERT INTO artistas_seguidos (usuario_id, artista_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);
  
-- -----------------------------------------------------
-- Table SpotifyClone.historico_reproducao
-- -----------------------------------------------------

CREATE TABLE SpotifyClone.historico_reproducao (
    usuario_id INT NOT NULL,
    musica_id INT NOT NULL, 
    PRIMARY KEY (musica_id, usuario_id),   
    FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios (usuario_id),
    FOREIGN KEY (musica_id) REFERENCES SpotifyClone.musicas (musica_id)   
);


INSERT INTO historico_reproducao (usuario_id, musica_id)
VALUES
  (1, 1),
  (1, 6),
  (1, 14),
  (1, 16),
  (2, 13),
  (2, 17),
  (2, 2),
  (2, 15),
  (3, 4),
  (3, 16),
  (3, 6),
  (4, 3),
  (4, 18),
  (4, 11);
  

