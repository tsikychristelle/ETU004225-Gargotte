CREATE TABLE client(
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);
ALTER TABLE commande ADD COLUMN idClient INT REFERENCES client(id);

INSERT INTO client(nom) VALUES('Alice'), ('Bob'), ('Charlie');
CREATE VIEW v_client_Commande AS(
    SELECT co.id,co.date,
    CASE 
        WHEN co.idClient IS NOT NULL THEN cl.nom
        WHEN  co.idClient IS NULL THEN 'Client de passage'
        END AS NomClient
    FROM commande co
    LEFT JOIN client cl ON cl.id = co.idClient
);
SELECT * FROM v_client_Commande;
-- ON UTILISE LEFT JOIN POUR AFFICHER TOUTES LES COMMANDES, MÊME CELLES SANS CLIENT ASSOCIÉ. SI UNE COMMANDE N'A PAS DE CLIENT, LE NOM DU CLIENT SERA AFFICHÉ COMME 'Client de passage'.