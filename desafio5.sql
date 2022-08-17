SELECT song.song_name AS 'cancao',
COUNT(history.song_id) AS 'reproducoes'
FROM SpotifyClone.song AS song
INNER JOIN SpotifyClone.history AS history ON song.song_id = history.song_id
GROUP BY song_name
ORDER BY reproducoes DESC, cancao
LIMIT 2;