<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.js"></script>
    <link href="${pageContext.request.contextPath}/static/layui/css/layui.css" rel="stylesheet">
    <style>
        body{
            height: 100%;
            width: 100%;
        }
        .top-menu{
            float:right;
            margin-right: 110px;
        }
        .top-menu ul li{
            display:inline-block;
            margin-top:1.6em;
        }
        .top-menu ul li a{
            font-size:1.3em;
            text-decoration:none;
            text-transform:uppercase;
            color:#007DDB;
            margin:0 0.5em ;
            font-weight: 400;
        }
        .top-menu ul li a:hover {
            color: #000;
            font-weight:400;
        }
        .top-menu ul li a.active{
            color:#000;
            font-weight: 600;
        }
        #header_div{
            background-color: whitesmoke;
            width: 1349px;
            height: 80px;
            font-size: 16px;
            z-index: 100;
            position: relative;//不随页面滚动而滚动
            float: left;
            margin-top: 35px;
            background-color:rgba(200,200,200,0.2);
        }
        #body_div{
            width: 1240px;
            height: 700px;
            margin-top: 80px;
            margin-left: 50px;
            scroll-margin-bottom: unset;
            float: left;
            z-index: 99;
        }
        #if{
            width: 1240px;
            height: 550px;
            margin-left: 0px;
            margin-top: 0px;
            z-index: 99;
        }
        #if_2{
            margin-top: 60px;
            width: 1240px;
            height: 1800px;
            z-index: 99;
        }
        #my_inf{
            display: none;
            list-style:none;
            text-align: center;
            background-color: #c0c4cc;
            position: absolute;
        }
        a:hover{
            cursor: pointer;
        }
        iframe{
            border: none;
        }

        .title{
            margin-right: 600px;
            font-size: 24px;
            font-family: "微软雅黑 Light";
        }
    </style>
</head>
<body <%--style="background: transparent url(${pageContext.request.contextPath}/static/imgs/background.jpg) center center no-repeat; background-size:cover;"--%>>
<!-- <%--头部导航--%> -->
<div id="header_div">
    <div class="top-menu">
        <ul>
            <span class="title">power Fitness</span>
            <li><a id="page" href="${pageContext.request.contextPath}/homeController/slider" target="my_iframe">主页</a></li>
            <li><a id="map" href="${pageContext.request.contextPath}/homeController/map" target="my_iframe2" class="scroll">关于我们</a></li>
            <li><a class="my" id="classes" href="${pageContext.request.contextPath}/homeController/classes.do" target="my_iframe2" class="scroll">课程</a></li>
            <li><a class="my" id="handVIP" href="${pageContext.request.contextPath}/homeController/handVIP" target="my_iframe2" class="scroll">会员</a></li>
            <li><a class="my" id="trainer" href="${pageContext.request.contextPath}/homeController/getTrainerList" target="my_iframe2" class="scroll">私教</a></li>
            <c:choose>
                <c:when test="${sessionScope.get('userID')!= null}">
                    <%--有登录对象时显示登录对象--%>
                    <li id="user"><a href="#"><span class="layui-icon-user layui-icon"></span>${userID}</a>
                        <dl id="my_inf">
                            <dd><a class="my" id="my_message" href="${pageContext.request.contextPath}/homeController/message?userID=${userID}" target="my_iframe2">我的资料</a></dd>
                            <dd><a class="my" id="my_vip" href="${pageContext.request.contextPath}/homeController/my_vip.do" target="my_iframe2">我的会员</a></dd>
                            <dd><a class="my" id="my_classes" href="${pageContext.request.contextPath}/homeController/my_classes" target="my_iframe2">我的课程</a></dd>
                            <dd><a class="my" id="my_health" href="${pageContext.request.contextPath}/homeController/my_classes" target="my_iframe2">我的健康</a></dd>
                            <dd><a class="my" id="my_trainer" href="${pageContext.request.contextPath}/homeController/my_trainer.do" target="my_iframe2">我的私教</a></dd>
                            <dd><a>注销</a></dd>
                        </dl>
                    </li>
                </c:when>
                <c:otherwise>
                    <%--当没有登录对象时，显示登录按钮--%>
                    <li><a href="${pageContext.request.contextPath}/homeController/login" class="scroll">登录</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>
<%--主体--%>
<div id="body_div">
    <iframe  id="if" src="${pageContext.request.contextPath}/homeController/slider" name="my_iframe" ></iframe>
    <iframe scrolling="no" id="if_2" src="${pageContext.request.contextPath}/homeController/introduce" name="my_iframe2"></iframe>
</div>

<script>

    $(function () {
        inf();
        if_hideAndShow();
    });

    /**
     * 鼠标悬浮“登录”时动画
     */
    function inf(){
        $("#user").mouseover(function () {
            $("#my_inf").fadeIn();
        });
        $("#user").mouseleave(function () {
            $("#my_inf").fadeOut();
        })
    }

    function if_hideAndShow() {
        $("#page").click(function () {
            $("#if").css("display","block");
            $("#if_2").attr("src","${pageContext.request.contextPath}/homeController/introduce")
                .css("margin-top","60px")
                .css("width","1240px")
                .css("height","1800px")
                .css("z-index","99");
        });
        $("#map").click(function () {
            $("#if").css("display","none");
        });
        $(".my").click(function () {
            //轮播图消失，第二个iframe给其如下样式属性
            $("#if").css("display","none");
            $("#if_2")
                .css("margin-top","-50px")
                .css("width","1240px")
                .css("height","1200px")
                .css("z-index","99");
        });
    }

</script>

</body>
</html>
