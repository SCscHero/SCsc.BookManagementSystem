using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BkAdminSystem
{
    public partial class OperLimitAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void lbModi(object sender,EventArgs e)
        {
            //创建一个Session接受值
            Session["CID"] = BulletedList1.SelectedItem.Value;
            ListView1.DataBind();
        }
    }
}