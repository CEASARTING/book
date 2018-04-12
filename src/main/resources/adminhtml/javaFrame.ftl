<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title> java框架 </title>
    <link rel="stylesheet" href="/css/style.css" type="text/css" />
    <link rel="stylesheet" href="/css/form.css" type="text/css" />
    <script src="/laydate/laydate.js"></script>
    <script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/js/layer/layer.js"></script>
    <script type="text/javascript" src="/js/common.js"></script>
    <link rel="stylesheet" href="/js/layui/css/layui.css" />
    <script type="text/javascript" src="/js/layui/layui.js"></script>
    <style>
        html{background-color:#E3E3E3; font-size:14px; color:#000; font-family:'微软雅黑'}
        h2{line-height:30px; font-size:20px;}
        a,a:hover{ text-decoration:none;}
        pre{font-family:'微软雅黑'}
        .box{width:970px; padding:10px 20px; background-color:#fff; margin:10px auto;}
        .box a{padding-right:20px;}
        .Width1 input[type='text']{    height:32px;
            line-height: 32px;
            border: 1px solid #cccccc;
            border-radius: 3px;
            float: left;
            padding: 0;
            padding-left: 5px;
        }
        .laydate-icon
        {
            width: 200px;
            height:32px;
            line-height: 32px;
            border: 1px solid #cccccc;
            border-radius: 3px;
            float: left;
            padding: 0;
            padding-left: 5px;
        }
        .Width1 span
        {
            display: block;
            float: left;
            width:75px;
            height: 34px;
            line-height: 34px;
            margin-left: 20px;
        }
        .SPan1 span
        {
            display: block;
            height: 32px;
            line-height: 32px;
            padding-left: 8px;
            padding-right: 8px;
            margin-left: 10px;
            border: 1px solid #00FF66;
            float: left;
        }
        .btn-handle
        {
            margin-top: 5px;
        }
    </style>

    <script type="text/javascript">
        function addJavaBase() {

            layer.open({
                type: 2,
                shadeClose: true, //开启遮罩关闭
                area: ['850px', '600px'],
                scrollbar: false,
                content:"/211/book/add/Page?dictId=6",
                title:'添加java框架书籍'
            });
        };

        function addDown(id) {
            var form = new FormData();
            form.append("bookId", id);

            $.ajax({
                url:"/211/book/add/down",
                type:"post",
                data:form,
                processData:false,
                contentType:false,
            });
        }
    </script>



</head>
<body>
<div id="header">
<#include "topmenue.ftl">
</div>
<div id="container">
<#include "leftmenue.ftl">
    <div id="maincontent">
        <br/>
        <br/>
        <br/>
        <div id="handlelist" style="height: 147px;">

            <div class="Width1">
                <button onclick="addJavaBase();">添加此类书籍</button>
            </div>

        </div>
        <div class="tablelist">
            <table >
            <#if javaFrame?exists>
                <tr >
                    <td>书名</td>
                    <td>网盘链接</td>
                    <td>密码</td>
                    <td>上传人</td>
                    <td>上传时间</td>
                    <td>下载次数</td>
                </tr>
                <#list javaFrame as book>
                    <tr >
                        <td>${book.bookName}</td>
                        <td><a href="${book.bookUrl}" onclick="addDown(${book.bookId});">${book.bookUrl}</a></td>
                        <td>${book.bookPassword}</td>
                        <td>${book.bookMan}</td>
                        <td>${book.bookTime?number_to_date}</td>
                        <td>${book.bookDown}</td>
                    </tr>
                </#list>
            <#else >
                <label onclick="addJavaBase();">还没有此类书籍，你来添加吧！</label>
            </#if>

            </table>
        </div>

        <div id="page"></div>
    </div>
    <div class="clear"></div>
</div>
<div id="footer">
<#include "footer.ftl">
</div>

</body>
</html>

