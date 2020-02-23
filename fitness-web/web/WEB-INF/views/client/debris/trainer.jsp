<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.js"></script>
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <style>
        .trainer_div{
            border:1px solid black;
            height: 230px;
            width: 160px;
            float: left;
            margin-left: 20px;
            margin-top:15px;
        }
        .trainer_div:hover{
            cursor: pointer;
        }
        #big_div{
            height: 600px;
            width: auto;
        }
        #pages{
            margin-top: 10px;
            position: fixed;
            margin-left: 30%;
        }
        img{
            width: 160px;
            height: 170px;
        }
    </style>
</head>
<body>
<div id="big_div">
<c:forEach var="t" items="${trainerList.list}">
    <div class="trainer_div">
        <a href="${pageContext.request.contextPath}/homeController/trainerMessage?trainerId=${t.id}">
            <header>
                <img src="http://localhost:88/${t.picture}"/>
            </header>
        </a>
        <footer>
        教资：${t.teachAge}<br>
        号码：${t.phoneNumber}<br>
        </footer>
    </div>
</c:forEach>
</div>

<ul id="pages" class="pagination">
    <li><a href="${pageContext.request.contextPath}/homeController/getTrainerList?pageNum=1">首页</a></li>
    <li><a href="${pageContext.request.contextPath}/homeController/getTrainerList?pageNum=${trainerList.prePage}">&lt;&lt;上一页</a></li>
    <c:forEach var="i" items="${trainerList.navigatepageNums}">
        <li><a href="${pageContext.request.contextPath}/homeController/getTrainerList?pageNum=${i}">${i}</a></li>
    </c:forEach>
    <li><a href="${pageContext.request.contextPath}/homeController/getTrainerList?pageNum=${trainerList.nextPage}">下一页&gt;&gt;</a></li>
    <li><a href="${pageContext.request.contextPath}/homeController/getTrainerList?pageNum=${trainerList.pages}">尾页</a></li>
</ul>
</body>
</html>
