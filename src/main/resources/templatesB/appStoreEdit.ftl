<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>本店管理</title>
<link rel="stylesheet" href="/css/main.css?v=1" type="text/css"/>
<link rel="stylesheet" type="text/css" href="/css/demo.css?v=1">
<script type="text/javascript" src="/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="/js/adaptive.js" ></script>
<script type="text/javascript" src="/js/adaptive.js" ></script>
<script type="text/javascript" src="/layui/layui.js"></script>
    <script type="text/javascript" src="/js/layer/layer.js"></script>
<script type="text/javascript">
		window['adaptive'].desinWidth=750;
        window['adaptive'].baseFont=12;
        window['adaptive'].maxWidth=480;
        window['adaptive'].init();
 </script>
<script type="text/javascript">
    $(function() {
        $('#btn_submit').click(function () {
            var storeId = $("#storeId").val();

            var storeAdmin = $("#storeAdmin").val();
            var storePhone = $("#storePhone").val();
            var storeCorporation = $("#storeCorporation").val();
            var storeAddressDetail = $("#storeAddressDetail").val();
            var storeProvinceId = $("#storeProvinceId").val();
            var storeCityId = $("#storeCityId").val();
            var storeDistrictId = $("#storeDistrictId").val();
            var storeProvinceName = $("#storeProvinceName").val();
            var storeCityName = $("#storeCityName").val();
            var storeDistrictName = $("#storeDistrictName").val();

            $.ajax({
                type: 'post',
                data:
                        {
                            storeId:storeId,
                            storeAdmin:storeAdmin,
                            storePhone:storePhone,
                            storeCorporation:storeCorporation,
                            storeAddressDetail:storeAddressDetail,
                            storeProvinceId:storeProvinceId,
                            storeCityId:storeCityId,
                            storeDistrictId:storeDistrictId,
                            storeProvinceName:storeProvinceName,
                            storeCityName:storeCityName,
                            storeDistrictName:storeDistrictName
                        },
                dataType: 'json',
                url: "/store/storeEditDo",
                success: function (data) {
                    var code = data.code;
                    var msg = data.msg;
                    var info = data.data;
                    switch (code) {
                        case 200:
                            layer.msg(msg);
                            break;
                        default:
                            layer.alert(msg,{icon:5});
                    }
                }
            });


//            layui.use('layer', function () {
//                var layer = layui.layer;
//                var phone = $("#phone").val();
//                $.ajax({
//                    type: 'post',
//                    data:
//                    {
//                        storeId:storeId,
//                        storeAdmin:storeAdmin,
//                        storePhone:storePhone,
//                        storeCorporation:storeCorporation,
//                        storeAddressDetail:storeAddressDetail,
//                        storeProvinceId:storeProvinceId,
//                        storeCityId:storeCityId,
//                        storeDistrictId:storeDistrictId,
//                        storeProvinceName:storeProvinceName,
//                        storeCityName:storeCityName,
//                        storeDistrictName:storeDistrictName
//                    },
//                    dataType: 'json',
//                    url: "/store/storeEditDo",
//                    success: function (data) {
//                        var code = data.code;
//                        var msg = data.msg;
//                        var info = data.data;
//                        switch (code) {
//                            case 200:
//                               layer.msg(msg);
//                                break;
//                            default:
//                                layer.alert(msg,{icon:5});
//                        }
//                    }
//                });
//            });

        });
    });

</script>
</head>

<body class="body_1">
  <div class="header"><img onclick=window.location.href="/store/manage/${store.storeId!}" src="/images/27.png"><span>门店基本信息</span></div>
  <div class="user_28"><span>门店名称</span><input type="text" value="${store.storeName}" disabled="disabled"></div>
  <div class="user_28"><span>门店编号</span><input type="text" value="${store.storeId}" disabled="disabled"></div>
  <div class="user_28"><span>加盟时间</span><input type="text" value="${store.storeAddtime?number_to_date}" disabled="disabled"></div>
  <div class="user_28"><span>酒柜数量</span><input type="text" value="${nums!}" disabled="disabled"></div>
  <div class="user_29">
     <span class="user_29_1">运营人员</span>
     <table class="user_29_2" border="0">
         <#list storeAdmins as storeAdmin>
           <tr style="float: right"><td>${storeAdmin.saAdminName}（${storeAdmin.saAdminPhone}）</td></tr>
         </#list>
     </table>
     <div class="clear"></div>
  </div>
  <span class="user_26">以下信息可编辑</span>
      <input type="hidden" id="storeId" value="${store.storeId}"/>
      <div class="user_28"><span>门店负责人</span><input type="text" id="storeAdmin" value="${store.storeAdmin}" placeholder="请点击输入"></div>
      <div class="user_28"><span>联系电话</span><input type="text" id="storePhone" value="${store.storePhone}" placeholder="请点击输入"></div>
      <div class="user_28"><span>法定代表人（可空）</span><input type="text" id="storeCorporation" value="${store.storeCorporation}" placeholder="请点击输入"></div>
      <div class="user_28"><span>所在地区</span><a href="#" class="btn btn-info btn-lg active" role="button" id="sel_city" style="font-size:0.24rem !important;">${address}</a></div>
  <div class="user_80"><span>详细地址</span><textarea type="text" id="storeAddressDetail"  placeholder="请点击输入">${store.storeAddressDetail!""}</textarea></div>
      <button class="user_22" style="margin-bottom:0.6rem;" id="btn_submit">保存</button>

     <!--省市区选择的地址-->
      <input type="hidden" id="storeProvinceId" value="${store.storeProvinceId!0}"/>
      <input type="hidden" id="storeProvinceName" value="${store.storeProvinceName!''}"/>
      <input type="hidden" id="storeCityId" value="${store.storeCityId!0}"/>
      <input type="hidden" id="storeCityName" value="${store.storeCityName!''}"/>
      <input type="hidden" id="storeDistrictId" value="${store.storeDistrictId!}"/>
      <input type="hidden" id="storeDistrictName" value="${store.storeDistrictName!''}"/>


</body>
</html>

<script src="/js/picker.min.js"></script>
<script src="/js/city.js"></script>
<script>
    var nameEl = document.getElementById('sel_city');
    var first = []; /* 省，直辖市 */
    var second = []; /* 市 */
    var third = []; /* 镇 */
    var selectedIndex = [0, 0, 0]; /* 默认选中的地区 */
    var checked = [0, 0, 0]; /* 已选选项 */
    function creatList(obj, list){
        obj.forEach(function(item, index, arr){
            var temp = new Object();
            temp.text = item.name;
            temp.value = item.areaId;
            list.push(temp);
        })
    }

    creatList(city, first);

    if (city[selectedIndex[0]].hasOwnProperty('sub')) {
        creatList(city[selectedIndex[0]].sub, second);
    } else {
        second = [{text: '', value: 0}];
    }

    if (city[selectedIndex[0]].sub[selectedIndex[1]].hasOwnProperty('sub')) {
        creatList(city[selectedIndex[0]].sub[selectedIndex[1]].sub, third);
    } else {
        third = [{text: '', value: 0}];
    }

    var picker = new Picker({
        data: [first, second, third],
        selectedIndex: selectedIndex,
        title: '地址选择'
    });

    picker.on('picker.select', function (selectedVal, selectedIndex) {
        var text1 = first[selectedIndex[0]].text;
        var text2 = second[selectedIndex[1]].text;
        var text3 = third[selectedIndex[2]] ? third[selectedIndex[2]].text : '';


        var value1 = first[selectedIndex[0]].value;
        var value2 = second[selectedIndex[1]].value;
        var value3 = third[selectedIndex[2]] ? third[selectedIndex[2]].value : 0;

        $("#storeProvinceId").val(value1);
        $("#storeProvinceName").val(text1);
        $("#storeCityId").val(value2);
        $("#storeCityName").val(text2);
        $("#storeDistrictId").val(value3);
        $("#storeDistrictName").val(text3);
        nameEl.innerText = text1 + ' ' + text2 + ' ' + text3;
    });

    picker.on('picker.change', function (index, selectedIndex) {
        if (index === 0){
            firstChange();
        } else if (index === 1) {
            secondChange();
        }

        function firstChange() {
            second = [];
            third = [];
            checked[0] = selectedIndex;
            var firstCity = city[selectedIndex];
            if (firstCity.hasOwnProperty('sub')) {
                creatList(firstCity.sub, second);

                var secondCity = city[selectedIndex].sub[0]
                if (secondCity.hasOwnProperty('sub')) {
                    creatList(secondCity.sub, third);
                } else {
                    third = [{text: '', value: 0}];
                    checked[2] = 0;
                }
            } else {
                second = [{text: '', value: 0}];
                third = [{text: '', value: 0}];
                checked[1] = 0;
                checked[2] = 0;
            }

            picker.refillColumn(1, second);
            picker.refillColumn(2, third);
            picker.scrollColumn(1, 0)
            picker.scrollColumn(2, 0)
        }

        function secondChange() {
            third = [];
            checked[1] = selectedIndex;
            var first_index = checked[0];
            if (city[first_index].sub[selectedIndex].hasOwnProperty('sub')) {
                var secondCity = city[first_index].sub[selectedIndex];
                creatList(secondCity.sub, third);
                picker.refillColumn(2, third);
                picker.scrollColumn(2, 0)
            } else {
                third = [{text: '', value: 0}];
                checked[2] = 0;
                picker.refillColumn(2, third);
                picker.scrollColumn(2, 0)
            }
        }

    });

    picker.on('picker.valuechange', function (selectedVal, selectedIndex) {
        console.log(selectedVal);
        console.log(selectedIndex);
    });

    nameEl.addEventListener('click', function () {
        picker.show();
    });
</script>
