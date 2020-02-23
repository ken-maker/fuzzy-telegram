<%--
  Created by IntelliJ IDEA.
  User: 匿名情书
  Date: 2019/12/20
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.js"></script>
    <style>
        p ,h2{
            text-align: center;
        }
        span {
            color: red;
        }
    </style>
</head>
<body>
<h2>支付成功</h2>
<p>
    <span id="time">5</span>秒之后，自动跳转到首页
</p>


<script>
    /*
    倒计时跳转

    分析：
        1. 显示页面
        2. 定义一个方法，用于修改倒计时秒数
        3. 判断如果秒数等于1，则跳转到首页
        4. 定义一个定时器，每隔一秒执行一次方法
     */

    // 2. 定义一个方法，用于修改倒计时秒数
    var newTime = 5;
    function fun() {
        newTime --;
        // 3. 判断如果秒数等于1，则跳转到首页
        if (newTime == 1) {
            location.href = "${pageContext.request.contextPath}/front_login_controller/home?userID=${sessionScope.get('userID')}";
        }
        var time = document.getElementById("time");
        time.innerHTML = newTime + "";  // 加上 + ""    使newTime变为字符串形式
    }


    // 4. 定义一个定时器，每隔一秒执行一次方法
    setInterval(fun, 1000);

</script>
</body>
</html>
