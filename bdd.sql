--
-- code pour la création des tables
--

CREATE TABLE Materiaux (
    ID_Materiaux uuid not null default uuid_generate_v4(), 
    libelle_Materiaux VARCHAR, 
    PRIMARY KEY (ID_Materiaux)
    )

CREATE TABLE Montre (
    ID_Montre uuid not null default uuid_generate_v4(), 
    Bracelet_Montre VARCHAR, 
    Ecran_Montre VARCHAR, 
    Boutons_Montre VARCHAR, 
    Boitier_Montre VARCHAR, 
    id_materiaux uuid,
    commander boolean not null default false,
    id_utilisateurs uuid references auth.users not null default uid(), 
    FOREIGN KEY (id_materiaux) references materiaux(id_materiaux), 
    PRIMARY KEY (ID_Montre)
    )






--
-- code pour la création des vues
--




--
-- code pour la création des policies
--