<%@ Page Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true"
    CodeBehind="UserDetails.aspx.cs"
    Inherits="HotelManagementProject.UserDetails" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

<style>
    body {
        font-family: 'Segoe UI', sans-serif;
    }

    .reg-bg {
        background: url('Family-at-5-star-hotel.jpg') no-repeat center center;
        background-size: cover;
        min-height: 100vh;
        padding: 40px 20px;
    }

    .reg-box {
        background: rgba(0,0,0,0.82);
        border-radius: 15px;
        padding: 35px;
        width: 95%;
        max-width: 1100px;
        margin: auto;
        box-shadow: 0 0 25px gold;
        overflow-x: auto;
        color: white;
    }

    .reg-box h2 {
        text-align: center;
        color: gold;
        margin-bottom: 20px;
        font-size: 26px;
    }

    /* GRID TABLE */
    .reg-box table {
        width: 100%;
        border-collapse: collapse;
        font-size: 14px;
        min-width: 900px;
    }

    .reg-box table th {
        background: rgba(255,215,0,0.2);
        color: gold;
        padding: 10px;
        border-bottom: 1px solid #555;
    }

    .reg-box table td {
        padding: 10px;
        border-bottom: 1px solid #333;
        color: #ddd;
    }

    .reg-box table tr:hover {
        background: rgba(255,255,255,0.05);
    }

    /* ⭐ FINAL BUTTON FIX (WORKING 100%) */
    .reg-box table input,
    .reg-box table button,
    .reg-box table a {
        padding: 2px 6px !important;
        font-size: 11px !important;
        font-weight: 600;
        border-radius: 4px;
        border: none;
        cursor: pointer;
        margin: 2px;
        color: white !important;
        text-decoration: none;
        display: inline-block;
    }

    /* Colors */
    .reg-box table input[value="Edit"],
    .reg-box table a { background: #3a8add !important; }

    .reg-box table input[value="Save"] { background: #28a745 !important; }
    .reg-box table input[value="Cancel"] { background: #6c757d !important; }
    .reg-box table input[value="Delete"] { background: #c0392b !important; }

    /* Edit mode textbox */
    .reg-box table td input[type="text"] {
        padding: 4px;
        border-radius: 4px;
        border: 1px solid gold;
        width: 140px;
    }

    /* Bottom button */
    #btnHotel {
        display: block;
        margin: 25px auto 0 auto;
        padding: 12px 25px;
        background: gold;
        color: #222;
        border: none;
        border-radius: 8px;
        font-size: 15px;
        font-weight: bold;
        cursor: pointer;
    }

    #btnHotel:hover {
        background: #e5c400;
    }

</style>

<div class="reg-bg">
    <div class="reg-box">

        <h2>User Details</h2>

        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="Id"
            OnRowEditing="GridView1_RowEditing"
            OnRowUpdating="GridView1_RowUpdating"
            OnRowCancelingEdit="GridView1_RowCancelingEdit"
            OnRowDeleting="GridView1_RowDeleting">

            <Columns>

                <asp:CommandField
                    ShowEditButton="True"
                    ShowDeleteButton="True"
                    EditText="Edit"
                    UpdateText="Save"
                    CancelText="Cancel"
                    DeleteText="Delete"
                    ButtonType="Button" />

                <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" Visible="False" />

                <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                <asp:BoundField DataField="UserName" HeaderText="Username" ReadOnly="True" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" />
                <asp:BoundField DataField="Address" HeaderText="Address" />
                <asp:BoundField DataField="Age" HeaderText="Age" />
                <asp:BoundField DataField="Languages" HeaderText="Languages" />
                <asp:BoundField DataField="Country" HeaderText="Country" />

            </Columns>

        </asp:GridView>

       

    </div>
</div>

</asp:Content>