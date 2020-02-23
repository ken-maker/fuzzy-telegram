<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.js"></script>
    <link href="${pageContext.request.contextPath}/static/layui/css/layui.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
</head>
<style>
    input{
        border:none;
    }
</style>
<body>
<input class="layui-btn-normal layui-btn" value="添加"/>
<table class="layui-table">
    <tr class="layui-table-header">
        <th>编号</th>
        <th>名称</th>
        <th>价格</th>
        <th>赔偿金</th>
        <th>状态</th>
        <th>类型</th>
        <th>操作</th>
    </tr>
    <c:forEach var="equipment" items="${equipmentList.list}">
        <tr class="layui-table-body">
            <td>${equipment.id}</td>
            <td>${equipment.name}</td>
            <td>${equipment.price}</td>
            <td>${equipment.damage}</td>
            <td>${equipment.state}</td>
            <td>${equipment.type}</td>
            <td>
                <button class="layui-btn-danger layui-btn-sm">
                    <a id="delete_a" href="${pageContext.request.contextPath}/equipmentController/deleteEquipment?id=${equipment.id}}">删除</a>
                </button>
                <button class="layui-btn-warm layui-btn-sm">
                    <a href="">修改</a>
                </button>
            </td>
        </tr>
    </c:forEach>
</table>
<ul class="pagination">
    <li><a href="${pageContext.request.contextPath}/equipmentController/equipment?pageNum=1">首页</a></li>
    <li><a href="${pageContext.request.contextPath}/equipmentController/equipment?pageNum=${equipment.prePage}">&lt;&lt;上一页</a></li>
    <c:forEach var="i" items="${vipList.navigatepageNums}">
        <li><a href="${pageContext.request.contextPath}/equipmentController/equipment?pageNum=${i}">${i}</a></li>
    </c:forEach>
    <li><a href="${pageContext.request.contextPath}/equipmentController/equipment?pageNum=${equipment.nextPage}">下一页&gt;&gt;</a></li>
    <li><a href="${pageContext.request.contextPath}/equipmentController/equipment?pageNum=${equipment.pages}">尾页</a></li>
</ul>

<div id="light">
    <a href="#" id="hideWin">×</a>
    <form id="addVIP_form" class="layui-form" action="${pageContext.request.contextPath}/equipmentController/addEquipment" method="post">
        <input id="name" name="name" class="layui-input" placeholder="名称"/>
        <span id="name_remark"></span><br>
        <input id="price" name="price" class="layui-input" placeholder="价格">
        <span id="price_remark"></span><br>
        <input id="damage" name="damage" class="layui-input" placeholder="赔偿金"/>
        <span id="damage_remark"></span><br>
<%--        这里写单选按钮、下拉框--%>
        <button type="submit" id="addEquipment_btn">添加</button>
    </form>
</div>
<div id="fade_div" style="opacity: 0.5"></div> <!-- 我是掩盖层 -->


<script>

    $(function () {
        addDisplay();
        addEquipment();
    });

    //添加会员
    function addEquipment(){
        $("#addVIP_btn").click(function () {
            $("#name").focus();
            var name=$("#name").val();
            var phoneNumber=$("#price").val();
            var identityCard=$("#damage").val();
            if (name.length<5){
                $("#name_remark").html("名字>=5").css("color","red");
                $("#name").focus();
            }if (phoneNumber.length!=11){
                $("#price_remark").html("手机号码位数必须11位").css("color","red");
                $("#price").focus();
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
