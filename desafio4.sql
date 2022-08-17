SELECT user.user_name AS 'usuario',
IF(YEAR(MAX(history.date_reproduction)) < 2021, 'Usuário inativo', 'Usuário ativo') AS 'status_usuario'
FROM SpotifyClone.user AS user
INNER JOIN SpotifyClone.history AS history ON history.user_id = user.user_id
GROUP BY user_name
ORDER BY user_name;