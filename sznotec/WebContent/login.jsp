<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html lang="cn">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
<!--     <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>深圳欣诺泰电子有限公司</title>

    <!-- Bootstrap -->
    <link href="css/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="css/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="css/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="css/vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="css/build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form name="loginForm" action="signin" method="POST">
              <h1>用 户 登 录</h1>
              <div>
                <input id="id" name="id" type="text" class="form-control" placeholder="账 号" required oninvalid="setCustomValidity('请输入您的账号');" oninput="setCustomValidity('');"/>
              </div>
              <div>
                <input id="pwd" name="pwd" type="password" class="form-control" placeholder="密 码" required oninvalid="setCustomValidity('请输入您的密码');" oninput="setCustomValidity('');"/>
              </div>
              <div>
                <input type="submit" class="btn btn-default submit" value="登 录"/>
                <a class="reset_pass" href="#">忘记密码?</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">新用户?
                  <a href="#signup" class="to_register"> 创建账号 </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i> SZNOTEC </h1>
                  <p>©深圳欣诺泰电子有限公司</p>
                </div>
              </div>
            </form>
          </section>
        </div>

        <div id="register" class="animate form registration_form">
          <section class="login_content">
            <form name="registerForm" action = "signup" method = "POST">
              <h1> 注 册 账 号 </h1>
              <div>
                <input name="uid" type="text" class="form-control" placeholder="用户名" required="required" />
              </div>
              <div>
                <input name="upwd" type="password" class="form-control" placeholder="密 码" required="required" />
              </div>
              <div>
                <input name="empSno" type="text" class="form-control" placeholder="员工编号" required="required" />
              </div>
              <div>
                <input name="email" type="email" class="form-control" placeholder="邮 箱" required="required" />
              </div>
              <div>
                <input type="submit" class="btn btn-default submit" value="提 交"/>
<!--                 <a class="btn btn-default submit" href="index.html">注 册</a> -->
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link"> 已注册账户 ?
                  <a href="#signin" class="to_register"> 登 录 </a>
                </p>

                <div class="clearfix"></div>
                <br/>

                <div>
                  <h1><i class="fa fa-paw"></i> SZNOTEC </h1>
                  <p>©深圳欣诺泰电子有限公司</p>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
  </body>
</html>
