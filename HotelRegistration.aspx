<%@ Page Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" 
CodeBehind="HotelRegistration.aspx.cs" 
Inherits="HotelManagementProject.HotelRegistration" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

<style>
    header, nav, footer {
        display: none !important;
    }
</style>
    <style>
    header, nav, footer {
        display: none !important;
    }

    .reg-bg {
        background: url('Family-at-5-star-hotel.jpg') no-repeat center center;
        background-size: cover;
        min-height: 100vh;
        padding-top: 50px;
    }

    .reg-box {
        width: 450px;
        margin: auto;
        background: rgba(0,0,0,0.75);
        padding: 30px;
        border-radius: 15px;
        color: white;
        box-shadow: 0 0 20px gold;
    }

    .reg-box h2 {
        text-align: center;
        color: gold;
    }

    .reg-box label {
        display: block;
        margin-top: 10px;
        font-weight: bold;
    }

    .reg-box input[type=text],
    .reg-box input[type=password] {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border-radius: 5px;
        border: none;
    }

    #btnRegister {
        width: 100%;
        padding: 12px;
        margin-top: 20px;
        background: gold;
        border: none;
        border-radius: 5px;
        font-size: 18px;
        cursor: pointer;
    }
</style>

<div class="reg-bg">
    <div class="reg-box">
        <h2>Hotel Registration</h2>
        <label>Username</label>
        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
        <br /><br />
        <label>Room Type</label>
        <asp:RadioButtonList ID="rblRoom" runat="server">
            <asp:ListItem>Delux</asp:ListItem>
            <asp:ListItem>Ordinary</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <label>Amenities</label>
        <br />
        <asp:CheckBox ID="chkAC" runat="server" Text="AC" />
        <asp:CheckBox ID="chkComputer" runat="server" Text="Computer" />
        <br /><br />
        <asp:Button ID="btnRegister"
            runat="server"
            Text="Register"
            OnClick="btnRegister_Click" />
    </div>
</div>

</asp:Content>