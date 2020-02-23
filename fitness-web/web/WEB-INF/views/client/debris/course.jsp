<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>课程</title>
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <style>
        .trainer_div{
            border:1px solid black;
            height: 130px;
            width: 200px;
            float: left;
            margin-left: 20px;
        }
        .trainer_div:hover{
            cursor: pointer;
        }
        #big_div{
            width: auto;
            height: 500px;
        }
        #pages{
            margin-top: 0px;
            position: fixed;
            margin-left: 30%;
        }
        img{
            width: 200px;
            height: 210px;
        }
    </style>
</head>
<body>
<h2>课程界面：
    优质课程推荐、
    点击课程进入该课程详情界面，在里面进行报名
    条件查询（剩余名额少于5,则用红色主题框，否则用绿色主题框）、
    报名（需会员手机号，若人数未满则报名成功，人数满则报名失败）
</h2>
<div id="big_div">
    <c:forEach var="course" items="${courseList.list}">
        <div class="trainer_div">
            <a href="${pageContext.request.contextPath}/homeController/classMessage?courseId=${course.id}">
                <header>
                <img src="http://localhost:88/${course.picture}"/>
                </header>
            </a>
            <footer>
                类型：${course.type}<br>
                人数限制：${course.peopleCount}<br>
            </footer>
        </div>
    </c:forEach>
</div>
<ul id="pages" class="pagination">
    <li><a href="${pageContext.request.contextPath}/homeController/classes.do?pageNum=1">首页</a></li>
    <li><a href="${pageContext.request.contextPath}/homeController/classes.do?pageNum=${courseList.prePage}">&lt;&lt;上一页</a></li>
    <c:forEach var="i" items="${courseList.navigatepageNums}">
        <li><a href="${pageContext.request.contextPath}/homeController/classes.do?pageNum=${i}">${i}</a></li>
    </c:forEach>
    <li><a href="${pageContext.request.contextPath}/homeController/classes.do?pageNum=${courseList.nextPage}">下一页&gt;&gt;</a></li>
    <li><a href="${pageContext.request.contextPath}/homeController/classes.do?pageNum=${courseList.pages}">尾页</a></li>
</ul>
</body>
</html>
