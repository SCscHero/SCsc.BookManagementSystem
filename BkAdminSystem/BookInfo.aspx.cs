using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Collections;


namespace BkAdminSystem
{
    public partial class BookInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void modiBookInfo(object s, CommandEventArgs e)
        {
            try
            {
                //利用db数据库操作类进行数据连接
                db.openConnection();
                //创建连接命令字符串
                string sql = "SELECT * FROM BookInfo WHERE biId = @biId";
                //定义一个sqlCommand接收SQL命令
                SqlCommand cmd = new SqlCommand(sql, db.Conn1);
                //将查询变量参数化，防止Sql注入
                cmd.Parameters.AddWithValue("@biId", e.CommandArgument);
                //使用DataReadre对象读取数据
                SqlDataReader dr = cmd.ExecuteReader();
                //创建哈希表存储操作员账户所有信息
                Hashtable oiInfo = new Hashtable();

                //利用While循环 使DataReader读取数据
                while (dr.Read())
                {
                    for (int i = 0; i < dr.FieldCount; i++)
                    {
                        oiInfo.Add(dr.GetName(i), dr.GetValue(i)); //向哈希表中存入数据
                    }
                }
                dr.Close();//关闭DataReader，节省性能
                Session["BookInfo"] = oiInfo;
            }
            catch(Exception ex)
            {
                Console.Write(ex.Message);
            }
            finally
            {
                db.closeConnection();
            }

        }
        protected void delBookInfo(object s, CommandEventArgs e)
        {

        }
    }
}