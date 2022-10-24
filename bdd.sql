--
-- code pour la création des tables
--

CREATE TABLE Materiaux (
    ID_Materiaux uuid not null default uuid_generate_v4(), 
    libelle_Materiaux VARCHAR, 
    PRIMARY KEY (ID_Materiaux)
    )








--
-- code pour la création des vues
--




--
-- code pour la création des policies
--