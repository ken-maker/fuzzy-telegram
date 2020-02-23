<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>power后台管理</title>
    <link href="${pageContext.request.contextPath}/static/layui/css/layui.css" rel="stylesheet">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">power健身后台管理</div>
        <!-- 头部区域-->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item">
                <a href="">会员设置</a>
            </li>
            <li class="layui-nav-item">
                <a href="">课程设置</a>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="">邮件管理</a>
                    </dd>
                    <dd>
                        <a href="">消息管理</a>
                    </dd>
                    <dd>
                        <a href="">授权管理</a>
                    </dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img"> ${userID}
                </a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="">基本资料</a>
                    </dd>
                    <dd>
                        <a href="">安全设置</a>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="">退了</a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">员工管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="${pageContext.request.contextPath}/employeeController/employeeList" target="body">员工列表</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;">普通用户</a>
                        </dd>
                        <dd>
                            <a href="${pageContext.request.contextPath}/vipController/vipList" target="body">会员用户</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="${pageContext.request.contextPath}/equipmentController/equipmentList" target="body">器材管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="${pageContext.request.contextPath}/lockerController/lockerList" target="body">储物柜管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="${pageContext.request.contextPath}/courseController/courseList" target="body">课程管理</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <iframe name="body" style="width:1178px; height:800px; border: none; overflow-x: auto"></iframe>
    </div>

<%--    <div class="layui-footer">--%>
<%--        <!-- 底部固定区域 -->--%>
<%--        ©. layuicom - 底部固定区域--%>
<%--    </div>--%>
</div>

<script src="${pageContext.request.contextPath}/static/layui/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.js"></script>

<script>
    //JavaScript代码区域
    layui.use('element', function() {
        var element = layui.element;
    });
</script>
</body>
</html>
