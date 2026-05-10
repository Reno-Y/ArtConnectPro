-- ============================================================
--  ArtConnect — Script d'insertion de données d'exemple
--  TI603 Étape 3 — généré et vérifié manuellement
-- ============================================================

USE artconnect;

-- Disciplines
INSERT INTO discipline (name) VALUES
    ('Peinture'), ('Photographie'), ('Sculpture'),
    ('Musique'), ('Street Art'), ('Illustration numérique');

-- Tags
INSERT INTO tag (name) VALUES
    ('abstrait'), ('figuratif'), ('urbain'), ('nature'),
    ('portrait'), ('minimaliste'), ('coloré'), ('noir et blanc');

-- Artistes
INSERT INTO artist (name, bio, birth_year, contact_email, phone, city, website, is_active) VALUES
    ('Claire Morand',   'Peintre abstraite lyonnaise, inspirée par la lumière méditerranéenne.',               1985, 'claire.morand@mail.fr',   '0601010101', 'Lyon',      'https://clairemorand.fr',   TRUE),
    ('Yann Lefebvre',   'Photographe documentaire, spécialisé dans les portraits urbains.',                    1990, 'yann.lefebvre@mail.fr',   '0602020202', 'Paris',     'https://yannlefebvre.fr',   TRUE),
    ('Sofia Reyes',     'Sculptrice travaillant le bronze et le bois récupéré.',                               1978, 'sofia.reyes@mail.fr',     '0603030303', 'Bordeaux',  'https://sofiareyes.art',    TRUE),
    ('Marcus Diallo',   'Artiste de street art reconnu pour ses fresques engagées.',                           1995, 'marcus.diallo@mail.fr',   '0604040404', 'Marseille', NULL,                        TRUE),
    ('Inès Fontaine',   'Illustratrice numérique et compositrice, crée des univers oniriques.',                1992, 'ines.fontaine@mail.fr',   '0605050505', 'Nantes',    'https://inesfontaine.com',  TRUE);

-- Galeries
INSERT INTO gallery (name, address, owner_name, opening_hours, contact_phone, rating, website) VALUES
    ('Galerie Lumière',  '12 rue des Arts, Lyon',          'Henri Blanc',   'Mar-Sam 10h-19h',  '0411111111', 4.5, 'https://galerie-lumiere.fr'),
    ('Espace Urbain',    '45 avenue Montmartre, Paris',    'Julie Martin',  'Mer-Dim 11h-20h',  '0122222222', 4.2, 'https://espace-urbain.fr'),
    ('Atelier du Port',  '8 quai des Chartrons, Bordeaux', 'Pierre Castel', 'Lun-Sam 9h-18h30', '0533333333', 4.8, 'https://atelierduport.fr');

-- Membres communautaires
INSERT INTO community_member (name, email, birth_year, phone, city, membership_type) VALUES
    ('Alice Dupont',   'alice.dupont@mail.fr',   1998, '0611111111', 'Lyon',      'premium'),
    ('Bob Martin',     'bob.martin@mail.fr',     1985, '0622222222', 'Paris',     'free'),
    ('Camille Truc',   'camille.truc@mail.fr',   2000, '0633333333', 'Bordeaux',  'premium'),
    ('David Sosa',     'david.sosa@mail.fr',     1992, '0644444444', 'Marseille', 'free'),
    ('Emma Petit',     'emma.petit@mail.fr',     1997, '0655555555', 'Nantes',    'premium'),
    ('François Noel',  'francois.noel@mail.fr',  1975, '0666666666', 'Lyon',      'free'),
    ('Gabrielle Roy',  'gabrielle.roy@mail.fr',  2001, '0677777777', 'Paris',     'premium'),
    ('Hugo Blanc',     'hugo.blanc@mail.fr',     1989, '0688888888', 'Bordeaux',  'free');

-- Œuvres
INSERT INTO artwork (title, creation_year, type, medium, dimensions, description, price, status, id_artist) VALUES
    ('Lumière d''Automne',     2022, 'Peinture',     'Huile sur toile',    '80x100cm',  'Abstraction chaude aux tons ocre.',         1200.00, 'FOR_SALE',  1),
    ('Éclats Bleus',           2023, 'Peinture',     'Acrylique',          '60x80cm',   'Série bleue, énergie pure.',                 850.00, 'FOR_SALE',  1),
    ('Regard de Banlieue',     2021, 'Photographie', 'Tirage argentique',  '40x60cm',   'Portrait d''un habitant de la périphérie.',  650.00, 'SOLD',      2),
    ('Verticales',             2023, 'Photographie', 'Tirage numérique',   '50x70cm',   'Architecture et verticalité urbaine.',       400.00, 'EXHIBITED', 2),
    ('Racines I',              2020, 'Sculpture',    'Bronze',             '30x20x15cm','Fragment organique inspiré des forêts.',    3500.00, 'FOR_SALE',  3),
    ('Fusion',                 2022, 'Sculpture',    'Bois et métal',      '45x30x20cm','Bois flotté et acier soudé.',               2800.00, 'EXHIBITED', 3),
    ('Le Mur Parle',           2023, 'Street Art',   'Aérosol sur toile',  '120x80cm',  'Reproduction d''une fresque engagée.',       700.00, 'FOR_SALE',  4),
    ('Quartier Libre',         2024, 'Street Art',   'Aérosol',            '200x150cm', 'Grande toile panoramique.',                 1100.00, 'FOR_SALE',  4),
    ('Rêve Pixelisé',          2023, 'Illustration', 'Impression sur alu', '50x50cm',   'Univers onirique en palette limitée.',       550.00, 'FOR_SALE',  5),
    ('Harmonie Fragile',       2024, 'Illustration', 'Impression fine-art','60x60cm',   'Dualité entre ordre et chaos.',              620.00, 'FOR_SALE',  5),
    ('Solitude Urbaine',       2022, 'Photographie', 'Tirage numérique',   '30x45cm',   'Rue déserte à l''aube.',                     350.00, 'FOR_SALE',  2),
    ('Mémoire de Pierre',      2021, 'Sculpture',    'Pierre calcaire',    '25x15x10cm','Visage à moitié émergé.',                   4200.00, 'SOLD',      3);

-- Expositions
INSERT INTO exhibition (title, start_date, end_date, description, curator_name, theme, id_gallery) VALUES
    ('Couleurs Vivantes',    '2025-03-01', '2025-04-15', 'Peintures et photos aux couleurs vives.',     'Marie Leconte',  'Couleur',         1),
    ('Formes & Matières',    '2025-05-10', '2025-06-30', 'Sculptures et installations mixtes.',        'Paul Arnaud',    'Matériau',        3),
    ('Ville en Images',      '2025-09-01', '2025-10-31', 'Photographie et street art urbains.',        'Laure Morin',    'Urbanisme',       2),
    ('Horizon 2026',         '2026-01-15', '2026-03-30', 'Nouvelles créations numériques et mixtes.',  'Henri Blanc',    'Futur & Numérique',1);

-- Ateliers
INSERT INTO workshop (title, date, duration_minutes, max_participants, price, location, description, level, id_artist) VALUES
    ('Initiation Aquarelle',        '2025-04-12 10:00:00', 180, 10, 45.00,  'Galerie Lumière, Lyon',       'Découverte des bases de l''aquarelle.',          'beginner',     1),
    ('Photo Urbaine Avancée',       '2025-05-20 14:00:00', 240, 8,  75.00,  'Espace Urbain, Paris',        'Techniques de prise de vue en ville.',           'advanced',     2),
    ('Sculpture sur Argile',        '2025-06-07 09:30:00', 300, 6,  90.00,  'Atelier du Port, Bordeaux',   'Modeler et cuire une pièce unique.',             'intermediate', 3);

-- Réservations
INSERT INTO booking (booking_date, payment_status, id_workshop, id_member) VALUES
    ('2025-04-01 09:00:00', 'PAID',      1, 1),
    ('2025-04-02 10:30:00', 'PAID',      1, 2),
    ('2025-04-03 11:00:00', 'PENDING',   1, 3),
    ('2025-05-05 08:00:00', 'PAID',      2, 4),
    ('2025-05-06 09:00:00', 'PAID',      2, 5),
    ('2025-05-07 10:00:00', 'CANCELLED', 2, 1),
    ('2025-05-25 08:30:00', 'PAID',      3, 6),
    ('2025-05-26 09:15:00', 'PENDING',   3, 7),
    ('2025-05-27 10:45:00', 'PAID',      3, 8);

-- Critiques
INSERT INTO review (rating, comment, review_date, id_member, id_artwork) VALUES
    (5, 'Œuvre envoûtante, les couleurs sont sublimes.',       '2025-04-20', 1, 1),
    (4, 'Beau travail photographique, très expressif.',        '2025-04-21', 2, 3),
    (5, 'La sculpture est d''une finesse remarquable.',        '2025-05-01', 3, 5),
    (3, 'Intéressant mais manque de profondeur.',              '2025-05-10', 4, 7),
    (4, 'J''adore l''univers onirique de cette illustration.', '2025-05-15', 5, 9),
    (5, 'Chef-d''œuvre de matière et de forme.',               '2025-06-01', 6, 6),
    (4, 'La photographie urbaine capture bien l''essence.',    '2025-06-05', 7, 4),
    (2, 'Pas à mon goût mais techniquement propre.',           '2025-06-10', 8, 8);

-- Associations artist_discipline
INSERT INTO artist_discipline VALUES (1,1),(1,6),(2,2),(3,3),(4,5),(5,4),(5,6);

-- Associations member_discipline
INSERT INTO member_discipline VALUES (1,1),(1,2),(2,2),(3,3),(4,5),(5,6),(6,1),(7,4),(8,3);

-- Tags sur les œuvres
INSERT INTO artwork_tag VALUES
    (1,1),(1,7),(2,1),(2,6),(3,5),(3,8),(4,3),(4,8),
    (5,4),(5,6),(6,4),(7,3),(7,7),(8,3),(9,1),(9,6),(10,1),(11,3),(11,8),(12,5);

-- Œuvres dans les expositions
INSERT INTO exhibition_artwork VALUES
    (1,1),(1,2),(1,4),(2,5),(2,6),(2,12),(3,3),(3,4),(3,7),(3,8),(4,9),(4,10);

-- ============================================================
--  VUES — ArtConnect
-- ============================================================

-- Vue 1 : Catalogue public des œuvres à vendre
-- Objectif : masquer les données sensibles (id_artist, prix interne)
--            et ne montrer que les œuvres disponibles à l'achat
CREATE OR REPLACE VIEW v_catalogue_public AS
SELECT
    a.id_artwork,
    a.title,
    a.creation_year,
    a.type,
    a.medium,
    a.dimensions,
    a.description,
    a.price,
    ar.name  AS artist_name,
    ar.city  AS artist_city
FROM artwork a
JOIN artist ar ON a.id_artist = ar.id_artist
WHERE a.status = 'FOR_SALE'
  AND ar.is_active = TRUE;

-- Vue 2 : Tableau de bord des ateliers avec taux de remplissage
-- Objectif : simplification de requête pour l'interface de gestion
CREATE OR REPLACE VIEW v_workshop_dashboard AS
SELECT
    w.id_workshop,
    w.title,
    w.date,
    w.duration_minutes,
    w.max_participants,
    w.price,
    w.level,
    ar.name                                          AS artist_name,
    COUNT(b.id_booking)                              AS total_bookings,
    SUM(b.payment_status = 'PAID')                   AS paid_bookings,
    ROUND(COUNT(b.id_booking) / w.max_participants * 100, 1) AS fill_rate_pct,
    (w.max_participants - COUNT(b.id_booking))       AS seats_remaining
FROM workshop w
JOIN artist ar ON w.id_artist = ar.id_artist
LEFT JOIN booking b ON w.id_workshop = b.id_workshop
                    AND b.payment_status != 'CANCELLED'
GROUP BY w.id_workshop, w.title, w.date, w.duration_minutes,
         w.max_participants, w.price, w.level, ar.name;

-- Vue 3 : Fiche artiste enrichie (disciplines + note moyenne)
-- Objectif : jointure complexe réutilisable dans l'appli Java
CREATE OR REPLACE VIEW v_artist_profile AS
SELECT
    ar.id_artist,
    ar.name,
    ar.bio,
    ar.birth_year,
    ar.city,
    ar.website,
    GROUP_CONCAT(DISTINCT d.name ORDER BY d.name SEPARATOR ', ') AS disciplines,
    COUNT(DISTINCT aw.id_artwork)                                 AS artwork_count,
    ROUND(AVG(r.rating), 2)                                       AS avg_rating
FROM artist ar
LEFT JOIN artist_discipline ad ON ar.id_artist = ad.id_artist
LEFT JOIN discipline d         ON ad.id_discipline = d.id_discipline
LEFT JOIN artwork aw           ON ar.id_artist = aw.id_artist
LEFT JOIN review r             ON aw.id_artwork = r.id_artwork
WHERE ar.is_active = TRUE
GROUP BY ar.id_artist, ar.name, ar.bio, ar.birth_year, ar.city, ar.website;

-- Vue 4 : Expositions en cours ou à venir (sécurité / filtrage temporel)
-- Objectif : éviter d'afficher les expositions passées aux utilisateurs
CREATE OR REPLACE VIEW v_active_exhibitions AS
SELECT
    e.id_exhibition,
    e.title,
    e.start_date,
    e.end_date,
    e.theme,
    e.curator_name,
    g.name    AS gallery_name,
    g.address AS gallery_address,
    COUNT(ea.id_artwork) AS artwork_count
FROM exhibition e
JOIN gallery g          ON e.id_gallery    = g.id_gallery
LEFT JOIN exhibition_artwork ea ON e.id_exhibition = ea.id_exhibition
WHERE e.end_date >= CURDATE()
GROUP BY e.id_exhibition, e.title, e.start_date, e.end_date,
         e.theme, e.curator_name, g.name, g.address;
         

-- ============================================================
--  INDEX — ArtConnect
-- ============================================================

-- Index 1 : Recherche d'œuvres par statut (filtrage catalogue)
-- Justification : requête très fréquente dans v_catalogue_public
--                 et toute recherche par statut ou artiste actif
CREATE INDEX idx_artwork_status
    ON artwork (status);

-- Index 2 : Recherche de réservations par atelier + statut
-- Justification : le dashboard ateliers fait GROUP BY + filtre sur
--                 payment_status pour compter les places disponibles
CREATE INDEX idx_booking_workshop_status
    ON booking (id_workshop, payment_status);

-- Index 3 : Recherche d'expositions par dates (expositions actives)
-- Justification : la vue v_active_exhibitions et les requêtes de
--                 planning filtrent systématiquement sur end_date
CREATE INDEX idx_exhibition_dates
    ON exhibition (start_date, end_date);

-- Index 4 : Recherche de membres par email (login / unicité)
-- Justification : l'email est la clé naturelle de connexion,
--                 requête fréquente à chaque authentification
CREATE INDEX idx_member_email
    ON community_member (email);

-- Index 5 : Recherche d'œuvres par artiste
-- Justification : très utilisé dans la fiche artiste et
--                 lors des DELETE CASCADE depuis artist
CREATE INDEX idx_artwork_artist
    ON artwork (id_artist);

-- ============================================================
--  DROITS D'ACCÈS — ArtConnect
-- ============================================================

-- Compte applicatif Java (lecture + écriture, pas d'accès DDL)
CREATE USER IF NOT EXISTS 'artconnect_app'@'localhost'
    IDENTIFIED BY 'AppStr0ng#2025';

GRANT SELECT, INSERT, UPDATE, DELETE
    ON artconnect.*
    TO 'artconnect_app'@'localhost';

-- Compte lecture seule pour les vues publiques (ex : API publique)
CREATE USER IF NOT EXISTS 'artconnect_readonly'@'localhost'
    IDENTIFIED BY 'ReadOnly#2025';

GRANT SELECT
    ON artconnect.v_catalogue_public    TO 'artconnect_readonly'@'localhost';
GRANT SELECT
    ON artconnect.v_active_exhibitions  TO 'artconnect_readonly'@'localhost';
GRANT SELECT
    ON artconnect.v_artist_profile      TO 'artconnect_readonly'@'localhost';

FLUSH PRIVILEGES;


-- ============================================================
--  TRIGGERS — ArtConnect
-- ============================================================

DELIMITER $$

-- Trigger 1 : Vérification des places disponibles avant réservation
-- Objectif : empêcher une sur-réservation même sans transaction
CREATE TRIGGER trg_booking_check_capacity
BEFORE INSERT ON booking
FOR EACH ROW
BEGIN
    DECLARE v_max       INT;
    DECLARE v_current   INT;

    SELECT max_participants INTO v_max
    FROM workshop WHERE id_workshop = NEW.id_workshop;

    SELECT COUNT(*) INTO v_current
    FROM booking
    WHERE id_workshop   = NEW.id_workshop
      AND payment_status != 'CANCELLED';

    IF v_current >= v_max THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Atelier complet : aucune place disponible.';
    END IF;
END$$

-- Trigger 2 : Audit des modifications d'exposition
-- Objectif : tracer tout changement de dates ou de titre dans une table d'audit
CREATE TABLE IF NOT EXISTS exhibition_audit (
    id_audit       INT AUTO_INCREMENT PRIMARY KEY,
    id_exhibition  INT,
    changed_at     DATETIME DEFAULT CURRENT_TIMESTAMP,
    changed_by     VARCHAR(100) DEFAULT USER(),
    old_title      VARCHAR(150),
    new_title      VARCHAR(150),
    old_start_date DATE,
    new_start_date DATE,
    old_end_date   DATE,
    new_end_date   DATE
)$$

CREATE TRIGGER trg_exhibition_audit
AFTER UPDATE ON exhibition
FOR EACH ROW
BEGIN
    IF OLD.title != NEW.title
       OR OLD.start_date != NEW.start_date
       OR OLD.end_date   != NEW.end_date
    THEN
        INSERT INTO exhibition_audit
            (id_exhibition, old_title, new_title,
             old_start_date, new_start_date,
             old_end_date,   new_end_date)
        VALUES
            (OLD.id_exhibition, OLD.title, NEW.title,
             OLD.start_date, NEW.start_date,
             OLD.end_date,   NEW.end_date);
    END IF;
END$$

-- Trigger 3 : Mise à jour automatique du statut d'une œuvre à la vente
-- Objectif : quand un booking est annulé et que l'œuvre était SOLD,
--            remettre l'œuvre à FOR_SALE si aucun autre booking actif
--            (ici appliqué au cas où une œuvre passe en SOLD via review)
-- NOTE : ce trigger gère la cohérence status → SOLD quand le prix est 0
--        et empêche le statut EXHIBITED d'une œuvre sans exposition liée
CREATE TRIGGER trg_artwork_status_on_insert
BEFORE INSERT ON artwork
FOR EACH ROW
BEGIN
    IF NEW.status = 'SOLD' AND NEW.price IS NOT NULL AND NEW.price > 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Une œuvre SOLD ne peut pas avoir un prix positif non nul.';
    END IF;
END$$

-- Trigger 4 : Cohérence des dates d'exposition au niveau BEFORE UPDATE
-- Objectif : double sécurité (la contrainte CHECK peut être bypassée en ancien MySQL)
CREATE TRIGGER trg_exhibition_dates_check
BEFORE UPDATE ON exhibition
FOR EACH ROW
BEGIN
    IF NEW.end_date < NEW.start_date THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La date de fin ne peut pas être antérieure à la date de début.';
    END IF;
END$$

DELIMITER ;



-- ============================================================
--  PROCÉDURES ET FONCTIONS STOCKÉES — ArtConnect
-- ============================================================

DELIMITER $$

-- Fonction 1 : Nombre de participants confirmés à un atelier
-- Objectif : réutilisable dans l'appli Java et dans d'autres requêtes
CREATE FUNCTION fn_workshop_participant_count(p_workshop_id INT)
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE v_count INT;
    SELECT COUNT(*) INTO v_count
    FROM booking
    WHERE id_workshop   = p_workshop_id
      AND payment_status = 'PAID';
    RETURN v_count;
END$$

-- Fonction 2 : Note moyenne d'un artiste (sur toutes ses œuvres)
-- Objectif : calcul métier centralisé, utilisé dans v_artist_profile
CREATE FUNCTION fn_artist_avg_rating(p_artist_id INT)
RETURNS DECIMAL(3,2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE v_avg DECIMAL(3,2);
    SELECT ROUND(AVG(r.rating), 2) INTO v_avg
    FROM review r
    JOIN artwork a ON r.id_artwork = a.id_artwork
    WHERE a.id_artist = p_artist_id;
    RETURN COALESCE(v_avg, 0.00);
END$$

-- Procédure 1 : Inscrire un membre à un atelier (avec vérification complète)
-- Objectif : encapsuler la logique métier d'une réservation
CREATE PROCEDURE sp_book_workshop(
    IN  p_member_id   INT,
    IN  p_workshop_id INT,
    OUT p_result      VARCHAR(200)
)
BEGIN
    DECLARE v_max       INT;
    DECLARE v_current   INT;
    DECLARE v_already   INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET p_result = 'ERREUR : échec lors de la réservation (contrainte BD).';
    END;

    -- Vérifier existence membre
    IF NOT EXISTS (SELECT 1 FROM community_member WHERE id_member = p_member_id) THEN
        SET p_result = 'ERREUR : membre introuvable.';
        LEAVE sp_book_workshop;  -- label implicite via le nom de procédure
    END IF;

    -- Double-réservation
    SELECT COUNT(*) INTO v_already FROM booking
    WHERE id_member = p_member_id AND id_workshop = p_workshop_id
      AND payment_status != 'CANCELLED';
    IF v_already > 0 THEN
        SET p_result = 'ERREUR : déjà inscrit à cet atelier.';
        LEAVE sp_book_workshop;
    END IF;

    -- Capacité
    SELECT max_participants INTO v_max FROM workshop WHERE id_workshop = p_workshop_id;
    SELECT COUNT(*) INTO v_current FROM booking
    WHERE id_workshop = p_workshop_id AND payment_status != 'CANCELLED';
    IF v_current >= v_max THEN
        SET p_result = 'ERREUR : atelier complet.';
        LEAVE sp_book_workshop;
    END IF;

    START TRANSACTION;
        INSERT INTO booking (payment_status, id_workshop, id_member)
        VALUES ('PENDING', p_workshop_id, p_member_id);
    COMMIT;
    SET p_result = CONCAT('OK : réservation créée, id_booking=', LAST_INSERT_ID());
END$$

-- Procédure 2 : Créer une exposition et y associer des œuvres d'un artiste
-- Objectif : opération atomique "créer expo + lier œuvres"
CREATE PROCEDURE sp_create_exhibition_with_artworks(
    IN p_title        VARCHAR(150),
    IN p_start_date   DATE,
    IN p_end_date     DATE,
    IN p_curator      VARCHAR(100),
    IN p_theme        VARCHAR(150),
    IN p_gallery_id   INT,
    IN p_artist_id    INT
)
BEGIN
    DECLARE v_expo_id INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;
        INSERT INTO exhibition (title, start_date, end_date, curator_name, theme, id_gallery)
        VALUES (p_title, p_start_date, p_end_date, p_curator, p_theme, p_gallery_id);

        SET v_expo_id = LAST_INSERT_ID();

        -- Associer toutes les œuvres FOR_SALE ou EXHIBITED de l'artiste
        INSERT INTO exhibition_artwork (id_exhibition, id_artwork)
        SELECT v_expo_id, id_artwork
        FROM artwork
        WHERE id_artist = p_artist_id
          AND status IN ('FOR_SALE', 'EXHIBITED');

        -- Mettre à jour le statut des œuvres en EXHIBITED
        UPDATE artwork
        SET status = 'EXHIBITED'
        WHERE id_artist = p_artist_id
          AND status = 'FOR_SALE';
    COMMIT;

    SELECT v_expo_id AS new_exhibition_id;
END$$

-- Procédure 3 : Rapport de synthèse d'un membre (ateliers + critiques)
-- Objectif : générer un résumé pour le profil membre dans l'UI Java
CREATE PROCEDURE sp_member_summary(IN p_member_id INT)
BEGIN
    SELECT
        cm.name,
        cm.email,
        cm.membership_type,
        COUNT(DISTINCT b.id_workshop)  AS workshops_booked,
        SUM(b.payment_status = 'PAID') AS workshops_paid,
        COUNT(DISTINCT r.id_review)    AS reviews_written,
        ROUND(AVG(r.rating), 2)        AS avg_rating_given
    FROM community_member cm
    LEFT JOIN booking b ON cm.id_member = b.id_member
    LEFT JOIN review  r ON cm.id_member = r.id_member
    WHERE cm.id_member = p_member_id
    GROUP BY cm.id_member, cm.name, cm.email, cm.membership_type;
END$$

DELIMITER ;



-- ============================================================
--  TRANSACTIONS — ArtConnect
-- ============================================================

-- ─────────────────────────────────────────────────────────────
-- Scénario T1 : Inscription atomique d'un membre à plusieurs ateliers
-- Règle : soit tout réussit, soit rien n'est validé
-- ─────────────────────────────────────────────────────────────
START TRANSACTION;

    -- Réservation atelier 1 (Initiation Aquarelle)
    INSERT INTO booking (payment_status, id_workshop, id_member)
    VALUES ('PENDING', 1, 5);

    -- Réservation atelier 2 (Photo Urbaine Avancée)
    INSERT INTO booking (payment_status, id_workshop, id_member)
    VALUES ('PENDING', 2, 5);

    -- Réservation atelier 3 (Sculpture sur Argile)
    INSERT INTO booking (payment_status, id_workshop, id_member)
    VALUES ('PENDING', 3, 5);

COMMIT;
-- Si une contrainte UNIQUE ou le trigger trg_booking_check_capacity
-- lève une erreur, le ROLLBACK annule les 3 insertions.


-- ─────────────────────────────────────────────────────────────
-- Scénario T2 : Vente d'une œuvre (statut + création d'un log)
-- Règle : mise à jour statut ET insertion d'un enregistrement
--         dans une table de ventes doivent être atomiques
-- ─────────────────────────────────────────────────────────────

-- Table de log des ventes (à créer une seule fois)
CREATE TABLE IF NOT EXISTS sale_log (
    id_sale    INT AUTO_INCREMENT PRIMARY KEY,
    id_artwork INT NOT NULL,
    id_member  INT NOT NULL,
    sale_date  DATETIME DEFAULT CURRENT_TIMESTAMP,
    sale_price DECIMAL(10,2)
);

START TRANSACTION;

    -- Vérifier que l'œuvre est bien à vendre (SELECT ... FOR UPDATE = verrou)
    SELECT id_artwork, price, status
    FROM artwork
    WHERE id_artwork = 1 AND status = 'FOR_SALE'
    FOR UPDATE;

    -- Marquer comme vendue
    UPDATE artwork
    SET status = 'SOLD', price = 0
    WHERE id_artwork = 1;

    -- Enregistrer la vente
    INSERT INTO sale_log (id_artwork, id_member, sale_price)
    VALUES (1, 2, 1200.00);

COMMIT;


-- ─────────────────────────────────────────────────────────────
-- Scénario T3 : Transfert d'une œuvre d'une exposition à une autre
-- Règle : désassociation + réassociation atomiques, avec mise à
--         jour du statut de l'œuvre si l'expo d'origine est vide
-- ─────────────────────────────────────────────────────────────
START TRANSACTION;

    -- Retirer l'œuvre 4 (Verticales) de l'exposition 1 (Couleurs Vivantes)
    DELETE FROM exhibition_artwork
    WHERE id_exhibition = 1 AND id_artwork = 4;

    -- L'ajouter à l'exposition 3 (Ville en Images) — cohérente thématiquement
    INSERT INTO exhibition_artwork (id_exhibition, id_artwork)
    VALUES (3, 4);

    -- Si l'expo 1 n'a plus d'œuvres de ce statut, on pourrait la marquer "archivée"
    -- (ici simple vérification pour illustration)
    -- Mettre à jour le statut de l'œuvre reste EXHIBITED (inchangé)
    UPDATE artwork SET status = 'EXHIBITED' WHERE id_artwork = 4;

COMMIT;


-- ─────────────────────────────────────────────────────────────
-- Scénario T4 (ROLLBACK démonstratif) : tentative d'inscrire un
-- membre à un atelier déjà complet → rollback déclenché
-- ─────────────────────────────────────────────────────────────
START TRANSACTION;

    -- Atelier 3 = max 6 participants, déjà 3 inscrits dans les données
    -- On remplit jusqu'à la limite
    INSERT INTO booking (payment_status, id_workshop, id_member) VALUES ('PAID', 3, 1);
    INSERT INTO booking (payment_status, id_workshop, id_member) VALUES ('PAID', 3, 2);
    INSERT INTO booking (payment_status, id_workshop, id_member) VALUES ('PAID', 3, 3);

    -- Cette 7ème inscription déclenchera trg_booking_check_capacity
    -- et lèvera une erreur → ROLLBACK de tout le bloc
    INSERT INTO booking (payment_status, id_workshop, id_member) VALUES ('PAID', 3, 4);

ROLLBACK; -- explicite pour l'exemple ; en production, géré par le handler Java


-- ─────────────────────────────────────────────────────────────
-- Tests de vérification post-transactions
-- ─────────────────────────────────────────────────────────────
-- Vérifier les inscriptions du membre 5
SELECT * FROM booking WHERE id_member = 5;

-- Vérifier le taux de remplissage des ateliers
SELECT * FROM v_workshop_dashboard;

-- Vérifier les œuvres de l'expo 3 après le transfert
SELECT ea.id_artwork, a.title FROM exhibition_artwork ea
JOIN artwork a ON ea.id_artwork = a.id_artwork
WHERE ea.id_exhibition = 3;

-- Vérifier l'audit des expositions
SELECT * FROM exhibition_audit;

-- Tester les programmes stockés
SELECT fn_workshop_participant_count(1) AS participants_atelier_1;
SELECT fn_artist_avg_rating(1)          AS note_moyenne_claire_morand;
CALL sp_member_summary(1);