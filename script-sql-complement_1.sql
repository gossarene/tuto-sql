/* =========================================================
   DATASET TUTO #8 - OPERATIONS D’ENSEMBLE SQL
   UNION / UNION ALL / INTERSECT / EXCEPT
   ========================================================= */

-- Nettoyage (optionnel)
IF OBJECT_ID('dbo.Ventes_Online', 'U') IS NOT NULL DROP TABLE dbo.Ventes_Online;
IF OBJECT_ID('dbo.Ventes_Magasin', 'U') IS NOT NULL DROP TABLE dbo.Ventes_Magasin;
IF OBJECT_ID('dbo.Produits', 'U') IS NOT NULL DROP TABLE dbo.Produits;
IF OBJECT_ID('dbo.Clients_Web', 'U') IS NOT NULL DROP TABLE dbo.Clients_Web;
IF OBJECT_ID('dbo.Clients_CRM', 'U') IS NOT NULL DROP TABLE dbo.Clients_CRM;
 

------------------------------------------------------------
-- 1) CLIENTS CRM
------------------------------------------------------------
CREATE TABLE dbo.Clients_CRM (
    ClientID_CRM INT IDENTITY(1,1) PRIMARY KEY,
    Email NVARCHAR(255) NOT NULL,
    NomComplet NVARCHAR(150) NOT NULL,
    Pays NVARCHAR(100) NOT NULL,
    Ville NVARCHAR(100) NOT NULL,
    DateCreation DATE NOT NULL,
    Segment NVARCHAR(50) NOT NULL
);

INSERT INTO dbo.Clients_CRM (Email, NomComplet, Pays, Ville, DateCreation, Segment)
VALUES
('patrick.hounton@demo.com', 'Patrick HOUNTON', 'Bénin', 'Cotonou', '2024-01-10', 'Pro'),
('christelle.zinsou@demo.com', 'Christelle ZINSOU', 'Bénin', 'Porto-Novo', '2024-02-18', 'Pro'),
('roland.degbe@demo.com', 'Roland DEGBE', 'Togo', 'Lomé', '2024-03-05', 'Particulier'),
('cynthia.akpaki@demo.com', 'Cynthia AKPAKI', 'France', 'Paris', '2024-04-11', 'Particulier'),
('joel.ahissou@demo.com', 'Joël AHISSOU', 'Bénin', 'Abomey-Calavi', '2023-12-02', 'Pro'),
('claude.agbegnon@demo.com', 'Claude AGBEGNON', 'Togo', 'Lomé', '2024-01-22', 'Pro'),
('thomas.ouedraogo@demo.com', 'Thomas OUEDRAOGO', 'Burkina-Faso', 'Ouagadougou', '2024-02-01', 'Pro'),
('karim.nassar@demo.com', 'Karim NASSAR', 'Bénin', 'Cotonou', '2024-05-09', 'Particulier'),
('chantal.alabi@demo.com', 'Chantal ALABI', 'Togo', 'Kara', '2024-06-01', 'Particulier'),
('jacques.kouassi@demo.com', 'Jacques KOUASSI', 'Côte d''Ivoire', 'Abidjan', '2024-06-18', 'Pro'),
('isabelle.boko@demo.com', 'Isabelle BOKO', 'Bénin', 'Cotonou', '2024-07-12', 'Particulier'),
('celine.ncho@demo.com', 'Céline N''CHO', 'Côte d''Ivoire', 'Abidjan', '2024-08-03', 'Pro'),
('kehinde.adebayo@demo.com', 'Kehinde ADEBAYO', 'Nigeria', 'Lagos', '2024-08-15', 'Pro');

------------------------------------------------------------
-- 2) CLIENTS WEB
------------------------------------------------------------
CREATE TABLE dbo.Clients_Web (
    ClientID_Web INT IDENTITY(1,1) PRIMARY KEY,
    Email NVARCHAR(255) NOT NULL,
    NomComplet NVARCHAR(150) NOT NULL,
    Pays NVARCHAR(100) NOT NULL,
    Ville NVARCHAR(100) NOT NULL,
    DateInscription DATE NOT NULL,
    SourceAcquisition NVARCHAR(50) NOT NULL
);

INSERT INTO dbo.Clients_Web (Email, NomComplet, Pays, Ville, DateInscription, SourceAcquisition)
VALUES
('patrick.hounton@demo.com', 'Patrick HOUNTON', 'Bénin', 'Cotonou', '2024-09-01', 'Referral'),
('roland.degbe@demo.com', 'Roland DEGBE', 'Togo', 'Lomé', '2024-09-03', 'Organic'),
('karim.nassar@demo.com', 'Karim NASSAR', 'Bénin', 'Cotonou', '2024-09-04', 'Ads'),
('jacques.kouassi@demo.com', 'Jacques KOUASSI', 'Côte d''Ivoire', 'Abidjan', '2024-09-06', 'Referral'),
('isabelle.boko@demo.com', 'Isabelle BOKO', 'Bénin', 'Cotonou', '2024-09-08', 'Organic'),
('celine.ncho@demo.com', 'Céline N''CHO', 'Côte d''Ivoire', 'Abidjan', '2024-09-10', 'Ads'),
('arnaud.koffi@demo.com', 'Arnaud KOFFI', 'Côte d''Ivoire', 'Abidjan', '2024-09-02', 'Organic'),
('mariam.tchalla@demo.com', 'Mariam TCHALLA', 'Togo', 'Lomé', '2024-09-05', 'Ads'),
('fatou.diop@demo.com', 'Fatou DIOP', 'Sénégal', 'Dakar', '2024-09-07', 'Referral'),
('serge.hounkpe@demo.com', 'Serge HOUNKPE', 'Bénin', 'Parakou', '2024-09-09', 'Organic'),
('aicha.traore@demo.com', 'Aïcha TRAORE', 'Mali', 'Bamako', '2024-09-11', 'Ads');

------------------------------------------------------------
-- 3) PRODUITS
------------------------------------------------------------
CREATE TABLE dbo.Produits (
    ProduitID INT IDENTITY(1,1) PRIMARY KEY,
    SKU NVARCHAR(30) NOT NULL UNIQUE,
    NomProduit NVARCHAR(150) NOT NULL,
    Categorie NVARCHAR(80) NOT NULL,
    PrixUnitaire DECIMAL(12,2) NOT NULL
);

INSERT INTO dbo.Produits (SKU, NomProduit, Categorie, PrixUnitaire)
VALUES
('BI-001', 'Formation Power BI - Fondamentaux', 'Formation', 59000),
('BI-002', 'Formation Power BI - Modélisation', 'Formation', 79000),
('SQL-001', 'Formation SQL - Débutant', 'Formation', 49000),
('SQL-002', 'Formation SQL - Avancé', 'Formation', 69000),
('FAB-001', 'Formation Microsoft Fabric - Starter', 'Formation', 89000),
('COACH-01', 'Coaching 1h (Data/BI)', 'Coaching', 25000),
('COACH-05', 'Coaching Pack 5h', 'Coaching', 110000),
('TEMP-001', 'Template Dashboard Finance', 'Template', 15000),
('TEMP-002', 'Template Dashboard Sales', 'Template', 15000),
('EXTRA-001', 'Ebook: Modèle en étoile', 'Ressource', 8000);


------------------------------------------------------------
-- 4) VENTES MAGASIN (terrain) 
------------------------------------------------------------
CREATE TABLE dbo.Ventes_Magasin (
    VenteID INT IDENTITY(1,1) PRIMARY KEY,
    DateVente DATE NOT NULL,
    EmailClient NVARCHAR(255) NOT NULL,
    ProduitID INT NOT NULL,
    Quantite INT NOT NULL,
    PrixUnitaire DECIMAL(12,2) NOT NULL,
    Magasin NVARCHAR(80) NOT NULL, -- Cotonou / Lomé / Abidjan
    FOREIGN KEY (ProduitID) REFERENCES dbo.Produits(ProduitID)
);

INSERT INTO dbo.Ventes_Magasin (DateVente, EmailClient, ProduitID, Quantite, PrixUnitaire, Magasin)
VALUES
('2024-09-12', 'patrick.hounton@auvider-demo.com', 1, 1, 59000, 'Cotonou'),
('2024-09-12', 'christelle.zinsou@auvider-demo.com', 2, 1, 79000, 'Porto-Novo'),
('2024-09-13', 'roland.degbe@auvider-demo.com', 6, 1, 25000, 'Lomé'),
('2024-09-13', 'claude.agbegnon@auvider-demo.com', 7, 1, 110000, 'Lomé'),
('2024-09-14', 'karim.nassar@auvider-demo.com', 3, 1, 49000, 'Cotonou'),
('2024-09-14', 'jacques.kouassi@auvider-demo.com', 5, 1, 89000, 'Abidjan'),
('2024-09-15', 'isabelle.boko@auvider-demo.com', 6, 2, 25000, 'Cotonou'),
('2024-09-16', 'celine.ncho@auvider-demo.com', 2, 1, 79000, 'Abidjan'),
('2024-09-16', 'kehinde.adebayo@auvider-demo.com', 4, 1, 69000, 'Lomé');

------------------------------------------------------------
-- 5) VENTES ONLINE (web/app) 
------------------------------------------------------------
CREATE TABLE dbo.Ventes_Online (
    CommandeID INT IDENTITY(1,1) PRIMARY KEY,
    DateCommande DATE NOT NULL,
    EmailClient NVARCHAR(255) NOT NULL,
    ProduitID INT NOT NULL,
    Quantite INT NOT NULL,
    PrixUnitaire DECIMAL(12,2) NOT NULL,
    Canal NVARCHAR(30) NOT NULL, -- Web / Mobile
    FOREIGN KEY (ProduitID) REFERENCES dbo.Produits(ProduitID)
);

INSERT INTO dbo.Ventes_Online (DateCommande, EmailClient, ProduitID, Quantite, PrixUnitaire, Canal)
VALUES
('2024-09-17', 'patrick.hounton@auvider-demo.com', 6, 1, 25000, 'Web'),
('2024-09-17', 'arnaud.koffi@auvider-demo.com', 3, 1, 49000, 'Mobile'),
('2024-09-18', 'mariam.tchalla@auvider-demo.com', 1, 1, 59000, 'Web'),
('2024-09-18', 'fatou.diop@auvider-demo.com', 8, 1, 15000, 'Mobile'),
('2024-09-19', 'serge.hounkpe@auvider-demo.com', 6, 1, 25000, 'Web'),
('2024-09-19', 'aicha.traore@auvider-demo.com', 10, 1, 8000, 'Web'),
('2024-09-20', 'isabelle.boko@auvider-demo.com', 7, 1, 110000, 'Mobile'),
('2024-09-20', 'roland.degbe@auvider-demo.com', 9, 1, 15000, 'Web'),
('2024-09-21', 'jacques.kouassi@auvider-demo.com', 6, 1, 25000, 'Mobile');



