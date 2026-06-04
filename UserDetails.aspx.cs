using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace HotelManagementProject
{
    public partial class UserDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 1. Check login session
                if (Session["UserName"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // 2. Show ONLY logged-in user data
                    SqlDataAdapter da = new SqlDataAdapter(
                        "SELECT * FROM UserRegistration WHERE UserName = @UserName",
                        con
                    );

                    da.SelectCommand.Parameters.AddWithValue(
                        "@UserName",
                        Session["UserName"].ToString()
                    );

                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // 3. Bind GridView
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }
    }
}