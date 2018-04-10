<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>扫码支付</title>
    <script type="text/javascript" src="/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="/js/adaptive.js" ></script>
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
</head>

</body>
<script type="text/javascript">

    wx.config({
        debug: false,
        appId:"${map.appId}",
        timestamp: "${map.timestamp}",
        nonceStr: "${map.nonceStr}",
        signature: "${map.signature}",
        jsApiList: [
            'scanQRCode'
        ]
    });


    wx.ready(function () {

        wx.scanQRCode({
            needResult: 0, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
            scanType: ["qrCode","barCode"], // 可以指定扫二维码还是一维码，默认二者都有
            success: function (res) {

            }

        });
    });
</script>

</html>
