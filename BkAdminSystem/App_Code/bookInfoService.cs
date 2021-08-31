using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;


public class bookInfoService
{
    //???
    //public static DataTable LoadBookByType(int TypeId)
    //{
    //    DataTable tb = null;
    //    if (TypeId != -1)
    //    {
    //        string StrSql = @"SELECT BookInfo.*,BookTypeName FROM BookInfo 
    //            JOIN BookTypeInfo ON BookTypeID=TypeID 
    //            WHERE TypeID=@TypeID ";
    //        List<SqlParameter> Params = new List<SqlParameter>();
    //        SqlParameter para = new SqlParameter("@TypeID", SqlDbType.Int);
    //        para.Value = TypeId;
    //        Params.Add(para);
    //        tb = SqlHelper.QueryTable(CommandType.Text, StrSql, Params.ToArray());
    //    }
    //    else
    //    {
    //        string StrSql = @"SELECT BookInfo.*,BookTypeName FROM BookInfo 
    //            JOIN BookTypeInfo ON BookTypeID=TypeID  ";
    //        tb = SqlHelper.QueryTable(CommandType.Text, StrSql);
    //    }
    //    return tb;
    //}


    /// <summary>
    /// 增加书籍信息
    /// </summary>
    /// <param name="bi"></param>
    //public static void InsertBookInfo(BookInfo bi)
    //{
    //    string StrSql = @"INSERT INTO BookInfo
    //        (
    //       [BookName] ,[TypeID] ,[Author],[Press],[PubData]
    //       ,[Pricing],[Page],[ConverImage],[Summary]
    //         )
    //        VALUES
    //        (
    //         @BookName ,@TypeID, @Author,@Press,@PubData
    //       ,@Pricing,@Page,@ConverImage,@Summary
    //        )
    //        ";

    //    Type t = bi.GetType();
    //    PropertyInfo[] PropertyList = t.GetProperties();
    //    List<SqlParameter> Params = new List<SqlParameter>();
    //    foreach (PropertyInfo _pinfo in PropertyList)
    //    {
    //        SqlParameter para = new SqlParameter("@" + _pinfo.Name, Function.CType2SqlType(_pinfo.PropertyType));
    //        para.Value = _pinfo.GetValue(bi, null);
    //        Params.Add(para);
    //    }

    //    SqlHelper.ExecuteNonQuery(CommandType.Text, StrSql, Params.ToArray());
    //}

    /// <summary>
    /// 修改书籍信息
    /// </summary>
    /// <param name="bi"></param>
//    public static void UpdateBookInfo(BookInfo bi)
//    {

//        string StrSql = @"
// UPDATE BookInfo SET 
//[BookName]=@BookName
//      ,[Author]=@Author
//      ,[Press]=@Press
//      ,[PubData]=@PubData
//      ,[Pricing]=@Pricing
//      ,[Page]=@Page
//      ,[ConverImage]=@ConverImage
//      ,[Summary]=@Summary
//      ,[TypeID]=@TypeID
//WHERE BookID=@BookID;
//";

//        Type t = bi.GetType();
//        PropertyInfo[] PropertyList = t.GetProperties();
//        List<SqlParameter> Params = new List<SqlParameter>();
//        foreach (PropertyInfo _pinfo in PropertyList)
//        {
//            SqlParameter para = new SqlParameter("@" + _pinfo.Name, Function.CType2SqlType(_pinfo.PropertyType));
//            para.Value = _pinfo.GetValue(bi, null);
//            Params.Add(para);
//        }
//        SqlHelper.ExecuteNonQuery(CommandType.Text, StrSql, Params.ToArray());
//    }


//    /// <summary>
//    /// 删除书籍信息
//    /// </summary>
//    /// <param name="Uid"></param>
//    public static void DeleteBookInfo(int BookID)
//    {
//        string StrSql = @"
// DELETE BookInfo WHERE BookID=@BookID;
//";
//        List<SqlParameter> Params = new List<SqlParameter>();
//        SqlParameter para = new SqlParameter("@BookID", SqlDbType.Int);
//        para.Value = BookID;
//        Params.Add(para);

//        SqlHelper.ExecuteNonQuery(CommandType.Text, StrSql, Params.ToArray());
//    }
}
