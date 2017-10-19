using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Election
{
    public partial class selection : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        List<string> listOfString = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("select * from ElectionInfo", conn);

                SqlDataAdapter adpt = new SqlDataAdapter(cmd);

                DataTable da_table = new DataTable();

                adpt.Fill(da_table);

                DataRow row = da_table.Rows[0];

                Label1.Text = row["Subject"].ToString();

                DataList1.DataSource = da_table;
                DataList1.DataBind();


                int num = da_table.Rows.Count;
                DataRow r;

                for (int i = 0; i < num; i++)
                {
                    r = da_table.Rows[i];
                    listOfString.Add(r["Candidate"].ToString());
                }

                foreach (string val in listOfString)
                {

                    DropDownList1.Items.Add(new ListItem(val, val));

                }
                conn.Close();
            }
            catch
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            Label2.Visible = false;
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool allCheck = true;
            int flag = 1;

            //TextBox1 Validation

            string nameStr = TextBox1.Text;

            if (nameStr == " ")
            {
                TextBox1.Text = "*Invalid Value!";
                TextBox1.BorderColor = Color.Red;
                allCheck = false;
            }
            else
            {
                foreach (var ch in nameStr)
                {
                    if(ch == char.Parse(" ")){

                        continue;
                    }

                    if (!char.IsLetter(ch))
                    {
                            TextBox1.Text = "*Invalid Value!";
                            TextBox1.BorderColor = Color.Red;
                            allCheck = false;
                        
                    }

                }
            }

            //TextBox2 Validation

            string numberStr = TextBox2.Text;

            if (numberStr == " ")
            {
                TextBox2.Text = "*Invalid Value!";
                TextBox2.BorderColor = Color.Red;
                allCheck = false;
            }
            else
            {

                foreach (var ch in numberStr)
                {
                    if (char.IsLetter(ch))
                    {

                        TextBox2.Text = "*Invalid Value!";
                        TextBox2.BorderColor = Color.Red;
                        allCheck = false;
                    }

                }
            }
            
             
            //TextBox3 Validation

            string phoneNumber = TextBox3.Text;

            if (phoneNumber == " ")
            {
                TextBox3.Text = "*Invalid Value!";
                TextBox3.BorderColor = Color.Red;
                allCheck = false;
            }
            else
            {
                foreach (var ch in phoneNumber)
                {

                    if (char.IsLetter(ch))
                    {
                        TextBox3.Text = "*Invalid Value!";
                        TextBox3.BorderColor = Color.Red;
                        allCheck = false;
                    }
                }
            }

            //duplicate Checking
            
            if (allCheck == true)
            {
                conn.Open();    

                SqlCommand cmd = new SqlCommand("select CNIC_Number from VoterList", conn);

                SqlDataAdapter adpt = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                adpt.Fill(dt);

                for (int i = 0; i < dt.Rows.Count; i++ )
                {
                    string pk = dt.Rows[i][0].ToString();
                    if (pk == TextBox2.Text)
                    {
                        Label2.Visible = true;
                        flag = 0;
                    }

                }

                conn.Close();
            }

            //After all Validation 
            
            if(allCheck == true && flag == 1){
                    
                    conn.Open();

                    string selectedPerson = DropDownList1.SelectedItem.Value;
                    string CNICname = TextBox1.Text;
                    string CNICnumber = TextBox2.Text;
                    long phone_no = long.Parse(TextBox3.Text);
                    string email = TextBox4.Text;

                    SqlCommand cmd = new SqlCommand("INSERT INTO VoterList VALUES('" + CNICname + "', '" + CNICnumber + "', '" + phone_no + "', '" + selectedPerson + "', '" + email + "' ) ", conn);
                    cmd.ExecuteNonQuery();

                    Response.Redirect("~/default.aspx");

                    conn.Close();
                
            }
                      
        }

    }
}




















