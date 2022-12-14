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

CREATE VIEW allMateriaux as
SELECT *
FROM "materiaux";

CREATE View allCuir as
select "montre"
from "materiaux","montre"
where"materiaux".id_materiaux = "montre".id_materiaux
and "materiaux"."libelle_materiaux" = 'Cuir'

CREATE View allCaoutchouc as
select "montre"
from "materiaux","montre"
where"materiaux".id_materiaux = "montre".id_materiaux
and "materiaux"."libelle_materiaux" = 'Caoutchouc'

CREATE View allCarbone as
select "montre"
from "materiaux","montre"
where"materiaux".id_materiaux = "montre".id_materiaux
and "materiaux"."libelle_materiaux" = 'Carbone'



--
-- code pour la création des policies
--

CREATE POLICY "Voir toutes les montres"
ON public.montre
FOR SELECT USING (
  (uid() = id_utilisateurs)
);

CREATE POLICY "Les personnes authentifier peuvent INSERT"
ON public.montre
FOR INSERT 
TO authenticated 
WITH CHECK (true);

CREATE POLICY "Enable delete for users based on user_id" ON "public"."montre"
AS PERMISSIVE FOR DELETE
TO public
USING (auth.uid() = id_utilisateurs )

CREATE POLICY "Les gens peuvent modifier"
ON public.montre
FOR UPDATE USING(
    (uid() = id_utilisateurs) AND (commander = false))

