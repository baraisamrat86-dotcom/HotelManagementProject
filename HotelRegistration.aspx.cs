using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace HotelManagementProject
{
    public partial class HotelRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtUserName.Text = "";
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            List<string> amenitiesList = new List<string>();

            if (chkAC.Checked)
                amenitiesList.Add("AC");

            if (chkComputer.Checked)
                amenitiesList.Add("Computer");

            string amenities = string.Join(", ", amenitiesList);

            string cs = ConfigurationManager
                .ConnectionStrings["dbcs"]
                .ConnectionString;

            SqlConnection con = new SqlConnection(cs);

            SqlCommand cmd = new SqlCommand(
                "insert into HotelRegistration values(@u,@r,@a)",
                con);

            cmd.Parameters.AddWithValue("@u", txtUserName.Text);
            cmd.Parameters.AddWithValue("@r", rblRoom.SelectedValue);
            cmd.Parameters.AddWithValue("@a", amenities);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("HotelSuccess.aspx");
        }
    }
}