using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ApplicationDevelopmentCoursework
{
    public partial class OldDvds : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Ropey_DVDsConnectionString"].ConnectionString.ToString();
            string query = "delete from DVDCopy  where DATEDIFF(dd,DVDCopy.Date_Purchased,GETDATE()) >365";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(query, connection);
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}