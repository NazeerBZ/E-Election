using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Data;
using System.Net.Mail;
using System.Collections;
using System.Text;
using System.Web.UI.HtmlControls;


namespace E_Election
{
    public partial class setting : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            //CheckBoxList1.Visible = true;

            //string cls = slideItDown.Attributes["class"];

            //if (cls == "")
            //{
            //    CheckBoxList1.Visible = false;

            //}
            
            conn.Open();

            SqlCommand cmd = new SqlCommand("delete from ElectionInfo", conn);
            cmd.ExecuteNonQuery();

            Label3.Visible = true;
            Label3.ForeColor = Color.Red;
            Label3.Text = "Data has been deleted!!";

            conn.Close();


           // StringBuilder html = new StringBuilder();

            
           // //table starts
           // html.Append("<table border='1'>");

           // int num = 0;

           // foreach (DataRow row in tbl.Rows)
           // {
           //     //Table Row
           //     html.Append("<tr>");

           //     html.Append("<td>");
           //     html.Append(row[0]);
           //     html.Append("</td>");

           //     html.Append("<td>");

           //     html.Append("<button name='del' value='"+ num +"'>");
           //     html.Append("del");
           //     html.Append("</button>");

           //     html.Append("</td>");

           //     html.Append("</tr>");
           // }


           ////Table Ends
           // html.Append("</table>");

           // html.Append("</form>");

           // Label4.Visible = true;
           // Label4.Controls.Add(new Literal { Text = html.ToString() });

            //GridView1.DataSource = tbl;
            //GridView1.DataBind();

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Session["poke"] = "dovote";

                Response.Redirect("~/default.aspx");

        }

        protected void AsyncFileUpload1_UploadedComplete(object sender, AsyncFileUploadEventArgs e)
        {
            if(TextBox1.Text != "" && TextBox2.Text != ""){

                if(AsyncFileUpload1.HasFile){

                    Session.Clear();
                    Session["checkFile"] = "FileYes";
                    Session["checkImage"] = "ImageNo";

                string fileType = AsyncFileUpload1.ContentType;

                if (fileType == "image/jpeg" || fileType == "image/png")
                {

                    Session.Clear();
                    Session["checkFile"] = "FileYes";
                    Session["checkImage"] = "ImageYes";

                    string filename = System.IO.Path.GetFileName(AsyncFileUpload1.FileName);
                    AsyncFileUpload1.SaveAs(Server.MapPath("~/uploads/") + filename);

                    conn.Open();
                    string path = "uploads/" + filename;

                    SqlCommand cmd = new SqlCommand("insert into ElectionInfo values('" + TextBox1.Text + "','" + TextBox2.Text + "', '" + path + " ')", conn);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
                
                }
            }
            
        }
        
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["checkFile"].ToString() == "FileYes" && Session["checkImage"].ToString() == "ImageNo")
                {
                    Label3.Visible = true;
                    Label3.ForeColor = Color.Red;
                    Label3.Text = "Image Only!!";
                    TextBox2.Text = "";
                }

                if (Session["checkFile"].ToString() == "FileYes" && Session["checkImage"].ToString() == "ImageYes")
                {
                    Label3.Visible = true;
                    Label3.ForeColor = Color.Green;
                    Label3.Text = "Uploaded!!";
                    TextBox2.Text = "";
                }
            }
            catch
            {
                Label3.Visible = true;
                Label3.Text = "Image Not Uploaded!!";
                TextBox2.Text = "";
            }
        }

        protected void Announce(object sender, EventArgs e)
        {
            try
            {
                conn.Open();

                SqlCommand cmd1 = new SqlCommand("select MAX(Num_Of_Vote) from Decision", conn);
                SqlDataAdapter adpt1 = new SqlDataAdapter(cmd1);
                DataTable tbl1 = new DataTable();
                adpt1.Fill(tbl1);
                int maxVote = int.Parse(tbl1.Rows[0][0].ToString());

                SqlCommand cmd2 = new SqlCommand("select Selected_Candidate from Decision where Num_Of_Vote='" + maxVote + "' ", conn);
                SqlDataAdapter adpt2 = new SqlDataAdapter(cmd2);
                DataTable tbl2 = new DataTable();
                adpt2.Fill(tbl2);
                ArrayList winnerPerson = new ArrayList();
                for (int i = 0; i < tbl2.Rows.Count; i++)
                {
                    winnerPerson.Add(tbl2.Rows[i][0].ToString());
                }

                SqlCommand cmd = new SqlCommand("select Email from VoterList", conn);
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                DataTable tbl = new DataTable();
                adpt.Fill(tbl);
                ArrayList mailAdd = new ArrayList();
                string userMail;

                for (int i = 0; i < tbl.Rows.Count; i++)
                {
                    mailAdd.Add(tbl.Rows[i][0].ToString());
                    userMail = mailAdd[i].ToString();

                    if (winnerPerson.Count == 1)
                    {
                        MailMessage msg = new MailMessage();
                        msg.From = new MailAddress("nazeeridreesi381@gmail.com");
                        msg.To.Add(userMail);
                        msg.Subject = "Winning Announcement";
                        msg.Body = winnerPerson[0] + " got heighest Vote: " + maxVote.ToString();
                        msg.IsBodyHtml = true;

                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = "smtp.gmail.com";

                        System.Net.NetworkCredential NetwokrCred = new System.Net.NetworkCredential();
                        NetwokrCred.UserName = "nazeeridreesi381@gmail.com";
                        NetwokrCred.Password = "allah ho akbar 381";

                        smtp.UseDefaultCredentials = true;
                        smtp.Credentials = NetwokrCred;
                        smtp.Port = 587;
                        smtp.EnableSsl = true;
                        smtp.Send(msg);

                        Label3.Visible = true;
                        Label3.ForeColor = Color.Green;
                        Label3.Text = "Annoucement Done Successfully!";

                    }
                    else
                    {

                        MailMessage msg = new MailMessage();
                        msg.From = new MailAddress("nazeeridreesi381@gmail.com");
                        msg.To.Add(userMail);
                        msg.Subject = "Result Announcement";
                        msg.Body = "Result got Tie Checkout Our Website";
                        msg.IsBodyHtml = true;

                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = "smtp.gmail.com";

                        System.Net.NetworkCredential NetwokrCred = new System.Net.NetworkCredential();
                        NetwokrCred.UserName = "nazeeridreesi381@gmail.com";
                        NetwokrCred.Password = "allah ho akbar 381";

                        smtp.UseDefaultCredentials = true;
                        smtp.Credentials = NetwokrCred;
                        smtp.Port = 587;
                        smtp.EnableSsl = true;
                        smtp.Send(msg);

                        Label3.Visible = true;
                        Label3.ForeColor = Color.Green;
                        Label3.Text = "Annoucement Done Successfully!";
                    }
                }


                conn.Close();
            }
            catch
            {
                Label3.Visible = true;
                Label3.ForeColor = Color.Red;
                Label3.Text = "Annoucement Failed!";
            }
        }

                

    }
}








