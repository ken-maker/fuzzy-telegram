<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>课程修改</title>
    <link href="${pageContext.request.contextPath}/static/layui/css/layui.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.js"></script>
</head>
<body>
<form>
课程名：<input id="name" value="${course.name}"><span id="name_remark"></span><br>
    类型：
    <select id="course_type">
        <option value="${course.type}" selected="selected">${course.type}</option>
        <option value="减脂">减脂</option>
        <option value="塑形">塑形<option>
        <option value="增肌">增肌</option>
    </select><br>
    限制人数：<input id="peopleCount" value="${course.peopleCount}"><span id="peopleCount_remark"></span><br>
    照片：<input id="picture" value="${course.picture}"><span id="picture_remark"></span><br>
    现报人数：<input id="nowPeople" value="${course.nowPeople}"><span id="nowPeople_remark"></span><br>
    上课时间<input id="classTime" value="${course.classTime}"><span id="classTime_remark"></span><br>
    <input id="courseId" hidden="hidden" value="${course.id}"/>
    <input id="update_btn" type="button" value="确认修改">
</form>
<script type="text/javascript">
    $(function () {
        update();
    });

    //基本判断
    function base(name,peopleCount,picture,nowPeople,classTime) {
        if (name.length<2){
            $("#name_remark").html("名字>=2").css("color","red");
            $("#name").focus();
            return false;
        }
        if (peopleCount.length<1){
            $("#peopleCount_remark").html("限制报名人数不能为空").css("color","red");
            $("#peopleCount").focus();
            return false;
        }
        if(picture.length<1){
            $("#picture_remark").html("照片不能为空").css("color","red");
            $("#picture").focus();
            return false;
        }if (nowPeople.length<0){
            $("#nowPeople_remark").html("当前人数不能为负").css("color","red");
            $("#nowPeople").focus();
            return false;
        }if (classTime.length<1){
            $("#classTime_remark").html("上课时间不能为空").css("color","red");
            $("#classTime").focus();
            return false;
        }
        else{
            $("#name_remark").html("√").css("color","green");
            $("#picture_remark").html("√").css("color","green");
            $("#nowPeople_remark").html("√").css("color","green");
            $("#peopleCount_remark").html("√").css("color","green");
            $("#classTime_remark").html("√").css("color","green");
            return true;
        }
    }

    //点击修改
    function update() {
        $("#update_btn").click(function () {
            var id = $("#courseId").val();
            var name = $("#name").val();
            var type = $('#course_type option:selected').val();
            var peopleCount = $("#peopleCount").val();
            var picture = $("#picture").val();
            var nowPeople = $("#nowPeople").val();
            var classTime = $("#classTime").val();
            if (base(name,peopleCount,picture,nowPeople,classTime)){
                $.ajax({
                    url:"${pageContext.request.contextPath}/courseController/updateCourse.do",
                    method:"GET",
                    data:{
                        id:id,
                        name:name,
                        type:type,
                        peopleCount:peopleCount,
                        picture:picture,
                        nowPeople:nowPeople,
                        classTime:classTime
                    },
                    contentType:"application/json",
                    dataType:"json"
                }).done(function (data) {
                    if (data.message){
                        // layui.use('layer', function(){
                        //     var layer = layui.layer;
                        //     layer.msg('修改成功');
                        // });
                        window.location.href="${pageContext.request.contextPath}/courseController/courseList";
                    }else{
                        // layui.use('layer', function(){
                        //     var layer = layui.layer;
                        //     layer.msg('修改失败');
                        // });
                        alert("修改失败");
                    }
                })
            }
        })
    }
</script>

<%--<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/static/layui/lay/modules/layer.js"></script>--%>

</body>
</html>
