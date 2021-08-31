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
    /// hdBookInfoAdd 的摘要说明
    /// </summary>
    public class hdBookInfoAdd : IHttpHandler
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

            //Dictionary<String, Object> dicParameter = GetParameter(context);
            //string biTypeOneValue = context.Request["objBookInfoAdd"].ToString();
            //IDictionary<string, object> paramsItems = (IDictionary<string, object>)context.Request.InputStream;
            //context.Request["key1"].ToString()


            try
            {
                //利用db数据库操作类进行数据连接
                db.openConnection();
                //创建连接命令字符串
                string sql = "INSERT dbo.BookInfo(biName,biType,biWriter,biDesc,biPublish,biState,biPubTime,biMark)VALUES";
                sql += "(@biName,@biType,@biWriter,@biDesc,@biPublish,@biState,@biPubTime,@biMark)";
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

        ///// <summary>
        ///// 获取参数
        ///// </summary>
        ///// <param name="context"></param>
        ///// <returns></returns>
        //private Dictionary<String, Object> GetParameter(HttpContext context)
        //{
        //    StreamReader reader = new StreamReader(context.Request.InputStream);
        //    //得到json字符串：strJson={"key3":"xdp-gacl","key4":"白虎神皇"}
        //    String strJson = HttpUtility.UrlDecode(reader.ReadToEnd());
        //    JavaScriptSerializer jss = new JavaScriptSerializer();
        //    //将json字符串反序列化成一个Dictionary对象
        //    Dictionary<String, Object> dicParameter = jss.Deserialize<Dictionary<String, Object>>(strJson);
        //    return dicParameter;
        //}

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
