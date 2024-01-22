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
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie loginCookie = Request.Cookies["Login"];
                if (loginCookie != null)
                {
                    string userName = loginCookie.Values["UserName"];
                    string password = loginCookie.Values["Password"];
            // User validation based on cookies if required for valid user as might be user can change his password in any cases
            // so call your databse user login validation method
            if (isValidUser(userName, password)) // user validation code
            {
                Session[Common.SessionUser] = userName;
                Common.IsLoggedIn = true;
                Common.IsAdmin = isValidAdmin(userName, password);
               // Response.Redirect("Home.aspx");

                    }
                    else
                    {
                        Response.Redirect("Login.aspx");
                    }
                }
            }
            UpdateUserNavigation();
        }

        public void UpdateUserNavigation()
        {
            if (Common.IsLoggedIn)
            {
                menuUser.Items[0].Text = "Welcome " + Session[Common.SessionUser];
            }
            else
            {
                menuUser.Items[0].Text = "Login";
                Session[Common.SessionUser] = null;
                for (int i = menuUser.Items[0].ChildItems.Count - 1; i >= 0; i--)
                {
                    MenuItem menuItem = menuUser.Items[0].ChildItems[i];
                    menuUser.Items[0].ChildItems.Remove(menuItem);
                }


                
            }
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void menuUser_MenuItemClick(object sender, MenuEventArgs e)
        {
            string itemValue = e.Item.Value;
            if (itemValue == "Profile")
            {
                Response.Redirect("~/Profile.aspx");
            }
            else if (itemValue == "logout")
            {
               // Request.Cookies["Login"].Expires = DateTime.Now.AddMilliseconds(1);
                Common.IsLoggedIn = false;
                Response.Redirect("~/login.aspx");
            }
            UpdateUserNavigation();
            //Response.Write("<p class=\"whitetext\">logged in: " + Common.IsLoggedIn + "</p>");
        }

        protected bool isValidUser(string username,string password)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Ropey_DVDsConnectionString"].ConnectionString.ToString();
            string query = "select * from Users where User_Name = '" + username+ "' and User_Pw = '" + password + "'  ";
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
        protected bool isValidAdmin(string username,string password)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Ropey_DVDsConnectionString"].ConnectionString.ToString();
            string query = "select * from Users where User_Name = '" + username + "' and User_Pw = '" + password + "' and User_Type = 'Manager'  ";
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