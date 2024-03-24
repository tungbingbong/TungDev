<?php

/**
 * @Project NUKEVIET 4.x
 * @Author VINADES.,JSC (contact@vinades.vn)
 * @Copyright (C) 2014 VINADES.,JSC. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate 2-10-2010 20:59
 */

if (! defined('NV_ADMIN')) {
    die('Stop!!!');
}

/**
 * Note:
 * 	- Module var is: $lang, $module_file, $module_data, $module_upload, $module_theme, $module_name
 * 	- Accept global var: $db, $db_config, $global_config
 */

$sth = $db->prepare("INSERT INTO " . $db_config['prefix'] . "_" . $lang . "_" . $module_data . "_department (full_name, alias, phone, fax, email, address, note, others, cats, admins, act, weight, is_default) VALUES (:full_name, :alias, :phone, :fax, :email, '', :note, :others, :cats, '1/1/1/0;', 1, :weight, :is_default)");

$full_name = 'Biệt thự';
$alias = 'biet-thu';
$phone = '0932.495.121[+84932495121]';
$fax = '0911.548.646';
$email = 'info@azvietco.vn';
$note = 'Bộ phận tiếp nhận xử lý theo chức năng, nhiệm vụ theo loại công trình Biệt thự';
$others = json_encode(array( 'viber' => 'myViber', 'skype' => 'mySkype', 'yahoo' => 'myYahoo'));
$cats = 'Tư vấn|Khiếu nại, phản ánh|Đề nghị hợp tác';
$weight = 1;
$is_default = 1;
$sth->bindParam(':full_name', $full_name, PDO::PARAM_STR, strlen($full_name));
$sth->bindParam(':alias', $alias, PDO::PARAM_STR, strlen($alias));
$sth->bindParam(':phone', $phone, PDO::PARAM_STR, strlen($phone));
$sth->bindParam(':fax', $fax, PDO::PARAM_STR, strlen($fax));
$sth->bindParam(':email', $email, PDO::PARAM_STR, strlen($email));
$sth->bindParam(':note', $note, PDO::PARAM_STR, strlen($note));
$sth->bindParam(':others', $others, PDO::PARAM_STR, strlen($others));
$sth->bindParam(':cats', $cats, PDO::PARAM_STR, strlen($cats));
$sth->bindValue(':weight', $weight, PDO::PARAM_INT);
$sth->bindValue(':is_default', $is_default, PDO::PARAM_INT);
$sth->execute();

$full_name = 'Nhà phố';
$alias = 'nha-pho';
$phone = '0932.495.121[+84932495121]';
$fax = '0911.548.646';
$email = 'info@azvietco.vn';
$note = 'Bộ phận tiếp nhận xử lý theo chức năng, nhiệm vụ theo loại công trình Nhà phố';
$others = json_encode(array( 'viber' => 'myViber2', 'skype' => 'mySkype2', 'yahoo' => 'myYahoo2'));
$cats = 'Tư vấn|Khiếu nại, phản ánh|Đề nghị hợp tác';
$weight = 2;
$is_default = 0;
$sth->bindParam(':full_name', $full_name, PDO::PARAM_STR, strlen($full_name));
$sth->bindParam(':alias', $alias, PDO::PARAM_STR, strlen($alias));
$sth->bindParam(':phone', $phone, PDO::PARAM_STR, strlen($phone));
$sth->bindParam(':fax', $fax, PDO::PARAM_STR, strlen($fax));
$sth->bindParam(':email', $email, PDO::PARAM_STR, strlen($email));
$sth->bindParam(':note', $note, PDO::PARAM_STR, strlen($note));
$sth->bindParam(':others', $others, PDO::PARAM_STR, strlen($others));
$sth->bindParam(':cats', $cats, PDO::PARAM_STR, strlen($cats));
$sth->bindValue(':weight', $weight, PDO::PARAM_INT);
$sth->bindValue(':is_default', $is_default, PDO::PARAM_INT);
$sth->execute();

$bodytext = 'Để không ngừng nâng cao chất lượng dịch vụ và đáp ứng tốt hơn nữa các yêu cầu của Quý khách, chúng tôi mong muốn nhận được các thông tin phản hồi. Nếu Quý khách có bất kỳ thắc mắc hoặc đóng góp nào, xin vui lòng liên hệ với chúng tôi theo thông tin dưới đây. Chúng tôi sẽ phản hồi lại Quý khách trong thời gian sớm nhất.';
$sth = $db->prepare("INSERT INTO " . NV_CONFIG_GLOBALTABLE . " (lang, module, config_name, config_value) VALUES ('vi', '" . $module_name . "', 'bodytext', :bodytext)");
$sth->bindParam(':bodytext', $bodytext, PDO::PARAM_STR, strlen($bodytext));
$sth->execute();
