using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace BkAdminSystem
{
    /// <summary>
    /// hdBiTypeTwo 的摘要说明
    /// </summary>
    public class hdBiTypeTwo : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string biTypeTwoValue = context.Request["biTypeTwoValue"].ToString();
            try
            {
                //利用db数据库操作类进行数据连接
                db.openConnection();
                //创建查询命令字符串
                string sql = "SELECT btId,btName FROM BookType Where btTypeId = @btTypeId";
                //定义一个sqlCommand接收SQL命令
                SqlCommand cmd = new SqlCommand(sql, db.Conn1);
                //将查询变量参数化，防止Sql注入
                cmd.Parameters.AddWithValue("@btTypeId", biTypeTwoValue);
                //创建一个SqlDataadapter
                SqlDataAdapter sdr = new SqlDataAdapter();
                //Adapter载入cmd
                sdr.SelectCommand = cmd;
                //创建一个DataTable
                DataTable dt = new DataTable();
                //使用SqlDataAdapter对象填充数据
                sdr.Fill(dt);
                //转换成JSON
                string str = DataTableToJson("1", dt);
                context.Response.Write(str);

            }
            catch (Exception ex)
            {
                //向控制台输出错误
                Console.Write(ex.Message);
            }
            finally
            {
                //关闭数据库
                db.closeConnection();
            }
        }


        public string DataTableToJson(string jsonName, DataTable table)
        {
            var jsonString = new StringBuilder();
            if (table.Rows.Count > 0)
            {
                jsonString.Append("[");
                for (int i = 0; i < table.Rows.Count; i++)
                {
                    jsonString.Append("{");
                    for (int j = 0; j < table.Columns.Count; j++)
                    {
                        if (j < table.Columns.Count - 1)
                        {
                            jsonString.Append("\"" + table.Columns[j].ColumnName.ToString()
                         + "\":" + "\""
                         + table.Rows[i][j].ToString() + "\",");
                        }
                        else if (j == table.Columns.Count - 1)
                        {
                            jsonString.Append("\"" + table.Columns[j].ColumnName.ToString()
                         + "\":" + "\""
                         + table.Rows[i][j].ToString() + "\"");
                        }
                    }
                    if (i == table.Rows.Count - 1)
                    {
                        jsonString.Append("}");
                    }
                    else
                    {
                        jsonString.Append("},");
                    }
                }
                jsonString.Append("]");
            }
            return jsonString.ToString();
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