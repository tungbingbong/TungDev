<?php

/**
 * @Project NUKEVIET 4.x
 * @Author KENNY NGUYEN (nguyentiendat713@gmail.com) 
 * @Copyright (C) 2015 tradacongnghe.com. All rights reserved
 * @Based on NukeViet CMS 
 * @License GNU/GPL version 2 or any later version
 * @Createdate  Wed, 21 Jan 2015 14:00:59 GMT
 */
 

if ( ! defined( 'NV_MAINFILE' ) ) die( 'Stop!!!' );

$lang_translator['author'] = 'VINADES.,JSC (contact@vinades.vn)';
$lang_translator['createdate'] = '22/07/2013, 21:41';
$lang_translator['copyright'] = '@Copyright (C) 2013 VINADES.,JSC. All rights reserved';
$lang_translator['info'] = '';
$lang_translator['langtype'] = 'lang_module';

$lang_module['save']='Lưu lại';
$lang_module['delete']='Xóa';
$lang_module['edit']='Sửa';
$lang_module['weight']='Thứ tự';
$lang_module['cancel']='Hủy';
$lang_module['search']='Tìm kiếm';
$lang_module['defaults']='Mặc định';
$lang_module['enable']='Bật';
$lang_module['disabled']='Tắt';
$lang_module['status']='Trạng thái';
$lang_module['action']='Thao tác';
$lang_module['add_new']='Thêm mới';
$lang_module['general']='Thông tin chung';
$lang_module['create_alias']='Tạo liên kết tĩnh';
$lang_module['delete_sign']='Xóa bỏ dấu, kí tự đặc biệt';
$lang_module['please_select_one']='Hãy chọn một dòng để thực hiện';
$lang_module['check_form']='Bạn hãy kiểm tra cá tab, trường dữ liệu gây ra lỗi';
$lang_module['confirm']='Lỗi: Nếu thực hiện thao tác này bạn sẽ không thể phục hồi lại dữ liệu. Bạn có chắc chắc muốn xoá ?';
$lang_module['require_category'] = 'Vui lòng tạo chuyên mục trước';

$lang_module['inhome_0'] = 'Tắt';
$lang_module['inhome_1'] = 'Mở';

$lang_module['status_0'] = 'Tắt';
$lang_module['status_1'] = 'Mở';


/*function category*/
$lang_module['category']='Quản lý chuyên mục';
$lang_module['category_list']='Danh sách chuyên mục';
$lang_module['category_add']='Thêm chuyên mục';
$lang_module['category_edit']='Sửa chuyên mục';
$lang_module['category_name']='Tên chuyên mục';
$lang_module['category_alias']='Liên kết tĩnh';
$lang_module['category_inhome']='Trang chủ';
$lang_module['category_status']='Trạng thái';
$lang_module['category_show_inhome']='Hiển thị trang chủ';
$lang_module['category_show_status']='Trạng thái kích hoạt';
$lang_module['category_viewcat']='Phương án hiển thị';
$lang_module['category_numlinks']='Số liên kết';
$lang_module['category_description']='Mô tả';
$lang_module['category_meta_title']='Thẻ Meta title';
$lang_module['category_meta_description']='Thẻ Meta description';
$lang_module['category_meta_keyword']='Thẻ keywords';
$lang_module['category_sub_sl']='Là chuyên mục chính';
$lang_module['category_layout']='Giao diện chuyên mục';
$lang_module['category_viewcat_grid']='Hiển thị dạng lưới';
$lang_module['category_insert_success']='Thêm Chuyên mục thành công';
$lang_module['category_update_success']='Cập nhật Chuyên mục thành công';
$lang_module['category_delete_success']='Chuyên mục đã xoá thành công';
  
$lang_module['category_error_album']='Lỗi: Không thể xoá. chuyên mục này đang được sử dụng ở %s Album';
$lang_module['category_error_name']='Lỗi: Tên chuyên mục không được để trống';
$lang_module['category_error_meta_title']='Lỗi: Thẻ meta title không được để trống';
$lang_module['category_error_warning']='Lỗi: Hãy kiểm tra các trường thông báo lỗi';
$lang_module['category_error_save']='Lỗi: Không cập nhật được nội dung. Tên chuyên mục có thể bị trùng';
$lang_module['duplicate_alias']='Lỗi: Alias có thể bị trùng';
/*function category*/ 

/*function album*/
$lang_module['album']='Quản lý khách hàng';
$lang_module['album_list']='Danh sách khách hàng';
$lang_module['album_add']='Thêm khách hàng';
$lang_module['album_edit']='Sửa khách hàng';
$lang_module['album_name']='Tên Khách hàng';
$lang_module['album_alias']='Liên kết tĩnh';
$lang_module['album_category']='Chuyên mục';
$lang_module['album_category_select']='Chọn chuyên mục';
$lang_module['album_num_photo']='Số ảnh';
$lang_module['album_status']='Trạng thái';
$lang_module['album_date_added']='Ngày thêm';
$lang_module['album_folder']='Thư mục chứa ảnh';
$lang_module['album_description']='Mô tả';
$lang_module['album_meta_title']='Thẻ Meta title';
$lang_module['album_meta_description']='Thẻ Meta description';
$lang_module['album_meta_keyword']='Thẻ keywords';
$lang_module['album_layout']='Giao diện khách hàng';
$lang_module['album_model']='Kiểu mẫu';
$lang_module['album_capturedate']='Ngày thiết kế';
$lang_module['album_capturelocal']='Địa điểm';
$lang_module['album_show_status']='Trạng thái kích hoạt';
$lang_module['album_image']='Upload ảnh';
$lang_module['album_info_image']='Thông tin ảnh';
$lang_module['album_next_step']='Bước kế tiếp';
$lang_module['album_step_1']='Bước 1: Tạo Khách hàng';
$lang_module['album_step_2']='Bước 2: Chọn và tải ảnh';
$lang_module['album_step_3']='Bước 3: Cập nhật thông tin ảnh';
$lang_module['album_upload_require']='Bạn đang sử dụng trình duyệt không hỗ trợ ít nhất: HTML5, Flash hay Silverlight.<br/> Vui lòng nâng cấp lên trình duyệt có hỗ trợ một trong các yêu cầu trên';
$lang_module['album_allow_rating']='Cho phép đánh giá';
$lang_module['album_allow_comment']='Cho phép bình luận';


$lang_module['album_error_name']='Lỗi: Tên khách hàng không được để trống';
$lang_module['album_error_folder']='Lỗi: Tên thư mục lưu ảnh không được để trống';
$lang_module['album_error_category']='Lỗi: Bạn chưa chọn chuyên mục';
$lang_module['album_error_meta_title']='Lỗi: Thẻ meta title không được để trống';
$lang_module['album_error_warning']='Lỗi: Hãy kiểm tra các trường thông báo lỗi';
$lang_module['album_error_save']='Lỗi: Không cập nhật được nội dung. Tên album có thể bị trùng';
$lang_module['album_error_create_folder']='Lỗi: không tạo được thư mục lưu ảnh. Hãy kiểm tra lại việc Chmod hệ thống';
$lang_module['album_error_defaults']='Lỗi: Bạn phải chọn một ảnh đại diện cho khách hàng';
$lang_module['album_error_copy_photo'] = 'Lỗi di chuyển ảnh';
$lang_module['album_error_mime'] = 'Định dạng ảnh không xác định';
$lang_module['album_success_delete'] = 'Khách hàng đã được xoá thành công';
$lang_module['album_error_delete'] = 'Không có khách nào được xoá';
/*function album*/
 
/*photo*/
$lang_module['photo_defaults']='Chọn làm ảnh đại diện khách hàng';
$lang_module['photo_name']='Tên ảnh';
$lang_module['photo_description']='Mô tả ảnh';
$lang_module['photo_success_delete']='Xoá ảnh thành công';
$lang_module['photo_error_delete']='Lỗi bảo mật ảnh này không thể xoá';
$lang_module['photo_error_delete']='Lỗi bảo mật ảnh này không thể xoá';

 
/*setting */
$lang_module['setting']='Cấu hình';
$lang_module['setting_module_display']='Cấu hình hiển thị Module';
$lang_module['setting_module_addition']='Cấu hình bổ sung';

$lang_module['setting_origin_size']='Kích thước ảnh gốc (WidthxHeight)';
$lang_module['setting_cr_thumb_size']='Kích thước tự tạo ảnh Thumbs (WidthxHeight)';
$lang_module['setting_cr_thumb_quality']='Chất lượng ảnh';
$lang_module['setting_home_view']='Phương án hiển thị khách hàng tại trang chủ';
$lang_module['setting_home_layout']='Giao diện trang chủ (layout)';
$lang_module['setting_album_view']='Phương án hiển thị ảnh thuộc khách hàng';
$lang_module['setting_per_line']='Hiển thị trên một dòng';
$lang_module['setting_per_page_album']='Số khách hàng trên một trang';
$lang_module['setting_per_page_photo']='Số ảnh trên một trang';
$lang_module['setting_home_title_cut']='Ký tự cắt tiêu đề trang chủ';
$lang_module['setting_social_tool']='Kích hoạt công cụ MXH';
$lang_module['setting_fbappid']='Facebook App ID';
$lang_module['setting_active_logo']='Kích hoạt đóng dấu ảnh';
$lang_module['setting_logo']='Logo đóng dấu ảnh';
$lang_module['setting_autologosize1']='Nếu chiều rộng ảnh &lt; = 150px';
$lang_module['setting_autologosize2']='Nếu chiều rộng ảnh &gt; 150px, &lt; 350px';
$lang_module['setting_autologosize3']='Nếu chiều rộng ảnh &gt; = 350px';
$lang_module['setting_autologowidth']='Chiều rộng của logo bằng';
$lang_module['setting_autologosample']='Sử dụng nguyên kích thước logo, Kích thước tối đa của logo bằng ';
$lang_module['setting_structure_upload']='Thư mục lưu ảnh khách hàng';
$lang_module['setting_dir_album']='ten_album';
$lang_module['setting_max_size_upload']='Dung lượng tải lên';
$lang_module['setting_sys_max_size']='Dung lượng tối đa được phép tải lên';
$lang_module['setting_update_success']='Cập nhật cấu hình thành công';
$lang_module['home_view_grid_by_cat']='Hiển thị dạng lưới theo chuyên mục';
$lang_module['home_view_grid_by_album']='Hiển thị khách hàng theo dạng lưới';
$lang_module['album_view_slider']='Hiển thị dạng slider';
$lang_module['album_view_grid']='Hiển thị dạng lưới';
$lang_module['album_upload_author']='Người đăng';
$lang_module['album_last_modifier']='Chỉnh sửa';

