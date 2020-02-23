<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>我的会员：
    显示信息(办理会员日期，会员到期日期，会员类型，还有多久到期)、
    续会员（选择套餐后跳往支付页面）、优惠推荐</h2>

    办理日期：${vip.handingTime}<br>
    办理时长：${card.type}年<br>
    会员卡号：${card.id}<br>
    会员到期日期：${timeOut}<br>

    <a href="#">我要续会员</a>
</body>
</html>
