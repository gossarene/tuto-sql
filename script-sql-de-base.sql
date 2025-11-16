
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
    Departement NVARCHAR(100),
    Pays NVARCHAR(100)
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
('Maison', 'Articles pour la maison'),
('Boissons', 'Sodas, eaux et jus'),
('Informatique', 'Accessoires informatiques'),
('Electroménager', 'Appareils de cuisine'),
('Téléphonie', 'Accessoires téléphoniques'),
('Sport', 'Equipements sportifs');



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
('Bouteille de gaz 6kg', 5, 12000, 30),
('Coca-Cola 1L', 6, 700, 200),
('Jus d''orange Don Simon 1L', 6, 1200, 150),
('Disque dur externe 1TB', 7, 45000, 40),
('Clavier Logitech K120', 7, 8500, 60),
('Mixeur Moulinex 700W', 8, 35000, 20),
('Friteuse électrique Philips', 8, 75000, 12),
('Coque iPhone 12 Silicone', 9, 3500, 100),
('Chargeur Tecno Original', 9, 5000, 90),
('Ballon Adidas Pro', 10, 18000, 50),
('Chaussures de sport Puma', 10, 42000, 35),
('TV Samsung 43"', 1, 245000, 10),
('Laptop Dell Inspiron 15', 1, 410000, 8),
('Parfum Dior Sauvage', 4, 95000, 25),
('Sac à main cuir', 3, 28000, 55),
('Tapis de prière luxe', 5, 15000, 70);



-- Charger  la  Table Clients

INSERT INTO Clients (Nom, Prenom, Sexe, Email, Telephone, Ville, Pays, DateInscription)
VALUES
('GOSSA', 'René', 'M', 'rene.gossa@example.com', '+22961234567', 'Cotonou', 'Bénin', '2023-05-10'),
('ADJANON', 'Prisca', 'F', 'prisca.adjanon@example.com', '+22967220345', 'Porto-Novo', 'Bénin', '2023-08-15'),
('KOUASSI', 'Serge', 'M', 'serge.kouassi@example.com', '+22505098765', 'Abidjan', N'Côte d''Ivoire', '2024-01-12'),
('AGBO', 'Judith', 'F', 'judith.agbo@example.com', '+22890214578', 'Lomé', 'Togo', '2024-03-20'),
('AHOUANSOU', 'Fabrice', 'M', 'fabrice.ahouansou@example.com', '+22960222334', 'Parakou', 'Bénin', '2024-07-01'),
('PHILIP', 'Jack', 'M', 'jack.philip@example.com', null, null, 'France', '2023-08-11'),
('SOW', 'Amina', 'F', 'amina.sow@example.com', '+221780112233', 'Dakar', 'Sénégal', '2024-02-10'),
('CISSE', 'Moussa', 'M', 'moussa.cisse@example.com', '+22395011223', 'Bamako', 'Mali', '2024-03-14'),
('KANTE', 'Ousmane', 'M', 'ousmane.kante@example.com', '+224620998877', 'Conakry', 'Guinée', '2023-11-18'),
('YARO', 'Clarisse', 'F', 'clarisse.yaro@example.com', '+22678002211', 'Ouagadougou', 'Burkina Faso', '2024-06-12'),
('AGBETE', 'Junior', 'M', 'junior.agbete@example.com', '+22890334455', 'Lomé', 'Togo', '2023-12-02'),
('HOUNTONDJI', 'Gloria', 'F', 'gloria.hountondji@example.com', '+22962001122', 'Cotonou', 'Bénin', '2024-01-08'),
('AFOUDA', 'Emmanuel', 'M', 'emmanuel.afouda@example.com', '+22966552233', 'Abomey-Calavi', 'Bénin', '2024-04-09'),
('KABORE', 'Salif', 'M', 'salif.kabore@example.com', '+22678009900', 'Ouagadougou', 'Burkina Faso', '2023-10-13'),
('DIALLO', 'Fatim', 'F', 'fatim.diallo@example.com', '+22177005522', 'Dakar', 'Sénégal', '2023-09-17'),
('AMADOU', 'Ismael', 'M', 'ismael.amadou@example.com', '+22788002211', 'Niamey', 'Niger', '2024-02-25'),
('OKPEITCHA', 'Rolande', 'F', 'rolande.okpeitcha@example.com', '+22966550022', 'Cotonou', 'Bénin', '2024-05-20'),
('GBAGUIDI', 'Ulrich', 'M', 'ulrich.gbaguidi@example.com', '+22995002233', 'Porto-Novo', 'Bénin', '2024-01-16'),
('ZINSOU', 'Leticia', 'F', 'leticia.zinsou@example.com', '+22961224433', 'Bohicon', 'Bénin', '2024-03-30'),
('NADJO', 'David', 'M', 'david.nadjo@example.com', '+22962003344', 'Parakou', 'Bénin', '2024-04-14'),
('KPANTENON', 'Joelle', 'F', 'joelle.kpantenon@example.com', '+22965007788', 'Ouidah', 'Bénin', '2024-05-02'),
('BARRO', 'Abdoulaye', 'M', 'abdoulaye.barro@example.com', '+22678003322', 'Bobo-Dioulasso', 'Burkina Faso', '2024-06-29'),
('SAGBO', 'Célestine', 'F', 'celestine.sagbo@example.com', '+22990012233', 'Allada', 'Bénin', '2024-07-12'),
('TCHALIM', 'Komi', 'M', 'komi.tchalim@example.com', '+22899887766', 'Kara', 'Togo', '2024-06-10'),
('SANNI', 'Rahim', 'M', 'rahim.sanni@example.com', '+22965557788', 'Natitingou', 'Bénin', '2024-08-01'),
('MIGNAN', 'Justine', 'F', 'justine.mignan@example.com', '+22960334455', 'Cotonou', 'Bénin', '2024-07-22');



-- Charger  la  Table Employes

INSERT INTO Employes (Nom, Prenom, Poste, DateEmbauche, Salaire, Departement, pays)
VALUES
('HOUNTON', 'Patrick', 'Vendeur', '2022-01-10', 180000, 'Ventes','Bénin'),
('ZINSOU', 'Christelle', 'Responsable Stock', '2021-11-22', 250000, 'Logistique','Bénin'),
('DEGBE', 'Roland', 'Caissier', '2023-03-15', 160000, 'Comptabilité','Togo'),
('AKPAKI', 'Cynthia', 'Chargée Clientèle', '2023-09-01', 200000, 'Support','France'),
('AHISSOU', 'Joël', 'Manager Général', '2020-02-17', 400000, 'Direction','Bénin'),
('AGBEGNON', 'Claude', 'Responsable commercial', '2020-02-17', 210000, 'Commercial','Togo'),
('OUEDRAOGO', 'Thomas', 'DRH', '2020-02-17', 210000, 'RH','Burkina-Faso'),
('NASSAR', 'Karim', 'Vendeur', '2021-04-05', 185000, 'Ventes', 'Bénin'),
('ALABI', 'Chantal', 'Assistante Commerciale', '2022-10-12', 150000, 'Commercial', 'Togo'),
('SOGLO', 'Thierry', 'Livreur', '2023-02-20', 120000, 'Logistique', 'Bénin'),
('KOUASSI', 'Jacques', 'Comptable', '2021-07-15', 230000, 'Comptabilité', 'Côte d''Ivoire'),
('BOKO', 'Isabelle', 'Support Client', '2022-01-19', 170000, 'Support', 'Bénin'),
('FATON', 'Rodrigue', 'Chef entrepôt', '2020-05-10', 260000, 'Logistique', 'Bénin'),
('GBEDJI', 'Donald', 'Analyste Vente', '2023-08-21', 300000, 'Direction', 'Bénin'),
('SAMA', 'Elom', 'Caissier', '2023-11-11', 150000, 'Comptabilité', 'Togo'),
('N’CHO', 'Celine', 'Responsable RH', '2020-09-10', 350000, 'RH', 'Côte d''Ivoire'),
('ADEBAYO', 'Kehinde', 'Superviseur Boutique', '2021-12-03', 210000, 'Ventes', 'Nigeria');



-- Charger  la  Table Commandes

INSERT INTO Commandes (ClientID, EmployeID, DateCommande, Statut, MontantTotal)
VALUES
(1, 1, '2024-09-10', 'Livrée', 320000),
(2, 3, '2024-09-18', 'En attente', 15500),
(3, 4, '2024-10-05', 'Livrée', 24500),
(4, 2, '2024-11-02', 'Livrée', 37000),
(5, 1, '2024-12-15', 'Annulée', 18000),
(6, 2, '2024-09-20', 'Livrée', 45000),
(7, 5, '2024-09-22', 'Livrée', 18000),
(8, 3, '2024-09-25', 'En attente', 65000),
(9, 1, '2024-10-01', 'Livrée', 24000),
(10, 8, '2024-10-04', 'Annulée', 0),
(11, 4, '2024-10-10', 'Livrée', 35000),
(12, 6, '2024-10-12', 'Livrée', 15000),
(13, 7, '2024-10-14', 'En attente', 29000),
(14, 2, '2024-10-16', 'Livrée', 57000),
(15, 9, '2024-10-19', 'Livrée', 47000),
(16, 1, '2024-10-22', 'Livrée', 28000),
(17, 3, '2024-10-25', 'Annulée', 0),
(18, 5, '2024-10-28', 'Livrée', 36000),
(19, 8, '2024-11-02', 'Livrée', 58000),
(20, 6, '2024-11-05', 'En attente', 12000),
(21, 4, '2024-11-07', 'Livrée', 32000),
(22, 7, '2024-11-10', 'Livrée', 49000),
(23, 1, '2024-11-12', 'En attente', 22000),
(24, 2, '2024-11-15', 'Livrée', 53000),
(25, 9, '2024-11-18', 'Livrée', 61000);



-- Charger  la  Table DetailsCommandes

INSERT INTO DetailsCommandes (CommandeID, ProduitID, Quantite, PrixUnitaire)
VALUES
(1, 2, 1, 320000),
(2, 3, 1, 15500),
(3, 4, 2, 8000),
(3, 7, 2, 1250),
(4, 5, 2, 12000),
(4, 8, 1, 4500),
(5, 6, 1, 18000),
(6, 3, 2, 15500),
(6, 7, 3, 1200),
(7, 6, 1, 18000),
(8, 10, 1, 12000),
(8, 1, 1, 95000),
(9, 9, 1, 25000),
(10, 8, 1, 4500),
(11, 2, 1, 320000),
(11, 7, 2, 1200),
(12, 3, 1, 15500),
(12, 14, 1, 28000),
(13, 5, 1, 12000),
(13, 4, 2, 8000),
(14, 11, 1, 245000),
(14, 6, 1, 18000),
(15, 15, 2, 15000),
(16, 12, 1, 410000),
(16, 8, 2, 4500),
(17, 5, 1, 12000),
(18, 13, 1, 95000),
(19, 9, 1, 25000),
(19, 3, 1, 15500),
(20, 10, 1, 12000),
(21, 7, 4, 1200),
(22, 14, 1, 28000),
(22, 8, 1, 4500),
(23, 6, 1, 18000),
(24, 1, 1, 95000),
(24, 3, 1, 15500),
(25, 11, 1, 245000),
(25, 5, 2, 12000);



-- Charger  la  Table Paiements 

 INSERT INTO Paiements (CommandeID, DatePaiement, Montant, ModePaiement, StatutPaiement)
VALUES
(1, '2024-09-10', 320000, 'Mobile Money', 'Réussi'),
(2, '2024-09-19', 15500, 'Espèces', 'Réussi'),
(3, '2024-10-06', 24500, 'Carte bancaire', 'Réussi'),
(4, '2024-11-02', 37000, 'Mobile Money', 'Réussi'),
(5, '2024-12-15', 0, 'Aucun', 'Annulé'),
(6, '2024-09-20', 45000, 'Mobile Money', 'Réussi'),
(7, '2024-09-22', 18000, 'Mobile Money', 'Réussi'),
(8, '2024-09-26', 65000, 'Carte bancaire', 'Réussi'),
(9, '2024-10-01', 24000, 'Espèces', 'Réussi'),
(11, '2024-10-10', 35000, 'Mobile Money', 'Réussi'),
(12, '2024-10-12', 15000, 'Carte bancaire', 'Réussi'),
(13, '2024-10-15', 29000, 'Mobile Money', 'Réussi'),
(14, '2024-10-16', 57000, 'Espèces', 'Réussi'),
(15, '2024-10-19', 47000, 'Mobile Money', 'Réussi'),
(16, '2024-10-22', 28000, 'Carte bancaire', 'Réussi'),
(18, '2024-10-28', 36000, 'Espèces', 'Réussi'),
(19, '2024-11-02', 58000, 'Mobile Money', 'Réussi'),
(21, '2024-11-07', 32000, 'Mobile Money', 'Réussi'),
(22, '2024-11-10', 49000, 'Carte bancaire', 'Réussi'),
(24, '2024-11-15', 53000, 'Espèces', 'Réussi'),
(25, '2024-11-18', 61000, 'Mobile Money', 'Réussi');
