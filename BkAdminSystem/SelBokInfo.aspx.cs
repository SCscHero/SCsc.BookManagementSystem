using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BkAdminSystem
{
    public partial class SelBokInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSel_Click(object sender, EventArgs e)
        {
            Session["sel"] = inpSel.Value;
            Response.Redirect("Sel.aspx");
        }
    }
}