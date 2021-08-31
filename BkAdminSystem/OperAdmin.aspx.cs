using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections;

namespace BkAdminSystem
{
    public partial class OperAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //lvOpenInfo.View = View.Details;
            //lvOpenInfo.GridLines = true;
        }

        protected void lvOperInfo_SelectedIndexChanged(object sender, EventArgs e)
        {
            //ListView lv = (ListView)sender;
            //string filename = lv.SelectedItems[0].SubItems[1].Text;
            ////获取第1列的值

        }
        protected void insOiInfo(object s, CommandEventArgs e)
        {
            //创建新增命令字符串
            string sql = "DELETE FROM OperInfo WHERE oiId = @oiId";
            //定义一个sqlCommand接收删除字符串命令
            SqlCommand cmd = new SqlCommand(sql, db.Conn1);
            //此为过时写法：cmd.Parameters.Add("@oiId", e.CommandArgument.ToString());
            cmd.Parameters.AddWithValue("@oiId", e.CommandArgument.ToString());
            try
            {
                db.openConnection();//利用数据库操作类打开数据库连接
                Hashtable oiInfo = new Hashtable();//创建哈希表存储数据
                SqlDataReader dr = cmd.ExecuteReader();//创建哈希表存储操作员账户所有信息
                //利用While循环 使DataReader读取数据
                while (dr.Read())
                {
                    for (int i = 0; i < dr.FieldCount; i++)
                    {
                        oiInfo.Add(dr.GetName(i), dr.GetValue(i));
                    }
                }
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
            }
            finally
            {
                db.closeConnection();
                lvOperInfo.DataBind();
            }
        }
        protected void delOiInfo(object s, CommandEventArgs e)
        {
            //创建删除命令字符串
            string sql = "DELETE FROM OperInfo WHERE oiId = @oiId";
            //定义一个sqlCommand接收删除字符串命令
            SqlCommand cmd = new SqlCommand(sql, db.Conn1);
            //此为过时写法：cmd.Parameters.Add("@oiId", e.CommandArgument.ToString());
            cmd.Parameters.AddWithValue("@oiId", e.CommandArgument.ToString());
            try
            {
                db.openConnection();//利用数据库操作类打开数据库连接
                Hashtable oiInfo = new Hashtable();//创建哈希表存储数据
                SqlDataReader dr = cmd.ExecuteReader();//创建哈希表存储操作员账户所有信息
                //利用While循环 使DataReader读取数据
                while (dr.Read())
                {
                    for (int i = 0; i < dr.FieldCount; i++)
                    {
                        oiInfo.Add(dr.GetName(i), dr.GetValue(i));
                    }
                }
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
            }
            finally
            {
                db.closeConnection();
                lvOperInfo.DataBind();
            }
        }
        protected void modiOiInfo(object s, CommandEventArgs e)
        {
            //创建修改命令字符串
            string sql = "UPDATE OperInfo SET oiName = '张少驰123' WHERE oiId = @oiId";
            //定义一个sqlCommand接收修改字符串命令
            SqlCommand cmd = new SqlCommand(sql, db.Conn1);
            //此为过时写法：cmd.Parameters.Add("@oiId", e.CommandArgument.ToString());
            cmd.Parameters.AddWithValue("@oiId", e.CommandArgument.ToString());
            try
            {
                db.openConnection();//利用数据库操作类打开数据库连接
                Hashtable oiInfo_modi = new Hashtable();//创建哈希表存储数据
                SqlDataReader dr = cmd.ExecuteReader();//创建DataReader接收数据
                //利用While循环 使DataReader读取数据
                while (dr.Read())
                {
                    for (int i = 0; i < dr.FieldCount; i++)
                    {
                        oiInfo_modi.Add(dr.GetName(i), dr.GetValue(i));//向哈希表中存入数据
                    }
                }
                dr.Close();//关闭DataReader，节省性能
                Session["oiInfo_modi"] = oiInfo_modi;//使用Session保存哈希表
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
            }
            finally
            {
                db.closeConnection();
                lvOperInfo.DataBind();
            }
        }
    }
}