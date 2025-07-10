-- Bonus SQL

-- 1. Trouver les 3 auteurs dont les livres ont généré le plus de chiffre d’affaires total.
SELECT a.first_name, a.last_name, SUM(cu.total_amount) AS ca
FROM customer_order cu
JOIN book b ON cu.book_id = b.book_id
JOIN author a ON b.author_id = a.author_id
GROUP BY a.author_id
ORDER BY ca DESC LIMIT 3

-- 2. Calculer le total des ventes par thème de livre, classé du plus au moins vendu (en montant).
SELECT t.theme_name, SUM(cu.total_amount) AS ventes_totales
FROM customer_order cu
JOIN book b ON cu.book_id = b.book_id
JOIN theme t ON b.theme_id = t.theme_id
GROUP BY t.theme_name
ORDER BY ventes_totales DESC

-- 3. Afficher pour chaque mois de l’année 2024 le nombre de commandes passées et le chiffre d’affaires total.
SELECT cu.order_date, SUM(cu.total_amount) AS chiffre_affaires
FROM customer_order cu
JOIN book b ON b.book_id = cu.book_id
GROUP BY cu.order_date
ORDER BY cu.order_date ASC
WHERE cu.order_date IS 


-- 4. Pour chaque auteur, calculer la moyenne des notes des livres écrits, y compris les auteurs dont livres n’ont pas encore d’avis (afficher NULL dans ce cas).


-- 5. Afficher les commandes les plus récentes pour chaque client (1 commande max par client).
