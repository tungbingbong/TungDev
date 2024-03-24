<?php

/**
 * @Project NUKEVIET 4.x
 * @Author VINADES.,JSC (contact@vinades.vn)
 * @Copyright (C) 2014 VINADES.,JSC. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate 12/31/2009 0:51
 */

if (! defined('NV_SYSTEM')) {
    die('Stop!!!');
}

define('NV_IS_MOD_WEBLINKS', true);

require_once(NV_ROOTDIR . '/modules/' . $module_file . '/global.functions.php');

/**
 * adminlink()
 *
 * @param mixed $id
 * @return
 */
function adminlink($id)
{
    global $lang_module, $module_name;
    $link = '<em class="fa fa-trash-o fa-lg">&nbsp;</em><a href="' . NV_BASE_ADMINURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&' . NV_NAME_VARIABLE . '=' . $module_name . '&' . NV_OP_VARIABLE . '=del_link&amp;id=' . $id . '">' . $lang_module['delete'] . '</a>&nbsp;&nbsp;';
    $link .= '<em class="fa fa-edit fa-lg">&nbsp;</em><a href="' . NV_BASE_ADMINURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&' . NV_NAME_VARIABLE . '=' . $module_name . '&' . NV_OP_VARIABLE . '=content&amp;id=' . $id . '">' . $lang_module['edit'] . '</a>';
    return $link;
}

$catid = 0;
$parentid = 0;
$set_viewcat = '';
$alias_cat_url = isset($array_op[0]) ? $array_op[0] : '';
$array_mod_title = array();
$global_weblinks_cat = array();

// Xac dinh RSS
if ($module_info['rss']) {
    $rss[] = array( 'title' => $module_info['custom_title'], 'src' => NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=' . $module_info['alias']['rss'] );
}

$sql = 'SELECT catid, parentid, title, description, catimage, alias, keywords  FROM ' . NV_PREFIXLANG . '_' . $module_data . '_cat WHERE inhome=1 ORDER BY parentid, weight';
$result = $db->query($sql);

while (list($catid_i, $parentid_i, $title_i, $description_i, $catimage_i, $alias_i, $keywords_i) = $result->fetch(3)) {
    $link_i = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=' . $alias_i;

    $sql1 = 'SELECT COUNT(*) FROM ' . NV_PREFIXLANG . '_' . $module_data . '_rows WHERE catid = '. $catid_i;
    $result1 = $db->query($sql1);

    $count_link = $result1->fetchColumn();

    $global_weblinks_cat[$catid_i] = array(
        'catid' => $catid_i,
        'parentid' => $parentid_i,
        'title' => $title_i,
        'alias' => $alias_i,
        'link' => $link_i,
        'description' => $description_i,
        'keywords' => $keywords_i,
        'catimage' => $catimage_i,
        'count_link' => $count_link );

    if ($alias_cat_url == $alias_i) {
        $catid = $catid_i;
        $parentid = $parentid_i;
    }

    //Xac dinh RSS
    if ($module_info['rss']) {
        $rss[] = array( 'title' => $module_info['custom_title'] . ' - ' . $title_i, 'src' => NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=' . $module_info['alias']['rss'] . '/' . $alias_i );
    }
}
unset($sql, $result);

$count_op = sizeof($array_op);
$per_page = $weblinks_config['per_page'];
$page = 1;

if (! empty($array_op)) {
    if ($catid == 0) {
        if (substr($array_op[0], 0, 10) == 'visitlink-') {
            $op = 'visitlink';
        } elseif (substr($array_op[0], 0, 11) == 'reportlink-') {
            $op = 'reportlink';
        }
        $temp = explode('-', $array_op[0]);
        $id = intval(end($temp));
    } else {
        $op = 'main';
        if ($count_op == 1 or substr($array_op[1], 0, 5) == 'page-') {
            $op = 'viewcat';
            if ($count_op > 1) {
                $page = intval(substr($array_op[1], 5));
            }
        } elseif ($count_op == 2) {
            $array_page = explode('-', $array_op[1]);
            $id = intval(end($array_page));
            $alias_url = str_replace('-' . $id, '', $array_op[1]);
            if ($id > 0 and $alias_url != '') {
                $op = 'detail';
            }
        }
        $parentid = $catid;
        while ($parentid > 0) {
            $array_cat_i = $global_weblinks_cat[$parentid];
            $array_mod_title[] = array(
                'catid' => $parentid,
                'title' => $array_cat_i['title'],
                'link' => $array_cat_i['link'] );
            $parentid = $array_cat_i['parentid'];
        }
        sort($array_mod_title, SORT_NUMERIC);
    }
}
