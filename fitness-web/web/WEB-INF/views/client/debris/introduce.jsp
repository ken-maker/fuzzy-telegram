<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>描述</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">

    <style>
        img{
            width: 400px;
            height:300px;
            margin-left: 100px;
            margin-top:40px;
            border-radius: 50px;
        }
        #fatPercent_form{
            width: 220px;
            height: 130px;
            float: left;
        }
        .calculator{
            font-family: cursive;
        }
    </style>
</head>
<body>
    <h2>私教团队</h2>
    <img src="http://localhost:88/eva.jpg">
    <img src="http://localhost:88/303731.jpg">
    <img src="http://localhost:88/304180.jpg">
    <img src="http://localhost:88/5.jpg">
    <h2>崭新器材</h2>
    <br><br>
    <form id="fatPercent_form">
        <h2 class="calculator">power体脂率计算器</h2><br>
        男<input id="man" name="sex" type="radio" value="男"  checked />
        女<input id="women" name="sex" type="radio" value="女" /><br>
        <input id="weight" type="number" class="layui-input" placeholder="输入你的体重 kg"><br>
        <input id="waistLine" type="number" class="layui-input" placeholder="输入你的腰围 cm"><br>
        <span id="remark"></span><br>
        <input id="test_btn" class="layui-input" type="button" value="测">
    </form>

</body>
<script type="text/javascript">
    $(function () {
        fatPercent();
    });
//    体脂率
    function fatPercent() {
        $("#test_btn").click(function () {
            var gender="";
            gender=$("#man").prop("checked")? "男":"女";
            if ($("#weight").val().length<1||$("#waistLine").val().length<1){
                $("#remark").html("体重和腰围皆不能为空").css("color","red");
            }else {
                $("#remark").html("");
                $.ajax({
                    url:"${pageContext.request.contextPath}/homeController/body_fat",
                    method:"GET",
                    data:{gender:gender,weight:$("#weight").val(),waistLine:$("#waistLine").val()},
                    contentType:"application/json",
                    dataType:"json"
                }).done(function (data) {
                    $("#remark").html("您的体脂率为："+data.fatPercent).css("color","green");
                }).fail(function () {
                    alert("出故障了");
                })
            }
        })
    }

</script>
</html>
