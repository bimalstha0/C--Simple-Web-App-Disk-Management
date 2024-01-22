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
    public partial class DVD : System.Web.UI.Page
    {
        public static bool Enabled { get; internal set; }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
          
        }

        protected void BtnAddTitle_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Ropey_DVDsConnectionString"].ConnectionString.ToString();
            string query = "insert into DVDTitle(Category_No,Studio_No,Producer_No,DVD_Title,Date_Released,Standard_Charge,Penalty_Charge) values ('" + DropDownCategory.SelectedValue + "','" + DropDownStudio.SelectedValue + "','" + DropDownProducer.SelectedValue + "','" + TxtTitle.Text + "','" + datereleased.Text + "','" + TxtStandardCharge.Text + "','" + TxtPenaltyCharge.Text + "') ";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(query, connection);
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
            Response.Write(Common.castQuery.Count);

            for (int i = 0; i < Common.castQuery.Count; i++)
            {
                string query1 = Common.castQuery[i];
                SqlConnection connection1 = new SqlConnection(connectionString);
                SqlCommand cmd1 = new SqlCommand(query1, connection1);
                connection1.Open();
                cmd1.ExecuteNonQuery();
                connection1.Close();
                Response.Write(Common.castQuery[i]);
            }
            Success.Visible = true;
            Common.castQuery.Clear();
        }

        protected void BtnAddCategory_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/DVDCategory.aspx");
        }

        protected void BtnAddStudio_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/StudioDetailsForm.aspx");
        }

        protected void BtnAddProducer_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ProducerDetailForm.aspx");
        }

        protected void BtnAddActor_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ActorDetailsForm.aspx");
        }



        protected void BtnAddCast_Click(object sender, EventArgs e)
        {
            Common.castQuery.Add("insert into CastMember values ((select max(DVD_No)from DVDTitle), '" + ActorDropDown.SelectedValue + "')");

            castlbl.Text += ActorDropDown.SelectedItem.Text + ",";
            //string connectionString = ConfigurationManager.ConnectionStrings["Ropey_DVDsConnectionString"].ConnectionString.ToString();
            //string query4 = "insert into CastMember values ('" + DropDownStudio.SelectedValue + "','" + DropDownProducer.SelectedValue + "','" + TxtTitle.Text + "','" + datereleased.Text + "','" + TxtStandardCharge.Text + "','" + TxtPenaltyCharge.Text + "') ";
            //SqlConnection connection3 = new SqlConnection(connectionString);
            //SqlCommand cmd = new SqlCommand(query4, connection3);
            //connection3.Open();
            //cmd.ExecuteNonQuery();
            //connection3.Close();
            //Success.Visible = true;
        }
    }
}