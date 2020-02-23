<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>power用户登录</title>
    <link href="${pageContext.request.contextPath}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/Phone_login.css" rel="stylesheet"/>
</head>
<body style="background: transparent url(${pageContext.request.contextPath}/static/imgs/hero-bg.jpg) center center no-repeat; background-size:cover;">
<div id="login_div" class="layui-anim-fadein">
    <form class="layui-form">
        <input id="phoneNumber" class="layui-input" type="tel" name="PhoneNumber" placeholder="手机号码">
        <span id="PN_remark"></span>
        <input id="verificationCode" class="layui-input" name="verificationCode" placeholder="验证码">
        <div id="vf_btn_div">
            <input type="button" class="layui-button" id="vf_btn" value="点我获取">
        </div>
        <span id="VFC_remark"></span>
        <input type="button" class="layui-button" id="tologin_btn" value="登录" />
        <div id="to_ID_login">
            <a href="${pageContext.request.contextPath}/homeController/login"><<<账号密码登录</a>
        </div>
    </form>
</div>

<script src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.js"></script>

<script>
    //总事件
    $(function () {
        textChange();
        getVerifyCode();
        toLogin();
    });

    //判断号码不为空，并且长度=11
    function verifyPhoneNumber(phoneNumber) {
        if (phoneNumber==null||phoneNumber==""){
            $("#PN_remark").html("不能为空").css("color","red");
            $("#phoneNumber").focus();
            return false;
        }if(phoneNumber.length!=11){
            $("#PN_remark").html("长度必须为11位").css("color","red");
            return false;
        }else{
            return true;
        }
    }

    //判断验证码不为空
    function verifyVerify(verification) {
        if (verification==null||verification==""){
            $("#VFC_remark").html("不能为空").css("color","red");
            $("#verificationCode").focus();
            return false;
        }else{
            return true;
        }
    }

    //验证,号码是否存在
    function NumberIsExist(phoneNumber,fn){
        //异步请求，请求到控制器判断是否有这个号码
        $.ajax({
            url:"${pageContext.request.contextPath}/front_login_controller/phoneNumberIsExist",
            method:"GET",
            data:{phoneNumber:phoneNumber},
            contentType:"application/json",
            dataType:"json"
        }).done(function (data) {
            if (data.message){
                $("#PN_remark").html("√").css("color","white");
                fn();
            }else{
                $("#PN_remark").html("此号码无效").css("color","red");
                $("#phoneNumber").focus();
            }
        }).fail(function () {
            alert("出故障了");
        })
    }



    //鼠标离开时,验证号码是否存在
    function textChange() {
        $("#phoneNumber").change(function () {
            var phoneNumber=$("#phoneNumber").val();
            NumberIsExist(phoneNumber,function () {

            });
        })
    }

    //获取验证码
    function getVerifyCode(){
        $("#vf_btn").click(function () {
            $("#verificationCode").val("");
            var phoneNumber = $("#phoneNumber").val();
            if (verifyPhoneNumber(phoneNumber)){
                if (NumberIsExist(phoneNumber,function () {
                    $.ajax({
                        url:"${pageContext.request.contextPath}/front_login_controller/getVerifyCode",
                        method:"GET",
                        data:{phoneNumber:phoneNumber},
                        contentType:"application/json",
                        dataType:"json"
                    }).done(function (data) {
                        $("#VFC_remark").html(data.message).css("color", "yellow");
                    }).fail(function () {
                        alert("fail");
                    })
                })){
                }
            }
        })
    }

    //登录,短信验证
    function toLogin(){
        $("#tologin_btn").click(function () {
            var verificationCode = $("#verificationCode").val();
            var phoneNumber = $("#phoneNumber").val();
            if (verifyPhoneNumber(phoneNumber)){
                if (verifyVerify(verificationCode)){
                    $.ajax({
                        url:"${pageContext.request.contextPath}/front_login_controller/PhoneLogin.do",
                        method:"GET",
                        data:{verificationCode:verificationCode,phoneNumber:phoneNumber},
                        contentType:"application/json",
                        dataType:"json"
                    }).done(function (data) {
                        if (data.message=="success"){
                            $("#VFC_remark").html("√").css("color","blue");
                            window.location.href="${pageContext.request.contextPath}/front_login_controller/home?userID="+data.userID;
                        }else{
                            $("#VFC_remark").html(data.message).css("color","red");
                            $("#verificationCode").focus();
                        }
                    }).fail(function () {
                        alert("出故障了");
                    })
                }
            }
        })
    }

</script>
</body>
</html>
