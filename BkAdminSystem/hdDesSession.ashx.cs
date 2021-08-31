using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BkAdminSystem
{
    /// <summary>
    /// hdDesSession 的摘要说明
    /// </summary>
    public class hdDesSession : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Session.Abandon();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}