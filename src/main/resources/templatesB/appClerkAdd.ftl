<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>本店管理</title>
<link rel="stylesheet" href="/css/main.css" type="text/css"/>
<script type="text/javascript" src="/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="/js/adaptive.js" ></script>
    <script type="text/javascript" src="/js/layer/layer.js"></script>
<script type="text/javascript">
		window['adaptive'].desinWidth=750;
			window['adaptive'].baseFont=12;
			window['adaptive'].maxWidth=480;
			window['adaptive'].init();
 </script>

</head>

<body class="body_1">
<div class="header"><img onclick=window.location.href="/store/clerkManage/${storeId!}" src="/images/27.png"><span>添加店员</span></div>
    <div class="user_24">
        <span>店员类型</span>
        <input type="radio" name="1" checked="checked" value="${ClerkIsNotAdmin}"/><span>服务员</span>
        <input type="radio" name="1" value="${ClerkIsAdmin!}"/><span>管理员</span>
    </div>
    <div class="user_25"><span>店员姓名</span><input type="text" placeholder="请点击输入" id="userRealName"></div>
    <div class="user_25"><span>手机号</span><input type="text" placeholder="请点击输入11位手机号" id="userPhone"></div>
    <div class="user_24">
        <span>性别</span>
        <input type="radio" name="2" checked="checked" value="${Man}"/><span>先生</span>
        <input type="radio" name="2" value="${Women}"/><span>女士</span>
    </div>
    <div class="user_24">
        <span>是否启用</span>
        <input type="radio" name="3" checked="checked" value="${clerkValid}"/><span>是</span>
        <input type="radio" name="3" value="${clerkInvalid}"/><span>否</span>
    </div>
    <div class="user_25" ><span>支付密码</span><input type="text" placeholder="点击输入4位数字" id="userClerkPassword"></div>
    <button class="user_22" id="save">保存</button>
<script type="text/javascript">
    function trim(str) {
        return str.replace(/(^\s*)|(\s*$)/g, "");
    }

    $('#save').click(function () {
        var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        var pattern = /^\d{4}$/;

        if(trim($("#userRealName").val())==null || trim($("#userRealName").val())==""
        || trim($("#userPhone").val())==null || trim($("#userPhone").val())==""
        || trim($("#userClerkPassword").val())==null || trim($("#userClerkPassword").val())==""){
            layer.alert("请输入店员信息");
            return false;
        }else if(!myreg.test(trim($("#userPhone").val()))){
            layer.alert("请输入正确的电话");
            return false;
        }else if(!pattern.test(trim($("#userClerkPassword").val()))){
            layer.alert("密码请输入四位数字");
            return false;
        }

        $.ajax({
            type: 'post',
            data:
                    {
                        userName: $("#userRealName").val(),
                        userPhone:$("#userPhone").val(),
                        userClerkAdmin:$("input[name='1']:checked").val(),
                        userSex:$("input[name='2']:checked").val(),
                        userClerkIfact:$("input[name='3']:checked").val(),
                        userClerkPassword:$("#userClerkPassword").val()
                    },
            dataType: 'json',
            async: false,
            url: "/store/clerkAdd/${storeId!}",
            success: function (data) {
                var code = data.code;
                var msg = data.msg;
                var info = data.data;
                if(code==200){
                    layer.alert(msg,{icon:6},function () {
                        window.location.href="/store/clerkManage/${storeId!}";
                    });
                    return false;
                }else {
                    layer.alert(msg,{icon:5});
                    return false;
                }
            }
        });
    });
</script>
</body>
</html>
