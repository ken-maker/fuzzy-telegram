<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.js"></script>
    <link href="${pageContext.request.contextPath}/static/layui/css/layui.css" type="text/css" rel="stylesheet">
</head>
<body>
<form class="layui-form" action="${pageContext.request.contextPath}/vipController/updateVIP.do" method="post">
    <input name="id" value="${vip.id}" hidden="hidden">
    <input id="name" name="name" class="layui-input" value="${vip.name}">
    <input id="phoneNumber" name="phoneNumber" class="layui-input" value="${vip.phoneNumber}">
    <input id="identityCard" name="identityCard" class="layui-input" value="${vip.identityCard}">
    <button class="layui-btn">修改</button>
</form>
</body>
</html>
