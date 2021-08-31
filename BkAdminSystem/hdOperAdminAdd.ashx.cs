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
    /// hdOperAdminAdd 的摘要说明
    /// </summary>
    public class hdOperAdminAdd : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            string oiAct = context.Request["oiAct"].ToString();
            string oiPwd = context.Request["oiPwd"].ToString();
            string oiName = context.Request["oiName"].ToString();
            string oiTel = context.Request["oiTel"].ToString();
            string oiAdres = context.Request["oiAdres"].ToString();
            string oiMark = context.Request["oiMark"].ToString();

            //Dictionary<String, Object> dicParameter = GetParameter(context);
            //string biTypeOneValue = context.Request["objBookInfoAdd"].ToString();
            //IDictionary<string, object> paramsItems = (IDictionary<string, object>)context.Request.InputStream;
            //context.Request["key1"].ToString()

            try
            {
                //利用db数据库操作类进行数据连接
                db.openConnection();
                //创建连接命令字符串
                string sql = "INSERT INTO dbo.OperInfo(oiAct,oiPwd,oiName,oiTel,oiAdres,oiMark)VALUES";
                sql += "(@oiAct,@oiPwd,@oiName,@oiTel,@oiAdres,@oiMark)";
                //定义一个sqlCommand接收SQL命令
                SqlCommand cmd = new SqlCommand(sql, db.Conn1);
                //将查询变量参数化，防止Sql注入
                cmd.Parameters.AddWithValue("@oiAct", oiAct);
                cmd.Parameters.AddWithValue("@oiPwd", oiPwd);
                cmd.Parameters.AddWithValue("@oiName", oiName);
                cmd.Parameters.AddWithValue("@oiTel", oiTel);
                cmd.Parameters.AddWithValue("@oiAdres", oiAdres);
                cmd.Parameters.AddWithValue("@oiMark", oiMark);
                //cmd执行  新增成功
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