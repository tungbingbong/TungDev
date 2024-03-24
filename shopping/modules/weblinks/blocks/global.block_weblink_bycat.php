<?php

/**
 * @Project NUKEVIET 4.x
 * @Author VINADES.,JSC (contact@vinades.vn)
 * @Copyright (C) 2014 VINADES.,JSC. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate Sat, 10 Dec 2011 06:46:54 GMT
 */

if( ! defined( 'NV_MAINFILE' ) )
{
	die( 'Stop!!!' );
}

if( ! nv_function_exists( 'nv_block_weblinks_bycat' ) )
{
	function nv_block_config_weblinks_bycat( $module, $data_block, $lang_block )
	{
		global $nv_Cache, $site_mods;

		$html = '<tr>';
		$html .= '<td>' . $lang_block['catid'] . '</td>';
		$sql = 'SELECT * FROM ' . NV_PREFIXLANG . '_' . $site_mods[$module]['module_data'] . '_cat ORDER BY weight ASC';
		$list = $nv_Cache->db( $sql, '', $module );
		$html .= '<td>';
		foreach( $list as $l )
		{
			$xtitle_i = '';

			if( $l['lev'] > 0 )
			{
				for( $i = 1; $i <= $l['lev']; ++$i )
				{
					$xtitle_i .= '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				}
			}
			$html .= $xtitle_i . '<label><input type="checkbox" name="config_catid[]" value="' . $l['catid'] . '" ' . ( ( in_array( $l['catid'], $data_block['catid'] ) ) ? ' checked="checked"' : '' ) . '</input>' . $l['title'] . '</label><br />';
		}
		$html .= '</td>';
		$html .= '</tr>';
		$html .= '<tr>';
		$html .= '<td>' . $lang_block['numrow'] . '</td>';
		$html .= '<td><input type="text" class="form-control w200" name="config_numrow" size="5" value="' . $data_block['numrow'] . '"/></td>';
		$html .= '</tr>';

		return $html;
	}

	function nv_block_config_weblinks_bycat_submit( $module, $lang_block )
	{
		global $nv_Request;
		$return = array();
		$return['error'] = array();
		$return['config'] = array();
		$return['config']['catid'] = $nv_Request->get_array( 'config_catid', 'post', array() );
		$return['config']['numrow'] = $nv_Request->get_int( 'config_numrow', 'post', 0 );
		return $return;
	}

	function nv_block_weblinks_bycat( $block_config )
	{
		global $nv_Cache, $module_weblinks_cat, $module_info, $site_mods, $module_config, $global_config, $db;
		$module = $block_config['module'];
 
		if( empty( $block_config['catid'] ) )
		{
			return '';
		}

		$catid = implode( ',', $block_config['catid'] );

		$db->sqlreset()->select( 'id, catid, title, alias, url, gia_1, mieuta_gia_1, gia_2, mieuta_gia_2, gia_3, mieuta_gia_3, description, urlimg' )->from( NV_PREFIXLANG . '_' . $site_mods[$module]['module_data'] . '_rows' )->where( 'status= 1 AND catid IN(' . $catid . ')' )->order( 'add_time ASC' )->limit( $block_config['numrow'] );
		$list = $nv_Cache->db( $db->sql(), '', $module );

		if( ! empty( $list ) )
		{
			if( file_exists( NV_ROOTDIR . '/themes/' . $global_config['module_theme'] . '/modules/weblinks/global.block_weblinks_bycat.tpl' ) )
			{
				$block_theme = $global_config['module_theme'];
			}
			else
			{
				$block_theme = 'default';
			}

			$xtpl = new XTemplate( 'global.block_weblinks_bycat.tpl', NV_ROOTDIR . '/themes/' . $block_theme . '/modules/weblinks' );
			$xtpl->assign( 'NV_BASE_SITEURL', NV_BASE_SITEURL );
			$xtpl->assign( 'TEMPLATE', $block_theme );

			foreach( $list as $l )
			{
				$l['link'] = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module . '&amp;' . NV_OP_VARIABLE . '=' . $module_weblinks_cat[$l['catid']]['alias'] . '/' . $l['alias'] . '-' . $l['id'] . $global_config['rewrite_exturl'];
				//$l['urlimg'] = NV_BASE_SITEURL . NV_FILES_DIR . '/' . $site_mods[$module]['module_upload'] . '/' . $l['urlimg'];
				$l['urlimg'] = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $l['urlimg'];

				$xtpl->assign( 'LOOP', $l );

				$xtpl->parse( 'main.loop' );
			}

			$xtpl->parse( 'main' );
			return $xtpl->text( 'main' );
		}
	}
}
if( defined( 'NV_SYSTEM' ) )
{
	global $nv_Cache, $site_mods, $module_name, $global_weblinks_cat, $module_weblinks_cat;
	$module = $block_config['module'];
	if( isset( $site_mods[$module] ) )
	{
		if( $module == $module_name )
		{
			$module_weblinks_cat = $global_weblinks_cat;
			unset( $module_weblinks_cat[0] );
		}
		else
		{
			$module_weblinks_cat = array();
			$sql = 'SELECT catid, parentid, title, description, catimage, alias, keywords FROM ' . NV_PREFIXLANG . '_' . $site_mods[$module]['module_data'] . '_cat ORDER BY weight ASC';
			$list = $nv_Cache->db( $sql, 'catid', $module );
			if( ! empty( $list ) )
			{
				foreach( $list as $l )
				{
					$module_weblinks_cat[$l['catid']] = $l;
					$module_weblinks_cat[$l['catid']]['link'] = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module . '&amp;' . NV_OP_VARIABLE . '=' . $l['alias'];
				}
			}
		}
		$content = nv_block_weblinks_bycat( $block_config );
	}
}
