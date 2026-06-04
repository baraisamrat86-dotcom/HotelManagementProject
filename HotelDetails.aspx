<%@ Page Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true"
CodeBehind="HotelDetails.aspx.cs"
Inherits="HotelManagementProject.HotelDetails" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

<style>
    header, nav, footer {
        display: none !important;
    }
    .reg-bg {
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 40px 20px;
    }
    .reg-box {
        background: rgba(255,255,255,0.95);
        border-radius: 12px;
        padding: 40px 48px;
        width: auto;
        max-width: 95%;
        overflow-x: auto;
    }
    .reg-box h2 {
        text-align: center;
        color: #1a6fc4;
        margin-bottom: 24px;
    }
    .reg-box table {
        border-collapse: collapse;
        width: 100%;
        font-size: 14px;
        color: black !important;
    }
    .reg-box table th {
        background: #1a6fc4;
        color: white;
        padding: 10px 12px;
        text-align: left;
    }
    .reg-box table td {
        padding: 8px 12px;
        border-bottom: 1px solid #ddd;
        color: black !important;
    }
    .reg-box table tr:hover {
        background: #f0f6ff;
    }
    #lblWelcome {
        color: black !important;
    }
</style>

<div class="reg-bg">
    <div class="reg-box">
        <h2>Hotel Details</h2>
        <asp:Label ID="lblWelcome"
            runat="server"
            Font-Bold="true">
        </asp:Label>
        <br /><br />
        <asp:GridView ID="GridView1"
            runat="server">
        </asp:GridView>
    </div>
</div>

</asp:Content>