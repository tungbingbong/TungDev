<!-- BEGIN: main -->
<!-- BEGIN: error -->
<div class="alert alert-warning">{error}</div>
<!-- END: error -->
<div id="list_mods">
	<form action="{NV_BASE_ADMINURL}index.php" method="post" class="form-horizontal">
		<input type="hidden" name ="{NV_NAME_VARIABLE}" value="{MODULE_NAME}" />
		<input type="hidden" name ="{NV_OP_VARIABLE}" value="{OP}" />
		<input type="hidden" name ="id" value="{DATA.id}" />
		<input type="hidden" name ="save" value="1" />
		<div class="table-responsive">
			<table class="table table-striped table-bordered table-hover">
				<tbody>
					<tr>
						<td class="w150">{LANG.weblink_add_title} : </td>
						<td><input class="form-control w500" type="text" name="title" value="{DATA.title}" id="idtitle"/></td>
					</tr>
					<tr>
						<td>{LANG.alias} : </td>
						<td>
							<input id="idalias" class="form-control w500" name="alias" type="text" value="{DATA.alias}" maxlength="255" style="display:inline-block"/>
							&nbsp;<em class="fa fa-refresh fa-lg fa-pointer text-middle" onclick="get_alias();">&nbsp;</em>
						</td>
					</tr>
					<tr>
						<td>{LANG.weblink_add_url} : </td>
						<td><input class="form-control" name="url" id= "url" type="text" value="{DATA.url}" maxlength="255" /></td>
					</tr>
					<tr>
						<td>{LANG.weblink_add_parent} : </td>
						<td>
						<select class="form-control" name="catid">
							<!-- BEGIN: loopcat -->
							<option value="{CAT.catid}" {CAT.sl}>{CAT.title}</option>
							<!-- END: loopcat -->
						</select></td>
					</tr>
					<tr>
						<td>{LANG.weblink_add_image} : </td>
						<td>
							
							<div class="form-group">
								<div class="col-sm-10">
									<input class="form-control" type="text" name="urlimg" id="urlimg" value="{DATA.urlimg}"/>
								</div>
								<div class="col-sm-4">
									<input type="button" value="Browse server" name="selectimg" class="btn btn-info">
								</div>
							</div>
						</td>
					</tr>
                    <tr>
						<td class="w150">{LANG.gia_1} : </td>
						<td><input class="form-control w500" type="text" name="gia_1" value="{DATA.gia_1}" id="gia_1"/></td>
					</tr>
                    <tr>
						<td class="w150">{LANG.mieuta_gia_1} : </td>
						<td><input class="form-control w500" type="text" name="mieuta_gia_1" value="{DATA.mieuta_gia_1}" id="mieuta_gia_1"/></td>
					</tr>
                    <tr>
						<td class="w150">{LANG.gia_2} : </td>
						<td><input class="form-control w500" type="text" name="gia_2" value="{DATA.gia_2}" id="gia_2"/></td>
					</tr>
                    <tr>
						<td class="w150">{LANG.mieuta_gia_2} : </td>
						<td><input class="form-control w500" type="text" name="mieuta_gia_2" value="{DATA.mieuta_gia_2}" id="mieuta_gia_2"/></td>
					</tr>
                    <tr>
						<td class="w150">{LANG.gia_3} : </td>
						<td><input class="form-control w500" type="text" name="gia_3" value="{DATA.gia_3}" id="gia_3"/></td>
					</tr>
                    <tr>
						<td class="w150">{LANG.mieuta_gia_3} : </td>
						<td><input class="form-control w500" type="text" name="mieuta_gia_3" value="{DATA.mieuta_gia_3}" id="mieuta_gia_3"/></td>
					</tr>
					<tr>
						<td>{LANG.weblink_description} :</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2"> {DESCRIPTION} </td>
					</tr>
					<tr>
						<td>{LANG.weblink_inhome} : </td>
						<td><label><input name="status" type="checkbox" value="1" checked="{checked}" />{LANG.weblink_yes}</label></td>
					</tr>
					<tr>
						<td class="text-center" colspan="2"><input class="btn btn-primary" name="submit" style="width:80px;margin-left:110px" type="submit" value="{LANG.weblink_submit}" /></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</div>
<script type="text/javascript">
	//<![CDATA[
	$("input[name=selectimg]").click(function() {
		var area = "urlimg";
		var path = "{PATH}";
		var type = "image";
		nv_open_browse(script_name + "?" + nv_name_variable + "=upload&popup=1&area=" + area + "&path=" + path + "&type=" + type, "NVImg", 850, 420, "resizable=no,scrollbars=no,toolbar=no,location=no,status=no");
		return false;
	});
	
</script>
<!-- BEGIN: getalias -->
<script type="text/javascript">
	$("#idtitle").change(function() {
		get_alias();
	});
</script>
<!-- END: getalias -->
<!-- END: main -->