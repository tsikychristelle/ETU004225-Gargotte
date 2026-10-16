CREATE TABLE serveur(
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);

CREATE TABLE tableGargotte(
    id SERIAL PRIMARY KEY,
    numero INT NOT NULL
);
ALTER TABLE commande ADD COLUMN idServeur INT REFERENCES serveur(id);
ALTER TABLE commande ADD COLUMN idTableGargotte INT REFERENCES tableGargotte(id);
INSERT INTO serveur(nom) VALUES('Njaka Rakoto'), ('Lalao Rasoa');

INSERT INTO tableGargotte(numero) VALUES(1), (2), (3),(4), (5),(6), (7), (8);

UPDATE commande SET idServeur = 1, idTableGargotte = 2 WHERE id = 1;
UPDATE commande SET idServeur = 2, idTableGargotte = 3 WHERE id = 2;
UPDATE commande SET idServeur = 1, idTableGargotte = 1 WHERE id = 3;
UPDATE commande SET idServeur = 2, idTableGargotte = 4 WHERE id = 4;
CREATE OR REPLACE VIEW  v_commande_serveur AS(
    SELECT co.id, co.date, s.nom AS NomServeur, s.id IdServeur
    FROM commande co
    LEFT JOIN serveur s ON s.id = co.idServeur
);

CREATE OR REPLACE VIEW v_prixTotal_Par_Commande_PAR_SERVEUR AS(
    SELECT SUM(cp.quantite*p.prix) AS PrixTotal, c.ID IdCommande, c.date, s.nom AS NomServeur, s.id IdServeur
    FROM commandePlat as cp
    JOIN plat as p on p.id = cp.idPlat
    JOIN commande as c on c.id = cp.idCommande 
    JOIN serveur s on c.idServeur = s.id
    GROUP BY c.id, c.date, s.nom, s.id
);

CREATE OR REPLACE VIEW v_chiffreAffaireParServeur AS(
    SELECT s.nom AS NomServeur, COUNT(co.id) AS NombreDeCommandes, SUM(v.PrixTotal) AS ChiffeDAffaire
    FROM commande co 
    LEFT JOIN serveur s ON s.id = co.idServeur
    LEFT JOIN v_prixTotal_Par_Commande v ON v.IdCommande = co.id
    GROUP BY s.id
);


