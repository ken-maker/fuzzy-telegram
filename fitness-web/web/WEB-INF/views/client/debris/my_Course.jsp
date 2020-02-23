<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.js"></script>
</head>
<body>
<%--<h2>我的课程：
    显示我的全部课程、
    课程推荐（优质好课）、
    课程报名（点击报名后自动报名）、
    更多好课（跳到课程界面）、
    我报过的课（历史记录，备份表）</h2>--%>

    <c:forEach var="course" items="${courses}">
        <div id="myClass_div">
            <header>
                <img src="http://localhost:88/${course.picture}"/>
            </header>
            <footer>
            编号：${course.id}<br>
            名称：${course.name}<br>
            限制人数：${course.peopleCount}<br>
            当前报名人数：${course.nowPeople}<br>
            上课时间：${course.classTime}<br>
                <input id="cancel_hidden" hidden="hidden" value="${course.id}">
                <button id="cancel_btn">取消课程</button>
            </footer>
        </div>
    </c:forEach>

<script>

    $(function () {
        cancelCourse();
    });

    function cancelCourse(){
        $("#cancel_btn").click(function () {
            var courseId = $("#cancel_hidden").val();
            $.ajax({
                url:"${pageContext.request.contextPath}/homeController/cancelCourse",
                method:"GET",
                data:{courseId:courseId},
                contentType:"application/json",
                dataType:"json"
            }).done(function (data) {
                if (data.message){
                    alert("取消课程成功");
                    window.location.reload();
                }
            }).fail(function () {
                alert("出故障了")
            })
        })
    }

</script>


</body>
</html>
