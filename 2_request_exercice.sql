-- 1. Affichez la somme totale des stocks de livres.
SELECT sum(stock) FROM book

-- 2. Affichez pour chaque auteur le nombre de livres écrits.
SELECT a.first_name, a.last_name, count(b.author_id)
FROM author a
JOIN book b ON b.author_id = a.author_id
GROUP BY a.author_id, a.first_name, a.last_name -- Aidé par chatgpt pour cette ligne


-- 3. Affichez le titre du livre, nom complet de l’auteur, et nom du thème.
SELECT b.title, a.first_name, a.last_name, t.theme_name
FROM author a
JOIN book b, theme t ON a.author_id = b.author_id

-- 4. Affichez toutes les commandes d’un client donné avec titre du livre et date de commande.
SELECT c.customer_id, cu.customer_id, b.title, cu.order_date
FROM customer c
JOIN customer_order cu, book b ON c.customer_id = cu.customer_id
WHERE c.customer_id = 5

-- 5. Affichez la moyenne des notes pour chaque livre ayant au moins 3 avis.
SELECT b.title, AVG(r.rating), COUNT(r.comment)
FROM book b
JOIN review r ON r.book_id = b.book_id
GROUP BY b.book_id, b.title
HAVING COUNT(r.comment) >= 3 -- A REFAIRE

-- 6. Affichez le nombre total de commandes passées par chaque client (email+nb commandes.
SELECT c.email, c.customer_id, SUM(cu.order_id) AS total_commandes
FROM customer_order cu
JOIN customer c ON c.customer_id = cu.customer_id
GROUP BY c.email, c.customer_id

-- 7. Affichez les titres des livres qui n’ont jamais été commandés.
SELECT b.title, cu.order_id
FROM book b
LEFT JOIN customer_order cu ON b.book_id = cu.book_id
WHERE cu.book_id IS NULL

-- 8. Affichez le chiffre d’affaires total généré par chaque auteur (somme des prix des livres commandés).
SELECT a.first_name, a.last_name, SUM(b.price) AS ca
FROM customer_order cu
JOIN book b ON cu.book_id = b.book_id
JOIN author a ON b.author_id = a.author_id
GROUP BY a.author_id, a.first_name, a.last_name

