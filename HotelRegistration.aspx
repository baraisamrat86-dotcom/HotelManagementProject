<%@ Page Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" 
CodeBehind="HotelRegistration.aspx.cs" 
Inherits="HotelManagementProject.HotelRegistration" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

<style>
    header, nav, footer {
        display: none !important;
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