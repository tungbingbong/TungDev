﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="mod_add_edit_menu.ascx.cs" Inherits="admincp_modules_mod_menu_mod_add_edit_menu" %>
<%@Import Namespace = "System.Data" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<script type="text/javascript">
function clearForm()
{
    document.forms[0].reset();
    return false;
}

	</script>

<table bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
	<tbody>
		<tr>
			<td class="DarkText" style="background-position: center top; background-repeat: repeat-x; background-attachment: scroll;" align="center" background="images/bg_silver.gif" valign="top">
			
			<table class="main" cellpadding="0" cellspacing="0">
			<tr>
				<td>
				
				<!-- Body -->				
	            <table class="title" cellpadding="3" cellspacing="3">
                    <tr>
                        <td width="5%"><img border="0" src="images/icons/laguage.gif" align="bottom" class="icon" ></td>
                        <td width="95%"><span class="title">Quản trị danh mục tin tức</span></td>
                    </tr>    		
                </table>
                <table class="content">
                    <tr>
                        <td>
	                        <table class="header" cellpadding="0" cellspacing="0">
		                        <tr>
			                        <th>Thêm - Sửa thông tin danh mục</th>
		                        </tr>	
	                        </table>
	                        <table class="boder" cellSpacing="1" cellPadding="1">
		                        <tr>
			                        <td >
				                        <table width="100%">
					                        <tr>
						                        <td align="right" width="100%" valign="bottom">
						                        <a href="Default.aspx?page=menu&mod=menu" title="Danh sách danh mục"><img src="images/icons/list.gif" class="icon" ></a>&nbsp;&nbsp;&nbsp;
						                        <a href="#" onclick="window.location.reload();" title="{src_refresh}"><img src="images/icons/refresh.gif" class="icon" ></a>
						                        			</td>
					                        </tr>
				                        </table>
				                        <table class="form">
					                        <!-- BEGIN block_error -->
					                        <tr >
						                        <td></td>
						                        <td>
						                            <asp:Label ID="block_error" runat="server"></asp:Label>
						                        </td>
					                        </tr>
					                        <!-- END block_error -->
					                        <tr>
						                        <th>Tên Menu :<span class="note">*</span></th>
						                        <td><asp:TextBox runat="server" type="text" size="70" id="txtName"></asp:TextBox></td>
					                        </tr>
					                        <tr>
						                        <th>Liên kết :</th>
						                        <td><asp:TextBox runat="server" type="text" size="70" id="txtUrl"></asp:TextBox></td>
					                        </tr>
					                        <tr>
						                        <th>Icon :</th>
						                        <td>
						                        <select id="DrdCategoryIcon" runat="server" onchange="image.src = 'images/ThemeOffice/'+ ctl03$DrdCategoryIcon.value;">						                        
						                        </select>						                        
						                        <asp:Label runat="server" ID="lblIcon"></asp:Label>
						                        </td>
					                        </tr>
					                        <tr>
						                        <th>Danh mục cha :</th>
						                        <td><asp:DropDownList id="DrdCategory" runat="server"></asp:DropDownList></td>
					                        </tr>
                							
					                        <tr>
						                        <th valign="top">Thuộc tính :</th>
						                        <td>
						                        <asp:CheckBox id="ChkAdd" runat="server" Text=" Add"></asp:CheckBox>&nbsp;&nbsp;
						                        <asp:CheckBox id="ChkEdit" runat="server" Text=" Edit"></asp:CheckBox>&nbsp;&nbsp;
						                        <asp:CheckBox id="ChkDel" runat="server" Text=" Del"></asp:CheckBox>&nbsp;&nbsp;
						                        <asp:CheckBox id="ChkLock" runat="server" Text=" Lock"></asp:CheckBox>	  			                          
						                        </td>
					                        </tr>             												                        
				                        </table>
				                        <br>
				                        <table class="page">
					                        <tr>
						                        <td>
						                        <asp:Panel ID="PnAdd" runat="server">
				                                <input type="submit" class="button" runat="server" id="BtnSubmit" value="Thêm mới" onserverclick="BtnSubmit_ServerClick">			    
			                                    <input type="reset" value="Nhập lại" class="button">
					                        <input type="button" value="Quay lại" onclick="javascript:history.go(-1)" class="button">
			                                    </asp:Panel>
			                                    <asp:Panel ID="PnEdit" runat="server">
				                                <input type="submit" class="button" runat="server" id="BtnEdit" value="Sửa lại" onserverclick="BtnEdit_ServerClick">			    
			                                    <input type="reset" value="Nhập lại" class="button">
					                        <input type="button" value="Quay lại" onclick="javascript:history.go(-1)" class="button">
			                                    </asp:Panel>					                        
					                        
						                        </td>
					                        </tr>
				                        </table>
			                        </td>
		                        </tr>
	                        </table>
                        </td>
                    </tr>
                </table>
	           
				<!-- End body -->
				
				</td>
			</tr>
			</table>
			
			</td>
		</tr>
	</tbody>		
</table>