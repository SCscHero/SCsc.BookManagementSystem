using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;



/// <summary>
/// 数据库访问基础类
/// 增删改查等方法
/// </summary>
public class db
{
    //获取web.config中连接字符串
    private static string ConString = ConfigurationManager.AppSettings["ConString"];
    //定义一个SqlConnection连接对象
    private static SqlConnection Conn;
    //对连接字符串进行封装，只读属性
    public static string ConString1
    {
        get
        {
            return ConString;
        }
    }
    //对SqlConnection封装
    public static SqlConnection Conn1
    {
        get
        {
            return Conn;
        }

        set
        {
            Conn = value;
        }
    }

    public db()
    {

    }

    #region 数据库基本操作方法

    //数据库打开方法
    public static void openConnection()
    {
        if (Conn1 == null)
            Conn1 = new SqlConnection(ConString);
        if (Conn1.State == ConnectionState.Closed)
            Conn1.Open();
    }

    //数据库关闭方法
    public static void closeConnection()
    {
        if (Conn1.State == ConnectionState.Open)
            Conn1.Close();
    }

    //获取命令的无参方法
    public static SqlCommand getCommand()
    {
        openConnection();
        SqlCommand comm = new SqlCommand();
        comm.Connection = Conn1;
        return comm;
    }

    //获取命令的有参方法
    public static SqlCommand getCommand(string sql)
    {
        openConnection();
        SqlCommand comm = new SqlCommand(sql, Conn1);
        return comm;
    }

    //执行Sql命令的方法、新增、修改、删除
    public static int getNonQuery(string sql)
    {
        SqlCommand comm = getCommand();
        comm.CommandText = sql;
        return comm.ExecuteNonQuery();
    }

    //返回Dataset数据集的方法
    public static DataSet getDataSet(string sql, string dbName)
    {
        openConnection();
        DataSet myDataSet = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(sql, Conn1);
        da.Fill(myDataSet, dbName);
        return myDataSet;
    }

    //读取数据库的DataReader方法
    public static SqlDataReader getReader(string sql)
    {
        SqlCommand myComm = getCommand(sql);
        return myComm.ExecuteReader();
    }
    #endregion

    #region 拓展验证功能
    //登录验证的方法
    public static void selectLogin(string account)
    {
        openConnection();
        string sql = "select u_password from SC3User where u_email=" + account + "";
        closeConnection();
    }

    //增加会员信息的方法
    public static void insMembInfo(string miName, string miTel, string miAdres, string miCard, string miMoney, string miTime, string miMark)
    {
        openConnection();

        //getNonQuery(sql);
        closeConnection();
    }

    //修改会员信息的方法
    public static void modMembInfo(string miName, string miTel, string miAdres, string miCard, string miMoney, string miTime, string miMark)
    {
        openConnection();

        //getNonQuery(sql);
        closeConnection();
    }



    //新增项目

    public static void insertDataError(string proName, string proDlop, string proTest, string proStaff, string proTester, string proState, string proBuilder, string proStaTime, string proMark)
    {
        openConnection();
        string sql = "insert into Admin(proName,proDlop,proTest,proStaff,proTester,proState,proBuilder,proStaTime,proMark)Values('" + proName + "','" + proDlop + "','" + proTest + "','" + proStaff + "','" + proTester + "','" + proStaff + "','" + proTester + "','" + proState + "','" + proBuilder + "','" + proStaTime + "','" + proMark + "')";
        getNonQuery(sql);
        closeConnection();
    }
    //新增项目

    public static void insertDataError2(string adType, string adCont, string adState, string adSlover, string adMark)
    {
        openConnection();
        string sql = "insert into Admin(adType,adCap,adCont,adState,adSlover,adMark)Values('" + adType + "','" + adCont + "','" + adState + "','" + adSlover + "','" + adMark + "')";
        getNonQuery(sql);
        closeConnection();
    }

    //[WebMethod]
    //public static void updateDatePwd(string uAct,string oldUPwd,string newUpwd)
    //{
    //    openConnection();
    //    string sql = "update Users SET uPwd = '" + newUpwd + "' where uAct = '" + uAct + "' and uPwd = '" + oldUPwd + "'";
    //    getNonQuery(sql);
    //    closeConnection();
    //}


    /// <summary>
    /// 登录 - 验证用户名是否存在及密码是否正确，验证通过即登录
    /// </summary>
    /// <param name="act"></param>
    /// <param name="pwd"></param>
    /// <returns></returns>
    public static string judgePwd(string act, string pwd)
    {
        openConnection();
        string sql = "select @Act from OperInfo";
        string sql1 = "select @pwd from OperInfo where oiAct = @Act";
        SqlCommand cmd = new SqlCommand(sql, Conn1);
        //将查询变量参数化，防止Sql注入
        SqlParameter sp = new SqlParameter("@Act", act);
        SqlParameter sp1 = new SqlParameter("@Pwd", pwd);
        cmd.Parameters.Add(sp);
        cmd.Parameters.Add(sp1);
        //判断如果有返回值，则判断用户名与密码是否匹配
        if (cmd.ExecuteNonQuery() > 0)
        {
            cmd = new SqlCommand(sql1, Conn1);
            if (cmd.ExecuteNonQuery() > 0)
            {
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    if (pwd == dr["oiPwd"].ToString())
                    {
                        return "ok";
                    }
                }
            }
            else
            {
                return "1";//返回1 即为密码不正确
            }
        }
        else
        {
            return "0"; //返回0 即为用户名不存在
        }
        closeConnection();
        //返回-1为服务器失败
        return "-1";
    }

    //删除数据的方法

    public static void delData()
    {

    }

    #endregion
}