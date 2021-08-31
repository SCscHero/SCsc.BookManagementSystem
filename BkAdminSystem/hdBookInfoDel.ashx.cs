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
    /// hdBookInfoDel 的摘要说明
    /// </summary>
    public class hdBookInfoDel : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //接受来自ajax的参数
            string oldId = context.Request["oldId"].ToString();
            Hashtable hsBookInfoOld = new Hashtable();

            try
            {
                //利用db数据库操作类进行数据连接
                db.openConnection();
                //创建连接命令字符串
                string sql = "delete from BookInfo where biId = @biId";
                //定义一个sqlCommand接收SQL命令
                SqlCommand cmd = new SqlCommand(sql, db.Conn1);
                //将查询变量参数化，防止Sql注入
                cmd.Parameters.AddWithValue("@biId", oldId);
                //执行删除语句
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