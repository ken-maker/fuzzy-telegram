<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>订单</title>
    <link href="${pageContext.request.contextPath}/static/layui/css/layui.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <style>
        .pagination {
            margin: 0;
            padding: 0;
            font-size: 12px;
            font-family: Geneva, Arial, Helvetica, sans-serif;
        }

        .pagination a, .pagination a:link, .pagination a:visited {
            margin: 0 5px 0 0;
            padding: 2px 5px 2px 5px;
            border: 1px solid #aaaadd;
            color: #006699;
            text-decoration: none;
        }

        .pagination a:hover, .pagination a:active {
            border: 1px solid #006699;
            color: #000000;
        }
        input{
            border:none;
        }
        #light{
            height: auto;
            width: 360px;
            border: 1px solid #000000;
            margin-top: 10%;
            margin-left: 35%;
            position: absolute;
            background: #9F9F9F;
            text-align: center;
            z-index: 100;
        }
        #hideWin{
            font-size: 24px;
            margin-left: 337px;
        }
        #addVIP_btn{
            cursor: pointer;
        }
        form input,#addVIP_btn,select{
            margin-left: 10px;
            margin-top: 15px;
            width: 150px;
            height: 30px;
        }
    </style>
</head>
<body>
<input id="showWin" class="layui-btn-normal layui-btn" value="手动添加"/>
<div id="light">
    <a href="#" id="hideWin">×</a>
    <form id="addVIP_form" class="layui-form">
        <input id="name" placeholder="订单编号"/><span id="name_remark"></span>
        <select id="course_type">
            <option value="">请选择课程类型</option>
            <option value="">请选择课程类型</option>
            <option value="">请选择课程类型</option>
            <option value="">请选择课程类型</option>
        </select>
        <input id="peopleCount" placeholder="限制报名人数"/><span id="peopleCount_remark"></span>
        <input id="picture" placeholder="如：xxx.jpg" /><span id="picture_remark"></span><br>
        <input id="nowPeople" placeholder="当前报名人数"/><span id="nowPeople_remark"></span>
        <input id="classTime" placeholder="上课时间"/><span id="classTime_remark"></span>
        <input type="button" class="layui-btn-warm" id="addVIP_btn" value="添加"/>
    </form>
</div>
<div id="fade_div" style="opacity: 0.5"></div> <!-- 我是掩盖层 -->

<table class="layui-table">
    <tr class="layui-table-header">
        <th>订单编号</th>
        <th>创建者</th>
        <th>订单名称</th>
        <th>创建日期</th>
        <th>交易金额</th>
        <th>备注</th>
    </tr>
    <c:forEach var="course" items="${courseList.list}">
        <tr class="layui-table-body">
            <td>${course.id}</td>
            <td>${course.name}</td>
            <td>${course.age}</td>
            <td>${course.gender}</td>
            <td>${course.salary}</td>
            <td>
                <button class="layui-btn-danger layui-btn-sm">
                    <a id="delete_a" href="${pageContext.request.contextPath}/?id=${course.id}">删除</a>
                </button>
                <button class="layui-btn-warm layui-btn-sm">
                    <a href="${pageContext.request.contextPath}/?id=${course.id}">修改</a>
                </button>
            </td>
        </tr>
    </c:forEach>
</table>
<ul class="pagination">
    <li><a href="${pageContext.request.contextPath}/courseController/courseList?pageNum=1">首页</a></li>
    <li><a href="${pageContext.request.contextPath}/courseController/courseList?pageNum=${course.prePage}">&lt;&lt;上一页</a></li>
    <c:forEach var="i" items="${course.navigatepageNums}">
        <li><a href="${pageContext.request.contextPath}/courseController/courseList?pageNum=${i}">${i}</a></li>
    </c:forEach>
    <li><a href="${pageContext.request.contextPath}/courseController/courseList?pageNum=${course.nextPage}">下一页&gt;&gt;</a></li>
    <li><a href="${pageContext.request.contextPath}/courseController/courseList?pageNum=${course.pages}">尾页</a></li>
</ul>

<script src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.js"></script>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/layui/lay.modules/layer.js"></script>

<script>
    <%--总事件--%>
    $(function () {
        addDisplay();
        addEmployee();
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

    //添加员工
    function addEmployee(){
        $("#addVIP_btn").click(function () {
            $("#name").focus();
            var name=$("#name").val();
            var peopleCount=$("#peopleCount").val();
            var picture=$("#picture").val();
            var nowPeople = $("#nowPeople").val();
            var classTime = $("#classTime").val();
            var type = $('#course_type option:selected').val();
            if(base(name,peopleCount,picture,nowPeople,classTime)) {
                alert("通过基本验证");
                $.ajax({
                    url:"",
                    method:"GET",
                    data:{
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
                        layui.use('layer', function(){
                            var layer = layui.layer;
                            layer.msg('添加成功');
                        });
                        $("#light").css("display","none");
                    }else{
                        layui.use('layer', function(){
                            var layer = layui.layer;
                            layer.msg('添加失败');
                        });
                    }
                }).fail(function () {
                    layui.use('layer', function(){
                        var layer = layui.layer;
                        layer.msg('出故障了');
                    });
                })
            }else{
                layui.use('layer', function(){
                    var layer = layui.layer;
                    layer.msg('出故障了');
                });
            }
        })
    }

    //显示添加员工div
    function addDisplay() {

        $("#light").css("display","none");
        $("#fade_div").css("display","block");

        $("#showWin").click(function(){
            $("#light").slideDown();
            $("#fade_div").fadeIn();
        });
        $("#hideWin").click(function(){
            $("#light").slideUp();
            $("#fade_div").fadeOut();
        })
    }
</script>

</body>
</html>
