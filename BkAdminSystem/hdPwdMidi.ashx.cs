using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Collections;
using System.IO;
using System.Web.Script.Serialization;

namespace BkAdminSystem
{
    /// <summary>
    /// hdPwdMidi 的摘要说明
    /// </summary>
    public class hdPwdMidi : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //接受来自ajax的参数
            string newPwd1 = context.Request["newPwd1"].ToString();
            string oiId = context.Session["oiId"].ToString();

            try
            {
                //利用db数据库操作类进行数据连接
                db.openConnection();
                //创建连接命令字符串
                string sql = "update OperInfo set oiPwd = @oiPwd Where oiId = @oiId";
                //定义一个sqlCommand接收SQL命令
                SqlCommand cmd = new SqlCommand(sql, db.Conn1);
                //将查询变量参数化，防止Sql注入
                cmd.Parameters.AddWithValue("@oiId", oiId);
                cmd.Parameters.AddWithValue("@oiPwd", newPwd1);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
            }
            finally
            {
                db.closeConnection();
            }

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