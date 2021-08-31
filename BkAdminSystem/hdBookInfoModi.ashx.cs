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
    /// hdBookInfoModi 的摘要说明
    /// </summary>
    public class hdBookInfoModi : IHttpHandler,System.Web.SessionState.IRequiresSessionState
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
                string sql = "SELECT biName,biType,biWriter,biDesc,biPublish,biState,biPubTime,biMark FROM BookInfo WHERE biId = @biId";
                //定义一个sqlCommand接收SQL命令
                SqlCommand cmd = new SqlCommand(sql, db.Conn1);
                //将查询变量参数化，防止Sql注入
                cmd.Parameters.AddWithValue("@biId", oldId);
                //定义一个SqlDataReader接收数据
                SqlDataReader dr = cmd.ExecuteReader();
                //创建哈希表接收数据
                Hashtable hsBookInfoOld = new Hashtable();
                //利用While循环 使DataReader读取数据
                while (dr.Read())
                {
                    for (int i = 0; i < dr.FieldCount; i++)
                    {
                        hsBookInfoOld.Add(dr.GetName(i), dr.GetValue(i)); //向哈希表中存入数据
                    }
                }
                dr.Close();//关闭DataReader，节省性能
                context.Session["hsBookInfoOld"] = hsBookInfoOld;
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