<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>本店管理</title>
<link rel="stylesheet" href="/css/main.css" type="text/css"/>
<script type="text/javascript" src="/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="/js/adaptive.js" ></script>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
		window['adaptive'].desinWidth=750;
			window['adaptive'].baseFont=12;
			window['adaptive'].maxWidth=480;
			window['adaptive'].init();
 </script>
</head>

<body class="body_1">
   <div class="header" ><img onclick=window.location.href="/store/manage/${storeId!}" src="/images/27.png"><span>店员管理</span><span onclick=window.location.href="/store/clerkAddPage/${storeId!}">添加店员</span></div>
   <table id="table1" class="user_17" border="0">
    <tr><td>店员姓名</td><td>店员类型</td><td>手机号</td><td>支付密码</td><td>微信绑定</td></tr>
    <#if clerks?exists>
        <#list clerks as clerk>
            <tr onclick=window.location.href="/store/updateClerkPage/${clerk.userId!}">
                <td>${clerk.userName!}</td>
                <td>
                    <#if "${ClerkIsAdmin!}"=="${clerk.userClerkAdmin!}">
                        管理员
                        <#else>
                        服务员
                    </#if>
                </td>
                <td>${clerk.userPhone!}</td>
                <td>${clerk.userClerkPassword!}</td>
                <td>
                    <#if ""=="${clerk.userWxId!}">
                        否
                        <#else>
                        是
                    </#if>
                </td>
            </tr>
        </#list>
    </#if>
  </table>
</body>
</html>
