<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Hotel Registration Success</title>

    <style>
        body {
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg,#0f172a,#1e293b);
            font-family: Arial, sans-serif;
        }

        .card {
            width: 650px;
            text-align: center;
            padding: 50px;
            border-radius: 25px;
            background: rgba(255,255,255,0.10);
            backdrop-filter: blur(15px);
            color: white;
            box-shadow: 0 0 35px rgba(255,215,0,0.5);
        }

        .tick {
            font-size: 90px;
        }

        h1 {
            color: gold;
        }

        p {
            font-size: 20px;
        }

        .btn {
            display: inline-block;
            margin-top: 25px;
            padding: 15px 35px;
            background: gold;
            color: black;
            text-decoration: none;
            border-radius: 50px;
            font-weight: bold;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="card">

            <div class="tick">✅</div>

            <h1>Hotel Registration Successful</h1>

            <p>
                Thank you for choosing our Hotel Management System.
                Your registration has been completed successfully.
            </p>

            <a href="HotelDetails.aspx" class="btn">
                View Hotel Details
            </a>

        </div>

    </form>
</body>
</html>