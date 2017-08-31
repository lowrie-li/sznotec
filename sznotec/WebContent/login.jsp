<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html lang="cn">
    <head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <!-- Meta, title, CSS, favicons, etc. -->
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	    <title>深圳欣诺泰电子有限公司</title>
	
	    <!-- Bootstrap -->
	    <link href="css/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	    <!-- Font Awesome -->
	    <link href="css/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	
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
			            <form name="registerForm" class="form-horizontal form-label-left" action = "signup" method = "POST">
			                <h1> 注 册 账 号 </h1>
			                <div class="item form-group">
			                    <label for="uid" class="control-label col-md-3">用户名</label>
			                    <div class="col-md-8 col-sm-8 col-xs-12">
			                        <input id="uid" type="text" name="uid" data-validate-length="4,10" class="form-control col-md-7 col-xs-12" required="required">
			                    </div>
			                </div>
			                <div class="item form-group">
			                    <label for="upwd" class="control-label col-md-3">用户密码</label>
			                    <div class="col-md-8 col-sm-8 col-xs-12">
			                        <input id="upwd" type="password" name="upwd" data-validate-length="6,8" class="form-control col-md-7 col-xs-12" required="required">
			                    </div>
			                </div>
			                <div class="item form-group">
			                    <label for="upwd2" class="control-label col-md-3 col-sm-3 col-xs-12">确认密码</label>
			                    <div class="col-md-8 col-sm-8 col-xs-12">
			                        <input id="upwd2" type="password" name="upwd2" data-validate-linked="upwd" class="form-control col-md-7 col-xs-12" required="required">
			                    </div>
			                </div>
			                <div class="item form-group">
			                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="empSno">员工编号</label>
			                    <div class="col-md-8 col-sm-8 col-xs-12">
			                        <input type="text" id="empSno" name="empSno" placeholder="4位数字编号" required="required" data-validate-minmax="4,4" class="form-control col-md-7 col-xs-12">
			                    </div>
			                </div>
			                <div class="item form-group">
			                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">用户邮箱</label>
			                    <div class="col-md-8 col-sm-8 col-xs-12">
			                        <input type="email" id="email" name="email" required="required" class="form-control col-md-7 col-xs-12">
			                    </div>
			                </div>
			                <div class="item form-group">
			                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">确认邮箱</label>
			                    <div class="col-md-8 col-sm-8 col-xs-12">
			                        <input type="email" id="email2" name="confirm_email" data-validate-linked="email" required="required" class="form-control col-md-7 col-xs-12">
			                    </div>
			                </div>
			                <div class="item form-group">
				                <div class="col-md-12 col-sm-12 col-xs-12 col-md-offset-5"">
				                    <input type="submit" class="btn btn-default submit" value="提 交"/>
				                </div>
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

	<!-- JQuery -->  
	<script src="../vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<!-- validator -->
	<script src="../vendors/validator/validator.js"></script>
	
	<!-- Custom Theme Scripts -->
	<script src="../build/js/custom.min.js"></script>
</html>
