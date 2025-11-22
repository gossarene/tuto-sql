
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