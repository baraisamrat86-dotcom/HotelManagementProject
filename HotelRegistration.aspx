<%@ Page Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeBehind="HotelRegistration.aspx.cs" Inherits="HotelManagementProject.HotelRegistration" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

<style>
    header, nav, footer { display: none !important; }
    body { font-family: 'Segoe UI', sans-serif; }

    .reg-bg {
        background: url('Family-at-5-star-hotel.jpg') no-repeat center center;
        background-size: cover;
        min-height: 100vh;
        padding: 40px 20px;
    }

    .reg-box {
        width: 480px;
        margin: 0 auto 30px auto;
        background: rgba(0,0,0,0.82);
        padding: 35px 30px;
        border-radius: 15px;
        color: white;
        box-shadow: 0 0 25px gold;
        box-sizing: border-box;
    }

    .reg-box h2 {
        text-align: center;
        color: gold;
        font-size: 26px;
        margin-bottom: 20px;
    }

    .reg-box label {
        display: block;
        margin-top: 14px;
        font-weight: 600;
        font-size: 14px;
        color: #ddd;
    }

    .reg-box input[type=text] {
        width: 100%;
        padding: 10px 12px;
        margin-top: 6px;
        border-radius: 6px;
        border: 1px solid #555;
        background: #fff8ee;
        font-size: 14px;
        color: #222;
        box-sizing: border-box;
    }

    .option-group { margin-top: 8px; }

    .option-item {
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 9px 14px;
        border: 1px solid #555;
        border-radius: 8px;
        cursor: pointer;
        font-size: 14px;
        color: #eee;
        margin-bottom: 6px;
    }

    .option-item:hover {
        background: rgba(255,215,0,0.1);
        border-color: gold;
    }

    .option-item input {
        accent-color: gold;
        width: 16px;
        height: 16px;
    }

    .edit-banner {
        background: rgba(255,215,0,0.12);
        border: 1px solid gold;
        border-radius: 6px;
        padding: 8px 12px;
        color: gold;
        font-size: 13px;
        text-align: center;
        margin-bottom: 14px;
    }

    .msg-success {
        background: rgba(40,167,69,0.2);
        border: 1px solid #28a745;
        border-radius: 6px;
        padding: 10px 14px;
        color: #90ee90;
        font-size: 14px;
        margin-bottom: 14px;
        text-align: center;
    }

    #btnRegister {
        width: 100%;
        padding: 12px;
        margin-top: 20px;
        background: gold;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        color: #222;
    }

    #btnRegister:hover { background: #e5c400; }

    #btnCancel {
        width: 100%;
        padding: 10px;
        margin-top: 8px;
        background: transparent;
        border: 1px solid #888;
        border-radius: 8px;
        font-size: 14px;
        cursor: pointer;
        color: #ccc;
    }

    #btnCancel:hover { background: rgba(255,255,255,0.08); }

    .table-box {
        width: 720px;
        margin: 0 auto;
        background: rgba(0,0,0,0.82);
        padding: 25px;
        border-radius: 15px;
        color: white;
        box-shadow: 0 0 25px gold;
    }

    .table-box h3 {
        color: gold;
        margin-bottom: 16px;
        font-size: 18px;
    }

    .reg-table {
        width: 100%;
        border-collapse: collapse;
        font-size: 14px;
    }

    .reg-table th {
        background: rgba(255,215,0,0.18);
        color: gold;
        padding: 10px;
        border-bottom: 1px solid #555;
    }

    .reg-table td {
        padding: 10px;
        border-bottom: 1px solid #333;
        color: #ddd;
    }

    .reg-table tr:hover td {
        background: rgba(255,255,255,0.04);
    }

    .badge-delux {
        background: rgba(255,215,0,0.2);
        color: gold;
        padding: 3px 10px;
        border-radius: 20px;
        font-size: 12px;
    }

    .badge-ordinary {
        background: rgba(200,200,200,0.15);
        color: #ccc;
        padding: 3px 10px;
        border-radius: 20px;
        font-size: 12px;
    }

    .amenity-tag {
        display: inline-block;
        background: rgba(40,167,69,0.2);
        color: #90ee90;
        padding: 2px 8px;
        border-radius: 12px;
        font-size: 12px;
        margin-right: 3px;
    }

    .btn-edit {
        padding: 5px 10px;
        background: #3a8add;
        border: none;
        border-radius: 5px;
        color: white;
        font-size: 12px;
        cursor: pointer;
        margin-right: 5px;
    }

    .btn-delete {
        padding: 5px 10px;
        background: #c0392b;
        border: none;
        border-radius: 5px;
        color: white;
        font-size: 12px;
        cursor: pointer;
    }

    .no-records {
        text-align: center;
        color: #777;
        padding: 20px;
    }

    @media (max-width: 600px) {
        .reg-box, .table-box { width: 95%; }
    }
</style>

<div class="reg-bg">

    <!-- FORM -->
    <div class="reg-box">
        <h2>Hotel Registration</h2>

        <asp:Panel ID="editBanner" runat="server" CssClass="edit-banner" Visible="false">
            Editing registration
        </asp:Panel>

        <asp:Label ID="lblSuccess" runat="server" CssClass="msg-success" Visible="false" />

        <label>Guest Name</label>
        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>

        <label>Room Type</label>
        <div class="option-group">
            <label class="option-item">
                <asp:RadioButton ID="rbDelux" runat="server" GroupName="RoomType" /> Delux
            </label>
            <label class="option-item">
                <asp:RadioButton ID="rbOrdinary" runat="server" GroupName="RoomType" /> Ordinary
            </label>
        </div>

        <label>Amenities</label>
        <div class="option-group">
            <label class="option-item"><asp:CheckBox ID="chkAC" runat="server" /> AC</label>
            <label class="option-item"><asp:CheckBox ID="chkComputer" runat="server" /> Computer</label>
            <label class="option-item"><asp:CheckBox ID="chkWifi" runat="server" /> WiFi</label>
        </div>

        <asp:HiddenField ID="hdnEditId" runat="server" Value="-1" />

        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" Visible="false" />
    </div>

    <!-- TABLE -->
    <div class="table-box">
        <h3>All Registrations <asp:Label ID="lblCount" runat="server" CssClass="count-label" /></h3>

        <asp:GridView ID="gvRegistrations" runat="server"
            CssClass="reg-table"
            AutoGenerateColumns="false"
            DataKeyNames="HotelId"
            OnRowCommand="gvRegistrations_RowCommand"
            GridLines="None">

            <Columns>

                <asp:BoundField DataField="HotelId" HeaderText="ID" />
                <asp:BoundField DataField="UserName" HeaderText="Guest Name" />

                <asp:TemplateField HeaderText="Room Type">
                    <ItemTemplate>
                        <span class='<%# (Eval("RoomType") == DBNull.Value ? "" : Eval("RoomType").ToString()) == "Delux" ? "badge-delux" : "badge-ordinary" %>'>
                            <%# Eval("RoomType") %>
                        </span>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Amenities">
                    <ItemTemplate>
                        <%# GetAmenityBadges(Eval("Amenities") == DBNull.Value ? "" : Eval("Amenities").ToString()) %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button runat="server" Text="Edit"
                            CssClass="btn-edit"
                            CommandName="EditReg"
                            CommandArgument='<%# Eval("HotelId") %>' />

                        <asp:Button runat="server" Text="Delete"
                            CssClass="btn-delete"
                            CommandName="DeleteReg"
                            CommandArgument='<%# Eval("HotelId") %>'
                            OnClientClick="return confirm('Delete this record?');" />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>

            <EmptyDataTemplate>
                <div class="no-records">No registrations found</div>
            </EmptyDataTemplate>

        </asp:GridView>

    </div>

</div>

</asp:Content>