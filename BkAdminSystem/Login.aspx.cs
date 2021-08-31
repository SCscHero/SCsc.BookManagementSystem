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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //初始化验证码
            ibtn_yzm.ImageUrl = "Verify.aspx";

            if (!IsPostBack)
            {
                //读取保存的Cookie信息
                HttpCookie cookies = Request.Cookies["USER_COOKIE"];
                if (cookies != null)
                {
                    //如果Cookie不为空，则将Cookie里面的用户名和密码读取出来赋值给前台的文本框。
                    inpOper.Value = cookies["UserName"];

                    inpPwd.Attributes.Add("value", cookies["UserPassword"]);
                    //这里依然把记住密码的选项给选中。
                    //this.ifSavAct.Checked = true;
                }
            }
            else
            {
                //cookie["USER_COOKIE"] != null
                if (true)
                {
                    //如果用户没有选择记住密码，那么立即将Cookie里面的信息情况，并且设置状态保持立即过期。
                    Response.Cookies["USER_COOKIE"].Expires = DateTime.Now;
                }
            }
        }

        /// <summary>
        /// 后台登录验证
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ifnull(object sender, EventArgs e)
        {
            try
            {
                //利用db数据库操作类进行数据连接
                db.openConnection();
                //创建连接命令字符串
                string sql = "select * from OperInfo where oiAct = @act";
                //定义一个sqlCommand接收SQL命令
                SqlCommand cmd = new SqlCommand(sql, db.Conn1);
                //将查询变量参数化，防止Sql注入
                cmd.Parameters.AddWithValue("@act", inpOper.Value);
                cmd.Parameters.AddWithValue("@pwd", inpPwd.Value);
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
                if (oiInfo["oiPwd"] != null)
                {
                    if (oiInfo["oiPwd"].ToString() == inpPwd.Value)
                    {
                        string code = tbx_yzm.Value;
                        HttpCookie htco = Request.Cookies["ImageV"];
                        string scode = htco.Value.ToString();
                        if (code != scode)
                        {
                            Response.Write("<script>layer.msg('验证码错误!', { icon: 5, time: 1000 });</script>");
                        }
                        else
                        {
                            //定义Session传参到主页
                            Session["oiInfo"] = oiInfo;
                            string js = "layer.msg('验证成功!', { icon: 6, time: 1000 });";
                            js += "setTimeout(function () { window.location.href = 'HomePage.aspx'; }, 2000);";
                            Response.Write(js);
                        }


                    }
                    else
                    {
                        Response.Write("<script>layer.msg('用户名为空或用户名不正确!', { icon: 5, time: 1000 });</script>");

                    }
                }
                else
                {
                    Response.Write("<script>alert('我是js');</script>");

                    Response.Write("<script language='javascript'> "
+ " function document.onreadystatechange() " //页面ready状态变化时触发
+ " { if(document.readyState=='complete') " //当页面加载完成时
+ "{ "
+ "error0()" //此时执行这个函数，应该就可以了，因为相关js已经被加载近来了。
+ "} "
+ "} "
+ "</script>");
                }
            }

            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                db.closeConnection();
            }
        }



        /// <summary>
        /// 登录 - 验证用户名是否存在及密码是否正确，验证通过即登录
        /// </summary>
        /// <param name="act"></param>
        /// <param name="pwd"></param>
        /// <returns></returns>
        [WebMethod]
        public static string judgePwd(string act, string pwd)
        {
            //利用db数据库操作类进行数据连接
            db.openConnection();
            //创建连接命令字符串
            string sql = "select * from OperInfo where oiAct = @act";
            //定义一个sqlCommand接收SQL命令
            SqlCommand cmd = new SqlCommand(sql, db.Conn1);
            //将查询变量参数化，防止Sql注入
            cmd.Parameters.AddWithValue("@act", act);
            cmd.Parameters.AddWithValue("@pwd", pwd);
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
            //因静态变量，县初始化Page 然后传参
            Page page = new Page();

            db.closeConnection();
            if (oiInfo["oiPwd"] != null)
            {
                if (oiInfo["oiPwd"].ToString() == pwd)
                {
                    //定义Session传参到主页
                    page.Session["oiInfo"] = oiInfo;
                    return "ok";//返回ok 即验证成功
                }
                else
                {
                    return "1";//返回1 即为密码不正确
                }
            }
            else
            {
                return "0";//返回0 即为用户名不存在
            }
        }

        /// <summary>
        /// 刷新
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void refVeri(object sender, EventArgs e)
        {
            string code = tbx_yzm.Value;
            HttpCookie htco = Request.Cookies["ImageV"];
            string scode = htco.Value.ToString();
            Session["refVeri"] = scode;
            }
        }





    //protected void loginVerify(object sender, EventArgs e)
    //{
    //}
    ////单值Cookies示例
    //HttpCookie ckOper = new HttpCookie("OperInfo");//定义一个名为OperInfo的主键
    //ckOper.Value = "操作员A";                      //给ckOper对象赋值
    //ckOper.Expires = DateTime.Now.AddDays(1);      //给Cookies设置过期时间
    //Response.Cookies.Add(ckOper);                  //写入Cookies


    ////多值Cookies示例
    //HttpCookie ckOper1 = new HttpCookie("OperInfo1"); //定义一个名为OperInfo的主键
    //ckOper1.Values.Add("opername", "小王");              //给多值ckOper1对象赋值，赋值顺序主键名、值
    //ckOper1.Values.Add("operage", "18");
    //ckOper1.Values.Add("opersex", "男");
    //ckOper1.Expires = DateTime.Now.AddDays(1);        //给Cookies设置过期时间
    //ckOper1.Expires = DateTime.MaxValue;//设置永不过期时间
    //Response.Cookies.Add(ckOper);                    //写入Cookies

    ////删除Cookies标准写法
    //Response.Cookies["OperInfo"].Expires = DateTime.MinValue;

    ////读取单值Cookies
    //if (Request.Cookies["OperInfo"] != null)      //判断是否为空
    //{
    //    string _myStr = Request.Cookies["OperInfo"].Value;  //读取OperInfo中的值

    //}


    //读取多值Cookies
    //if (Request.Cookies["OperInfo"] != null)
    //{
    //    HttpCookie _ck = Request.Cookies["OperInfo1"];  //Cookies主键名称
    //    string read_ck = _ck.Values["opername"] + "," + _ck.Values["operage"] + "," + _ck.Values["opersex"];//读取时调用子键的值

    //}

    //遍历Cookies  对主键遍历
    //foreach (string _key in Request.Cookies.AllKeys)
    //{
    //    //对子键遍历
    //    foreach (string _subkey in Request.Cookies[_key].Values.Keys)
    //    {
    //        //遍历清除所有Cookies
    //    }
    //}

    //if (uAct.Text == string.Empty)
    //{
    //    Response.Write("<script>alert('管理员名称不能为空！')</script>");
    //    return;
    //}
    //else if(uPwd.Text == string.Empty)
    //{
    //    Response.Write("<script>alert('管理员密码不能为空！')</script>");
    //    return;
    //}
    //else if(true)
    //{
    //    return;

    //    Session["_uAct"] = uAct.Text;
    //}
    //else
    //{
    //    Response.Redirect("HomePage.aspx");

    //    //DataSet adminds = null;
    //    //DataSet readerds = null;
    //    //adminmanage.Name = txtAdmin.Text;
    //    //adminmanage.Pwd = txtPwd.Text;
    //    //adminds = adminmanage.Login(adminmanage);
    //    //readermanage.ID = txtPwd.Text;
    //    //readermanage.Name = txtAdmin.Text;
    //    //readerds = readermanage.ReaderLogin(readermanage);
    //    //if (adminds.Tables[0].Rows.Count > 0 && txtCode.Text == Request.Cookies["CheckCode"].Value)
    //    //{
    //    //    Session["Name"] = txtAdmin.Text;
    //    //    Response.Redirect("Default.aspx");
    //    //}
    //    //else if (readerds.Tables[0].Rows.Count > 0 && txtCode.Text == Request.Cookies["CheckCode"].Value)
    //    //{
    //    //    Session["Name"] = txtAdmin.Text;
    //    //    Session["readid"] = txtPwd.Text;
    //    //    Session["role"] = "Reader";
    //    //    Response.Redirect("Default.aspx");
    //    //}
    //    //else
    //    //{
    //    //    Response.Write("<script>alert('登录名或密码不正确！')</script>");
    //    //}
    //}

    //    string conStr = "Data Source=.;Initial Catalog=rwxtt1; uid=sa;pwd=sa; Persist Security Info=True";
    //    SqlConnection con = new SqlConnection(conStr);
    //    //SqlCommand cmd = con.CreateCommand();
    //    con.Open();
    //    string sql = "select * from Users where uAct = '" + userAccount + "' AND uPwd = '" + userPassword + "'";
    //    SqlCommand cmd = new SqlCommand(sql, con);
    //    SqlDataReader dr = cmd.ExecuteReader();

    //    //cmd.ExecuteScalar() //是返回行数，可以通过返回行数来判断是否正确。
    //    while (dr.Read())
    //    {
    //        Session["_uAct"] = dr["uAct"];
    //        Session["_uPwd"] = dr["uPwd"];
    //    }
    //    if (userAccount != Session["_uAct"].ToString() && userPassword != Session["_uPwd"].ToString())
    //    {
    //        con.Close();
    //        return "1";//return logcd.nullActPwd;
    //    }
    //    else if (userAccount != Session["_uAct"].ToString() || userAccount == "")
    //    {
    //        con.Close();
    //        return "2";//return logcd.nullErrAct;
    //    }
    //    else if (userPassword != Session["_uPwd"].ToString() || userPassword == "")
    //    {
    //        con.Close();
    //        return "3";
    //        //return logcd.nullErrPwd;
    //    }
    //    else if (userAccount == Session["_uAct"].ToString() && userPassword == Session["_uPwd"].ToString())
    //    {
    //        con.Close();
    //        return "ok";
    //        //return logcd.sucedLogin;
    //    }
    //    else
    //    {
    //        con.Close();
    //        return "no";
    //        //return logcd.loginError;
    //    }


    //    //cmd.CommandText = "select uPwd from Users where uAct = " + userAccount; //执行命令？
    //    //SqlDataReader reader = cmd.ExecuteReader();
    //    //IHashObject hero = new

    //}
    //    catch (System.Exception ex)
    //    {
    //        System.Console.WriteLine(ex.Message);
    //        return "no";
    //        //return logcd.loginError;
    //    }}
    //}


}
