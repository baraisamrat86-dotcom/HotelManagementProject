using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace HotelManagementProject
{
    public partial class HotelDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string cs =
                ConfigurationManager
                .ConnectionStrings["dbcs"]
                .ConnectionString;

                SqlConnection con =
                new SqlConnection(cs);

                SqlDataAdapter da =
                new SqlDataAdapter(
                "select * from HotelRegistration",
                con);

                DataTable dt =
                new DataTable();

                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();

                if (dt.Rows.Count > 0)
                {
                    lblWelcome.Text =
                    "Welcome " +
                    dt.Rows[dt.Rows.Count - 1]["UserName"].ToString() +
                    ". You selected " +
                    dt.Rows[dt.Rows.Count - 1]["RoomType"].ToString() +
                    " Room with " +
                    dt.Rows[dt.Rows.Count - 1]["Amenities"].ToString();
                }
            }
        }
    }
}