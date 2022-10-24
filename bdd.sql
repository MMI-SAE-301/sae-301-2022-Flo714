--
-- code pour la création des tables
--

CREATE TABLE Matériaux (
    ID_Matériaux uuid not null default uuid_generate_v4(), 
    libelle_Matériaux VARCHAR, 
    PRIMARY KEY (ID_Matériaux)
    )








--
-- code pour la création des vues
--




--
-- code pour la création des policies
--