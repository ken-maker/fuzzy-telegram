<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>员工</title>
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
        <input id="name" placeholder="姓名"/><span id="name_remark"></span>
        <input id="phoneNumber" placeholder="号码"><span id="phoneNumber_remark"></span>
        <input id="idCard" placeholder="身份证"/><span id="identityCard_remark"></span>
        <input id="address" placeholder="地址"/><span id="address_remark"></span>
        <input id="salary" placeholder="工资"/><span id="salary_remark"></span>
        <input id="time" type="number" placeholder="合同时长"/><span id="time_remark"></span>
        <input id="picture" placeholder="如：xxx.jpg" /><span id="picture_remark"></span><br>
        <select id="type" style="display: block; width: 80px;text-align: center">
            <option value="1">前台</option>
            <option value="2">顾问</option>
            <option value="3" selected="selected">私教</option>
            <option value="4">清洁</option>
            <option value="5">宣传</option>
        </select>
        <input id="teachAge" placeholder="教龄 单位：年" type="number"/><span id="teachAge_remark"></span><br>

        <input type="button" class="layui-btn-warm" id="addVIP_btn" value="添加"/>
    </form>
</div>
<div id="fade_div" style="opacity: 0.5"></div> <!-- 我是掩盖层 -->

<table class="layui-table">
    <tr class="layui-table-header">
        <th>编号</th>
        <th>名字</th>
        <th>年龄</th>
        <th>性别</th>
        <th>工资</th>
        <th>身份证</th>
        <th>地址</th>
        <th>电话</th>
        <th>合同日期</th>
        <th>开始日期</th>
        <th>员工类型</th>
        <th>照片</th>
        <th>教资</th>
        <th>操作</th>
    </tr>
<c:forEach var="emp" items="${employeeList.list}">
    <tr class="layui-table-body">
        <td>${emp.id}</td>
        <td>${emp.name}</td>
        <td>${emp.age}</td>
        <td>${emp.gender}</td>
        <td>${emp.salary}</td>
        <td>${emp.idCard}</td>
        <td>${emp.address}</td>
        <td>${emp.phoneNumber}</td>
        <td>${emp.employmentTerm}年</td>
        <td>${emp.startEmploy}</td>
        <td>${emp.employeeTypeId}</td>
        <td>${emp.picture}</td>
        <td>${emp.teachAge}年</td>
        <td>
            <button class="layui-btn-danger layui-btn-sm">
                <a id="delete_a" href="${pageContext.request.contextPath}/employeeController/deleteEmployee?id=${vip.id}">删除</a>
            </button>
            <button class="layui-btn-warm layui-btn-sm">
                <a href="${pageContext.request.contextPath}/backHome/updateVIP?id=${vip.id}">修改</a>
            </button>
        </td>
    </tr>
</c:forEach>
</table>
<ul class="pagination">
    <li><a href="${pageContext.request.contextPath}/employeeController/employeeList?pageNum=1">首页</a></li>
    <li><a href="${pageContext.request.contextPath}/employeeController/employeeList?pageNum=${employeeList.prePage}">&lt;&lt;上一页</a></li>
    <c:forEach var="i" items="${employeeList.navigatepageNums}">
        <li><a href="${pageContext.request.contextPath}/employeeController/employeeList?pageNum=${i}">${i}</a></li>
    </c:forEach>
    <li><a href="${pageContext.request.contextPath}/employeeController/employeeList?pageNum=${employeeList.nextPage}">下一页&gt;&gt;</a></li>
    <li><a href="${pageContext.request.contextPath}/employeeController/employeeList?pageNum=${employeeList.pages}">尾页</a></li>
</ul>

<script src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.js"></script>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/layui/lay.modules/layer.js"></script>

<script>

<%--    总事件--%>
    $(function () {
        addDisplay();
        addEmployee();
    });

    //基本判断
    function base(name,phoneNumber,idCard,address,salary,time,picture,teachAge) {
        if (name.length<2){
            $("#name_remark").html("名字>=2").css("color","red");
            $("#name").focus();
            return false;
        }
        if (phoneNumber.length!=11){
            $("#phoneNumber_remark").html("手机号码位数必须11位").css("color","red");
            $("#phoneNumber").focus();
            return false;
        }
        if(idCard.length!=18){
            $("#identityCard_remark").html("身份证位数必须18位").css("color","red");
            $("#Utils").focus();
            return false;
        }
        if (salary.length<1){
            $("#salary_remark").html("工资不能为空").css("color","red");
            $("#salary").focus();
            return false;
        }
        if (address.length<1){
            $("#address_remark").html("地址不能为空").css("color","red");
            $("#address").focus();
            return false;
        }
        if (time.length<1){
            $("#time_remark").html("合同期限不能为空").css("color","red");
            $("#time").focus();
            return false;
        }
        if(picture.length<1){
            $("#picture_remark").html("照片不能为空").css("color","red");
            $("#picture").focus();
            return false;
        }if (teachAge<0){
            $("#teachAge_remark").html("教龄不能为负").css("color","red");
            $("#teachAge").focus();
            return false;
        }
        else{
            $("#name_remark").html("√").css("color","green");
            $("#picture_remark").html("√").css("color","green");
            $("#salary_remark").html("√").css("color","green");
            $("#time_remark").html("√").css("color","green");
            $("#address_remark").html("√").css("color","green");
            $("#teachAge_remark").html("√").css("color","green");
            return true;
        }
    }

    //判断号码是否已存在
    function numberIsExist(phoneNumber,fn) {
        $.ajax({
            url:"${pageContext.request.contextPath}/employeeController/numberIsExist",
            method:"GET",
            data:{phoneNumber:phoneNumber},
            contentType:"application/json",
            dataType:"json"
        }).done(function (data) {
            if (data.message){
                $("#phoneNumber_remark").html("√").css("color","green");
                fn();
            } else{
                $("#phoneNumber_remark").html("此号码已存在").css("color","red");
                $("#phoneNumber").focus();
            }
        })
    }

    //判断身份证是否存在
    function identityCardIsExist(idCard,fn) {
        $.ajax({
            url:"${pageContext.request.contextPath}/employeeController/identityCardIsExist",
            method:"GET",
            data:{identityCard:idCard},
            contentType:"application/json",
            dataType:"json"
        }).done(function (data) {
            if (data.message){
                $("#identityCard_remark").html("√").css("color","green");
                fn();
            } else{
                $("#identityCard_remark").html("此身份证已存在").css("color","red");
                $("#identityCard").focus();
            }
        })
    }
    //添加员工
    function addEmployee(){
        $("#addVIP_btn").click(function () {
            $("#name").focus();
            var name=$("#name").val();
            var phoneNumber=$("#phoneNumber").val();
            var idCard=$("#idCard").val();
            var address = $("#address").val();
            var salary = $("#salary").val();
            var time = $("#time").val();
            var picture=$("#picture").val();
            var type = $("#type").val();
            var teachAge = $("#teachAge").val();
            if(base(name,phoneNumber,idCard,address,salary,time,picture,teachAge)) {
                alert("通过基本验证");
                if (numberIsExist(phoneNumber, function () {
                    alert("通过存在验证");
                    if (identityCardIsExist(idCard,function () {
                        alert("提交");
                        $.ajax({
                            url:"${pageContext.request.contextPath}/employeeController/add",
                            method:"GET",
                            data:{
                                name:name,
                                phoneNumber:phoneNumber,
                                idCard:idCard,
                                address:address,
                                salary:salary,
                                employmentTerm:time,
                                picture:picture,
                                employeeTypeId:type,
                                teachAge:teachAge
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
                    }));
                }));
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
