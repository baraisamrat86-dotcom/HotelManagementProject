<%@ Page Language="C#" MasterPageFile="~/SiteMaster.master"
    AutoEventWireup="true"
    CodeBehind="Registration.aspx.cs"
    Inherits="HotelManagementProject.Registration" %>



<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


<div class="reg-bg">
    <div class="reg-box">

        <h2>User Registration</h2>

        <label>First Name</label>
        <asp:TextBox ID="txtFirstName" runat="server"
            AutoCompleteType="Disabled"></asp:TextBox>

        <br /><br />

        <label>Last Name</label>
        <asp:TextBox ID="txtLastName" runat="server"
            AutoCompleteType="Disabled"></asp:TextBox>

        <br /><br />

        <label>Username</label>
      <asp:TextBox ID="txtUserName"
    runat="server"
    AutoCompleteType="None">
    </asp:TextBox>

        <br /><br />

        <label>Gender</label>

        <asp:RadioButtonList ID="rblGender" runat="server">
            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
        </asp:RadioButtonList>

        <br />

        <label>Password</label>
       <asp:TextBox ID="txtPassword"
    runat="server"
    TextMode="Password"
    AutoCompleteType="None">
</asp:TextBox>

        <br /><br />

        <label>Email</label>
        <asp:TextBox ID="txtEmail" runat="server"
            AutoCompleteType="Disabled"></asp:TextBox>

        <br /><br />

        <label>Phone</label>
        <asp:TextBox ID="txtPhone" runat="server"
            AutoCompleteType="Disabled"></asp:TextBox>

        <br /><br />

        <label>Address</label>
        <asp:TextBox ID="txtAddress" runat="server"
            TextMode="MultiLine"
            Rows="3"
            AutoCompleteType="Disabled"></asp:TextBox>

        <br /><br />

        <label>Age</label>
        <asp:TextBox ID="txtAge" runat="server"
            AutoCompleteType="Disabled"></asp:TextBox>

        <br /><br />

        <label>Languages</label>

        <asp:CheckBox ID="chkEnglish" runat="server" Text="English" />
        <asp:CheckBox ID="chkHindi" runat="server" Text="Hindi" />
        <asp:CheckBox ID="chkTelugu" runat="server" Text="Telugu" />

        <br /><br />

        <label>Country</label>

        <asp:DropDownList ID="ddlCountry" runat="server">
            <asp:ListItem Text="Select" Value=""></asp:ListItem>
            <asp:ListItem Text="India" Value="India"></asp:ListItem>
            <asp:ListItem Text="USA" Value="USA"></asp:ListItem>
            <asp:ListItem Text="UK" Value="UK"></asp:ListItem>
        </asp:DropDownList>

        <br /><br />

        <asp:Button ID="btnRegister"
            runat="server"
            Text="Register"
            OnClick="btnRegister_Click" />

    </div>
</div>

</asp:Content>