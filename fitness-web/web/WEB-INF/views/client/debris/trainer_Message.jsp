<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>私教详情</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.js"></script>
    <style>
        img{
            width: 230px;
            height:300px;
        }
        input:hover{
            cursor: pointer;
            border: 1px red solid;
        }
        input{
            /*width: 100px;*/
            background-color: lightgray;
            border: none;
        }

    </style>
</head>
<body>
私教详情信息
<div id="trainer_div">
    <header>
        <img src="http://localhost:88/${trainer.picture}"/>
    </header>
    <footer>
        编号：${trainer.id}<br>
        姓名：${trainer.name}<br>
        <c:choose>
            <c:when test="${trainer.gender==1}">性别：男<br></c:when>
            <c:otherwise>性别：女<br></c:otherwise>
        </c:choose>
        年龄：${trainer.age}<br>
        住址：${trainer.address}<br>
        教龄：${trainer.teachAge}<br>
        号码：${trainer.phoneNumber}
<%--        隐藏域，保存私教的编号--%>
        <input hidden="hidden" id="trainer" value="${trainer.id}">
    </footer>
</div>

<div id="buyCourse_div">
    <select id="buyCourse_select" style="width: 100px">
        <option value="">--请选择套餐--</option>
        <option value="300" >1节私教课</option>
        <option value="500" >3节私教课</option>
        <option value="700">7节私教课</option>
        <option value="1400" aria-checked="true">特价3天私教课</option>
        <option value="3000">包1周私教课</option>
        <option value="9000">包1月私教课</option>
    </select>
    <span id="remark"></span>
    <button id="buyCourse_btn">购买TA的课</button>
</div>

<script>
    $(function () {
        selectCourse();
        buyCourse();
    });

    //显示价格
    function selectCourse() {
        $("#buyCourse_select").change(function () {
            $("#remark").html("￥"+$("#buyCourse_select").val())
        })
    }

    //登录与否
    function isLogin(fn){
        $.ajax({
            url:"${pageContext.request.contextPath}/aplyController/isLogin",
            method:"GET",
            contentType:"application/json",
            dataType:"json"
        }).done(function (data) {
            if (data.message){//已登录
                fn();//执行支付
            }else{//未登录
                alert("您还未登录，请先去登录");
            }
        }).fail(function () {
            alert("判断登录与否出错");
        })
    }

    //点击购买
    function buyCourse() {
        $("#buyCourse_btn").click(function () {
            var money = $('#buyCourse_select option:selected').val();//选中值
            var remark = $('#buyCourse_select option:selected').text();//选中文本
            var trainer = $("#trainer").val();//私教对象
            if (money===""||money===null){
                alert("请选择套餐");
            }else{//套餐选择完毕，判断是否登录
                isLogin(function () {
                    window.location.href="${pageContext.request.contextPath}/aplyController/alipay?money="+Number(money)+"&remark="+remark+"&trainerId="+trainer;
                });
                //跳去判断登录与否
                <%--window.location.href="${pageContext.request.contextPath}/aplyController/isLogin?money="+Number(money)+"&remark="+remark+"&trainer="+trainer;--%>
                //直接进入支付宝页面
                <%--window.location.href="${pageContext.request.contextPath}/aplyController/alipay?money="+Number(money)+"&remark="+remark;--%>
            }
        })
    }

</script>
</body>
</html>
