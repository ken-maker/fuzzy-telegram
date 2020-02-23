<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.js"></script>
    <link href="${pageContext.request.contextPath}/static/layui/css/layui.css" type="text/css" rel="stylesheet">

    <style>
        .layui-input{
             width: 100px;
             margin-left: 30px;
         }
    </style>
</head>
<body>
<h2>我的资料界面：
    全部资料、完善资料（判断，若已完善信息，则显示信息完善度100%，否则未完善）、
    修改资料<br></h2>
    <div id="base_message">
        <h2>基本信息</h2><br>
        姓名：${vip.name}<br>
        年龄：${vip.age}<br>
        性别：${vip.gender}<br>
        号码：${vip.phoneNumber}<br>
        办理日期：${vip.handingTime}<br>
        身份证：${vip.identityCard}<br>
        生日：${vip.birthDay}<br>
        会员卡号码：${vip.vipCardId}<br>
        <c:if var="b" test="${birthDay==true}">
            <h1>生日快乐，今天您的消费算我们的！</h1>
        </c:if>
    </div>

    <div id="locker_div">
        <h2>储物柜</h2>
        <c:choose>
            <c:when test="${locker==null}">
                <h3>您还没有租储物柜哦，<a href="#">去租？</a></h3>
            </c:when>
            <c:otherwise>
                储物柜编号：${locker.id}
                储物柜大小：${locker.size}
                月租：${locker.aMothMoney}
                状态：${locker.state}
            </c:otherwise>
        </c:choose>
    </div>

    <div id="health_div">
        <h2>我的健康</h2>
    </div>
</body>
</html>
