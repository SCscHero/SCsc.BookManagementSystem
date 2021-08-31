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
    /// hdOperAdminDel 的摘要说明
    /// </summary>
    public class hdOperAdminDel : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //接受来自ajax的参数
            string oldId = context.Request["oldId"].ToString();
            try
            {
                //利用db数据库操作类进行数据连接
                db.openConnection();
                //创建连接命令字符串
                string sql = "DELETE FROM OperInfo WHERE oiId = '@oiId' ";
                //定义一个sqlCommand接收SQL命令
                SqlCommand cmd = new SqlCommand(sql, db.Conn1);
                //将查询变量参数化，防止Sql注入
                cmd.Parameters.AddWithValue("@oiId", oldId);
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