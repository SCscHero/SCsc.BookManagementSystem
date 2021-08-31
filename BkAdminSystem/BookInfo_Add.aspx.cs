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
    public partial class BookInfo_Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //this.biTypeOne.Attributes.Add("onchange", base.Page.GetPostBackEventReference(this.biTypeOne));

            BindBookState();
            BindPubHouse();
            BindBiWrite();
            BindTypeOne();
        }


        /// <summary>
        /// 一级分类菜单绑定
        /// </summary>
        protected void BindTypeOne()
        {
            try
            {
                //利用db数据库操作类进行数据连接
                db.openConnection();
                //创建查询命令字符串
                string sql = "SELECT btId,btName FROM BookType Where btTypeId = 0";
                //定义一个sqlCommand接收SQL命令
                SqlCommand cmd = new SqlCommand(sql, db.Conn1);
                //使用DataReadre对象读取数据
                SqlDataReader dr = cmd.ExecuteReader();
                //利用While循环 使DataReader读取数据
                int i = -1;//定义一个i，来记录Value的索引
                while (dr.Read())
                {
                    i++;
                    biTypeOne.Items.Add(dr["btName"].ToString());
                    biTypeOne.Items[i].Value = dr["btId"].ToString();
                }
                dr.Close();//关闭DataReader，节省性能
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


        /// <summary>
        /// 二级分类菜单绑定
        /// </summary>
        //[WebMethod]
        //public static void BookInfoIns(string biName, string biType, string biWriter, string biDesc, string biPicPath, string biPublish, string biState, string biPubTime, string biPrice, string biDelte, string biMark)
        //{
        protected void BindTypeTwo(object sender, EventArgs e)
        {
            try
            {
                //利用db数据库操作类进行数据连接
                db.openConnection();
                //创建查询命令字符串
                string sql = "SELECT btId,btName FROM BookType Where btTypeId = @btTypeId";
                //定义一个sqlCommand接收SQL命令
                SqlCommand cmd = new SqlCommand(sql, db.Conn1);
                //将查询变量参数化，防止Sql注入
                cmd.Parameters.AddWithValue("@btTypeId", biTypeOne.Value);
                //使用DataReadre对象读取数据
                SqlDataReader dr = cmd.ExecuteReader();
                //利用While循环 使DataReader读取数据
                int i = -1;//定义一个i，来记录Value的索引
                while (dr.Read())
                {
                    i++;
                    biTypeTwo.Items.Add(dr["btName"].ToString());
                    biTypeTwo.Items[i].Value = dr["btId"].ToString();
                }
                dr.Close();//关闭DataReader，节省性能
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

        /// <summary>
        /// 三级分类菜单绑定
        /// </summary>
        protected void BindTypeThree(object sender, EventArgs e)
        {
            try
            {
                //利用db数据库操作类进行数据连接
                db.openConnection();
                //创建查询命令字符串
                string sql = "SELECT btId,btName FROM BookType Where btTypeId = @btTypeId";
                //定义一个sqlCommand接收SQL命令
                SqlCommand cmd = new SqlCommand(sql, db.Conn1);
                //将查询变量参数化，防止Sql注入
                cmd.Parameters.AddWithValue("@btTypeId", biTypeTwo.Value);
                //使用DataReadre对象读取数据
                SqlDataReader dr = cmd.ExecuteReader();
                //利用While循环 使DataReader读取数据
                int i = -1;//定义一个i，来记录Value的索引
                while (dr.Read())
                {
                    i++;
                    biTypeThree.Items.Add(dr["btName"].ToString());
                    biTypeThree.Items[i].Value = dr["btId"].ToString();
                }
                dr.Close();//关闭DataReader，节省性能
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

        /// <summary>
        /// 图书状态绑定
        /// </summary>
        protected void BindBookState()
        {
            try
            {
                //利用db数据库操作类进行数据连接
                db.openConnection();
                //创建查询命令字符串
                string sql = "SELECT bsId,bsState FROM BookState";
                //定义一个sqlCommand接收SQL命令
                SqlCommand cmd = new SqlCommand(sql, db.Conn1);
                //使用DataReadre对象读取数据
                SqlDataReader dr = cmd.ExecuteReader();
                //利用While循环 使DataReader读取数据
                int i = -1;//定义一个i，来记录Value的索引
                while (dr.Read())
                {
                    i++;
                    sBookState.Items.Add(dr["bsState"].ToString());
                    sBookState.Items[i].Value = dr["bsId"].ToString();
                }
                dr.Close();//关闭DataReader，节省性能
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

        /// <summary>
        /// 出版社绑定
        /// </summary>
        protected void BindPubHouse()
        {
            try
            {
                //利用db数据库操作类进行数据连接
                db.openConnection();
                //创建查询命令字符串
                string sql = "SELECT phId,phName FROM PubHouse";
                //定义一个sqlCommand接收SQL命令
                SqlCommand cmd = new SqlCommand(sql, db.Conn1);
                //使用DataReadre对象读取数据
                SqlDataReader dr = cmd.ExecuteReader();
                int i = -1;//定义一个i，来记录Value的索引
                //利用While循环 使DataReader读取数据
                while (dr.Read())
                {
                    i++;
                    sPubHouse.Items.Add(dr["phName"].ToString());
                    sPubHouse.Items[i].Value = dr["phId"].ToString();

                }
                dr.Close();//关闭DataReader，节省性能
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


        /// <summary>
        /// 撰写人绑定
        /// </summary>
        protected void BindBiWrite()
        {
            try
            {
                //利用db数据库操作类进行数据连接
                db.openConnection();
                //创建查询命令字符串
                string sql = "SELECT wId,wName FROM Writer";
                //定义一个sqlCommand接收SQL命令
                SqlCommand cmd = new SqlCommand(sql, db.Conn1);
                //使用DataReadre对象读取数据
                SqlDataReader dr = cmd.ExecuteReader();
                int i = -1;//定义一个i，来记录Value的索引
                //利用While循环 使DataReader读取数据
                while (dr.Read())
                {
                    i++;
                    sWriter.Items.Add(dr["wName"].ToString());
                    sWriter.Items[i].Value = dr["wId"].ToString();
                }
                dr.Close();//关闭DataReader，节省性能
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

        /// <summary>
        /// 新增图书信息的方法
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                //利用db数据库操作类进行数据连接
                db.openConnection();
                //创建查询命令字符串
                string sql = "INSERTdbo.BookInfo(biName,biType,biWriter,biDesc,biPicPath,biPublish,biState,biPubTime,biPrice,biMark)VALUES";
                sql += "(@biName,@biType,@biWriter,@biDesc,@bPicPath,@biPublish,@biState,@biPubTime,@biPrice,@biMark)";
                //定义一个sqlCommand接收SQL命令
                SqlCommand cmd = new SqlCommand(sql, db.Conn1);
                //将查询变量参数化，防止Sql注入
                //cmd.Parameters.AddWithValue("@biName", biName.Value);
                //cmd.Parameters.AddWithValue("@biType", act);
                //cmd.Parameters.AddWithValue("@biWriter", act);
                //cmd.Parameters.AddWithValue("@biDesc", act);
                //cmd.Parameters.AddWithValue("@bPicPath", act);
                //cmd.Parameters.AddWithValue("@biPublish", act);
                //cmd.Parameters.AddWithValue("@biState", act);
                //cmd.Parameters.AddWithValue("@biPubTime", act);
                //cmd.Parameters.AddWithValue("@biPrice", act);
                //cmd.Parameters.AddWithValue("@biMark", act);

                //使用DataReadre对象读取数据
                SqlDataReader dr = cmd.ExecuteReader();
                //定义一个ListItem来接收和绑定数据
                ListItem li = new ListItem();
                //利用While循环 使DataReader读取数据
                while (dr.Read())
                {
                    //利用li存储dr中读取的值
                    li.Text = dr["wName"].ToString();
                    //向biBookState存入选项
                    sWriter.Items.Add(li.Text);
                    //BindDropDownList(Convert.ToInt32(li.Value), bsName);
                }
                dr.Close();//关闭DataReader，节省性能
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

    }
}