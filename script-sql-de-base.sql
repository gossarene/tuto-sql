
-- Créer la  Table Clients

CREATE TABLE Clients (
    ClientID INT PRIMARY KEY IDENTITY(1,1),
    Nom NVARCHAR(100),
    Prenom NVARCHAR(100),
    Sexe CHAR(1),
    Email NVARCHAR(150),
    Telephone NVARCHAR(20),
    Ville NVARCHAR(100),
    Pays NVARCHAR(100),
    DateInscription DATE
);

-- Créer la  Table Employes

CREATE TABLE Employes (
    EmployeID INT PRIMARY KEY IDENTITY(1,1),
    Nom NVARCHAR(100),
    Prenom NVARCHAR(100),
    Poste NVARCHAR(100),
    DateEmbauche DATE,
    Salaire DECIMAL(10,2),
    Departement NVARCHAR(100)
);


-- Créer la  Table Categories

CREATE TABLE Categories (
    CategorieID INT PRIMARY KEY IDENTITY(1,1),
    NomCategorie NVARCHAR(100),
    Description NVARCHAR(255)
);


-- Créer la  Table Produits

CREATE TABLE Produits (
    ProduitID INT PRIMARY KEY IDENTITY(1,1),
    NomProduit NVARCHAR(150),
    CategorieID INT,
    PrixUnitaire DECIMAL(10,2),
    Stock INT,
    CONSTRAINT FK_Produits_Categories FOREIGN KEY (CategorieID) REFERENCES Categories(CategorieID)
);



-- Créer la  Table Commandes

CREATE TABLE Commandes (
    CommandeID INT PRIMARY KEY IDENTITY(1,1),
    ClientID INT,
    EmployeID INT,
    DateCommande DATE,
    Statut NVARCHAR(50),
    MontantTotal DECIMAL(10,2),
    CONSTRAINT FK_Commandes_Clients FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    CONSTRAINT FK_Commandes_Employes FOREIGN KEY (EmployeID) REFERENCES Employes(EmployeID)
);


-- Créer la  Table DetailsCommandes

CREATE TABLE DetailsCommandes (
    DetailID INT PRIMARY KEY IDENTITY(1,1),
    CommandeID INT,
    ProduitID INT,
    Quantite INT,
    PrixUnitaire DECIMAL(10,2),
    CONSTRAINT FK_Details_Commandes FOREIGN KEY (CommandeID) REFERENCES Commandes(CommandeID),
    CONSTRAINT FK_Details_Produits FOREIGN KEY (ProduitID) REFERENCES Produits(ProduitID)
);


-- Créer la  Table Paiements

CREATE TABLE Paiements (
    PaiementID INT PRIMARY KEY IDENTITY(1,1),
    CommandeID INT,
    DatePaiement DATE,
    Montant DECIMAL(10,2),
    ModePaiement NVARCHAR(50),
    StatutPaiement NVARCHAR(50),
    CONSTRAINT FK_Paiements_Commandes FOREIGN KEY (CommandeID) REFERENCES Commandes(CommandeID)
);



-- Charger  la  Table Categories

INSERT INTO Categories (NomCategorie, Description)
VALUES 
('Électronique', 'Appareils et accessoires électroniques'),
('Alimentation', 'Produits alimentaires et boissons'),
('Mode', 'Vêtements et accessoires'),
('Hygiène', 'Produits de soin et de beauté'),
('Maison', 'Articles pour la maison');



-- Charger  la  Table Produits 

INSERT INTO Produits (NomProduit, CategorieID, PrixUnitaire, Stock)
VALUES
('Smartphone Tecno Spark 10', 1, 95000, 40),
('Ordinateur HP Pavilion 14', 1, 320000, 15),
('Riz parfumé 25kg', 2, 15500, 120),
('Huile végétale 5L', 2, 8000, 60),
('Chemise en coton homme', 3, 12000, 75),
('Robe en pagne africain', 3, 18000, 45),
('Savon Karité 250g', 4, 1200, 150),
('Lotion hydratante Nivea', 4, 4500, 50),
('Ventilateur Binatone 16"', 5, 25000, 25),
('Bouteille de gaz 6kg', 5, 12000, 30);



-- Charger  la  Table Clients

INSERT INTO Clients (Nom, Prenom, Sexe, Email, Telephone, Ville, Pays, DateInscription)
VALUES
('GOSSA', 'René', 'M', 'rene.gossa@example.com', '+22961234567', 'Cotonou', 'Bénin', '2023-05-10'),
('ADJANON', 'Prisca', 'F', 'prisca.adjanon@example.com', '+22967220345', 'Porto-Novo', 'Bénin', '2023-08-15'),
('KOUASSI', 'Serge', 'M', 'serge.kouassi@example.com', '+22505098765', 'Abidjan', N'Côte d''Ivoire', '2024-01-12'),
('AGBO', 'Judith', 'F', 'judith.agbo@example.com', '+22890214578', 'Lomé', 'Togo', '2024-03-20'),
('AHOUANSOU', 'Fabrice', 'M', 'fabrice.ahouansou@example.com', '+22960222334', 'Parakou', 'Bénin', '2024-07-01');



-- Charger  la  Table Employes

INSERT INTO Employes (Nom, Prenom, Poste, DateEmbauche, Salaire, Departement)
VALUES
('HOUNTON', 'Patrick', 'Vendeur', '2022-01-10', 180000, 'Ventes'),
('ZINSOU', 'Christelle', 'Responsable Stock', '2021-11-22', 250000, 'Logistique'),
('DEGBE', 'Roland', 'Caissier', '2023-03-15', 160000, 'Comptabilité'),
('AKPAKI', 'Cynthia', 'Chargée Clientèle', '2023-09-01', 200000, 'Support'),
('AHISSOU', 'Joël', 'Manager Général', '2020-02-17', 400000, 'Direction');



-- Charger  la  Table Commandes

INSERT INTO Commandes (ClientID, EmployeID, DateCommande, Statut, MontantTotal)
VALUES
(1, 1, '2024-09-10', 'Livrée', 320000),
(2, 3, '2024-09-18', 'En attente', 15500),
(3, 4, '2024-10-05', 'Livrée', 24500),
(4, 2, '2024-11-02', 'Livrée', 37000),
(5, 1, '2024-12-15', 'Annulée', 18000);



-- Charger  la  Table DetailsCommandes

INSERT INTO DetailsCommandes (CommandeID, ProduitID, Quantite, PrixUnitaire)
VALUES
(1, 2, 1, 320000),
(2, 3, 1, 15500),
(3, 4, 2, 8000),
(3, 7, 2, 1250),
(4, 5, 2, 12000),
(4, 8, 1, 4500),
(5, 6, 1, 18000);



-- Charger  la  Table Paiements 

 INSERT INTO Paiements (CommandeID, DatePaiement, Montant, ModePaiement, StatutPaiement)
VALUES
(1, '2024-09-10', 320000, 'Mobile Money', 'Réussi'),
(2, '2024-09-19', 15500, 'Espèces', 'Réussi'),
(3, '2024-10-06', 24500, 'Carte bancaire', 'Réussi'),
(4, '2024-11-02', 37000, 'Mobile Money', 'Réussi'),
(5, '2024-12-15', 0, 'Aucun', 'Annulé');
