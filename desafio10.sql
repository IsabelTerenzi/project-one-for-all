SELECT song.song_name AS nome,
COUNT(user.user_id) AS reproducoes
FROM SpotifyClone.song AS song
INNER JOIN SpotifyClone.history AS history ON history.song_id = song.song_id
INNER JOIN SpotifyClone.user AS user ON user.user_id = history.user_id
WHERE user.plan_id = 1 OR user.plan_id = 4
GROUP BY song_name
ORDER BY song_name;