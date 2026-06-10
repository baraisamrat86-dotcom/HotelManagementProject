using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelManagementProject
{
    public partial class HotelRegistration : System.Web.UI.Page
    {
        private string CS
        {
            get { return ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ResetForm();
                BindGrid();
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string roomType = rbDelux.Checked ? "Delux"
                            : rbOrdinary.Checked ? "Ordinary"
                            : "";

            if (string.IsNullOrEmpty(txtUserName.Text.Trim()))
            {
                ShowSuccess("Please enter guest name.");
                return;
            }
            if (string.IsNullOrEmpty(roomType))
            {
                ShowSuccess("Please select a room type.");
                return;
            }

            string amenities = BuildAmenities();
            int editId = int.Parse(hdnEditId.Value);

            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();

                if (editId == -1)
                {
                    // INSERT
                    SqlCommand cmd = new SqlCommand(
                        "INSERT INTO HotelRegistration(UserName, RoomType, Amenities) VALUES(@u, @r, @a)", con);
                    cmd.Parameters.AddWithValue("@u", txtUserName.Text.Trim());
                    cmd.Parameters.AddWithValue("@r", roomType);
                    cmd.Parameters.AddWithValue("@a", amenities);
                    cmd.ExecuteNonQuery();

                    // ✅ FIX: UserDetails page par redirect
                    Response.Redirect("~/UserDetails.aspx");
                    return;
                }
                else
                {
                    // UPDATE
                    SqlCommand cmd = new SqlCommand(
                        "UPDATE HotelRegistration SET UserName=@u, RoomType=@r, Amenities=@a WHERE HotelId=@id", con);
                    cmd.Parameters.AddWithValue("@u", txtUserName.Text.Trim());
                    cmd.Parameters.AddWithValue("@r", roomType);
                    cmd.Parameters.AddWithValue("@a", amenities);
                    cmd.Parameters.AddWithValue("@id", editId);
                    cmd.ExecuteNonQuery();
                    ShowSuccess("Registration updated successfully!");
                }
            }

            ResetForm();
            BindGrid();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ResetForm();
            lblSuccess.Visible = false;
        }

        protected void gvRegistrations_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "DeleteReg")
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(
                        "DELETE FROM HotelRegistration WHERE HotelId=@id", con);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                }
                ShowSuccess("Registration deleted.");
                BindGrid();
            }
            else if (e.CommandName == "EditReg")
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(
                        "SELECT * FROM HotelRegistration WHERE HotelId=@id", con);
                    cmd.Parameters.AddWithValue("@id", id);
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        txtUserName.Text = dr["UserName"].ToString();
                        string room = dr["RoomType"].ToString();
                        rbDelux.Checked = (room == "Delux");
                        rbOrdinary.Checked = (room == "Ordinary");
                        string amen = dr["Amenities"].ToString();
                        chkAC.Checked = amen.Contains("AC");
                        chkComputer.Checked = amen.Contains("Computer");
                        chkWifi.Checked = amen.Contains("WiFi");
                        hdnEditId.Value = id.ToString();
                        SetEditMode(true);
                        ScriptManager.RegisterStartupScript(this, GetType(), "scroll",
                            "window.scrollTo({top:0,behavior:'smooth'});", true);
                    }
                }
            }
        }

        private void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlDataAdapter da = new SqlDataAdapter(
                    "SELECT * FROM HotelRegistration ORDER BY HotelId DESC", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvRegistrations.DataSource = dt;
                gvRegistrations.DataBind();
                lblCount.Text = dt.Rows.Count > 0 ? "(" + dt.Rows.Count + " guests)" : "";
            }
        }

        private string BuildAmenities()
        {
            var list = new List<string>();
            if (chkAC.Checked) list.Add("AC");
            if (chkComputer.Checked) list.Add("Computer");
            if (chkWifi.Checked) list.Add("WiFi");
            return list.Count > 0 ? string.Join(", ", list) : "None";
        }

        private void ResetForm()
        {
            txtUserName.Text = "";
            rbDelux.Checked = false;
            rbOrdinary.Checked = false;
            chkAC.Checked = false;
            chkComputer.Checked = false;
            chkWifi.Checked = false;
            hdnEditId.Value = "-1";
            SetEditMode(false);
        }

        private void SetEditMode(bool editing)
        {
            btnRegister.Text = editing ? "Update" : "Register";
            btnCancel.Visible = editing;
            editBanner.Visible = editing;
        }

        private void ShowSuccess(string msg)
        {
            lblSuccess.Text = msg;
            lblSuccess.Visible = true;
        }

        public string GetAmenityBadges(string amenities)
        {
            if (string.IsNullOrWhiteSpace(amenities) || amenities == "None")
                return "<span style='color:#666;font-size:12px;'>None</span>";
            var sb = new System.Text.StringBuilder();
            foreach (var a in amenities.Split(','))
                sb.Append("<span class='amenity-tag'>" + a.Trim() + "</span>");
            return sb.ToString();
        }
    }
}