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
    public partial class LoanForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void chargeBtn_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Ropey_DVDsConnectionString"].ConnectionString.ToString();
            string query = "  select distinct LoanType.Loan_Duration*DVDTitle.Standard_Charge as Loan_Total_Charge from DVDTitle,LoanType where DVDTitle.DVD_No=  '" + DVDDropDown.SelectedValue + "' and LoanType.Loan_Type_No = '" + LoanTypeDropDown.SelectedValue + "' ;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                double charge = (double)ds.Tables[0].Rows[0].ItemArray[0];
                chargeLbl.Text = charge.ToString();
                Labelcharge.Visible = true;
                chargeLbl.Visible = true;
            }
        }

        protected void BtnAddLoanForm_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Ropey_DVDsConnectionString"].ConnectionString.ToString();
            string query = " select count(*) from Loan where Member_No= '" + MemberDropDown.SelectedValue + "';";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                int tloans = (int)ds.Tables[0].Rows[0].ItemArray[0];
                string query1 = "  select MemberShipCategory.MemberShipCategoryTotalLoans from MemberShipCategory, Member where Member.Membership_Category_No = MemberShipCategory.MemberShipCategoryNo and Member.Member_No = '" + MemberDropDown.SelectedValue + "';";
                using (SqlConnection connection0 = new SqlConnection(connectionString))
                {
                    SqlCommand command0 = new SqlCommand(query1, connection0);
                    SqlDataAdapter adapter0 = new SqlDataAdapter(command0);
                    DataSet ds0 = new DataSet();
                    adapter0.Fill(ds0);
                    DateTime TodayDate = DateTime.Today;
                    int aloans = (int)ds0.Tables[0].Rows[0].ItemArray[0];

                    if (aloans > tloans)
                    {
                        string query2 = " select DVDCategory.Age_Restricted from DVDCategory,DVDTitle where DVDTitle.DVD_No='" + DVDDropDown.SelectedValue + "' and  DVDTitle.Category_No=DVDCategory.Category_No;";
                        using (SqlConnection connection1 = new SqlConnection(connectionString))
                        {
                            int ageRestricted = 0;
                            SqlCommand command1 = new SqlCommand(query2, connection1);
                            SqlDataAdapter adapter1 = new SqlDataAdapter(command1);
                            DataSet ds1 = new DataSet();
                            adapter1.Fill(ds1);
                            bool restricted = (bool)ds1.Tables[0].Rows[0].ItemArray[0];
                            if (restricted)
                            {
                                ageRestricted = 1;
                            }
                            string query3 = "  select DATEDIFF(YY,Member.Member_DOB,GETDATE()) as Age from Member where Member_No= '" + MemberDropDown.SelectedValue + "';";
                            using (SqlConnection connection2 = new SqlConnection(connectionString))
                            {
                                SqlCommand command2 = new SqlCommand(query3, connection2);
                                SqlDataAdapter adapter2 = new SqlDataAdapter(command2);
                                DataSet ds2 = new DataSet();
                                adapter2.Fill(ds2);
                                int memAge = (int)ds2.Tables[0].Rows[0].ItemArray[0];
                                if (ageRestricted == 1 && memAge < 18)
                                {
                                    AgeError.Visible = true;
                                }
                                else
                                {
                                    string query4 = "insert into Loan(Loan_Type_No,Copy_No,Member_No,Date_Out,Date_Due) values ('" + LoanTypeDropDown.SelectedValue + "','" + CopyDropDown.SelectedValue + "','" + MemberDropDown.SelectedValue + "','" + DateTime.Today + "',DATEADD(dd,(select Loan_Duration from LoanType where Loan_Type_No='" + LoanTypeDropDown.SelectedValue + "'),'" + DateTime.Today + "')) ";
                                    SqlConnection connection3 = new SqlConnection(connectionString);
                                    SqlCommand cmd = new SqlCommand(query4, connection3);
                                    connection3.Open();
                                    cmd.ExecuteNonQuery();
                                    connection3.Close();
                                    Success.Visible = true;
                                }
                            }
                        }
                    }
                    else
                    {
                        LoanCountError.Visible = true;
                    }
                }


            }

        }
    }
}