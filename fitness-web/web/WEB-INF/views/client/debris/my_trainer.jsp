<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
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
<h2>我的私教：
    若有私教则显示私教的所有信息、
    私教课推荐、
    续课（选择套餐后进入支付页面）、
    联系私教（发短信）、
    更多私教课（跳到私教界面）
</h2>

<c:choose>
    <c:when test="${trainers!=null}">
        <c:forEach var="trainer" items="${trainers}">
            <div id="myTrainer_div">
                <header>
                    <img src="http://localhost:88/${trainer.picture}"/>
                </header>
                <footer>
                    编号：${trainer.id}<br>
                    名称：${trainer.name}<br>
                    年龄：${trainer.age}<br>
                    性别：${trainer.gender}<br>
                    地址：${trainer.address}<br>
                    电话：${trainer.phoneNumber}<br>
                    教龄：${trainer.teachAge}<br>
                </footer>
            </div>
        </c:forEach>
    </c:when>
    <c:otherwise>
        抱歉，您还未定私教课
    </c:otherwise>
</c:choose>

</body>
</html>
