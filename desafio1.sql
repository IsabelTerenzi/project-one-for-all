DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plan(
      plan_id INT NOT NULL AUTO_INCREMENT,
      options VARCHAR(13) NOT NULL,
      price DECIMAL(6, 2) NOT NULL,

      primary key (plan_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.user(
      user_id INT NOT NULL AUTO_INCREMENT,
      user_name VARCHAR(100) NOT NULL,
      plan_id INT NOT NULL,
      age INT NOT NULL,
      date_signature DATE NOT NULL,

      foreign key (plan_id) references plan(plan_id),
      primary key (user_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artist(
      artist_id INT NOT NULL AUTO_INCREMENT,
      artist_name VARCHAR(100) NOT NULL,

      primary key (artist_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.album(
      album_id INT NOT NULL AUTO_INCREMENT,
      album_name VARCHAR(100) NOT NULL,
      artist_id INT NOT NULL,
      year_launch YEAR NOT NULL,

      foreign key (artist_id) references artist(artist_id),
      primary key (album_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.song(
      song_id INT NOT NULL AUTO_INCREMENT,
      song_name VARCHAR(100) NOT NULL,
      artist_id INT NOT NULL,
      time_seconds INT NOT NULL,
      album_id INT NOT NULL,

      foreign key (artist_id) references artist(artist_id),
      foreign key (album_id) references album(album_id),
      primary key (song_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.history(
      song_id INT NOT NULL,
      date_reproduction DATETIME NOT NULL,
      user_id INT NOT NULL,

      foreign key (song_id) references song(song_id),
      foreign key (user_id) references user(user_id),
      primary key (song_id, user_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.following(
      user_id INT NOT NULL,
      artist_id INT NOT NULL,

      foreign key (artist_id) references artist(artist_id),
      foreign key (user_id) references user(user_id),
      primary key (user_id, artist_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.plan (plan_id, options, price)
  VALUES
    (1, 'gratuito', 0.00),
    (2, 'familiar', 7.99),
    (3, 'universitário', 5.99),
    (4, 'pessoal', 6.99);

    INSERT INTO SpotifyClone.user (user_id, user_name, plan_id, age, date_signature)
  VALUES
    (1, 'Barbara Liskov', 1, 82, '2019-10-20'),
    (2, 'Robert Cecil Martin', 1, 58, '2017-01-06'),
    (3, 'Ada Lovelace', 2, 37, '2017-12-30'),
    (4, 'Martin Fowler', 2, 46, '2017-01-17'),
    (5, 'Sandi Metz', 2, 58, '2018-04-29'),
    (6, 'Paulo Freire', 3, 19, '2018-02-14'),
    (7, 'Bell Hooks', 3, 26, '2018-01-05'),
    (8, 'Christopher Alexander', 4, 85, '2019-06-05'),
    (9, 'Judith Butler', 4, 45, '2020-05-13'),
    (10, 'Jorge Amado', 4, 58, '2017-02-17');

  INSERT INTO SpotifyClone.artist (artist_id, artist_name)
  VALUES
    (1, 'Beyoncé'),
    (2, 'Queen'),
    (3, 'Elis Regina'),
    (4, 'Baco Exu do Blues'),
    (5, 'Blind Guardian'),
    (6, 'Nina Simone');

    INSERT INTO SpotifyClone.album (album_id, album_name, artist_id, year_launch)
  VALUES
    (1, 'Renaissance', 1, 2022),
    (2, 'Jazz', 2, 1978),
    (3, 'Hot Space', 2, 1982),
    (4, 'Falso Brilhante', 3, 1998),
    (5, 'Vento de Maio', 3, 2001),
    (6, 'QVVJFA?', 4, 2003),
    (7, 'Somewhere Far Beyond', 5, 2007),
    (8, 'I Put A Spell On You', 6, 2012);

    INSERT INTO SpotifyClone.song (song_id, song_name, artist_id, time_seconds, album_id)
  VALUES
    (1, 'BREAK MY SOUL', 1, 279, 1),
    (2, "VIRGO’S GROOVE", 1, 369, 1),
    (3, 'ALIEN SUPERSTAR', 1, 116, 1),
    (4, "Don’t Stop Me Now", 2, 203, 2),
    (5, 'Under Pressure', 2, 152, 3),
    (6, 'Como Nossos Pais', 3, 105, 4),
    (7, 'O Medo de Amar é o Medo de Ser Livre', 3, 207, 5),
    (8, 'Samba em Paris', 4, 267, 6),
    (9, "The Bard’s Song", 5, 244, 7),
    (10, 'Feeling Good', 6, 100, 8);

INSERT INTO SpotifyClone.history (song_id, date_reproduction, user_id)
  VALUES
    (8, '2022-02-28 10:45:55', 1),
    (2, '2020-05-02 05:30:35', 1),
    (10, '2020-03-06 11:22:33', 1),
    (10, '2022-08-05 08:05:17', 2),
    (4, '2020-01-02 07:40:33', 2),
    (10, '2020-11-13 16:55:13', 3),
    (2, '2020-12-05 18:38:30', 3),
    (8, '2021-08-15 17:10:10', 4),
    (8, '2022-01-09 01:44:33', 5),
    (5, '2020-08-06 15:23:43', 5),
    (4, '2017-01-24 00:31:17', 6),
    (1, '2017-10-12 12:35:20', 6),
    (4, '2011-12-15 22:30:49', 7),
    (4, '2012-03-17 14:56:41', 8),
    (9, '2022-02-24 21:14:22', 9),
    (3, '2015-12-13 08:30:22', 10);

    INSERT INTO SpotifyClone.following (user_id, artist_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);

    