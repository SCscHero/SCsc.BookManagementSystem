using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

namespace BkAdminSystem
{
    public partial class BookInfo_Modi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Hashtable hsBookInfoOld = (Hashtable)Session["hsBookInfoOld"];
            biName.Value = hsBookInfoOld["biName"].ToString();
            biTypeOne.Value = hsBookInfoOld["biType"].ToString();
            sWriter.Value = hsBookInfoOld["biWriter"].ToString();
            biDesc.Value = hsBookInfoOld["biDesc"].ToString();
            sPubHouse.Value = hsBookInfoOld["biPublish"].ToString();
            sBookState.Value = hsBookInfoOld["biState"].ToString();
            biPubTime.Value = hsBookInfoOld["biPubTime"].ToString();
            biMark.Value = hsBookInfoOld["biMark"].ToString();
        }
    }
}