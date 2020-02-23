<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.js"></script>
    <link href="${pageContext.request.contextPath}/static/layui/css/layui.css" type="text/css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
</head>
<style>
    input{
        border:none;
    }
    #light{
        height: auto;
        width: 360px;
        border: 1px solid #000000;
        margin-top: 10%;
        margin-left: 35%;
        position: absolute;
        background: #9F9F9F;
        z-index: 100;
    }
    #hideWin{
        font-size: 24px;
        margin-left: 337px;
    }
    #addVIP_btn{
        cursor: pointer;
    }
</style>
<body>
<input id="showWin" class="layui-btn-normal layui-btn" value="手动添加"/>
<div id="light">
    <a href="#" id="hideWin">×</a>
    <form id="addVIP_form" class="layui-form" action="${pageContext.request.contextPath}/vipController/addVIP" method="post">
        <input id="name" name="name" class="layui-input" placeholder="姓名"/>
        <span id="name_remark"></span><br>
        <input id="phoneNumber" name="phoneNumber" class="layui-input" placeholder="号码">
        <span id="phoneNumber_remark"></span><br>
        <input id="identityCard" name="identityCard" class="layui-input" placeholder="身份证"/>
        <span id="identityCard_remark"></span><br>
        <button type="submit" id="addVIP_btn">添加</button>
    </form>
</div>
<div id="fade_div" style="opacity: 0.5"></div> <!-- 我是掩盖层 -->

<table class="layui-table">
    <tr class="layui-table-header">
        <th>编号</th>
        <th>名字</th>
        <th>年龄</th>
        <th>性别</th>
        <th>号码</th>
        <th>办理时间</th>
        <th>身份证号</th>
        <th>生日</th>
        <th>操作</th>
    </tr>
    <c:forEach var="vip" items="${vipList.list}">
        <tr class="layui-table-body">
            <td>${vip.id}</td>
            <td>${vip.name}</td>
            <td>${vip.age}</td>
            <td>${vip.gender}</td>
            <td>${vip.phoneNumber}</td>
            <td>${vip.handingTime}</td>
            <td>${vip.identityCard}</td>
            <td>${vip.birthDay}</td>
            <td>
                <button class="layui-btn-danger layui-btn-sm">
                <a id="delete_a" href="${pageContext.request.contextPath}/vipController/deleteVIP?id=${vip.id}">删除</a>
                </button>
                <button class="layui-btn-warm layui-btn-sm">
                    <a href="${pageContext.request.contextPath}/vipController/updateVIP?id=${vip.id}">修改</a>
                </button>
            </td>
        </tr>
    </c:forEach>
</table>
<ul class="pagination">
    <li><a href="${pageContext.request.contextPath}/vipController/vipList?pageNum=1">首页</a></li>
    <li><a href="${pageContext.request.contextPath}/vipController/vipList?pageNum=${vipList.prePage}">&lt;&lt;上一页</a></li>
    <c:forEach var="i" items="${vipList.navigatepageNums}">
        <li><a href="${pageContext.request.contextPath}/vipController/vipList?pageNum=${i}">${i}</a></li>
    </c:forEach>
    <li><a href="${pageContext.request.contextPath}/vipController/vipList?pageNum=${vipList.nextPage}">下一页&gt;&gt;</a></li>
    <li><a href="${pageContext.request.contextPath}/vipController/vipList?pageNum=${vipList.pages}">尾页</a></li>
</ul>

<script>

    $(function () {
        addDisplay();
        addVIP();
    });

    //添加会员
    function addVIP(){
        $("#addVIP_btn").click(function () {
            $("#name").focus();
            var name=$("#name").val();
            var phoneNumber=$("#phoneNumber").val();
            var identityCard=$("#Utils").val();
            if (name.length<5){
                $("#name_remark").html("名字>=5").css("color","red");
                $("#name").focus();
            }if (phoneNumber.length!=11){
                $("#phoneNumber_remark").html("手机号码位数必须11位").css("color","red");
                $("#phoneNumber").focus();
            }if(identityCard.length!=18){
                $("#identityCard_remark").html("身份证位数必须18位").css("color","red");
                $("#Utils").focus();
            }else{
                alert("提交");
                $("#addVIP_btn").submit();
            }
        })
    }

    //显示添加会员div
    function addDisplay(){
        $("#light").css("display","none");
        $("#fade_div").css("display","block");

        $("#showWin").click(function(){
            $("#light").slideDown();
            $("#fade_div").fadeIn();
        });
        $("#hideWin").click(function(){
            $("#light").slideUp();
            $("#fade_div").fadeOut();
        })
    }
</script>
</body>
</html>
