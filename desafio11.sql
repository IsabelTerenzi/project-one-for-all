SELECT song.song_name AS nome_musica,
	CASE WHEN song_name LIKE '%Amar%' THEN REPLACE(song_name, 'Amar', 'Code Review')
		 WHEN song_name LIKE '%SUPERSTAR' THEN REPLACE(song_name, 'SUPERSTAR', 'SUPERDEV')
		 WHEN song_name LIKE '%Bard%' THEN REPLACE(song_name, 'Bard', 'QA')
		 WHEN song_name LIKE '%SOUL' THEN REPLACE(song_name, 'SOUL', 'CODE')
		 WHEN song_name LIKE '%Pais' THEN REPLACE(song_name, 'Pais', 'Pull Requests')
	ELSE song_name
END AS novo_nome
FROM SpotifyClone.song
WHERE song_name LIKE '%Amar%'
OR song_name LIKE '%SUPERSTAR'
OR song_name LIKE '%Bard%'
OR song_name LIKE '%SOUL'
OR song_name LIKE '%Pais'
ORDER BY song_name DESC;