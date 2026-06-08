<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Success.aspx.cs" Inherits="HotelManagementProject.Success" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Success</title>

    <link href="Style.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">

        <div class="success-container">

    <div class="success-card">


        <div class="success-icon">🏨</div>

        <h1>Welcome to Luxury Hotel</h1>

        <h2>Registration Completed Successfully</h2>

        <p>
            Your account has been created and is ready to use.
        </p>

        <p class="redirect-msg">
           Redirecting to Login Page in <span id="countdown">30</span> seconds...
        </p>

        <asp:Button
            ID="Button1"
            runat="server"
            Text="Login Now"
            CssClass="login-btn"
            PostBackUrl="~/Login.aspx" />

    </div>

</div>

<script>
    var timeLeft = 30;

    var timer = setInterval(function () {
        timeLeft--;
        document.getElementById("countdown").innerHTML = timeLeft;

        if (timeLeft <= 0) {
            clearInterval(timer);
            window.location.href = "Login.aspx";
        }
    }, 1000);
</script>

    </form>
</body>
</html>