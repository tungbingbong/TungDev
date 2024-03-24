 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Authentication.aspx.cs" Inherits="AND_travels.WebPages.Authentication" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login/SignUp</title>
    <link href="../Styles/Authentication.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
      <div class="mobile-view">
          <h1 style="color:#F22F08;margin-top:200px;">Ooopss.....!</h1><br><br>
          <h4>We are not Available in this resolution. Please Go with Our <a href="https://play.google.com/store?hl=en" target="_blank">Mobile App.</a></h4>

    </div>

        <nav>
        <div>
        <ul class="brand">
          <li class="repo"><a href="index.aspx" style="font-size:25px;margin-left:50px;">&</a></li>
          <li class="left"><a href="#">Bus Tickets</a></li>
          <li class="left"><a href="#">Hotels</a></li>
          <li class="left"><a href="#">Tour Packages</a></li>
          <li class="right dropdown" style="margin-right:100px;"><a href="#" class="dropbtn"><i class="fas fa-user-circle large"></i>&nbsp;&nbsp;<i class="fas fa-caret-down"></i></a>
            <div class="dropdown-content">
              <p>Existing User</p>
              <a href="Authentication.aspx">Login</a>
              <p>New User</p>
              <a href="Authentication.aspx">SignUp</a>
              </div>
          </li>
          <li class="right dropdown"><a href="#" class="dropbtn">Manage Booking&nbsp;&nbsp;<i class="fas fa-caret-down"></i></a>
            <div class="dropdown-content">
              <p>Bus Tickets</p>
              <a href="#">CancelTicket</a>
              <a href="#">PrintTicket</a>
              <p>Hotel Tickets</p>
              <a href="#">Cancel/Refund</a>
            </div>
          </li>
          <li class="right"><a href="#">Help</a></li>
        </ul>
      </div>
      </nav>
    
    <center>
        <div id="block5">
         <br />
    <table>
      <tr>
        <td class="right-border" style="padding-right:50px;">
         
            <table>
                <tr>
                    <td colspan="2" style="text-align:center;"><h1>Login</h1><br /></td>
                </tr>
                <tr>
                    <td style="float:right;">
                        <asp:Label ID="lblUserName" runat="server" Text="Email or Phone Number :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbUserName" runat="server" Columns="23" style="color:#F22f08;"></asp:TextBox>
                    </td>
                </tr>        
                <tr>
                    <td></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="tbUserName" ValidationGroup="grpLogin" ErrorMessage="Please Enter UserName " ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="float:right;">
                        <asp:Label ID="lblPassword" runat="server" Text="Password : "></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbPassword" runat="server" TextMode="Password" Columns="23" style="color:#F22f08;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="tbPassword" ValidationGroup="grpLogin" ErrorMessage="Please Enter Password " ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:CheckBox ID="chkRemember" runat="server" Text="  Remember Me" /></td>
                </tr>
                <tr>
                    <td><asp:LinkButton ID="lnkbtnForgetPassword" runat="server" Text="ForgetPassword" OnClick="lnkbtnForgetPassword_Click"></asp:LinkButton></td> 
                    <td><br /><asp:LinkButton ID="lnkbtnLogin" runat="server" Text="Login" CssClass="btnLogin" ValidationGroup="grpLogin" OnClick="lnkbtnLogin_Click"></asp:LinkButton></td>
                </tr>
            </table>
        </td>
        <td style="padding-left:50px;">
            
            <table>
                <tr>
                    <td colspan="3" style="text-align:center;"><h1>SignUp</h1><br /></td>
                </tr>
                <tr>
                    <td style="float:right;">
                        <asp:Label ID="lblName" runat="server" Text="Name : "></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbName" runat="server" Columns="27" style="color:#F22f08;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="tbName" ValidationGroup="grpSignUp" ErrorMessage=" *" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="float:right;">
                        <asp:Label ID="lblEmail" runat="server" Text="Email : "></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbEmail" runat="server" TextMode="Email" Columns="27" style="color:#F22f08;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="tbEmail" ValidationGroup="grpSignUp" ErrorMessage=" *" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Email is Not Valid" ControlToValidate="tbEmail" ValidationGroup="grpSignUp" ForeColor="Red" Font-Bold="true" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="float:right;">
                        <asp:Label ID="Label1" runat="server" Text="Mo. No. : "></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbMobile" runat="server" Columns="27" style="color:#F22f08;" onkeypress='validate(event)'></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="tbMobile" ValidationGroup="grpSignUp" ErrorMessage=" *" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revMobile" runat="server" ControlToValidate="tbMobile" ValidationGroup="grpSignUp" ErrorMessage="Invalid Mobile" ForeColor="Red" Font-Bold="true" ValidationExpression="^[6-9]\d{9}$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="float:right;">
                        <asp:Label ID="lblSignUpPassword" runat="server" Text="Password : "></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbSignUpPassword" runat="server" TextMode="Password" Columns="27" style="color:#F22f08;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvSignUpPassword" runat="server" ControlToValidate="tbSignUpPassword" ValidationGroup="grpSignUp" ErrorMessage=" *" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="float:right;">
                        <asp:Label ID="lblSignUpConfirmPassword" runat="server" Text="Confirm Password : "></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbSignUpConfirmPassword" runat="server" TextMode="Password" Columns="27" style="color:#F22f08;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvSignUpConfirmPassword" runat="server" ControlToValidate="tbSignUpConfirmPassword" ValidationGroup="grpSignUp" ErrorMessage=" *" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvPassword" runat="server" ControlToCompare="tbSignUpPassword" ControlToValidate="tbSignUpConfirmPassword" ValidationGroup="grpSignUp" ErrorMessage="Password is Not Same" ForeColor="Red" Font-Bold="true"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2"><br />
                        <asp:LinkButton ID="lnkbtnSignUp" runat="server" Text="SignUp" CssClass="btnSignUp" ValidationGroup="grpSignUp" OnClick="lnkbtnSignUp_Click"></asp:LinkButton>
                    </td>
                </tr>
            </table>


        </td>
      </tr>
    </table>
  </div>
      <br />
      <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
      <br /><br /><br />
        </center>
    </form>
</body>
</html>
