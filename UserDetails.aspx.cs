using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelManagementProject
{
    public partial class UserDetails : System.Web.UI.Page
    {
        private string CS => ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlDataAdapter da = new SqlDataAdapter(
                    "SELECT * FROM UserRegistration ORDER BY Id DESC", con);

                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            GridViewRow row = GridView1.Rows[e.RowIndex];

            string firstName = ((TextBox)row.Cells[2].Controls[0]).Text.Trim();
            string lastName = ((TextBox)row.Cells[3].Controls[0]).Text.Trim();
            string gender = ((TextBox)row.Cells[4].Controls[0]).Text.Trim();
            string email = ((TextBox)row.Cells[5].Controls[0]).Text.Trim();
            string phone = ((TextBox)row.Cells[6].Controls[0]).Text.Trim();
            string address = ((TextBox)row.Cells[7].Controls[0]).Text.Trim();
            int age = Convert.ToInt32(((TextBox)row.Cells[8].Controls[0]).Text.Trim());
            string languages = ((TextBox)row.Cells[9].Controls[0]).Text.Trim();
            string country = ((TextBox)row.Cells[10].Controls[0]).Text.Trim();

            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(@"
                    UPDATE UserRegistration SET 
                        FirstName=@fn,
                        LastName=@ln,
                        Gender=@g,
                        Email=@em,
                        Phone=@ph,
                        Address=@ad,
                        Age=@ag,
                        Languages=@la,
                        Country=@co
                    WHERE Id=@id", con);

                cmd.Parameters.Add("@fn", SqlDbType.NVarChar).Value = firstName;
                cmd.Parameters.Add("@ln", SqlDbType.NVarChar).Value = lastName;
                cmd.Parameters.Add("@g", SqlDbType.NVarChar).Value = gender;
                cmd.Parameters.Add("@em", SqlDbType.NVarChar).Value = email;
                cmd.Parameters.Add("@ph", SqlDbType.NVarChar).Value = phone;
                cmd.Parameters.Add("@ad", SqlDbType.NVarChar).Value = address;
                cmd.Parameters.Add("@ag", SqlDbType.Int).Value = age;
                cmd.Parameters.Add("@la", SqlDbType.NVarChar).Value = languages;
                cmd.Parameters.Add("@co", SqlDbType.NVarChar).Value = country;
                cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;

                cmd.ExecuteNonQuery();
            }

            GridView1.EditIndex = -1;
            BindGrid();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(
                    "DELETE FROM UserRegistration WHERE Id=@id", con);

                cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;
                cmd.ExecuteNonQuery();
            }

            BindGrid();
        }
    }
}