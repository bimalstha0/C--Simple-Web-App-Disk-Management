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
    public partial class ReturnOfDVDCopy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void SearchBtn_Click1(object sender, EventArgs e)
        {
            
                ChargeBtn.Visible = true;
                ConfirmReturnBtn.Visible = true;
                LoanDropDown.Visible = true;
            
        }

        protected void ChargeBtn_Click1(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Ropey_DVDsConnectionString"].ConnectionString.ToString();
            string query = "select Date_Due from Loan where Loan_No = '" + LoanDropDown.SelectedValue + "'";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                DateTime TodayDate = DateTime.Today;
                DateTime dueDate = (DateTime)ds.Tables[0].Rows[0].ItemArray[0];
                if (dueDate < TodayDate)
                {
                    string query0 = "select DATEDIFF(dd,Loan.Date_Due,GETDATE()) * DVDTitle.Penalty_Charge as pentalty from Loan,DVDTitle,DVDCopy where Loan.Copy_No=DVDCopy.Copy_No and DVDCopy.DVD_No=DVDTitle.DVD_No and Loan.Loan_No='" + LoanDropDown.SelectedValue + "'";
                    using (SqlConnection connection0 = new SqlConnection(connectionString))
                    {
                        SqlCommand command0 = new SqlCommand(query0, connection0);
                        SqlDataAdapter adapter0 = new SqlDataAdapter(command0);
                        DataSet ds0 = new DataSet();
                        adapter0.Fill(ds0);
                        penalty.Text = (ds0.Tables[0].Rows[0].ItemArray[0]).ToString();
                        lblpen.Visible = true;
                        penalty.Visible = true;
                    }


                }
                else
                {
                    lblpen.Text = "Loan Returned on Time.";
                    lblpen.Visible = true;
                }

            }
        }

        protected void ConfirmReturnBtn_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Ropey_DVDsConnectionString"].ConnectionString.ToString();
            string query = "update Loan set Date_Returned = '" + DateTime.Today + "'  where Loan_No = '" + LoanDropDown.Text + "' ";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(query, connection);
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
            lblpen.Visible = false;

            penalty.Visible = false;
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
            success.Visible = true;
        }
    }
}