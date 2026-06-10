using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;

namespace HotelManagementProject
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtUser.Attributes["autocomplete"] = "off";
                txtPass.Attributes["autocomplete"] = "off";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                // ✅ Validation
                if (string.IsNullOrWhiteSpace(txtUser.Text) ||
                    string.IsNullOrWhiteSpace(txtPass.Text))
                {
                    lblMsg.Text = "Please enter username and password";
                    return;
                }

                // ✅ Encode password (same as registration)
                string password = Convert.ToBase64String(
                    Encoding.UTF8.GetBytes(txtPass.Text.Trim()));

                string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = @"SELECT COUNT(*) 
                                     FROM UserRegistration 
                                     WHERE Username=@un AND Password=@pw";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@un", txtUser.Text.Trim());
                        cmd.Parameters.AddWithValue("@pw", password);

                        con.Open();

                        int count = Convert.ToInt32(cmd.ExecuteScalar());

                        if (count == 1)
                        {
                            Session["user"] = txtUser.Text.Trim();

                            // ✅ redirect after login
                            Response.Redirect("HotelRegistration.aspx");
                        }
                        else
                        {
                            lblMsg.Text = "Invalid Username or Password";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // ❗ Safe error message (not exposing system error)
                lblMsg.Text = "Something went wrong. Please try again.";
            }
        }
    }
}