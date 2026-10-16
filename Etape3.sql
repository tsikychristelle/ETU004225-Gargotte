CREATE TABLE commande(
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL 
);
CREATE TABLE commandePlat(
    id SERIAL PRIMARY KEY,
    idCommande INT NOT NULL REFERENCES commande(id),
    idPlat INT NOT NULL REFERENCES plat(id),
    quantite INT NOT NULL

);

INSERT INTO commande(date) VALUES
(NOW()),('2026-10-14');

INSERT INTO commandePlat(idCommande, idPlat, quantite)
VALUES
(1,2,3),
(1,3,1);

INSERT INTO commandePLat(idCommande, idPlat, quantite) VALUES
(3,2,1),
(3,7,1);

INSERT INTO commandePlat(idCommande, idPlat, quantite) VALUES
(2,1,2),
(2,5,1);

CREATE OR REPLACE VIEW v_prixTotal_Par_Commande AS(
    SELECT SUM(cp.quantite*p.prix) AS PrixTotal, c.ID IdCommande, c.date
    FROM commandePlat as cp
    JOIN plat as p on p.id = cp.idPlat
    JOIN commande as c on c.id = cp.idCommande GROUP BY c.id
);
SELECT * FROM v_prixTotal_Par_Commande;