CREATE TABLE Departements (
    DepartementID INT PRIMARY KEY IDENTITY(1,1),
    NomDepartement NVARCHAR(100)
);

CREATE TABLE Employes (
    EmployeID INT PRIMARY KEY IDENTITY(1,1),
    Nom NVARCHAR(100),
    Prenom NVARCHAR(100),
    Poste NVARCHAR(100),
    DateEmbauche DATE,
    Salaire DECIMAL(10,2),
    DepartementID INT,
    Pays NVARCHAR(100),
    ManagerID INT NULL
);



INSERT INTO Departements (NomDepartement)
VALUES
('Ventes'),
('Logistique'),
('Comptabilité'),
('Support'),
('Direction'),
('Commercial'),
('RH'),
('Sécurité'),
('Juridique');


INSERT INTO Employes (Nom, Prenom, Poste, DateEmbauche, Salaire, DepartementID, Pays, ManagerID)
VALUES
('HOUNTON', 'Patrick', 'Vendeur', '2022-01-10', 180000, 1, 'Bénin', 8),
('ZINSOU', 'Christelle', 'Responsable Stock', '2021-11-22', 250000, 2, 'Bénin', 5),
('DEGBE', 'Roland', 'Caissier', '2023-03-15', 160000, 3, 'Togo', 11),
('AKPAKI', 'Cynthia', 'Chargée Clientèle', '2023-09-01', 200000, 4, 'France', 12),
('AHISSOU', 'Joël', 'Manager Général', '2020-02-17', 400000, 5, 'Bénin', NULL),
('AGBEGNON', 'Claude', 'Responsable Commercial', '2020-02-17', 210000, 6, 'Togo', 5),
('OUEDRAOGO', 'Thomas', 'DRH', '2020-02-17', 210000, 7, 'Burkina-Faso', 5),
('NASSAR', 'Karim', null, '2021-04-05', 185000, 1, 'Bénin', 6),
('ALABI', 'Chantal', 'Assistante Commerciale', '2022-10-12', 150000, 6, 'Togo', 6),
('SOGLO', 'Thierry', 'Livreur', '2023-02-20', 120000, 32, 'Bénin', 2),
('KOUASSI', 'Jacques', 'Comptable', '2021-07-15', 230000, 3, 'Côte d''Ivoire', 5),
('BOKOU', 'Isabelle', 'Support Client', '2022-01-19', 170000, 54, 'Bénin', 4),
('FATON', 'Rodrigue', 'Chef entrepôt', null , 260000, 2, 'Bénin', 5),
('GBEMI', 'Donald', 'Analyste Vente', '2023-08-21', 300000, 500, 'Bénin', 5),
('SAMA', 'Elom', 'Caissier', '2023-11-11', 150000, 3, 'Togo', 3),
('N''CHO', 'Celine', 'Responsable RH', '2020-09-10', 350000, 7, 'Côte d''Ivoire', 5),
('ADEBAYO', 'Kehinde', 'Superviseur Boutique', '2021-12-03', 210000, 1, 'Nigeria', 8);
