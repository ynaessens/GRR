<?php
/**
 * admin_couleurs.php
 * Interface permettant à l'administrateur la personnalisation de certaines couleurs
 * Ce script fait partie de l'application GRR.
 * Dernière modification : $Date: 2018-07-18 10:00$
 * @author    Yan Naessens
 * @copyright Copyright 2003-2018 Team DEVOME - JeromeB
 * @link      http://www.gnu.org/licenses/licenses.html
 *
 * This file is part of GRR.
 *
 * GRR is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 */
$grr_script_name = "admin_couleurs.php";
include "../include/admin.inc.php";

$back = 'admin_config.php';

/* Enregistrement de la page 
if (isset($_POST['CGU'])) {
    if (!Pages::set("CGU", $_POST['CGU'])) {
        echo "Erreur lors de l'enregistrement de CGU !<br />";
        die();
    }
}
/**/

$msg = '';

// Si pas de problème, message de confirmation
if (isset($_POST['ok'])) {
    $_SESSION['displ_msg'] = 'yes';
    if ($msg == '') {
        $msg = get_vocab('message_records');
    }
    Header('Location: '.'admin_couleurs.php?msg='.$msg);
    exit();
}
if ((isset($_GET['msg'])) && isset($_SESSION['displ_msg']) && ($_SESSION['displ_msg'] == 'yes')) 
    { $msg = $_GET['msg'];} 
else { $msg = '';}

// print_header('', '', '', $type = 'with_session');
global $vocab, $search_str, $grrSettings, $clock_file, $desactive_VerifNomPrenomUser, $grr_script_name;
global $use_prototype, $use_admin, $use_tooltip_js, $desactive_bandeau_sup, $id_site, $use_select2;
include $racine."/include/hook.class.php";

if (!($desactive_VerifNomPrenomUser))
    $desactive_VerifNomPrenomUser = 'n';
// On vérifie que les noms et prénoms ne sont pas vides
VerifNomPrenomUser("with_session"); // une page admin ne doit pas être accessible hors session
// begin_page(Settings::get("company"),"with_session");
// code HTML
echo '<!DOCTYPE html>'.PHP_EOL;
echo '<html lang="fr">'.PHP_EOL;
// section <head>
echo pageHead2(Settings::get("company"),"with_session");
// section <body>
echo "<body>";
// Menu du haut = section <header>
echo "<header>";
pageHeader2('', '', '', 'with_session');
echo "</header>";

affiche_pop_up($msg, 'admin');

// Affichage de la colonne de gauche
include 'admin_col_gauche.php'; // ouverts : table, tr, td. On ne change rien au layout des pages admin pour l'instant

echo '<form action="./admin_couleurs.php" id="nom_formulaire" method="post" style="width: 100%;">'.PHP_EOL;

echo '<p>Page de choix des couleurs</p>';

echo '<div id="fixe" style="text-align:center;">'.PHP_EOL;
echo '<a class="btn btn-info" type="button" href="admin_couleurs.php?defaut=" style="font-variant: small-caps;">'.get_vocab('default').'</a>';
echo '<a class="btn btn-danger" type="button" href="admin_config.php" style="font-variant: small-caps;">'.get_vocab("cancel").'</a>';
echo '<input class="btn btn-primary" type="submit" name="ok" value="'.get_vocab('save').'" style="font-variant: small-caps;"/>'.PHP_EOL;
echo '</div>';
echo '</form>';

echo "</td></tr></table>";
echo "</body></html>";
?>