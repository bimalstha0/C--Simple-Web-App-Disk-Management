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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
           if(isValidUser())
            {
                Session[Common.SessionUser] = TxtUserName.Text;
                Common.IsLoggedIn = true;
                Common.IsAdmin = isValidAdmin();
                //Create a Cookie with a suitable Key.
                HttpCookie loginCookie = new HttpCookie("Login");
                //Set the Cookie value.
                loginCookie.Values["UserName"] = TxtUserName.Text;
                loginCookie.Values["Password"] = TxtPassword.Text;
                loginCookie.Path = Request.ApplicationPath;
                //Set the Expiry date.
                loginCookie.Expires = DateTime.Now.AddMinutes(10);
                //Add the Cookie to Browser.
                Response.Cookies.Add(loginCookie);
                Response.Redirect("Home.aspx");

            }
            else
            {
                error.Visible = true;
            }
        }

        protected bool isValidUser()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Ropey_DVDsConnectionString"].ConnectionString.ToString();
            string query = "select * from Users where User_Name = '" + TxtUserName.Text+ "' and User_Pw = '" + TxtPassword.Text + "'  ";
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

        protected bool isValidAdmin()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Ropey_DVDsConnectionString"].ConnectionString.ToString();
            string query = "select * from Users where User_Name = '" + TxtUserName.Text + "' and User_Pw = '" + TxtPassword.Text + "' and User_Type = 'Manager'  ";
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