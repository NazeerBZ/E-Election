using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace E_Election
{
    public partial class ranking : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                conn.Open();

                SqlCommand cmd4 = new SqlCommand("delete from Decision", conn);
                cmd4.ExecuteNonQuery();

                SqlCommand cmd1 = new SqlCommand("select Candidate from ElectionInfo", conn);
                SqlDataAdapter adpt1 = new SqlDataAdapter(cmd1);
                DataTable dt1 = new DataTable();
                adpt1.Fill(dt1);

                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    string canMem = dt1.Rows[i][0].ToString();
                    SqlCommand cmd2 = new SqlCommand("select Voted from VoterList where VoterList.Voted='" + canMem + "' ", conn);
                    SqlDataAdapter adpt2 = new SqlDataAdapter(cmd2);
                    DataTable dt2 = new DataTable();
                    adpt2.Fill(dt2);

                    int EffectedRows = dt2.Rows.Count;

                    SqlCommand cmd3 = new SqlCommand("insert into Decision values('" + canMem + "', '" + EffectedRows + "')", conn);
                    cmd3.ExecuteNonQuery();

                    dt2.Clear();
                }

                SqlCommand cmd5 = new SqlCommand("select Subject from ElectionInfo", conn);
                SqlDataAdapter adpt3 = new SqlDataAdapter(cmd5);
                DataTable dt3 = new DataTable();
                adpt3.Fill(dt3);
                Label1.Text = dt3.Rows[0][0].ToString();

                conn.Close();

                Chart1.Series[0]["PointWidth"] = "0.3";

                foreach (int charType in Enum.GetValues(typeof(SeriesChartType)))
                {
                    ListItem li = new ListItem(Enum.GetName(typeof(SeriesChartType), charType), charType.ToString());
                    DropDownList1.Items.Add(li);
                }
            }
            catch
            {
                Response.Redirect("~/default.aspx");
            }
            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            Chart1.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), DropDownList1.Text);

        }
             

        
    }
}



