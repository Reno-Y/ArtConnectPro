-- ============================================================
--  ArtConnectPro — Schéma MySQL
--  Généré d'après les modèles Java du dépôt Reno-Y/ArtConnectPro
--  Base cible : artconnect_db  (MySQL 8+)
-- ============================================================

CREATE DATABASE IF NOT EXISTS artconnect_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE artconnect_db;

-- ------------------------------------------------------------
-- 1. DISCIPLINE
--    Table de référence partagée par Artist et CommunityMember
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS discipline (
    id   INT          NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

-- ------------------------------------------------------------
-- 2. ARTIST
--    Clé naturelle : name (utilisée dans les DAO du projet)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS artist (
    name         VARCHAR(150) NOT NULL,
    bio          TEXT,
    birth_year   INT,
    contact_email VARCHAR(255),
    phone        VARCHAR(30),
    city         VARCHAR(100),
    website      VARCHAR(255),
    social_media VARCHAR(255),
    is_active    TINYINT(1)   NOT NULL DEFAULT 1,
    PRIMARY KEY (name)
);

-- Association Artist <-> Discipline  (many-to-many)
CREATE TABLE IF NOT EXISTS artist_discipline (
    artist_name    VARCHAR(150) NOT NULL,
    discipline_id  INT          NOT NULL,
    PRIMARY KEY (artist_name, discipline_id),
    CONSTRAINT fk_ad_artist     FOREIGN KEY (artist_name)   REFERENCES artist(name)     ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_ad_discipline FOREIGN KEY (discipline_id) REFERENCES discipline(id)   ON DELETE CASCADE
);

-- ------------------------------------------------------------
-- 3. ARTWORK
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS artwork (
    id            INT            NOT NULL AUTO_INCREMENT,
    title         VARCHAR(255)   NOT NULL,
    creation_year INT,
    type          VARCHAR(100),                          -- painting, sculpture, …
    medium        VARCHAR(100),                          -- oil, watercolor, …
    dimensions    VARCHAR(100),
    description   TEXT,
    price         DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    status        ENUM('FOR_SALE', 'SOLD', 'EXHIBITED') NOT NULL DEFAULT 'FOR_SALE',
    artist_name   VARCHAR(150)   NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_artwork_artist FOREIGN KEY (artist_name) REFERENCES artist(name) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tags associés à une œuvre
CREATE TABLE IF NOT EXISTS artwork_tag (
    id         INT          NOT NULL AUTO_INCREMENT,
    artwork_id INT          NOT NULL,
    name       VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_tag_artwork FOREIGN KEY (artwork_id) REFERENCES artwork(id) ON DELETE CASCADE
);

-- ------------------------------------------------------------
-- 4. GALLERY
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS gallery (
    id            INT            NOT NULL AUTO_INCREMENT,
    name          VARCHAR(255)   NOT NULL UNIQUE,
    address       VARCHAR(500),
    owner_name    VARCHAR(150),
    opening_hours VARCHAR(255),
    contact_phone VARCHAR(30),
    rating        DECIMAL(3, 2)  DEFAULT 0.00,
    website       VARCHAR(255),
    PRIMARY KEY (id)
);

-- ------------------------------------------------------------
-- 5. EXHIBITION
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS exhibition (
    id            INT          NOT NULL AUTO_INCREMENT,
    title         VARCHAR(255) NOT NULL,
    start_date    DATE,
    end_date      DATE,
    description   TEXT,
    gallery_id    INT          NOT NULL,
    curator_name  VARCHAR(150),
    theme         VARCHAR(255),
    PRIMARY KEY (id),
    CONSTRAINT fk_exhibition_gallery FOREIGN KEY (gallery_id) REFERENCES gallery(id) ON DELETE CASCADE
);

-- Œuvres présentées dans une exposition  (many-to-many)
CREATE TABLE IF NOT EXISTS exhibition_artwork (
    exhibition_id INT NOT NULL,
    artwork_id    INT NOT NULL,
    PRIMARY KEY (exhibition_id, artwork_id),
    CONSTRAINT fk_ea_exhibition FOREIGN KEY (exhibition_id) REFERENCES exhibition(id) ON DELETE CASCADE,
    CONSTRAINT fk_ea_artwork    FOREIGN KEY (artwork_id)    REFERENCES artwork(id)    ON DELETE CASCADE
);

-- ------------------------------------------------------------
-- 6. COMMUNITY_MEMBER
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS community_member (
    id              INT          NOT NULL AUTO_INCREMENT,
    name            VARCHAR(150) NOT NULL,
    email           VARCHAR(255) NOT NULL UNIQUE,
    birth_year      INT,
    phone           VARCHAR(30),
    city            VARCHAR(100),
    membership_type ENUM('free', 'premium') NOT NULL DEFAULT 'free',
    PRIMARY KEY (id)
);

-- Disciplines favorites d'un membre  (many-to-many)
CREATE TABLE IF NOT EXISTS member_discipline (
    member_id     INT NOT NULL,
    discipline_id INT NOT NULL,
    PRIMARY KEY (member_id, discipline_id),
    CONSTRAINT fk_md_member     FOREIGN KEY (member_id)    REFERENCES community_member(id) ON DELETE CASCADE,
    CONSTRAINT fk_md_discipline FOREIGN KEY (discipline_id) REFERENCES discipline(id)      ON DELETE CASCADE
);

-- ------------------------------------------------------------
-- 7. WORKSHOP
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS workshop (
    id               INT            NOT NULL AUTO_INCREMENT,
    title            VARCHAR(255)   NOT NULL,
    date             DATETIME       NOT NULL,
    duration_minutes INT            NOT NULL DEFAULT 60,
    max_participants INT            NOT NULL DEFAULT 10,
    price            DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    artist_name      VARCHAR(150)   NOT NULL,
    location         VARCHAR(255),
    description      TEXT,
    level            ENUM('beginner', 'intermediate', 'advanced'),
    PRIMARY KEY (id),
    CONSTRAINT fk_workshop_artist FOREIGN KEY (artist_name) REFERENCES artist(name) ON DELETE CASCADE ON UPDATE CASCADE
);

-- ------------------------------------------------------------
-- 8. BOOKING
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS booking (
    id             INT          NOT NULL AUTO_INCREMENT,
    workshop_id    INT          NOT NULL,
    member_id      INT          NOT NULL,
    booking_date   DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    payment_status ENUM('PENDING', 'PAID', 'CANCELLED') NOT NULL DEFAULT 'PENDING',
    PRIMARY KEY (id),
    CONSTRAINT fk_booking_workshop FOREIGN KEY (workshop_id) REFERENCES workshop(id)         ON DELETE CASCADE,
    CONSTRAINT fk_booking_member   FOREIGN KEY (member_id)   REFERENCES community_member(id) ON DELETE CASCADE
);

-- ------------------------------------------------------------
-- 9. REVIEW
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS review (
    id          INT  NOT NULL AUTO_INCREMENT,
    member_id   INT  NOT NULL,
    artwork_id  INT  NOT NULL,
    rating      TINYINT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment     TEXT,
    review_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    PRIMARY KEY (id),
    CONSTRAINT fk_review_member  FOREIGN KEY (member_id)  REFERENCES community_member(id) ON DELETE CASCADE,
    CONSTRAINT fk_review_artwork FOREIGN KEY (artwork_id) REFERENCES artwork(id)          ON DELETE CASCADE
);

-- ============================================================
--  DONNÉES D'EXEMPLE
-- ============================================================

INSERT INTO discipline (name) VALUES
    ('Peinture'),
    ('Sculpture'),
    ('Photographie'),
    ('Dessin'),
    ('Céramique'),
    ('Gravure'),
    ('Art numérique');

INSERT INTO artist (name, bio, birth_year, contact_email, phone, city, website, is_active) VALUES
    ('Sophie Marceau', 'Peintre expressionniste basée à Paris.', 1985, 'sophie@artmail.fr', '0601020304', 'Paris', 'https://sophiemarceau.art', 1),
    ('Lucas Renard', 'Sculpteur spécialisé dans les matériaux recyclés.', 1978, 'lucas@studio.fr', '0612345678', 'Lyon', NULL, 1),
    ('Amina Diallo', 'Photographe documentaire et art urbain.', 1992, 'amina.diallo@photo.fr', NULL, 'Bordeaux', 'https://aminadiallo.com', 1);

INSERT INTO artist_discipline (artist_name, discipline_id) VALUES
    ('Sophie Marceau', 1),   -- Peinture
    ('Sophie Marceau', 4),   -- Dessin
    ('Lucas Renard',   2),   -- Sculpture
    ('Lucas Renard',   5),   -- Céramique
    ('Amina Diallo',   3);   -- Photographie

INSERT INTO artwork (title, creation_year, type, medium, dimensions, description, price, status, artist_name) VALUES
    ('Lumière d''automne',    2022, 'Peinture',    'Huile sur toile',   '80x60 cm',  'Paysage automnal en forêt.',    1200.00, 'FOR_SALE', 'Sophie Marceau'),
    ('Reflets urbains',       2023, 'Peinture',    'Acrylique',         '100x80 cm', 'Série sur les reflets en ville.', 950.00, 'EXHIBITED','Sophie Marceau'),
    ('L''Écho du métal',      2021, 'Sculpture',   'Acier recyclé',     '40x30x30 cm','Structure géométrique.',       3500.00, 'FOR_SALE', 'Lucas Renard'),
    ('Vague de terre',        2020, 'Céramique',   'Grès',              '25x15 cm',  'Forme organique inspirée de la nature.', 450.00, 'SOLD', 'Lucas Renard'),
    ('Regards de Chartrons',  2023, 'Photographie','Tirage argentique',  '50x70 cm', 'Quartier des Chartrons, Bordeaux.', 600.00, 'FOR_SALE', 'Amina Diallo');

INSERT INTO artwork_tag (artwork_id, name) VALUES
    (1, 'nature'), (1, 'automne'),
    (2, 'urbain'), (2, 'lumière'),
    (3, 'métal'),  (3, 'géométrique'),
    (4, 'céramique'), (4, 'organique'),
    (5, 'photographie'), (5, 'bordeaux');

INSERT INTO gallery (name, address, owner_name, opening_hours, contact_phone, rating, website) VALUES
    ('Galerie du Marais', '12 rue des Archives, 75004 Paris', 'Claire Dupont', 'Mar-Dim 11h-19h', '0142000000', 4.50, 'https://galeriedumerais.fr'),
    ('Espace Confluences', '10 place Nautique, 69009 Lyon',   'Marc Girard',   'Mer-Lun 10h-18h', '0478000000', 4.20, NULL);

INSERT INTO exhibition (title, start_date, end_date, description, gallery_id, curator_name, theme) VALUES
    ('Lumières de la ville', '2025-03-01', '2025-04-30', 'Œuvres sur la lumière urbaine.', 1, 'Claire Dupont', 'Lumière'),
    ('Matières vivantes',    '2025-05-15', '2025-07-15', 'Sculpture et céramique contemporaines.', 2, 'Marc Girard', 'Matière');

INSERT INTO exhibition_artwork (exhibition_id, artwork_id) VALUES
    (1, 2),   -- Reflets urbains -> Lumières de la ville
    (2, 3),   -- L'Écho du métal -> Matières vivantes
    (2, 4);   -- Vague de terre  -> Matières vivantes

INSERT INTO community_member (name, email, birth_year, phone, city, membership_type) VALUES
    ('Jean Lefebvre',  'jean.lefebvre@mail.fr',  1990, '0623456789', 'Paris',    'premium'),
    ('Marie Nguyen',   'marie.nguyen@mail.fr',   1995, NULL,         'Lyon',     'free'),
    ('Antoine Barre',  'antoine.barre@mail.fr',  1988, '0698765432', 'Bordeaux', 'free');

INSERT INTO member_discipline (member_id, discipline_id) VALUES
    (1, 1), (1, 3),   -- Jean aime Peinture + Photographie
    (2, 2), (2, 5),   -- Marie aime Sculpture + Céramique
    (3, 3);            -- Antoine aime Photographie

INSERT INTO workshop (title, date, duration_minutes, max_participants, price, artist_name, location, description, level) VALUES
    ('Initiation aquarelle',     '2025-06-10 14:00:00', 120, 8,  45.00, 'Sophie Marceau', 'Paris 11e',  'Bases de l''aquarelle pour débutants.',          'beginner'),
    ('Sculpture sur métal',      '2025-07-05 10:00:00', 180, 6, 120.00, 'Lucas Renard',   'Lyon 9e',    'Travail de l''acier recyclé en atelier.',         'intermediate'),
    ('Portrait photographique',  '2025-06-20 09:00:00', 240, 10, 80.00, 'Amina Diallo',   'Bordeaux',   'Techniques du portrait en lumière naturelle.', 'beginner');

INSERT INTO booking (workshop_id, member_id, booking_date, payment_status) VALUES
    (1, 1, '2025-05-20 10:30:00', 'PAID'),
    (1, 2, '2025-05-21 14:00:00', 'PENDING'),
    (2, 1, '2025-05-22 09:15:00', 'PAID'),
    (3, 3, '2025-05-23 11:00:00', 'CANCELLED');

INSERT INTO review (member_id, artwork_id, rating, comment, review_date) VALUES
    (1, 1, 5, 'Magnifique jeu de lumières, très émouvant.',       '2025-04-15'),
    (2, 3, 4, 'Belle maîtrise de la structure géométrique.',       '2025-04-20'),
    (3, 5, 5, 'Une photo qui capture parfaitement l''ambiance.',   '2025-04-25'),
    (1, 2, 4, 'Très bel usage des reflets dans la série urbaine.', '2025-05-01');
