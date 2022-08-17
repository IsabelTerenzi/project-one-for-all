SELECT user.user_name AS 'usuario',
COUNT(history.user_id) AS 'qt_de_musicas_ouvidas',
ROUND(SUM(song.time_seconds) / 60, 2) AS 'total_minutos'
FROM SpotifyClone.user AS user
INNER JOIN SpotifyClone.history AS history ON history.user_id = user.user_id
INNER JOIN SpotifyClone.song AS song ON song.song_id = history.song_id
GROUP BY user_name
ORDER BY user_name;
