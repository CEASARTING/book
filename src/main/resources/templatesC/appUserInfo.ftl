<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>会员中心</title>
    <link rel="stylesheet" href="/css/C-main.css" type="text/css"/>
    <script type="text/javascript" src="/js/adaptive.js" ></script>
    <script type="text/javascript" src="/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="/layer/layer.js"></script>
    <script type="text/javascript">
        window['adaptive'].desinWidth=750;
        window['adaptive'].baseFont=12;
        window['adaptive'].maxWidth=480;
        window['adaptive'].init();
    </script>
    <script>
        //获取验证码
        $(function () {
            $("#J_getCode").click(function(){
                    var phone = $("#phone").val();
                    if(phone == ""){
                        layer.msg("请填写手机号");
                        return false;
                    }

                    $.ajax({
                        type: 'post',
                        data:
                                {
                                    phone: phone,
                                },
                        dataType: 'json',
                        url: "/common/getCode",
                        success: function (data) {
                            var code = data.code;
                            var msg = data.msg;
                            var info = data.data;
                            switch (code) {
                                case 200:
                                    layer.msg("短信发送成功！");
                                    resetCode();
                                    break;
                                default:
                                    layer.alert(msg,{icon:5});
                            }
                        }
                    });
            });


            $("#btn_submit").click(function () {

                    var name = $("#name").val();
                    if(name == "")
                    {
                        layer.msg("姓名不能为空！");
                        return false;
                    }
                    var phone = $("#phone").val();

                    if(phone == "")
                    {
                        layer.msg("手机号不能为空！");
                        return false;
                    }
                    else
                    {
                        if(!isPoneAvailable(phone))
                        {
                            layer.msg("手机号格式不正确！");
                            return false;
                        }
                    }

                    var code = $("#code").val();

                    if(code == "")
                    {
                        layer.msg("请输入短信验证码！");
                        return false;
                    }

                    var sex = $('input[name="sex"]:checked').val();

                    if(sex  == "")
                    {
                        layer.msg("请选择性别！");
                        return false;
                    }

                    var birthday = $("#birthday").val();
                    if(birthday == "")
                    {
                        layer.msg("请输入出生日期！");
                        return false;
                    }


                $.ajax({
                        type: 'post',
                        data:
                                {
                                    name:name,
                                    phone: phone,
                                    code:code,
                                    sex:sex,
                                    birthday:birthday
                                },
                        dataType: 'json',
                        url: "/c/user/userInfoSave",
                        success: function (data) {
                            var code = data.code;
                            var msg = data.msg;
                            switch (code) {
                                case 200:
                                    layer.msg("保存成功！");
                                    break;
                                default:
                                    layer.alert(msg,{icon:5});
                            }
                        }
                    });


                });

        });


        function resetCode(){
            $('#J_getCode').hide();

            var second = 60;
            $('#J_second').html(second+"秒后重发");
            $('#J_second').show();
            var timer = null;
            timer = setInterval(function(){
                second -= 1;
                if(second >0 ){
                    $('#J_second').html(second+"秒后重发");
                }else{
                    clearInterval(timer);
                    $('#J_getCode').show();
                    $('#J_second').hide();
                }
            },1000);
        }

        function isPoneAvailable(phone) {
            var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
            if (!myreg.test(phone)) {
                return false;
            } else {
                return true;
            }
        }
    </script>
</head>

<body class="body_3">
<div class="header"><img src="/images/27.png" onclick=window.location.href="/c/user/center/${cUser.userId!}"><span>个人资料</span><span onclick=window.location.href="/c/user/inviteCode">推荐码</span></div>
<div class="C-user_27">
    <img src="${cUser.userWxHeading!"/images/mrtx.png"}">
    <span>微信昵称：${cUser.userWxName!"云酒"}</span>
</div>
<div style="margin-top:0.2rem;" class="C-user_28"><span>姓名</span><input type="text" name="name" id="name" value="${cUser.userName!""}" placeholder="点击输入"></div>
<div class="C-user_28"><span>手机号</span><input id="phone" type="text" name="phone" value="${cUser.userPhone!""}" placeholder="点击输入"></div>
<div class="C-user_29"><span>验证码</span><input  id="code" name="code" type="text" placeholder="点击输入验证码"><button id="J_getCode">获取验证码</button><span id="J_second" style="display: none;" >60秒后重发</span></div>
<div class="C-user_30"><span>性别</span><input name="sex" type="radio" value="1" <#if cUser.userSex=1>checked="checked"</#if>><span>先生</span><input name="sex" type="radio" value="2" <#if cUser.userSex=2>checked="checked"</#if>><span>女士</span></div>
<div class="C-user_28"><span>出生日期</span><input id="birthday" name="birthday" type="text" value="${cUser.userBirthday!""}"></div>
<script src="/js/jquery.selector-px.js"></script>
<script>
    $(function () {
        var nowYear = new Date().getFullYear();
        var gYear = [];
        for (var i = 0; i < 100; i++) {
            gYear.push(Number(nowYear) - i);
        };

        // 年月日
        $.dateSelector({
            evEle: '#birthday',
            startYear: '1950',
            endYear: '2030',
            timeBoo: false,
            afterAction: function (d1, d2, d3) {
                $('#birthday').val(d1 + '-' + d2 + '-' + d3);
            }
        });
    });
</script>
<button class="user_40" id="btn_submit">保存</button>
<span style="margin-top:0.4rem;" class="C-user_26">${perfectInfo!""}</span>
</body>
</html>
