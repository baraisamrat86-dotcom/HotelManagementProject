<%@ Page Title=""
Language="C#"
MasterPageFile="~/SiteMaster.master"
AutoEventWireup="true"
CodeBehind="Home.aspx.cs"
Inherits="HotelManagementProject.Home" %>

<asp:Content ID="Content1"
runat="server"
ContentPlaceHolderID="ContentPlaceHolder1">

    <h2>Login Page</h2>

Username

<br />

<asp:TextBox ID="txtUser"
runat="server">
</asp:TextBox>

<br /><br />

Password

<br />

<asp:TextBox ID="txtPass"
runat="server"
TextMode="Password">
</asp:TextBox>

<br /><br />

<asp:Button ID="btnLogin"
runat="server"
Text="Login"
PostBackUrl="~/Login.aspx"/>

<br /><br />

<asp:Button ID="btnRegister"
runat="server"
Text="New User Registration"
PostBackUrl="~/Registration.aspx"/>

</asp:Content>