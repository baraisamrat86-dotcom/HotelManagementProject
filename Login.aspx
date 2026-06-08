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
        width: 500px;
        padding: 30px;
        background: rgba(0,0,0,0.80);
        border: 1px solid #d4af37;
        border-radius: 20px;
        box-shadow: 0 0 10px rgba(212,175,55,0.5);
        color: white;
    }

    .login-box h2 {
        text-align: center;
        color: gold;
        margin-bottom: 20px;
    }

    .login-box label {
        display: block;
        color: white;
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 5px;
    }

    .login-box input[type=text],
    .login-box input[type=password] {
        width: 100%;
    }

    .msg {
        display: block;
        text-align: center;
        font-weight: bold;
        margin-top: 10px;
    }
</style>

<div class="login-container">
    <div class="login-box">

        <!-- Fake fields -->
        <input type="text" name="fakeusernameremembered" style="display:none;" />
        <input type="password" name="fakepasswordremembered" style="display:none;" />

        <h2>User Login</h2>

        <label>Username</label>
        <asp:TextBox ID="txtUser"
            runat="server"
            AutoCompleteType="Disabled">
        </asp:TextBox>

        <br /><br />

        <label>Password</label>
        <asp:TextBox ID="txtPass"
            runat="server"
            TextMode="Password"
            AutoCompleteType="Disabled">
        </asp:TextBox>

        <br /><br />

        <asp:Button ID="btnLogin"
            runat="server"
            Text="Login"
            OnClick="btnLogin_Click" />

        <br /><br />

        <asp:Label ID="lblMsg"
            runat="server"
            CssClass="msg"
            ForeColor="Red">
        </asp:Label>

    </div>
</div>

</asp:Content>