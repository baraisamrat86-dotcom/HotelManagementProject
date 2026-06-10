<%@ Page Language="C#" MasterPageFile="~/SiteMaster.master"
    AutoEventWireup="true"
    CodeBehind="Login.aspx.cs"
    Inherits="HotelManagementProject.Login" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

<style>
    header, nav, footer {
        display: none !important;
    }

    .login-container {
        min-height: 80vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .login-box {
        width: 450px;
        padding: 30px;
        background: rgba(0,0,0,0.80);
        border: 1px solid #d4af37;
        border-radius: 20px;
        box-shadow: 0 0 12px rgba(212,175,55,0.6);
        color: white;
    }

    .login-box h2 {
        text-align: center;
        color: gold;
        margin-bottom: 20px;
    }

    .login-box label {
        display: block;
        font-size: 16px;
        font-weight: bold;
        margin-top: 10px;
    }

    .login-box input[type=text],
    .login-box input[type=password] {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border-radius: 5px;
        border: none;
    }

    .login-box button,
    .login-box input[type=submit],
    .login-box input[type=button] {
        width: 100%;
        padding: 10px;
        margin-top: 15px;
        background: gold;
        border: none;
        font-weight: bold;
        cursor: pointer;
        border-radius: 5px;
    }

    .msg {
        display: block;
        text-align: center;
        margin-top: 10px;
        font-weight: bold;
    }
</style>

<div class="login-container">
    <div class="login-box">

        <!-- Anti autofill -->
        <input type="text" style="display:none" autocomplete="username" />
        <input type="password" style="display:none" autocomplete="new-password" />

        <h2>User Login</h2>

        <label>Username</label>
        <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>

        <label>Password</label>
        <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>

        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />

        <asp:Label ID="lblMsg" runat="server" CssClass="msg" ForeColor="Red"></asp:Label>

    </div>
</div>

</asp:Content>