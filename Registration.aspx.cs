using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace HotelManagementProject
{
    public partial class Registration : System.Web.UI.Page
    {
        // ─────────────────────────────────────────
        // Page Load
        // ─────────────────────────────────────────
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClearFields();
                this.Form.Attributes["autocomplete"] = "off";
            }
        }

        // ─────────────────────────────────────────
        // Clear all fields
        // ─────────────────────────────────────────
        private void ClearFields()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtUserName.Text = "";
            txtPassword.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtAddress.Text = "";
            txtAge.Text = "";
            rblGender.ClearSelection();
            chkEnglish.Checked = false;
            chkHindi.Checked = false;
            chkTelugu.Checked = false;
            ddlCountry.SelectedIndex = 0;
        }

        // ─────────────────────────────────────────
        // SHA-256 Password Hash
        // ─────────────────────────────────────────
        private string HashPassword(string plainText)
        {
            using (SHA256 sha = SHA256.Create())
            {
                byte[] bytes = sha.ComputeHash(Encoding.UTF8.GetBytes(plainText));
                return Convert.ToBase64String(bytes);
            }
        }

        // ─────────────────────────────────────────
        // Safe JS Alert (no XSS)
        // ─────────────────────────────────────────
        private void ShowAlert(string message)
        {
            string safe = message.Replace("\\", "\\\\").Replace("'", "\\'");
            ScriptManager.RegisterStartupScript(
                this, GetType(), "msg",
                $"alert('{safe}');", true);
        }

        // ─────────────────────────────────────────
        // Duplicate check (username / email)
        // ─────────────────────────────────────────
        private bool IsDuplicate(string column, string value, SqlConnection con)
        {
            string q = $"SELECT COUNT(*) FROM UserRegistration WHERE {column} = @val";
            using (SqlCommand cmd = new SqlCommand(q, con))
            {
                cmd.Parameters.AddWithValue("@val", value);
                return (int)cmd.ExecuteScalar() > 0;
            }
        }

        // ─────────────────────────────────────────
        // Register Button Click
        // ─────────────────────────────────────────
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // 1. Required fields
            if (string.IsNullOrWhiteSpace(txtFirstName.Text) ||
                string.IsNullOrWhiteSpace(txtLastName.Text) ||
                string.IsNullOrWhiteSpace(txtUserName.Text) ||
                string.IsNullOrWhiteSpace(txtPassword.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                ShowAlert("Please fill all required fields (marked with *).");
                return;
            }

            // 2. Gender
            if (string.IsNullOrEmpty(rblGender.SelectedValue))
            {
                ShowAlert("Please select your gender.");
                return;
            }

            // 3. Email format
            if (!Regex.IsMatch(txtEmail.Text.Trim(),
                @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                ShowAlert("Please enter a valid email address.");
                return;
            }

            // 4. Phone — optional but must be 10 digits if provided
            if (!string.IsNullOrWhiteSpace(txtPhone.Text) &&
                !Regex.IsMatch(txtPhone.Text.Trim(), @"^\d{10}$"))
            {
                ShowAlert("Phone number must be exactly 10 digits.");
                return;
            }

            // 5. Age — optional but must be 18–100 if provided
            int age = 0;
            if (!string.IsNullOrWhiteSpace(txtAge.Text))
            {
                if (!int.TryParse(txtAge.Text, out age) || age < 18 || age > 100)
                {
                    ShowAlert("Age must be between 18 and 100.");
                    return;
                }
            }

            // 6. Password length
            if (txtPassword.Text.Length < 6)
            {
                ShowAlert("Password must be at least 6 characters long.");
                return;
            }

            // 7. Country selected
            if (string.IsNullOrEmpty(ddlCountry.SelectedValue))
            {
                ShowAlert("Please select your country.");
                return;
            }

            // 8. Build languages string
            StringBuilder lang = new StringBuilder();
            if (chkEnglish.Checked) lang.Append("English,");
            if (chkHindi.Checked) lang.Append("Hindi,");
            if (chkTelugu.Checked) lang.Append("Telugu,");
            string languages = lang.ToString().TrimEnd(',');

            string hashedPassword = HashPassword(txtPassword.Text);

            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // 9. Duplicate username / email
                    if (IsDuplicate("Username", txtUserName.Text.Trim(), con))
                    {
                        ShowAlert("Username already taken. Please choose another.");
                        return;
                    }
                    if (IsDuplicate("Email", txtEmail.Text.Trim(), con))
                    {
                        ShowAlert("This email is already registered. Please login.");
                        return;
                    }

                    // 10. Insert record
                    const string query = @"
                        INSERT INTO UserRegistration
                            (FirstName, LastName, Username, Gender, Password,
                             Email, Phone, Address, Age, Languages, Country)
                        VALUES
                            (@fn, @ln, @un, @g, @p,
                             @e,  @ph, @ad, @age, @lang, @c)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@fn", txtFirstName.Text.Trim());
                        cmd.Parameters.AddWithValue("@ln", txtLastName.Text.Trim());
                        cmd.Parameters.AddWithValue("@un", txtUserName.Text.Trim());
                        cmd.Parameters.AddWithValue("@g", rblGender.SelectedValue);
                        cmd.Parameters.AddWithValue("@p", hashedPassword);
                        cmd.Parameters.AddWithValue("@e", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@ph", txtPhone.Text.Trim());
                        cmd.Parameters.AddWithValue("@ad", txtAddress.Text.Trim());
                        cmd.Parameters.AddWithValue("@age", age);
                        cmd.Parameters.AddWithValue("@lang", languages);
                        cmd.Parameters.AddWithValue("@c", ddlCountry.SelectedValue);

                        cmd.ExecuteNonQuery();
                    }
                }

                // 11. Success → redirect
                Response.Redirect("Success.aspx");
            }
            catch (SqlException ex)
            {
                ShowAlert("Database error: " + ex.Message);
            }
            catch (Exception ex)
            {
                ShowAlert("An unexpected error occurred: " + ex.Message);
            }
        }
    }
}