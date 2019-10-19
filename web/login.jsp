<%--
  Created by IntelliJ IDEA.
  User: FTKJ
  Date: 2019/10/17
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>Login Page - Ace Admin</title>

    <meta name="description" content="User login page"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="${path}/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${path}/assets/font-awesome/4.5.0/css/font-awesome.min.css"/>

    <!-- text fonts -->
    <link rel="stylesheet" href="assets/css/fonts.googleapis.com.css"/>

    <!-- ace styles -->
    <link rel="stylesheet" href="${path}/assets/css/ace.min.css"/>

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="${path}/assets/css/ace-part2.min.css"/>
    <![endif]-->
    <link rel="stylesheet" href="${path}/assets/css/ace-rtl.min.css"/>

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="${path}/assets/css/ace-ie.min.css"/>
    <![endif]-->

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
    <script src="assets/js/html5shiv.min.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->
</head>

<body class="login-layout" background="${path}/assets/images/bg.jpg">
<div class="main-container">
    <div class="main-content">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="login-container" style="width: 400px;">
                    <div class="center">
                        <h1>

                            <span class="red">小标交友</span>

                        </h1>

                    </div>

                    <div class="space-6"></div>

                    <div class="position-relative">
                        <div id="login-box" class="login-box visible widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header blue lighter bigger">
                                        <i class="ace-icon fa fa-coffee green"></i>
                                        请输入你的信息
                                    </h4>

                                    <div class="space-6"></div>

                                    <form action="${path}/login" method="post" id="loginForm">
                                        <fieldset>
                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="用户名"
                                                                   name="username" id="username"/>
															<i class="ace-icon fa fa-user"></i>
														</span>
                                            </label>

                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" id="password1" class="form-control" name="password"
                                                                   placeholder="密码"/>
															<i class="ace-icon fa fa-lock"></i>
														</span>
                                            </label>

                                            <div class="space"></div>

                                            <div class="clearfix">
                                                <label class="inline">
                                                    <input type="checkbox" class="ace" name="remember"/>
                                                    <span class="lbl"> 记住我</span>
                                                </label>

                                                <button type="submit" class="width-35 pull-right btn btn-sm btn-primary"
                                                        onclick="login()">
                                                    <i class="ace-icon fa fa-key"></i>
                                                    <span class="bigger-110">登录</span>


                                                </button>

                                                <p style="color:red" id="errorMsg">${msg}</p>
                                                <script>
                                                    function login() {

                                                        $("#loginForm").submit();
                                                        <%--$.post("${path}/user/login", $("#loginForm").serialize(), function (data) {--%>
                                                            <%--if (data.flag) {--%>
                                                                <%--location.href = "${path}/html/index.jsp";--%>

                                                            <%--} else {--%>
                                                                <%--$("#errorMsg").html(data.msg);--%>

                                                            <%--}--%>
                                                        <%--});--%>
                                                    }
                                                </script>

                                            </div>

                                            <div class="space-4"></div>
                                        </fieldset>
                                    </form>

                                </div><!-- /.widget-main -->

                                <div class="toolbar clearfix">
                                    <div>
                                        <a href="#" data-target="#forgot-box" class="forgot-password-link">
                                            <i class="ace-icon fa fa-arrow-left"></i>
                                            忘记密码
                                        </a>
                                    </div>

                                    <div>
                                        <a href="#" data-target="#signup-box" class="user-signup-link">
                                            没有账号？
                                            <i class="ace-icon fa fa-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>
                            </div><!-- /.widget-body -->
                        </div><!-- /.login-box -->

                        <div id="forgot-box" class="forgot-box widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header red lighter bigger">
                                        <i class="ace-icon fa fa-key"></i>
                                        重置密码
                                    </h4>

                                    <div class="space-6"></div>
                                    <p>
                                        请输入你的邮箱
                                    </p>

                                    <form>
                                        <fieldset>
                                            <div class="clearfix">
                                                <span class="input-icon input-icon-right">
                                                    <input type="email" class="form-control" id="email"
                                                           placeholder="请输入您的邮箱"/>
                                                    <i class="ace-icon fa fa-envelope"></i>
                                                </span>
                                                <button type="button" onclick="sendCheckCode()"
                                                        class="width-35 pull-right btn btn-sm btn-danger">
                                                    <i class="ace-icon fa fa-lightbulb-o"></i>
                                                    <span class="bigger-110">发送验证码</span>
                                                </button>
                                                <script>
                                                    /*发送验证码*/
                                                    function sendCheckCode() {

                                                        $.post("${path}/user/sendCheckCode", {email: $("#email").val()}, function (data) {

                                                            if (data.flag) {
                                                                alert(data.msg);
                                                            } else {
                                                                alert(data.msg);
                                                            }

                                                        });
                                                    }

                                                    function updatePassword() {

                                                        $.post("${path}/user/updatePassword",
                                                            {
                                                                checkCode: $("#checkCode").val(),
                                                                email: $("#email").val(),
                                                                password: $("#newPassword").val()
                                                            },
                                                            function (data) {

                                                                if (data.flag) {
                                                                    location.reload();
                                                                } else {

                                                                    $("#updatePasswordErrorMsg").html(data.msg);
                                                                }

                                                            });


                                                    }

                                                </script>
                                            </div>
                                            <div class="clearfix" style="margin-top:20px;">
                                                <span class="input-icon input-icon-right">
                                                    <input type="text" class="form-control" placeholder="请输入验证码"
                                                           id="checkCode"/>
                                                </span>
                                                <span style="color:red" id="updatePasswordErrorMsg"></span>
                                            </div>
                                            <div class="clearfix" style="margin-top:20px;">
                                                <span class="input-icon input-icon-right">
                                                    <input type="password" class="form-control" id="newPassword"
                                                           placeholder="请输入新的密码"/>
                                                </span>
                                                <button type="button" onclick="updatePassword()"
                                                        class="width-35 pull-right btn btn-sm btn-success">
                                                    <i class="ace-icon fa fa-lightbulb-o"></i>
                                                    <span class="bigger-110">确认修改</span>
                                                </button>

                                            </div>

                                            <script>

                                            </script>
                                        </fieldset>
                                    </form>
                                </div><!-- /.widget-main -->

                                <div class="toolbar center">
                                    <a href="#" data-target="#login-box" class="back-to-login-link">
                                        返回登录
                                    </a>
                                </div>
                            </div><!-- /.widget-body -->
                        </div><!-- /.forgot-box -->

                        <div id="signup-box" class="signup-box widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header green lighter bigger">
                                        <i class="ace-icon fa fa-users blue"></i>
                                        新用户注册
                                    </h4>

                                    <div class="space-6"></div>
                                    <p> 输入你的资料: </p>

                                    <form method="post" id="registerForm">
                                        <fieldset>
                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="邮箱"
                                                                   name="email"/>
															<i class="ace-icon fa fa-envelope"></i>
														</span>
                                            </label>
                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="用户名"
                                                                   name="username"/>
															<i class="ace-icon fa fa-user"></i>
														</span>
                                            </label>

                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" id="password"
                                                                   placeholder="密码" name="password"/>
															<i class="ace-icon fa fa-lock"></i>
														</span>
                                            </label>

                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" id="repassword"
                                                                   placeholder="再次确认密码"/>
															<i class="ace-icon fa fa-retweet"></i>
														</span>
                                            </label>


                                            <p id="registerErrorMsg" style="color:red"></p>

                                            <div class="space-24"></div>

                                            <div class="clearfix">
                                                <button type="reset" class="width-30 pull-left btn btn-sm">
                                                    <i class="ace-icon fa fa-refresh"></i>
                                                    <span class="bigger-110">重置</span>
                                                </button>

                                                <input type="button" class="width-65 pull-right btn btn-sm btn-success"
                                                       onclick="register()" value="注册">
                                                <script>
                                                    function register() {
                                                        if ($("#repassword").val() != $("#password").val()) {
                                                            $("#registerErrorMsg").html("两次密码不一致！");
                                                            return;
                                                        }

                                                        $.post("${path}/user/register", $("#registerForm").serialize(), function (data) {
                                                            if (data.flag) {
                                                                // 注册成功
                                                                location.href = "${path}/login.jsp";
                                                            } else {
                                                                // 注册失败
                                                                $("#registerErrorMsg").html(data.msg);

                                                            }
                                                        });

                                                    }

                                                </script>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div>

                                <div class="toolbar center">
                                    <a href="#" data-target="#login-box" class="back-to-login-link">
                                        返回登录
                                    </a>
                                </div>
                            </div><!-- /.widget-body -->
                        </div><!-- /.signup-box -->
                    </div><!-- /.position-relative -->

                    <div class="navbar-fixed-top align-right">
                        <br/>
                        &nbsp;
                        <a id="btn-login-dark" href="#">Dark</a>
                        &nbsp;
                        <span class="blue">/</span>
                        &nbsp;
                        <a id="btn-login-blur" href="#">Blur</a>
                        &nbsp;
                        <span class="blue">/</span>
                        &nbsp;
                        <a id="btn-login-light" href="#">Light</a>
                        &nbsp; &nbsp; &nbsp;
                    </div>
                </div>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.main-content -->
</div><!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->
<script src="${path}/assets/js/jquery-2.1.4.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="${path}/assets/js/jquery-1.11.3.min.js"></script>
<script src="${path}/assets/js/jquery.validate.min.js"></script>
<![endif]-->
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function ($) {
        $(document).on('click', '.toolbar a[data-target]', function (e) {
            e.preventDefault();
            var target = $(this).data('target');
            $('.widget-box.visible').removeClass('visible');//hide others
            $(target).addClass('visible');//show target
        });
    });


    //you don't need this, just used for changing background
    jQuery(function ($) {
        $('#btn-login-dark').on('click', function (e) {
            $('body').attr('class', 'login-layout');
            $('#id-text2').attr('class', 'white');
            $('#id-company-text').attr('class', 'blue');

            e.preventDefault();
        });
        $('#btn-login-light').on('click', function (e) {
            $('body').attr('class', 'login-layout light-login');
            $('#id-text2').attr('class', 'grey');
            $('#id-company-text').attr('class', 'blue');

            e.preventDefault();
        });
        $('#btn-login-blur').on('click', function (e) {
            $('body').attr('class', 'login-layout blur-login');
            $('#id-text2').attr('class', 'white');
            $('#id-company-text').attr('class', 'light-blue');

            e.preventDefault();
        });

    });

</script>
</body>
</html>

