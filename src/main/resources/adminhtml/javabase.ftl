<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="author" content="微普科技 http://www.wiipu.com" />
    <title> 销售管理 </title>
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





</head>
<body>
<div id="header">
    <#include "topmenue.ftl">
</div>
<div id="container">
<#include "leftmenue.ftl">
    <div id="maincontent">

        <div id="handlelist" style="height: 147px;">

            <form  action="/admin/sale/ticketManage/find">

            </form>
            <script>
                laydate({
                    elem: '#demo', //需显示日期的元素选择器
                    event: 'click', //触发事件
                    format: 'YYYY-MM-DD hh:mm:ss', //日期格式
                    istime: false, //是否开启时间选择
                    isclear: true, //是否显示清空
                    istoday: true, //是否显示今天
                    issure: true, //是否显示确认
                    festival: true, //是否显示节日
                    choose: function(dates){ //选择好日期的回调

                    }
                });
            </script>
            <script>
                laydate({
                    elem: '#dem1', //需显示日期的元素选择器
                    event: 'click', //触发事件
                    format: 'YYYY-MM-DD hh:mm:ss', //日期格式
                    istime: false, //是否开启时间选择
                    isclear: true, //是否显示清空
                    istoday: true, //是否显示今天
                    issure: true, //是否显示确认
                    festival: true, //是否显示节日
                    choose: function(dates){ //选择好日期的回调

                    }
                });
            </script>
        </div>
        <div class="tablelist">
            <table >
                <tr >
                    <td>书名</td>
                    <td>网盘链接</td>
                    <td>密码</td>
                    <td>上传人</td>
                </tr>

            </table>
        </div>

        <div id="page"></div>
    </div>
    <div class="clear"></div>
</div>
<div id="footer">
    <a href="#">西电老科211</a>
</div>

</body>
</html>

