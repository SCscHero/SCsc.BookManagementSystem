using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BkAdminSystem
{
    public partial class CentPerson : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ifnull(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
    }
}