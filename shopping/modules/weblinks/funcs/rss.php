<?php

/**
 * @Project NUKEVIET 4.x
 * @Author VINADES (contact@vinades.vn)
 * @Copyright (C) 2014 VINADES. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate Apr 20, 2010 10:47:41 AM
 */

if (! defined('NV_IS_MOD_WEBLINKS')) {
    die('Stop!!!');
}

$channel = array();
$items = array();

$channel['title'] = $module_info['custom_title'];
$channel['link'] = NV_MY_DOMAIN . NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name;
$channel['description'] = ! empty($module_info['description']) ? $module_info['description'] : $global_config['site_description'];
$catid = 0;
if (isset($array_op[1])) {
    $alias_cat_url = $array_op[1];
    $cattitle = '';
    foreach ($global_weblinks_cat as $catid_i => $array_cat_i) {
        if ($alias_cat_url == $array_cat_i['alias']) {
            $catid = $catid_i;
            break;
        }
    }
}
if (! empty($catid)) {
    $channel['title'] = $module_info['custom_title'] . ' - ' . $global_weblinks_cat[$catid]['title'];
    $channel['link'] = NV_MY_DOMAIN . NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=' . $module_info['alias']['rss'] . '/' . $alias_cat_url;
    $channel['description'] = $global_weblinks_cat[$catid]['description'];

    $sql = 'SELECT id, catid, add_time, title, alias, description, urlimg FROM ' . NV_PREFIXLANG . '_' . $module_data . '_rows WHERE catid=' . intval($catid) . ' AND status=1 ORDER BY id ASC LIMIT 30';
} else {
    $sql = 'SELECT id, catid, add_time, title, alias, description, urlimg FROM ' . NV_PREFIXLANG . '_' . $module_data . '_rows WHERE status=1 ORDER BY id ASC LIMIT 30';
}
if ($module_info['rss']) {
    $result = $db->query($sql);
    while (list($id, $catid_i, $publtime, $title, $alias, $description, $urlimg) = $result->fetch(3)) {
        $rimages = (! empty($urlimg)) ? '<img src="' . NV_BASE_SITEURL . NV_ASSETS_DIR . '/' . $urlimg . '" width="100" align="left" border="0">' : '';
        $catalias = $global_weblinks_cat[$catid_i]['alias'];
        $items[] = array(
            'title' => $title,
            'link' => NV_MY_DOMAIN . NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=' . $catalias . '/' . $alias . '-' . $id,
            'guid' => $module_name . '_' . $id,
            'description' => $rimages . $description,
            'pubdate' => $publtime );
    }
}

nv_rss_generate($channel, $items);
die();
