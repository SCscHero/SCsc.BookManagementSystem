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
    /// hdBookInfoModiSave 的摘要说明
    /// </summary>
    public class hdBookInfoModiSave : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            string biName = context.Request["biName"].ToString();
            string biTypeTwo1 = context.Request["biTypeTwo1"].ToString();
            string sWriter = context.Request["sWriter"].ToString();
            string biDesc = context.Request["biDesc"].ToString();
            string sPubHouse = context.Request["sPubHouse"].ToString();
            string sBookState = context.Request["sBookState"].ToString();
            string biPubTime = context.Request["biPubTime"].ToString();
            string biMark = context.Request["biMark"].ToString();

            try
            {
                //利用db数据库操作类进行数据连接
                db.openConnection();
                //创建连接命令字符串
                string sql = "UPDATE dbo.BookInfo SET biName = @biName,biType=@biType,biWriter=@biWriter,";
                sql += "biDesc=@biDesc,biPublish=@biPublish,biState=@biState,biPubTime=@biPubTime,biMark=@biMark WHERE biId = @biId";
                //定义一个sqlCommand接收SQL命令
                SqlCommand cmd = new SqlCommand(sql, db.Conn1);
                //将查询变量参数化，防止Sql注入
                cmd.Parameters.AddWithValue("@biName", biName);
                cmd.Parameters.AddWithValue("@biType", biTypeTwo1);
                cmd.Parameters.AddWithValue("@biWriter", sWriter);
                cmd.Parameters.AddWithValue("@biDesc", biDesc);
                cmd.Parameters.AddWithValue("@biPublish", sPubHouse);
                cmd.Parameters.AddWithValue("@biState", sBookState);
                cmd.Parameters.AddWithValue("@biPubTime", biPubTime);
                cmd.Parameters.AddWithValue("@biMark", biMark);
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