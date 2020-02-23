<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta content="" name="description">
    <meta content="" name="author">

    <link rel="shortcut icon" href="static/assets/images/favicon/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="static/assets/images/favicon/apple-touch-icon.png" />
    <link rel="apple-touch-icon" sizes="57x57" href="static/assets/images/favicon/apple-touch-icon-57x57.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="static/assets/images/favicon/apple-touch-icon-72x72.png" />
    <link rel="apple-touch-icon" sizes="76x76" href="static/assets/images/favicon/apple-touch-icon-76x76.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="static/assets/images/favicon/apple-touch-icon-114x114.png" />
    <link rel="apple-touch-icon" sizes="120x120" href="static/assets/images/favicon/apple-touch-icon-120x120.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="static/assets/images/favicon/apple-touch-icon-144x144.png" />
    <link rel="apple-touch-icon" sizes="152x152" href="static/assets/images/favicon/apple-touch-icon-152x152.png" />
    <link rel="apple-touch-icon" sizes="180x180" href="static/assets/images/favicon/apple-touch-icon-180x180.png" />

    <title>主页</title>
    <link href="static/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Work+Sans:400,100,700,300|Nothing+You+Could+Do' rel='stylesheet' type='text/css'>
    <link href="static/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="static/assets/pe-icons/css/pe-icon-7-stroke.css" rel="stylesheet">
    <link href="static/assets/css/animate.css" rel="stylesheet">
    <link href="static/assets/css/plugins.css" rel="stylesheet">
    <link href="static/assets/style.css" rel="stylesheet">
    <link href="static/frontDesk_ID_login.css" rel="stylesheet">

</head>

<body class="top-navigation pushy-left-side pushy-left-open">

<nav class="pushy pushy-left">
    <ul class="list-unstyled">
        Wellcome！${userID}
        <li><a class="logo" href="#"><img alt="" class="logo img-responsive" src="static/assets/images/blog-1.jpeg"></a></li>
        <li class="pushy-submenu">
            <a class="submenu-link" href="#">主页 <i class="fa fa-angle-down"></i></a>
            <ul>
                <li><a href="index.html">主页</a></li>
            </ul>
        </li>
        <li class="pushy-submenu">
            <a class="submenu-link" href="#">博客 <i class="fa fa-angle-down"></i></a>
            <ul>
                <li><a href="news-reel.html">博客</a></li>
            </ul>
        </li>
        <li class="pushy-submenu">
            <a class="submenu-link" href="#">公文包 <i class="fa fa-angle-down"></i></a>
            <ul>
                <li><a href="portfolio-masonry.html">公文包</a></li>
            </ul>
        </li>
        <li class="pushy-submenu">
            <a class="submenu-link" href="#">关于我们 <i class="fa fa-angle-down"></i></a>
            <ul>
                <li><a href="about-us.html">关于我们</a></li>
            </ul>
        </li>
        <li class="pushy-submenu">
            <a class="submenu-link" href="#">产品特点 <i class="fa fa-angle-down"></i></a>
            <ul>
                <li class="pushy-submenu">
                    <a class="submenu-link" href="#">博客<i class="fa fa-angle-down"></i></a>
                    <ul>
                        <li><a href="news-grid.html">博客风格</a></li>
                    </ul>
                </li>
                <li class="pushy-submenu">
                    <a class="submenu-link" href="#">团队 <i class="fa fa-angle-down"></i></a>
                    <ul>
                        <li><a href="#">团队风格</a></li>
                    </ul>
                </li>
            </ul>
        </li>
    </ul>
</nav>

<!-- Site Overlay -->
<div class="site-overlay"></div>

<div id="master-wrapper">

    <div class="preloader">
        <div class="preloader-img">
            <span class="loading-animation animate-flicker"><img src="static/assets/images/loading.gif" alt="loading" /></span>
        </div>
    </div>

    <div class="nav-wrapper smoothie">
        <div class="nav-inner smoothie">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-3 col-xs-6">
                        <a class="logo" href="index.html"><img alt="" class="logo img-responsive" src="static/assets/images/logo3.png"></a>
                    </div>
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="false" aria-controls="navbar">
                        <a class="tcon tcon-menu--minus menu-btn" aria-label="toggle menu">
                            <span class="tcon-menu__lines" aria-hidden="true"></span>
                            <span class="tcon-visuallyhidden">toggle menu</span>
                        </a>
                    </button>
                    <div class="col-sm-9 col-xs-6 hidden-xs nopaddingleftright">
                        <div class="collapse navbar-collapse" id="navbar-collapse-1">
                            <ul class="nav navbar-nav navbar-right">
                                <!-- 下面是几个logo -->
                                <li>
                                    <a href="#" id="showWin"><i class="fa fa-twitter">登录</i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-google-plus"></i></a>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-search"></i></a>
                                    <ul class="dropdown-menu">
                                        <div class="nav-search-form-wrapper">
                                            <form class="form-inline">
                                                <button type="submit" class="btn btn-default pull-right"><i class="glyphicon glyphicon-search"></i></button><input type="text" class="form-control pull-left" placeholder="Search">
                                            </form>
                                        </div>
                                    </ul>
                                </li>
                                <li class="share-li twitter-bg">
                                     <a href="#"><span>Tweet</span> <i class="fa fa-twitter"></i></a>
                                </li>
                                <li class="share-li facebook-bg">
                                     <a href="#"><span>Share</span> <i class="fa fa-facebook"></i></a>
                                </li>
                                <li class="share-li gplus-bg">
                                    <a href="#"><span>+1</span> <i class="fa fa-google-plus"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <header id="home" class="backstretched single-page-hero">
        <div class="dark-overlay single-page-hero">
            <div class="container single-page-hero">
                <div class="vertical-center-js">
                    <h1 class="section-title mb20">power健身俱乐部</h1>
                </div>
            </div>
        </div>

        <%---------------------------用户登录---------------------%>
        <%--<a href="#" id="showWin">登录</a>--%>
        <div id="light">
            <a href="#" id="hideWin">×</a>
            <form class="layui-form">
                <input id="id" class="layui-input" name="userID" placeholder="ID"/>
                <span id="ID_remark"></span>
                <br/>
                <input id="pw" class="layui-input" name="userPassword" type="password" placeholder="密码"/>
                <span id="PWD_remark"></span>
                <br/>
                <input id="vf" class="layui-input" name="verification" placeholder="验证码" />
                <img id="vf_jpg" src="${pageContext.request.contextPath}/captchar.jpg"
                     onclick="this.src=this.src+'?'+Math.random()"/>
                <span id="VF_remark"></span>
                <br/>
                <input type="button" class="layui-button" id="login_btn" value="登录"><br/>
                <div id="to_phone_login">
                    <a href="${pageContext.request.contextPath}/phone_login">手机号码登录>>></a>
                </div>
            </form>
            <a id="forget_a" href="#">忘记密码？</a>
            <span id="forget_remark"></span>
        </div>
        <div id="fade_div"></div> <!-- 我是掩盖层 -->
        <%--    ------------------------------------------------------------%>
    </header>

    <section class="light-wrapper">
        <div class="section-inner">
            <div class="container">
                <div class="row mb90">
                    <div class="col-sm-8">
                        <p class="lead mb40">ggg</p>
                        <p>hhh</p>
                        <p>jjj</p>
                    </div>

                    <div class="col-sm-4">
                        <div class="panel-group styled-accordion" id="accordion" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-default">
                                <div class="panel-heading panel-open smoothie" role="tab" id="headingOne">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Summer Special</a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                    <div class="panel-body">
                                        <p>fff</p>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading smoothie" role="tab" id="headingTwo">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">Outdoor Persuits</a>
                                    </h4>
                                </div>
                                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                    <div class="panel-body">
                                        <p>eee</p>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading smoothie" role="tab" id="headingThree">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">Autumn Event</a>
                                    </h4>
                                </div>
                                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                    <div class="panel-body">
                                        <p>ddd</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="feature-box alt-style col-sm-4 wow fadeIn smoothie">
                        <div class="icon-box-1 match-height">
                            <i class="fa-4x pe-7s-camera smoothie"><a href="#">Details</a></i>
                            <div class="content-area">
                                <h3 class="title">动作</h3>
                                <div class="content">ccc</div>
                            </div>
                        </div>
                    </div>
                    <div class="feature-box alt-style col-sm-4 wow fadeIn smoothie">
                        <div class="icon-box-1 match-height">
                            <i class="fa-4x pe-7s-star smoothie"><a href="#">Details</a></i>
                            <div class="content-area">
                                <h3 class="title">饮食</h3>
                                <div class="content">bbb</div>
                            </div>
                        </div>
                    </div>
                    <div class="feature-box alt-style col-sm-4 wow fadeIn smoothie">
                        <div class="icon-box-1 match-height">
                            <i class="fa-4x pe-7s-light smoothie"><a href="#">Details</a></i>
                            <div class="content-area">
                                <h3 class="title">作息</h3>
                                <div class="content">aaa</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="dark-wrapper">
        <div class="section-inner">
            <div class="container">
                <div class="row mb60 text-center">
                    <div class="col-sm-12">
                        <h3 class="section-title">健身</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-10 col-sm-offset-1">
                        <div class="row">
                            <div class="col-md-3"><img class="img-responsive" src="static/assets/images/clients/logo1.png" alt=""></div>
                            <div class="col-md-3"><img class="img-responsive" src="static/assets/images/clients/logo2.png" alt=""></div>
                            <div class="col-md-3"><img class="img-responsive" src="static/assets/images/clients/logo3.png" alt=""></div>
                            <div class="col-md-3"><img class="img-responsive" src="static/assets/images/clients/logo4.png" alt=""></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="dark-wrapper green-wrapper">
        <div class="section-inner-60">
            <div class="container">
                <div class="row cta">
                    <div class="col-sm-8">
                        <h4>想办卡？</h4>
                    </div>
                    <div class="col-sm-4 text-right">
                        <a href="#" id="open-map" class="btn btn-white btn-lg">详情</a>
                        <a href="#" id="open-contact" class="btn btn-primary btn-lg">Email联系我们</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div id="map-holder">
        <div id="mapwrapper">
            详情内容
        </div>
    </div>

    <div id="contact-holder" class="silver-wrapper">
        <div class="section-inner">
            <div class="vertical-center-js">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-3">
                            <p>描述内容2</p>
                        </div>
                        <div class="col-sm-8 col-sm-offset-1">
                            <div class="row">
                                <div id="message" class="col-sm-12"></div>
                                <div class="col-sm-12">
                                    <form method="post" action="sendemail.php" id="contactform" class="main-contact-form">
                                        <div class="form-group">
                                            <input type="text" class="form-control col-md-4 mb20" name="name" placeholder="您的名字" id="name" required data-validation-required-message="Please enter your name." />
                                            <input type="text" class="form-control col-md-4 mb20" name="email" placeholder="您的邮箱" id="email" required data-validation-required-message="Please enter your email address." />
                                            <input type="text" class="form-control col-md-4 mb20" name="website" placeholder="您的地址" id="website" required data-validation-required-message="Please enter your web address." />
                                        </div>
                                        <textarea name="comments" class="form-control mb20" id="comments" placeholder="Your Message *" required data-validation-required-message="Please enter a message."></textarea>
                                        <input class="btn btn-primary mt30 pull-right" type="submit" name="submit" value="Submit" />
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="pure-white-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-sm-4 col-xs-12">
                    <div class="useful-link-widget widget">
                        这里可以写相关信息
                    </div>
                </div>
                <div class="col-sm-4 col-xs-12">
                    <div class="mailing-widget widget">
                        <div class="content-wiget">
                            <!-- 提交email到相关界面 -->
                            <form action="index.html">
                                <div class="input-group">
                                    <input class="form-control form-email-widget" placeholder="Email address" type="text"><span class="input-group-btn"><input class="btn btn-email" type="submit" value="✓"></span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- 回到顶层 -->
    <a href="#" id="back-to-top"><i class="fa fa-angle-up"></i></a>

</div>

<script src="static/assets/js/jquery.min.js"></script>
<script src="static/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="static/assets/js/plugins.js"></script>
<script src="static/assets/js/owl-carousel.js"></script>
<script src="static/assets/js/init.js"></script>

<script src="static/frontDesk_ID_login.js"></script>

<br/><br/>
</body>
</html>
