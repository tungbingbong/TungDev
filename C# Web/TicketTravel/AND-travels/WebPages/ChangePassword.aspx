<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="AND_travels.WebPages.ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ChangePassword </title>
    <style>
        *{font-family:'Segoe ui'; }
        #lnkbtnChange{
            color:#F22F08;
            padding:10px 20px;
            border:1px solid #F22F08;
            text-decoration:none;
            transition:0.5s all;
        }
        #lnkbtnChange:hover{
            border-radius:20px;
        }
        table tr td{
            padding:10px;
        }
        #tbPassword,#tbConfirmPassword{
            padding:10px;
            color:#F22F08;
            font-weight:bold;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br /><br /><br />
            <Center>
                <h1>ChangePassword :- </h1><br /><br />
                <table>
                    <tr>
                        <td style="float:right;"><asp:Label ID="lblPassword" runat="server" Text="Password :"></asp:Label></td>
                        <td><asp:TextBox ID="tbPassword" runat="server" TextMode="Password"></asp:TextBox></td>
                        <td><asp:RequiredFieldValidator ID="rfvPasswordCheck" runat="server" ControlToValidate="tbPassword" ValidationGroup="grpChange" ErrorMessage=" *" ForeColor="Red"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td style="float:right;"><asp:Label ID="lblConfirmPassword" runat="server" Text="ConfirmPassword :"></asp:Label></td>
                        <td><asp:TextBox ID="tbConfirmPassword" runat="server" TextMode="Password"></asp:TextBox></td>
                        <td><asp:RequiredFieldValidator ID="rfvPasswordConfirm" runat="server" ControlToValidate="tbConfirmPassword" ValidationGroup="grpChange" ErrorMessage=" *" ForeColor="Red"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><asp:CompareValidator ID="cmpPasswords" runat="server" ControlToCompare="tbPassword" ControlToValidate="tbConfirmPassword" ValidationGroup="grpChange" ErrorMessage="Passwords Are not Same..!" Font-Bold="true" ForeColor="Red"></asp:CompareValidator></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><asp:LinkButton ID="lnkbtnChange" runat="server" Text="Change" ValidationGroup="grpChange" OnClick="lnkbtnChange_Click"></asp:LinkButton></td>
                    </tr>
                    <tr>
                        <td colspan="2"><asp:Label ID="lblMessege" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label></td>
                    </tr>
                </table>
            </Center>
    </div>
    </form>
</body>
</html>
