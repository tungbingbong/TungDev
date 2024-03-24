<?php

/**
 * @Project NUKEVIET 4.x
 * @Author VINADES (contact@vinades.vn)
 * @Copyright (C) 2014 VINADES. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate Apr 20, 2010 10:47:41 AM
 */

if (! defined('NV_IS_FILE_SITEINFO')) {
    die('Stop!!!');
}

$lang_siteinfo = nv_get_lang_module($mod);

// Tong so link
$number = $db->query('SELECT COUNT(*) as number FROM ' . NV_PREFIXLANG . '_' . $mod_data . '_rows where status= 1')->fetchColumn();
if ($number > 0) {
    $siteinfo[] = array( 'key' => $lang_siteinfo['siteinfo_numberlink'], 'value' => $number );
}

// So bao cao link hong
$number = $db->query('SELECT COUNT(*) as number FROM ' . NV_PREFIXLANG . '_' . $mod_data . '_report')->fetchColumn();
if ($number > 0) {
    $pendinginfo[] = array(
        'key' => $lang_siteinfo['siteinfo_error'],
        'value' => $number,
        'link' => NV_BASE_ADMINURL . 'index.php?' . NV_NAME_VARIABLE . '=' . $mod . '&amp;' . NV_OP_VARIABLE . '=brokenlink' );
}
