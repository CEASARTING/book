<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="author" content="微普科技 http://www.wiipu.com" />
    <title> 添加书籍</title>
    <link rel="stylesheet" href="/css/style.css" type="text/css" />
    <link rel="stylesheet" href="/css/form.css" type="text/css" />
    <script type="text/javascript" src="/js/common.js"></script>
    <script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/js/layer/layer.js"></script>
</head>
<body>
<div id="formlist" >
    <form id="form">
        <p>
            <label>书名</label>
            <input type="text" class="text-input input-length-100" name="bookname" id="bookname"/>
        </p>
        <p>
            <label>网盘链接</label>
            <input type="text" class="text-input input-length-100" name="bookurl" id="bookurl"/>
        </p>
        <p>
            <label>密码</label>
            <input type="text" class="text-input input-length-100" name="bookpassword" id="bookpassword"/>
        </p>
        <p>
            <label>上传人</label>
            <input type="text" class="text-input input-length-100" name="upman" id="upman"/>
        </p>

        <p>
            <label>　　</label>
            <input type="button" class="btn_submit" value="提交" id="addad" onclick="save(${belong});"/>
        </p>

    </form>
</div>
<script type="text/javascript">
    function trim(str) {
        return str.replace(/(^\s*)|(\s*$)/g, "");
    }

    function save(id) {

        var bookname = document.getElementById("bookname").value;
        var bookurl = document.getElementById("bookurl").value;
        var bookpassword = document.getElementById("bookpassword").value;
        var upman = document.getElementById("upman").value;
        var belong = id;

        var form = new FormData();
        form.append("bookname", bookname);
        form.append("bookurl", bookurl);
        form.append("bookpassword", bookpassword);
        form.append("upman",upman);
        form.append("belong",belong);

            $.ajax({
                url:"/211/book/add/do",
                type:"post",
                data:form,
                processData:false,
                contentType:false,
                success:function(data){
                    //window.clearInterval(timer);
                    if(data.data=="ok"){
                        layer.alert("添加成功");
                        window.parent.location.href = "/211/book/java/javabase";
                        window.parent.top.layer.closeAll();
                    }else {
                        layer.alert(data.msg);
                    }
                }
            });
    }
</script>
</body>
</html>
