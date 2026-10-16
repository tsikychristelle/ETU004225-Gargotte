CREATE TABLE categoriePlat(
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);
CREATE TABLE plat(
    id SERIAL PRIMARY KEY,
    idCategoriePlat INT NOT NULL REFERENCES categoriePlat(id),
    nom VARCHAR(255) NOT NULL,
    prix DECIMAL(10,2) NOT NULL
);

INSERT INTO categoriePlat(nom) VALUES
('Plat Malagasy'),
('Plat Chinois'),
('Soupe'),
('Dessert et gouter'),
('Boisson');

INSERT INTO plat(idCategoriePlat, nom, prix) VALUES
(1, 'Romazava', 7000.00),
(1, 'Ravitoto sy henakisoa', 8000.00),
(1, 'Akoho sy voanio', 8500.00),
(2, 'Mi sao', 6000.00),
(3, 'Soupe chinoise', 5000.00),
(3, 'Mofo Gasy', 250.00),
(4,'Ranon apango', 500.00);
