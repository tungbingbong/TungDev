<?php

/**
 * @Project NUKEVIET 4.x
 * @Author VINADES.,JSC (contact@vinades.vn)
 * @Copyright (C) 2014 VINADES.,JSC. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate 2-9-2010 14:43
 */

if (! defined('NV_IS_FILE_ADMIN')) {
    die('Stop!!!');
}

$page_title = $lang_module['link_list'];

$xtpl = new XTemplate('main.tpl', NV_ROOTDIR . '/themes/' . $global_config['module_theme'] . '/modules/' . $module_file);
$xtpl->assign('LANG', $lang_module);
$xtpl->assign('FORM_ACTION', NV_BASE_ADMINURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=multidel');

$all_page = $db->query('SELECT COUNT(*) FROM ' . NV_PREFIXLANG . '_' . $module_data . '_rows')->fetchColumn();
if (empty($all_page)) {
    Header('Location: ' . NV_BASE_ADMINURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&' . NV_NAME_VARIABLE . '=' . $module_name . '&' . NV_OP_VARIABLE . '=content');
    exit();
}

$base_url = NV_BASE_ADMINURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&' . NV_NAME_VARIABLE . '=' . $module_name;
$per_page = 10;
$page = $nv_Request->get_int('page', 'get', 0);

$sql = 'SELECT * FROM ' . NV_PREFIXLANG . '_' . $module_data . '_rows ORDER BY id DESC LIMIT ' . $page . ', ' . $per_page;
$result = $db->query($sql);

while ($row = $result->fetch()) {
    $xtpl->assign('ROW', array(
        'id' => $row['id'],
        'title' => $row['title'],
		'gia_1' => $row['gia_1'],
		'mieuta_gia_1' => $row['mieuta_gia_1'],
		'gia_2' => $row['gia_2'],
		'mieuta_gia_2' => $row['mieuta_gia_2'],
		'gia_3' => $row['gia_3'],
		'mieuta_gia_3' => $row['mieuta_gia_3'],
        'url' => $row['url'],
        'hits_total' => $row['hits_total'],
        'status' => $row['status'] == 1 ? $lang_module['weblink_yes'] : $lang_module['weblink_no'],
        'url_edit' => NV_BASE_ADMINURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=content&amp;id=' . $row['id'],
        'url_delete' => NV_BASE_ADMINURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=del_link&amp;id=' . $row['id'] ));

    $xtpl->parse('main.loop');
}

$generate_page = nv_generate_page($base_url, $all_page, $per_page, $page);
if (! empty($generate_page)) {
    $xtpl->assign('GENERATE_PAGE', $generate_page);
    $xtpl->parse('main.generate_page');
}

$xtpl->parse('main');
$contents = $xtpl->text('main');

include NV_ROOTDIR . '/includes/header.php';
echo nv_admin_theme($contents);
include NV_ROOTDIR . '/includes/footer.php';
