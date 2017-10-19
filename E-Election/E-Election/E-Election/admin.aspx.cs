using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Election
{
    public partial class admin : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            conn.Open();
            
                SqlCommand cmd = new SqlCommand(" Select * from Administrator ", conn);

                SqlDataAdapter adpt = new SqlDataAdapter(cmd);

                DataTable tbl = new DataTable();

                adpt.Fill(tbl);

                string username = tbl.Rows[0][0].ToString();
                string password = tbl.Rows[0][1].ToString();

                bool valid = true;

              if(username != TextBox1.Text){

                  TextBox1.BorderColor = Color.Red;
                  valid = false;
                }

              if (password != TextBox2.Text)
              {
                TextBox2.BorderColor = Color.Red;
                valid = false;
            }

            if(valid == true){

                Response.Redirect("~/setting.aspx");
            }
            
    
            conn.Close();
        }
    }
}





