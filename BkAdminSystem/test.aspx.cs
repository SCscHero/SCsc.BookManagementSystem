using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BkAdminSystem
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["sel"] = "123";
            //this.CITY.Attributes.Add("onchange", base.Page.GetPostBackEventReference(this.CITY));
        }

        protected void CITY_ServerChange(object sender, EventArgs e)
        {
            //Response.Write("121313");
            //这是你要写的事件

            //protected void Page_Load(object sender, EventArgs e)
            //{
            //    this.biTypeOne.Attributes.Add("onchange", base.Page.GetPostBackEventReference(this.biTypeOne));
            //    //以下方法添加了TreeView的根节点和子节点
            //}
            //protected void BindTypeOne(object sender, EventArgs e)
            //{
            //    Response.Write("121313");
            //}
        }
    }
}