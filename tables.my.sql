DROP TABLE IF EXISTS grr_calendrier_feries;
CREATE TABLE grr_calendrier_feries (  `DAY` int(11) NOT NULL DEFAULT '0');
DROP TABLE IF EXISTS grr_calendrier_vacances;
CREATE TABLE grr_calendrier_vacances (  `DAY` int(11) NOT NULL DEFAULT '0');
DROP TABLE IF EXISTS grr_j_mailuser_room;
CREATE TABLE grr_j_mailuser_room (login varchar(40) NOT NULL default '', id_room int(11) NOT NULL default '0', PRIMARY KEY  (login,id_room) );
DROP TABLE IF EXISTS grr_j_user_area;
CREATE TABLE grr_j_user_area (login varchar(40) NOT NULL default '', id_area int(11) NOT NULL default '0', PRIMARY KEY  (login,id_area) );
DROP TABLE IF EXISTS grr_j_user_room;
CREATE TABLE grr_j_user_room (login varchar(40) NOT NULL default '', id_room int(11) NOT NULL default '0', PRIMARY KEY  (login,id_room) );
DROP TABLE IF EXISTS grr_j_useradmin_area;
CREATE TABLE grr_j_useradmin_area (login varchar(40) NOT NULL default '', id_area int(11) NOT NULL default '0', PRIMARY KEY  (login,id_area) );
DROP TABLE IF EXISTS grr_log;
CREATE TABLE grr_log (LOGIN varchar(40) NOT NULL default '', `START` datetime NOT NULL default '1970-01-01 00:00:00', SESSION_ID varchar(64) NOT NULL default '', REMOTE_ADDR varchar(16) NOT NULL default '', USER_AGENT varchar(255) NOT NULL default '', REFERER varchar(255) NOT NULL default '', AUTOCLOSE enum('0','1') NOT NULL default '0', `END` datetime NOT NULL default '1970-01-01 00:00:00', PRIMARY KEY  (SESSION_ID,`START`));
DROP TABLE IF EXISTS grr_area;
CREATE TABLE grr_area (id int(11) NOT NULL auto_increment, area_name varchar(30) NOT NULL default '', access char(1) NOT NULL default '', order_display smallint(6) NOT NULL default '0', ip_adr varchar(15) NOT NULL default '',   morningstarts_area smallint(6) NOT NULL default '0', eveningends_area smallint(6) NOT NULL default '0', duree_max_resa_area INT NOT NULL default '-1', resolution_area INT NOT NULL default '0', eveningends_minutes_area smallint(6) NOT NULL default '0', weekstarts_area smallint(6) NOT NULL default '0', twentyfourhour_format_area smallint(6) NOT NULL default '0', calendar_default_values char(1) NOT NULL default 'y', enable_periods char(1) NOT NULL default 'n', display_days varchar(7) NOT NULL default 'yyyyyyy', id_type_par_defaut int(11) NOT NULL default '-1', duree_par_defaut_reservation_area INT NOT NULL DEFAULT '0', max_booking smallint(6) NOT NULL default '-1', PRIMARY KEY  (id));
DROP TABLE IF EXISTS grr_entry;
CREATE TABLE grr_entry (id int(11) NOT NULL auto_increment, start_time int(11) NOT NULL default '0', end_time int(11) NOT NULL default '0', entry_type int(11) NOT NULL default '0', repeat_id int(11) NOT NULL default '0', room_id int(11) NOT NULL default '1',timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, create_by varchar(100) NOT NULL default '', beneficiaire_ext varchar(200) NOT NULL default '', beneficiaire varchar(100) NOT NULL default '', name varchar(80) NOT NULL default '', type char(2) NOT NULL default 'A', description text, statut_entry char(1) NOT NULL default '-', option_reservation int(11) NOT NULL default '0',overload_desc text, moderate tinyint(1) default '0', jours int(2) NOT NULL default '0', clef int(2) NOT NULL default '0', courrier int(2) NOT NULL default '0', PRIMARY KEY  (id), KEY idxStartTime (start_time), KEY idxEndTime (end_time));
DROP TABLE IF EXISTS grr_repeat;
CREATE TABLE grr_repeat ( id int(11) NOT NULL auto_increment, start_time int(11) NOT NULL default '0', end_time int(11) NOT NULL default '0', rep_type int(11) NOT NULL default '0', end_date int(11) NOT NULL default '0', rep_opt varchar(32) NOT NULL default '', room_id int(11) NOT NULL default '1', timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, create_by varchar(100) NOT NULL default '', beneficiaire_ext varchar(200) NOT NULL default '', beneficiaire varchar(100) NOT NULL default '', name varchar(80) NOT NULL default '', type char(2) NOT NULL default 'A', description text, rep_num_weeks tinyint(4) default '0',overload_desc text, jours tinyint(2) NOT NULL default '0', courrier int(2) NOT NULL default '0', PRIMARY KEY  (id));
DROP TABLE IF EXISTS grr_room;
CREATE TABLE grr_room ( id int(11) NOT NULL auto_increment,  area_id int(11) NOT NULL default '0',  room_name varchar(60) NOT NULL default '',  description varchar(60) NOT NULL default '',  capacity int(11) NOT NULL default '0',  max_booking smallint(6) NOT NULL default '-1', statut_room char(1) NOT NULL default '1', show_fic_room char(1) NOT NULL default 'n', picture_room varchar(50) NOT NULL default '', comment_room text NOT NULL, show_comment CHAR(1) NOT NULL DEFAULT 'n', delais_max_resa_room smallint(6) NOT NULL default '-1', delais_min_resa_room smallint(6) NOT NULL default '0', allow_action_in_past char(1) NOT NULL default 'n', dont_allow_modify char(1) NOT NULL default 'n', order_display smallint(6) NOT NULL default '0', delais_option_reservation smallint(6) NOT NULL default '0', type_affichage_reser smallint(6) DEFAULT '0' NOT NULL, moderate tinyint(1) default '0', qui_peut_reserver_pour char(1) NOT NULL default '5', active_ressource_empruntee char(1) NOT NULL default 'y', active_cle char(1) NOT NULL default 'y', who_can_see SMALLINT DEFAULT '0' NOT NULL, PRIMARY KEY  (id));
DROP TABLE IF EXISTS grr_utilisateurs;
CREATE TABLE grr_utilisateurs (login varchar(40) NOT NULL default '', nom varchar(30) NOT NULL default '', prenom varchar(30) NOT NULL default '', password varchar(32) NOT NULL default '', email varchar(100) NOT NULL default '', statut varchar(30) NOT NULL default '', etat varchar(20) NOT NULL default '', default_site smallint(6) NOT NULL default '0', default_area smallint(6) NOT NULL default '0', default_room smallint(6) NOT NULL default '0', default_style varchar(50) NOT NULL default '', default_list_type varchar(50) NOT NULL default '', default_language char(3) NOT NULL default '', source varchar(10) NOT NULL default 'local', PRIMARY KEY  (login) );
DROP TABLE IF EXISTS grr_setting;
CREATE TABLE grr_setting (  NAME varchar(32) NOT NULL default '',  VALUE text NOT NULL,  PRIMARY KEY  (NAME));
DROP TABLE IF EXISTS grr_area_periodes;
CREATE TABLE grr_area_periodes (id_area int(11) NOT NULL default '0', num_periode smallint(6) NOT NULL default '0', nom_periode varchar(100) NOT NULL default '', PRIMARY KEY  (`id_area`,`num_periode`));
DROP TABLE IF EXISTS grr_type_area;
CREATE TABLE grr_type_area (id int(11) NOT NULL auto_increment, type_name varchar(30) NOT NULL default '',order_display smallint(6) NOT NULL default '0',couleur smallint(6) NOT NULL default '0',couleurhexa varchar(10) NOT NULL,type_letter char(2) NOT NULL default '',disponible VARCHAR(1) NOT NULL DEFAULT '2', PRIMARY KEY  (id));
DROP TABLE IF EXISTS grr_j_type_area;
CREATE TABLE grr_j_type_area (id_type int(11) NOT NULL default '0', id_area int(11) NOT NULL default '0');
DROP TABLE IF EXISTS grr_calendar;
CREATE TABLE grr_calendar (DAY int(11) NOT NULL default '0');
DROP TABLE IF EXISTS grr_calendrier_jours_cycle;
CREATE TABLE grr_calendrier_jours_cycle (DAY int(11) NOT NULL default '0', Jours varchar(20) NOT NULL default '');
DROP TABLE IF EXISTS grr_overload;
CREATE TABLE grr_overload (id int(11) NOT NULL auto_increment, id_area INT NOT NULL, fieldname VARCHAR(55) NOT NULL default '', fieldtype VARCHAR(25) NOT NULL default '', fieldlist text NOT NULL, obligatoire CHAR( 1 ) DEFAULT 'n' NOT NULL, affichage CHAR( 1 ) DEFAULT 'n' NOT NULL, confidentiel CHAR( 1 ) DEFAULT 'n' NOT NULL, overload_mail CHAR( 1 ) DEFAULT 'n' NOT NULL, PRIMARY KEY  (id));
DROP TABLE IF EXISTS grr_entry_moderate;
CREATE TABLE grr_entry_moderate (id int(11) NOT NULL auto_increment, login_moderateur varchar(40) NOT NULL default '',motivation_moderation text NOT NULL,start_time int(11) NOT NULL default '0',end_time int(11) NOT NULL default '0',entry_type int(11) NOT NULL default '0', repeat_id int(11) NOT NULL default '0',room_id int(11) NOT NULL default '1',timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, create_by varchar(100) NOT NULL default '', beneficiaire_ext varchar(200) NOT NULL default '', beneficiaire varchar(100) NOT NULL default '', name varchar(80) NOT NULL default '',type char(2) default NULL,description text,statut_entry char(1) NOT NULL default '-',option_reservation int(11) NOT NULL default '0',overload_desc text,moderate tinyint(1) default '0', PRIMARY KEY  (id), KEY idxStartTime (start_time), KEY idxEndTime (end_time));
DROP TABLE IF EXISTS grr_site;
CREATE TABLE grr_site (id int(11) NOT NULL auto_increment, sitecode varchar(10) default NULL, sitename varchar(50) NOT NULL default '', adresse_ligne1 varchar(38) default NULL, adresse_ligne2 varchar(38) default NULL, adresse_ligne3 varchar(38) default NULL, cp varchar(5) default NULL, ville varchar(50) default NULL, pays varchar(50) default NULL, tel varchar(25) default NULL, fax varchar(25) default NULL, PRIMARY KEY (`id`));
DROP TABLE IF EXISTS grr_j_site_area;
CREATE TABLE grr_j_site_area ( id_site int(11) NOT NULL default '0', id_area int(11) NOT NULL default '0', PRIMARY KEY  (`id_site`,`id_area`));
DROP TABLE IF EXISTS grr_j_useradmin_site;
CREATE TABLE grr_j_useradmin_site (login varchar(40) NOT NULL default '', id_site int(11) NOT NULL default '0', PRIMARY KEY  (login,id_site) );
DROP TABLE IF EXISTS grr_correspondance_statut;
CREATE TABLE grr_correspondance_statut (id int(11) NOT NULL auto_increment, code_fonction varchar(30) NOT NULL, libelle_fonction varchar(200) NOT NULL, statut_grr varchar(30) NOT NULL,  PRIMARY KEY (id));
DROP TABLE IF EXISTS grr_page;
CREATE TABLE grr_page ( nom varchar(30) NOT NULL, valeur longtext NOT NULL default '', PRIMARY KEY  (`nom`));
INSERT INTO grr_page VALUES ('CGU', 'Les CGU');
INSERT INTO grr_type_area VALUES (1, 'Cours', 1, 1, 'A', 2);
INSERT INTO grr_type_area VALUES (2, 'R�union', 2, 2, 'B', 2);
INSERT INTO grr_type_area VALUES (3, 'Stage', 3, 3, 'C', 2);
INSERT INTO grr_type_area VALUES (4, 'Devoir', 4, 4, 'D', 2);
INSERT INTO grr_type_area VALUES (5, 'Autre', 5, 5, 'E', 2);
INSERT INTO grr_utilisateurs VALUES ('ADMINISTRATEUR', 'Administrateur', 'grr', 'ab4f63f9ac65152575886860dde480a1', 'admin@labas.fr', 'administrateur', 'actif', 0, 0, 0, 'default', 'item', 'fr','local');
INSERT INTO grr_setting VALUES ('sessionMaxLength', '30');
INSERT INTO grr_setting VALUES ('automatic_mail', 'yes');
INSERT INTO grr_setting VALUES ('company', 'Nom de l\'�tablissement');
INSERT INTO grr_setting VALUES ('webmaster_name', 'Webmestre de GRR');
INSERT INTO grr_setting VALUES ('webmaster_email', 'admin@mon.site.fr');
INSERT INTO grr_setting VALUES ('technical_support_email', 'support.technique@mon.site.fr');
INSERT INTO grr_setting VALUES ('grr_url', 'http://mon.site.fr/grr/');
INSERT INTO grr_setting VALUES ('disable_login', 'no');
INSERT INTO grr_setting VALUES ('ip_autorise', 'no');
INSERT INTO grr_setting VALUES ('begin_bookings', '1514761200');
INSERT INTO grr_setting VALUES ('end_bookings', '1609369200');
INSERT INTO grr_setting VALUES ('title_home_page', 'Gestion et R�servation de Ressources');
INSERT INTO grr_setting VALUES ('message_home_page', 'En raison du caract�re personnel du contenu, ce site est soumis � des restrictions utilisateurs. Pour acc�der aux outils de r�servation, identifiez-vous :');
INSERT INTO grr_setting VALUES ('version', '3.3.1');
INSERT INTO grr_setting VALUES ('versionRC', '');
INSERT INTO grr_setting VALUES ('default_language', 'fr');
INSERT INTO grr_setting VALUES ('url_disconnect', '');
INSERT INTO grr_setting VALUES ('allow_users_modify_profil', '2');
INSERT INTO grr_setting VALUES ('allow_users_modify_email', '2');
INSERT INTO grr_setting VALUES ('allow_users_modify_mdp', '2');
INSERT INTO grr_setting VALUES ('maj194_champs_additionnels', '1');
INSERT INTO grr_setting VALUES ('maj195_champ_rep_type_grr_repeat', '1');
INSERT INTO grr_setting VALUES ('display_info_bulle', '1');
INSERT INTO grr_setting VALUES ('display_full_description', '1');
INSERT INTO grr_setting VALUES ('pview_new_windows', '1');
INSERT INTO grr_setting VALUES ('default_report_days', '30');
INSERT INTO grr_setting VALUES ('authentification_obli', '0');
INSERT INTO grr_setting VALUES ('use_fckeditor', '1');
INSERT INTO grr_setting VALUES ('visu_fiche_description', '0');
INSERT INTO grr_setting VALUES ('allow_search_level', '1');
INSERT INTO grr_setting VALUES ('allow_user_delete_after_begin', '0');
INSERT INTO grr_setting VALUES ('allow_gestionnaire_modify_del', '1');
INSERT INTO grr_setting VALUES ('javascript_info_disabled', '0');
INSERT INTO grr_setting VALUES ('javascript_info_admin_disabled', '0');
INSERT INTO grr_setting VALUES ('pass_leng', '8');
INSERT INTO grr_setting VALUES ('jour_debut_Jours/Cycles', '1');
INSERT INTO grr_setting VALUES ('nombre_jours_Jours/Cycles', '1');
INSERT INTO grr_setting VALUES ('UserAllRoomsMaxBooking', '-1');
INSERT INTO grr_setting VALUES ('jours_cycles_actif', 'Non');
INSERT INTO grr_setting VALUES ('area_list_format', 'item');
INSERT INTO grr_setting VALUES ('longueur_liste_ressources_max', '20');
INSERT INTO grr_setting VALUES ('grr_mail_Password', '');
INSERT INTO grr_setting VALUES ('grr_mail_method', 'mail');
INSERT INTO grr_setting VALUES ('grr_mail_smtp', '');
INSERT INTO grr_setting VALUES ('grr_mail_Bcc', 'n');
INSERT INTO grr_setting VALUES ('grr_mail_Username', '');
INSERT INTO grr_setting VALUES ('verif_reservation_auto', '0');
INSERT INTO grr_setting VALUES ('ConvertLdapUtf8toIso', 'y');
INSERT INTO grr_setting VALUES ('ActiveModeDiagnostic', 'n');
INSERT INTO grr_setting VALUES ('ldap_champ_recherche', 'uid');
INSERT INTO grr_setting VALUES ('ldap_champ_nom', 'sn');
INSERT INTO grr_setting VALUES ('ldap_champ_prenom', 'givenname');
INSERT INTO grr_setting VALUES ('ldap_champ_email', 'mail');
INSERT INTO grr_setting VALUES ('gestion_lien_aide', 'ext');
INSERT INTO grr_setting VALUES ('lien_aide', '');
INSERT INTO grr_setting VALUES ('display_short_description', '1');
INSERT INTO grr_setting VALUES ('remplissage_description_breve', '1');
INSERT INTO grr_setting VALUES ('acces_fiche_reservation', '0');
INSERT INTO grr_setting VALUES ('display_level_email', '0');
INSERT INTO grr_setting VALUES ('nb_calendar', '1');
INSERT INTO grr_setting VALUES ('maj196_qui_peut_reserver_pour', '1');
INSERT INTO grr_setting VALUES ('default_site', '-1');
INSERT INTO grr_setting VALUES ('default_room', '-1');
INSERT INTO grr_setting VALUES ('default_css', 'default');
INSERT INTO grr_setting VALUES ('envoyer_email_avec_formulaire', 'no');
INSERT INTO grr_setting VALUES ('mail_destinataire', 'test@test.fr');
INSERT INTO grr_setting VALUES ('mail_etat_destinataire', '0');
INSERT INTO grr_setting VALUES ('menu_gauche', '1');
INSERT INTO grr_setting VALUES ('file', '1');
INSERT INTO grr_setting VALUES ('smtp_secure', '');
INSERT INTO grr_setting VALUES ('smtp_port', '25');
INSERT INTO grr_setting VALUES ('periodicite', 'y');
INSERT INTO grr_setting VALUES ('cas_port', '');
INSERT INTO grr_setting VALUES ('cas_racine', '');
INSERT INTO grr_setting VALUES ('cas_serveur', '');
INSERT INTO grr_setting VALUES ('remplissage_description_complete', '0');
