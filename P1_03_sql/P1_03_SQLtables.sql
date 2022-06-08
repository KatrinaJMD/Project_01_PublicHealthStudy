#CREATE DATABASE sql_fao;
#USE sql_fao;


DROP TABLE IF EXISTS population;
DROP TABLE IF EXISTS dispo_alim;
DROP TABLE IF EXISTS equilibre_prod;
DROP TABLE IF EXISTS sous_nutrition;


-- population
CREATE TABLE population (
	pays VARCHAR(50) NOT NULL,
    code_pays INT NOT NULL,
    annee YEAR NOT NULL,
    population INT NOT NULL,
    
    PRIMARY KEY(code_pays)
);

-- dispo_alim
CREATE TABLE dispo_alim (
	pays VARCHAR(50) NOT NULL,
	code_pays INT NOT NULL,
	annee YEAR NOT NULL,
	produit VARCHAR(50) NOT NULL,
	code_produit INT NOT NULL,
	origine VARCHAR(10) NOT NULL,
	dispo_alim_tonnes FLOAT DEFAULT 0,
	dispo_alim_kcal_p_j FLOAT DEFAULT 0,
	dispo_prot FLOAT DEFAULT 0,
	dispo_mat_gr FLOAT DEFAULT 0,
    
    PRIMARY KEY(code_pays, code_produit)
);

-- equilibre_prod
CREATE TABLE equilibre_prod (
	pays VARCHAR(50) NOT NULL,
    code_pays INT NOT NULL,
    annee YEAR NOT NULL,
    produit VARCHAR(50) NOT NULL,
	code_produit INT NOT NULL,
    dispo_int FLOAT DEFAULT 0,
	animal_food FLOAT DEFAULT 0,
	semences FLOAT DEFAULT 0,
	pertes FLOAT DEFAULT 0,
	transfo FLOAT DEFAULT 0,
	nourriture FLOAT DEFAULT 0,
	other_uses FLOAT DEFAULT 0,
    
    PRIMARY KEY(code_pays, code_produit)
);

-- sous_nutrition
CREATE TABLE sous_nutrition (
	pays VARCHAR(50) NOT NULL,
    code_pays INT NOT NULL,
    annee YEAR NOT NULL,
    nb_personnes FLOAT DEFAULT 0,
    
    PRIMARY KEY(code_pays)
);