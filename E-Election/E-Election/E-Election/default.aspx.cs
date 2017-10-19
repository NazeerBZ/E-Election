using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Election
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if(Session["poke"] != null){

                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "TimeLeft();", true);
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ranking.aspx");
        }

    }
}