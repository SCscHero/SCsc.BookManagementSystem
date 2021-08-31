using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data.SqlClient;

namespace BkAdminSystem
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["oiInfo"] == null)
            {
                Response.Redirect("Login1.aspx");
            }
            //强制转换哈希表
            Hashtable oiInfo = (Hashtable)Session["oiInfo"];
            //传入菜单右上角的用户名值
            oiState.InnerHtml = oiInfo["oiAct"].ToString();
            Session["oiId"] = oiInfo["oiId"];
            //权限菜单初始化
            try
            {
                db.openConnection();
                string sql= "SELECT * FROM OperLimit WHERE olId = @olId";
                //定义一个sqlCommand接收SQL命令
                SqlCommand cmd = new SqlCommand(sql,db.Conn1);
                //将查询变量参数化，防止Sql注入
                cmd.Parameters.AddWithValue("@olId",Session["oiId"].ToString());
                SqlDataReader dr = cmd.ExecuteReader();
                //创建哈希表存储操作员账户所有信息
                Hashtable olLimit = new Hashtable();
                //利用While循环 使DataReader读取数据
                while (dr.Read())
                {
                    for (int i = 0; i < dr.FieldCount; i++)
                    {
                        olLimit.Add(dr.GetName(i), dr.GetValue(i)); //向哈希表中存入数据
                    }
                }
                dr.Close();//关闭DataReader，节省性能

                ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", "<script>$('menu_OperAdmin').hide()</script>");
                //权限判定开始——————————
                if (olLimit["olInfo"].ToString()=="0")
                {

                    ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", "<script>$('menu_OperAdmin').hide()</script>");
                }
                if (olLimit["olState"].ToString() == "0")
                {
                    ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", "<script>$('menu_OperAdmin').hide()</script>");
                }
                if (olLimit["olBokInfo"].ToString() == "0")
                {
                    ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", "<script>$('menu_OperAdmin').hide()</script>");
                }
                if (olLimit["olBowAd"].ToString() == "0")
                {
                    ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", "<script>$('menu_OperAdmin').hide()</script>");
                }
                if (olLimit["olRetuAd"].ToString() == "0")
                {
                    ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", "<script>$('menu_OperAdmin').hide()</script>");
                }
                if (olLimit["olMark"].ToString() == "0")
                {
                    ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", "<script>$('menu_OperAdmin').hide()</script>");
                }
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                db.closeConnection();
            }

        }
    }
}