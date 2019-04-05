<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LaboGSB.Views.Home.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Connexion aux Labos GSB</title>
</head>
<body>
    <form id="form1" runat="server">

        <h2>Connexion</h2>

        <label>Adresse mel :</label>
         <input type="text" id="txt_AdrMel" />
        <label>Mot de passe : </label>&nbsp;
        <input type="text" id="txt_mdp" /><br />
        <input type="checkbox" id="chk_connexion" />
        <label>Connexion automatique</label>
        <a href="#">Mot de passe oublié ?</a>
        

        <asp:Button ID="Button1" runat="server" Text="Connexion" OnClick="Button1_Click" />



    </form>
</body>
</html>
