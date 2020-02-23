<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/static/layui/css/layui.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<input class="layui-btn-normal layui-btn" value="手动添加"/>
<table class="layui-table">
    <tr class="layui-table-header">
        <th>编号</th>
        <th>类型</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    <c:forEach var="locker" items="${lockerList.list}">
        <tr class="layui-table-body">
            <td>${locker.id}</td>
            <td>${locker.size}</td>
            <td>${locker.aMonthMoney}</td>
            <td>${locker.state}</td>
            <td>${locker.picture}</td>
            <td>${locker.place}</td>
            <td>
                <input id="delete" class="layui-btn-danger layui-btn-sm" type="button" value="删除"/>
                <input id="update" class="layui-btn-warm layui-btn-sm" type="button" value="修改"/>
            </td>
        </tr>
    </c:forEach>
</table>
<ul class="pagination">
    <li><a href="${pageContext.request.contextPath}/lockerController/lockerList?pageNum=1">首页</a></li>
    <li><a href="${pageContext.request.contextPath}/lockerController/lockerList?pageNum=${lockerList.prePage}">&lt;&lt;上一页</a></li>
    <c:forEach var="i" items="${lockerList.navigatepageNums}">
        <li><a href="${pageContext.request.contextPath}/lockerController/lockerList?pageNum=${i}">${i}</a></li>
    </c:forEach>
    <li><a href="${pageContext.request.contextPath}/lockerController/lockerList?pageNum=${lockerList.nextPage}">下一页&gt;&gt;</a></li>
    <li><a href="${pageContext.request.contextPath}/lockerController/lockerList?pageNum=${lockerList.pages}">尾页</a></li>
</ul>

<div id="light">
    <a href="#" id="hideWin">×</a>
    <form id="add_form" class="layui-form">
        <select id="size_select">
            <option value="">大</option>
            <option value="">中</option>
            <option value="">小</option>
        </select>
        <input id="aMonthMoney" placeholder="月租"/><span id="aMonthMoney_remark"></span>
        <select id="state_select">
            <option value="">正常</option>
            <option value="">禁用</option>
        </select>
        <input id="picture" placeholder="照片"/><span id="picture_remark"></span>
        <input id="place" placeholder="位置"/><span id="classTime_remark"></span>
        <input type="button" class="layui-btn-warm" id="add_btn" value="添加"/>
    </form>
</div>
<div id="fade_div" style="opacity: 0.5"></div> <!-- 我是掩盖层 -->

<script>
    $(function () {
        addDisplay();
        addEmployee();
    });

    //基本判断
    function base(aMonthMoney,picture,place) {
        if (aMonthMoney.length<0){
            $("#aMonthMoney_remark").html("月租不能为空").css("color","red");
            $("#aMonthMoney").focus();
            return false;
        }
        if (place.length<1){
            $("#place_remark").html("位置不能为空").css("color","red");
            $("#place").focus();
            return false;
        }
        if(picture.length<1){
            $("#picture_remark").html("照片不能为空").css("color","red");
            $("#picture").focus();
            return false;
        }
        else{
            $("#name_remark").html("√").css("color","green");
            $("#picture_remark").html("√").css("color","green");
            $("#nowPeople_remark").html("√").css("color","green");
            return true;
        }
    }

    //添加
    function addEmployee(){
        $("#add_btn").click(function () {
            var size = $('#size_select option:selected').val();
            var aMonthMoney=$("#aMonthMoney").val();
            var state = $('#state_select option:selected').val();
            var picture = $("#picture").val();
            var place = $("#place").val();
            if(base(aMonthMoney,picture,place)){
                alert("通过基本验证");
                $.ajax({
                    url:"",
                    method:"GET",
                    data:{
                        size:size,
                        aMonthMoney:aMonthMoney,
                        state:state,
                        picture:picture,
                        place:place,
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

    //显示添加div
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
