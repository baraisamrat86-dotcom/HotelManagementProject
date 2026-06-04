using System;
using System.Configuration;
using System.Data.SqlClient;

namespace HotelManagementProject
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Clear all controls
                txtFirstName.Text = "";
                txtLastName.Text = "";
                txtUserName.Text = "";
                txtPassword.Text = "";
                txtEmail.Text = "";
                txtPhone.Text = "";
                txtAddress.Text = "";
                txtAge.Text = "";

                // Disable browser autofill
                txtFirstName.Attributes["autocomplete"] = "off";
                txtLastName.Attributes["autocomplete"] = "off";
                txtUserName.Attributes["autocomplete"] = "off";
                txtPassword.Attributes["autocomplete"] = "new-password";
                txtEmail.Attributes["autocomplete"] = "off";
                txtPhone.Attributes["autocomplete"] = "off";
                txtAddress.Attributes["autocomplete"] = "off";
                txtAge.Attributes["autocomplete"] = "off";

                if (this.Form != null)
                {
                    this.Form.Attributes["autocomplete"] = "off";
                }
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string languages = "";

            if (chkEnglish.Checked)
                languages += "English,";

            if (chkHindi.Checked)
                languages += "Hindi,";

            if (chkTelugu.Checked)
                languages += "Telugu";

            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO UserRegistration VALUES (@fn,@ln,@un,@g,@p,@e,@ph,@ad,@age,@lang,@c)", con);

                cmd.Parameters.AddWithValue("@fn", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@ln", txtLastName.Text);
                cmd.Parameters.AddWithValue("@un", txtUserName.Text);
                cmd.Parameters.AddWithValue("@g", rblGender.SelectedValue);
                cmd.Parameters.AddWithValue("@p", txtPassword.Text);
                cmd.Parameters.AddWithValue("@e", txtEmail.Text);
                cmd.Parameters.AddWithValue("@ph", txtPhone.Text);
                cmd.Parameters.AddWithValue("@ad", txtAddress.Text);
                cmd.Parameters.AddWithValue("@age", txtAge.Text);
                cmd.Parameters.AddWithValue("@lang", languages);
                cmd.Parameters.AddWithValue("@c", ddlCountry.SelectedValue);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("Success.aspx");
        }
    }
}