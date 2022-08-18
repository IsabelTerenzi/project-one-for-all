SELECT artist.artist_name AS artista,
album.album_name AS album,
COUNT(following.user_id) AS seguidores
FROM SpotifyClone.artist AS artist
INNER JOIN SpotifyClone.album AS album ON album.artist_id = artist.artist_id
INNER JOIN SpotifyClone.following AS following ON following.artist_id = artist.artist_id
GROUP BY artist_name, album
ORDER BY seguidores DESC, artista ASC, album ASC;