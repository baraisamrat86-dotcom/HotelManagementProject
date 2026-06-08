using System;
using System.Configuration;
using System.Data.SqlClient;

namespace HotelManagementProject
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtUser.Text = "";
                txtPass.Text = "";

                txtUser.Attributes["autocomplete"] = "off";
                txtPass.Attributes["autocomplete"] = "new-password";

                if (this.Form != null)
                {
                    this.Form.Attributes["autocomplete"] = "off";
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string cs =
            ConfigurationManager.ConnectionStrings["dbcs"]
            .ConnectionString;

            SqlConnection con =
            new SqlConnection(cs);

            SqlCommand cmd =
            new SqlCommand(
            "select * from UserRegistration where UserName=@u and Password=@p",
            con);

            cmd.Parameters.AddWithValue("@u", txtUser.Text);
            cmd.Parameters.AddWithValue("@p", txtPass.Text);

            con.Open();

            SqlDataReader dr =
            cmd.ExecuteReader();

            if (dr.Read())
            {
                Session["UserName"] = txtUser.Text;
                Response.Redirect("UserDetails.aspx");
            }
            else
            {
                lblMsg.Text = "Invalid Username or Password";
            }

            con.Close();
        }
    }
}