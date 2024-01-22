using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ApplicationDevelopmentCoursework
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Common.IsLoggedIn)
            {
                LabelUsername.Text = Request.Cookies["Login"].Values["UserName"];
                LabelUserType.Text = Common.IsAdmin ? "Manager" : "Assistant";
            }
            if (Common.IsAdmin)
            {
                AdminPanel.Visible = true;
            }
        }

        protected void ChangePwBtn_Click(object sender, EventArgs e)
        {
            if (isValidUser())
            {
                if (newPwTxtBox.Text == confirmPwTxtBox.Text)
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["Ropey_DVDsConnectionString"].ConnectionString.ToString();
                    string query = "update Users set User_Pw = '" + newPwTxtBox.Text + "'  where User_Name = '" + LabelUsername.Text + "' and  User_Type = '" +LabelUserType.Text + "'  ";
                    SqlConnection connection = new SqlConnection(connectionString);
                    SqlCommand cmd = new SqlCommand(query, connection);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                    success.Visible = true;
                    pwTxtBox.Text = "";
                    newPwTxtBox.Text = "";
                    confirmPwTxtBox.Text = "";
                }
                else
                {
                    match.Visible = true;
                }
            }
            else
            {
                pw.Visible = true;
            }
        }
        protected bool isValidUser()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Ropey_DVDsConnectionString"].ConnectionString.ToString();
            string query = "select * from Users where User_Name = '" + LabelUsername.Text + "' and User_Pw = '" + pwTxtBox.Text + "'  ";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                if (ds.Tables[0].Rows.Count == 1)
                {
                    // user record valid and found
                    return true;
                }
                else
                {
                    return false;
                    // user record not found (incorrect login details)
                }

            }
        }
    }
}