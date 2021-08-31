using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class bookInfo
{
    /*???
        biId int identity(1,1) not null,  --图书编号
        biIsbn nvarchar(50) not null,	    --图书名称
        biName int foreign key references BookTypeInfo(BookTypeID),--图书分类编号
        biType nvarchar(50) not null,       --作者
        Press  nvarchar(50) not null,       --出版社
        PubDate datetime not null,          --出版日期
        Pricing float ,                     --定价
        Page int,                           --页数
        CoverImage varbinary,               --图书封面
        Summary nvarchar(maxr)			    --图书简介 
     */

    /// <summary>
    /// 图书编号
    /// </summary>
    public int biId { get; set; }

    /// <summary>
    /// 图书ISBN
    /// </summary>
    public string biIsbn { get; set; }

    /// <summary>
    /// 图书名称
    /// </summary>
    public string biName { get; set; }

    /// <summary>
    /// 图书分类编号
    /// </summary>
    public int biType { get; set; }

    /// <summary>
    /// 作者
    /// </summary>
    public string biWriter { get; set; }

    /// <summary>
    /// 图书描述
    /// </summary>
    public string biDesc { get; set; }

    /// <summary>
    /// 定价
    /// </summary>
    public float biPicPath { get; set; }

    /// <summary>
    /// 出版社
    /// </summary>
    public string biPublish { get; set; }

    /// <summary>
    /// 状态编号
    /// </summary>
    public int biState { get; set; }

    /// <summary>
    /// 出版时间
    /// </summary>
    public string biPubTime { get; set; }

    /// <summary>
    /// 价格 
    /// </summary>
    public float biPrice { get; set; }

    /// <summary>
    /// 备注 
    /// </summary>
    public string biMark { get; set; }
}
