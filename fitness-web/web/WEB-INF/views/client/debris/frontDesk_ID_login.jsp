<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/ID_login.css" rel="stylesheet" />
</head>
<body style="background: transparent url(${pageContext.request.contextPath}/static/imgs/hero-bg.jpg) center center no-repeat; background-size:cover;">
<div id="login_div">
    <form class="layui-form">
        <input id="id" class="layui-input" name="userID" placeholder="ID"/>
        <span id="ID_remark"></span>
        <br/>
        <input id="pw" class="layui-input" name="userPassword" type="password" placeholder="密码"/>
        <span id="PWD_remark"></span>
        <br/>
        <input id="vf" class="layui-input" name="verification" placeholder="验证码" />
        <img id="vf_jpg" src="${pageContext.request.contextPath}/front_login_controller/captchar.jpg"
			         onclick="this.src=this.src+'?'+Math.random()"/>
		<span id="VF_remark"></span>
        <br/>
        <input type="button" class="layui-button" id="login_btn" value="登录"><br/>
        <div id="to_phone_login">
            <a href="${pageContext.request.contextPath}/front_login_controller/phone_login">手机号码登录>>></a>
        </div>
    </form>
    <a id="forget_a" href="#">忘记密码？</a>
    <span id="forget_remark"></span>
</div>

<script>
    $(function (){
        IdIsItRight();
        PasswordIsItRight();
        loginVerify();
    });

    //判断不为空、长度>4
    function verifyId(userId) {
        if(userId==null||userId==""){
            $("#ID_remark").html("不能为空").css("color","red");
            $("#id").focus();
            return false;
        }else if (userId.length<5) {
            $("#ID_remark").html("长度不能<5").css("color","red");
            return false;
        }else{
            return true;
        }
    }
    //判断密码
    function verifyPassword(password) {
        if (password==null||password==""){
            $("#PWD_remark").html("不能为空").css("color","red");
            return false;
        }else if(password.length<3) {
            $("#PWD_remark").html("长度不能<3").css("color","red");
            return false;
        }else{
            $("#PWD_remark").html("√").css("color","blue");
            return true;
        }
    }
    //判断验证码不为空
    function verifyVerifyNotnull(verification) {
        if (verification==null||verification==""){
            $("#VF_remark").html("不能为空").css("color","red");
            return false;
            $("#vf").focus();
        }else if(verification.length!=4){
            $("#VF_remark").html("必须为四位").css("color","red");
            return false;
        }else{
            return true;
        }
    }


    //判断号码不为空，并且长度=11
    function verifyNumberNotNull(phoneNumber) {
        if (phoneNumber==null||phoneNumber==""){
            $("#phoneNumber_remark").html("不能为空").css("color","red");
            $("#phoneNumber").focus();
            return false;
        }if(phoneNumber.length!=11){
            $("#phoneNumber_remark").html("长度必须为11位").css("color","red");
            return false;
        }else{
            return true
        }
    }

    //文本框改变事件：userId是否合理
    function IdIsItRight() {
        $("#id").change(function () {
            var un = $(this).val();
            if (verifyId(un)) {//不为空并且位数>=5
                $.ajax({
                    url:"${pageContext.request.contextPath}/front_login_controller/judgeID",
                    method:"GET",
                    data:{userID:un},
                    contentType:"application/json",
                    dataType:"json"
                }).done(function(data){
                    if (data.isExist){
                        $("#ID_remark").html("√").css("color","blue");
                    }else{
                        $("#ID_remark").html("ID不存在").css("color","red");
                    }
                }).fail(function () {
                    $("#ID_remark").html("出故障了").css("color","red");
                })
            }
        })
    }
    //鼠标移出事件：password是否合理
    function PasswordIsItRight() {
        $("#pw").blur(function () {
            verifyPassword($("#pw").val());
        })
    }

    //提交登录
    function loginVerify() {
        $("#login_btn").click(function () {
            var userID = $("#id").val();
            var userPassword = $("#pw").val();
            var verification = $("#vf").val();
            if (verifyId(userID)&&verifyPassword(userPassword)&&verifyVerifyNotnull(verification)){
                //满足：id、密码、验证码不为空；id、密码符合位数长度
                $.ajax({
                    url:"${pageContext.request.contextPath}/front_login_controller/login.do",
                    method:"GET",
                    data:{userID:userID,userPassword:userPassword,verification:verification},
                    contentType:"application/json",
                    dataType:"json"
                }).done(function (data) {
                    if (data.login=="success") {
                        window.location.href="${pageContext.request.contextPath}/front_login_controller/home?userID="+userID;
                    }else if(data.login=="验证码错误"){
                        $("#vf_jpg").click();
                        $("#VF_remark").html("验证码有误").css("color","red");
                        $("#verification").focus();
                    }else if(data.login=="密码错误"){
                        $("#vf_jpg").click();
                        $("#PWD_remark").html("密码有误").css("color","red");
                        $("#userPassword").focus();
                    }
                }).fail(function () {
                    $("#PWD_remark").html("出故障了").css("color","red");
                })
            }
        })
    }
</script>
</body>
</html>
