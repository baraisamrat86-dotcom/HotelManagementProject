<%@ Page Language="C#" MasterPageFile="~/SiteMaster.master"
    AutoEventWireup="true"
    CodeBehind="Login.aspx.cs"
    Inherits="HotelManagementProject.Login" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

<style>
    header, nav, footer {
        display: none !important;
    }
</style>

<div class="reg-bg">
    <div class="reg-box">
        <h2>User Login</h2>
        <label>Username</label>
        <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
        <br /><br />
        <label>Password</label>
        <asp:TextBox ID="txtPass"
            runat="server"
            TextMode="Password">
        </asp:TextBox>
        <br /><br />
        <asp:Button ID="btnLogin"
            runat="server"
            Text="Login"
            OnClick="btnLogin_Click" />
        <br /><br />
        <asp:Label ID="lblMsg"
            runat="server"
            ForeColor="Red">
        </asp:Label>
    </div>
</div>
</asp:Content>