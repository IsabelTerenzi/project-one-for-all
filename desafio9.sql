SELECT COUNT(history.song_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.history
WHERE history.user_id = 1;