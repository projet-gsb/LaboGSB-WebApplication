<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GSBHome.aspx.cs" Inherits="LaboGSB.Views.Home.GSBHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <title>Gestion des Comptes-Rendus</title>
</head>
<body>
    <h2>Gestion Compte-Rendu</h2>
    <form id="PageGSB" runat="server">
        <><asp:Menu ID="Menu1" runat="server" Height="140px" Width="143px" OnMenuItemClick="Menu1_MenuItemClick">
            <DynamicItemTemplate>
                <%# Eval("Text") %>
            </DynamicItemTemplate>
            <Items>
                <asp:MenuItem Text="Fichier" Value="Fichier">
                    <asp:MenuItem Text="se deconnecter" Value="se deconnecter"></asp:MenuItem>
                    <asp:MenuItem Text="Quitter" Value="Quitter"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="Outils" Value="Outils">
                    <asp:MenuItem Text="Recherche..." Value="Recherche...">
                        <asp:MenuItem Text="Contact" Value="Contact"></asp:MenuItem>
                        <asp:MenuItem Text="Entreprise" Value="Entreprise"></asp:MenuItem>
                        <asp:MenuItem Text="Ville" Value="Ville"></asp:MenuItem>
                    </asp:MenuItem>
                </asp:MenuItem>
            </Items>
        </asp:Menu>
        <asp:Label ID="Label1" runat="server" Text="Rechercher"></asp:Label>
        <br />
        <asp:TextBox ID="SearchBox" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="ButtonRecherche_Click" Text="Envoyer" />
&nbsp;<asp:Panel ID="Panel1" runat="server" Height="45px">
                
                     <asp:Button ID="ButtonCompteRendu" runat="server" Text="Compte-Rendu" Height="39px" OnClick="ButtonCompteRendu_Click" />
                
                 
                     <asp:Button ID="ButtonFormEtablissement" runat="server" Text="Ajouter Etablissement" OnClick="ButtonAjoutFormEtablissementClick" OnClientClick="Afficher formulaire établissement" />
                     <asp:Button ID="ButtonFormContact" runat="server" Text="Ajouter Contact" OnClick="ButtonFormContact_Click" />
                
                     <asp:Button ID="ButtonGestionFrais" runat="server" OnClick="ButtonGestionFrais_Click" style="margin-top: 0px" Text="Gestion fiche de frais" />
                
            </asp:Panel>
        </>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" Width="685px" style="margin-right: 3px">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="nom" HeaderText="nom" SortExpression="nom" />
                <asp:BoundField DataField="adresse" HeaderText="adresse" SortExpression="adresse" />
                <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                <asp:BoundField DataField="contact" HeaderText="contact" ReadOnly="True" SortExpression="contact" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT nom, adresse, type, STUFF((SELECT DISTINCT '\' + p.nom AS Expr1 FROM personne 
            INNER JOIN travailpour ON e.id = travailpour.idEtablissement INNER JOIN personne AS p ON travailpour.idContact = p.id 
            FOR XML PATH('')), 1, 1, '') AS contact FROM etablissement AS e" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
    </form>
</body>
</html>