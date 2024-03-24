<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loading.aspx.cs" Inherits="AND_travels.Loading" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Proccessing</title>
    <style>
        *{
            font-family:'Segoe UI';
        }
    </style>
    <meta http-equiv="Refresh" content="5;url=~/PrintTicket.aspx" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br /><br />
        <center>
            <h1 style="color:#ff0000;">Proccessing.........!</h1>
            <br />
            <image src="../Images/Loading.gif"></image>
            <p>We are Still working on your request. Please do not Close or Refresh your Page. For Continoius Payment.</p>
        </center>
    </div>
    </form>
</body>
</html>
