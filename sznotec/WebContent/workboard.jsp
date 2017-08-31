<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> SZNOTEC 信息管理系统 ! </title>

    <!-- Bootstrap -->
    <link href="css/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="css/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    
    <!-- Custom Theme Style -->
    <link href="css/build/css/custom.min.css" rel="stylesheet">

  </head>
  
  <body class="nav-md">
    <div id="XXX"></div>
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col menu_fixed">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span> SZNOTEC !</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="images/logo.jpg" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>欢迎登录,</span>
                <h2>XXX</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br>

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>概览</h3>
                <ul class="nav side-menu">
                  <li class=""><a><i class="fa fa-user"></i> 个人 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu" style="display: none;">
                      <li><a href="notifications.jsp">通知公告</a></li>
                      <li><a href="myinfo.html">通讯录</a></li>
                      <li><a href="myinfo.html">个人信息</a></li>
                    </ul>
                  </li>
                  <li class=""><a><i class="fa fa-edit"></i> 销售 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu" style="display: none;">
<!--                  <li><a href="customer.jsp">客户管理</a></li> -->
                      <li><a href="customers.jsp">客户管理</a></li>
                      <li><a href="form_advanced.html">销售订单</a></li>
                      <li><a href="form_validation.html">销售报表</a></li>
                      <li><a href="form_validation.html">销售审计</a></li>
                      <li><a href="form_wizards.html">业绩总汇</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-desktop"></i> 采购 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu" style="">
                      <li><a href="media_gallery.html">采购订单</a></li>
                      <li><a href="form_validation.html">采购审计</a></li>
                      <li><a href="general_elements.html">产品管理</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-table"></i> 仓储 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu" style="">
                      <li><a href="tables.html">仓库管理</a></li>
                      <li><a href="tables_dynamic.html">库存管理</a></li>
                      <li><a href="tables_dynamic.html">库存调拨</a></li>
                      <li><a href="tables_dynamic.html">库存损益</a></li>
                      <li><a href="media_gallery.html">产品追踪</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bar-chart-o"></i> 财务 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu" style="">
                      <li><a href="chartjs.html">概览</a></li>
                      <li><a href="chartjs.html">费用填报</a></li>
                      <li><a href="chartjs2.html">费用审计</a></li>
                      <li><a href="chartjs.html">流水管理</a></li>
                      <li><a href="chartjs.html">账户管理</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-share-alt"></i> 共享 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu" style="">
                      <li><a href="fixed_sidebar.html">概览</a></li>
                      <li><a href="fixed_sidebar.html">查找</a></li>
                      <li><a href="fixed_footer.html">上传</a></li>
                    </ul>
                  </li>
                </ul>
              </div>
            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="" data-original-title="设置">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="" data-original-title="全屏">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="" data-original-title="锁定">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="" href="login2.jsp" data-original-title="退出">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="images/logo.jpg" alt="">John Doe
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="javascript:myinfo.jsp;"> 个人信息 </a></li>
                    <li>
                      <a href="javascript:;">
                        <span class="badge bg-red pull-right">50%</span>
                        <span> 设置 </span>
                      </a>
                    </li>
                    <li><a href="javascript:;"> 帮助 </a></li>
                    <li><a href="login2.jsp"><i class="fa fa-sign-out pull-right"></i> 退出 </a></li>
                  </ul>
                </li>

                <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green">6</span>
                  </a>
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                    <li>
                      <a>
                        <span class="image"><img src="images/logo.jpg" alt="Profile Image"></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="images/logo.jpg" alt="Profile Image"></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="images/logo.jpg" alt="Profile Image"></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="images/logo.jpg" alt="Profile Image"></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <div class="text-center">
                        <a>
                          <strong> 查看所有通告 </strong>
                          <i class="fa fa-angle-right"></i>
                        </a>
                      </div>
                    </li>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main" style="min-height: 712px;">
            <div id="mainPanle" region="center" style="overflow: scroll">
		    </div>
        </div>
    
    <!-- /page content -->

    <!-- footer content -->
    <footer>
      <div class="pull-right">
        SZNOTEC管理系统 供应商：<a href="https://www.sznotec.com">深圳欣诺泰电子有限公司</a>
      </div>
      <div class="clearfix"></div>
    </footer>
    <!-- /footer content -->
    </div>
  </div>
  
<!-- jQuery -->
<script src="css/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="css/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- NProgress -->
<script src="css/vendors/nprogress/nprogress.js"></script>

<!-- Custom Theme Scripts -->
<script src="css/build/js/custom.min.js"></script>
</body>
</html>
