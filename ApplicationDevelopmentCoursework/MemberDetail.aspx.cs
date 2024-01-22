using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ApplicationDevelopmentCoursework
{
    public partial class MemberDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count > 0)
            {
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    int al = Int32.Parse(GridView1.Rows[i].Cells[5].Text);
                    int tl = Int32.Parse(GridView1.Rows[i].Cells[6].Text);
                    if (tl > al)
                    {
                        GridView1.Rows[i].Cells[6].Text += " (Too Many Loans)";
                    }
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}