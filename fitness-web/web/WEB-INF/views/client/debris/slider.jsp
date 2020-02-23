<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel='stylesheet prefetch' href='${pageContext.request.contextPath}/static/jquery-slider/css/slick.css'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/jquery-slider/css/style.css">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <style type="text/css">
        html{height:100%}
        body{height:100%;margin:0px;padding:0px}
        img{
            width: 800px;
            height: 400px;
        }
    </style>

</head>

<body>
<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
     width="0" height="0" viewBox="0 0 1366 768" xml:space="preserve">
    <defs>
        <filter id="blur0">
            <feGaussianBlur in="SourceGraphic" stdDeviation="0 0" />
        </filter>
        <filter id="blur1">
            <feGaussianBlur in="SourceGraphic" stdDeviation="5 0" />
        </filter>
        <filter id="blur2">
            <feGaussianBlur in="SourceGraphic" stdDeviation="12 0" />
        </filter>
        <filter id="blur3">
            <feGaussianBlur in="SourceGraphic" stdDeviation="20 0" />
        </filter>
        <filter id="blur4">
            <feGaussianBlur in="SourceGraphic" stdDeviation="35 1" />
        </filter>
        <filter id="blur5">
            <feGaussianBlur in="SourceGraphic" stdDeviation="50 1" />
        </filter>
    </defs>
</svg>

<%--轮播--%>
<div class="slider">
    <div>
        <img src="${pageContext.request.contextPath}/static/imgs/1.jpg" alt="">
    </div>
    <div>
        <img src="${pageContext.request.contextPath}/static/imgs/2.jpg" alt="">
    </div>
    <div>
        <img src="${pageContext.request.contextPath}/static/imgs/3.jpg" alt="">
    </div>
</div>

<%--导入外部文件--%>
<script src='${pageContext.request.contextPath}/static/jquery-slider/js/jquery.min.js'></script>
<script src='${pageContext.request.contextPath}/static/jquery-slider/js/slick.min.js'></script>
<script src="${pageContext.request.contextPath}/static/jquery-slider/js/index.js"></script>
</body>
</html>
