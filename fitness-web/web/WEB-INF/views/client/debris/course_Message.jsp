<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>课程详情</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.js"></script>
</head>
<body>
私教详情信息
<div id="course_div">
    <header>
        <img src="http://localhost:88/${course.picture}"/>
    </header>
    <footer>
        编号：${course.id}<br>
        名称：${course.name}<br>
        类型：${course.type}<br>
        限制人数：${course.peopleCount}<br>
        上课时间：${course.classTime}<br>
        报名人数：${course.nowPeople}<br>
        <input id="peopleCount" hidden="hidden" value="${course.peopleCount}">
        <input id="nowPeople" hidden="hidden" value="${course.nowPeople}">
        <button class="apply_btn" value="${course.id}">报名</button>
        <span id="remark"></span>
    </footer>
</div>

<script>

    $(function () {
        apply();
    });

    function apply(){
        $(".apply_btn").click(function () {
            var courseId = $(this).val();
            var peopleCount = $("#peopleCount").val();
            var nowPeople = $("#nowPeople").val();
            if (peopleCount>nowPeople){//如果当前报名人数小于人数限制，则可报名
                $.ajax({
                    url:"${pageContext.request.contextPath}/homeController/apply.do",
                    method:"GET",
                    data:{courseId:courseId},
                    contentType:"application/json",
                    dataType:"json"
                }).done(function(data){
                    alert(data.message);
                }).fail(function () {
                    alert("出故障了");
                })
            }else{
                $("#course_div").css("border","2px solid red");
                $("#remark").html("人数已满").css("color","red");
            }
        })
    }


</script>

</body>
</html>
