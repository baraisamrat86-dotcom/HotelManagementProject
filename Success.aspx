<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Success.aspx.cs" Inherits="HotelManagementProject.Success" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Success</title>

    <link href="Style.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">

        <div class="success-box">

            <h2>Registration Successful</h2>

            <p>Click on Login Button to Check Details</p>

            <br />

            <asp:Button
                ID="Button1"
                runat="server"
                Text="Login"
                CssClass="success-btn"
                PostBackUrl="~/Login.aspx" />

        </div>

    </form>
</body>
</html>