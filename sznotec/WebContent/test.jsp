<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> SZNOTEC 信息管理系统 ! </title>

    <!-- Bootstrap -->
    <link href="css/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="css/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="css/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="css/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    
    <!-- bootstrap-progressbar -->
    <link href="css/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="css/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="css/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="css/build/css/custom.min.css" rel="stylesheet">
    
        <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    
    <!-- Datatables -->
    <link href="css/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="css/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="css/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="css/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="css/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">

    <script src="css/vendors/jquery/dist/jquery.min.js"></script>
    
    <script type="text/javascript">
      $(document).ready(function() {
        $('#datatable-fixed-header').dataTable( {
            language: {
                "processing": "处理中...",
                "lengthMenu": "显示 _MENU_ 项结果",
                "zeroRecords": "没有匹配结果",
                "info": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "infoEmpty": "显示第 0 至 0 项结果，共 0 项",
                "infoFiltered": "(由 _MAX_ 项结果过滤)",
                "infoPostFix": "",
                "search": "搜索:",
                "url": "",
                "emptyTable": "表中数据为空",
                "loadingRecords": "载入中...",
                "infoThousands": ",",
                "paginate": {
                    "first": "首页",
                    "previous": "上页",
                    "next": "下页",
                    "last": "末页"
                },
                "aria": {
                    "sortAscending": ": 以升序排列此列",
                    "sortDescending": ": 以降序排列此列"
                }
            },
          /* language:{
              "decimal":        "",
              "emptyTable":     "表中数据为空",
              "info":           "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 记录",
              "infoEmpty":      "显示第 0 至 0 项结果，共 0 记录",
              "infoFiltered":   "(从 _MAX_ 项记录中过滤)",
              "infoPostFix":    "",
              "thousands":      ",",
              "lengthMenu":     "显示 _MENU_ 项记录",
              "loadingRecords": "数据加载中...",
              "processing":     "后台处理中...",
              "search":         "查找:",
              "zeroRecords":    "无匹配记录",
              "paginate": {
                  "first":      "首页",
                  "last":       "尾页",
                  "next":       "下一页",
                  "previous":   "上一页"
              },
              "aria": {
                  "sortAscending":  ": 以升序排列此列",
                  "sortDescending": ": 以降序排列此列"
              }
          }， */
          retrieve: "true",
          autoWidth:"true",
          ajax:{
            "url":"getJson",
/*          "dataSrc":"data", */
            "dataSrc": function(json) {
  /*             alert(JSON.stringify(json)); */
              return json.data;
            }
          },
          columns: [
            { "className":"column-title", "title":"序号", "data": "compSno"},
            { "title":"客户编码", "data": "shrtName"},
            { "title":"名称", "data": "compName"},
            { "title":"电话", "data": "compTel"},
            { "title":"地址", "data": "compAddr"},
            { "title":"联系人", "data": "cnntName"},
            { "title":"联系电话", "data": "cnntPhone"},
            { "title":"职位", "data": "position"},
            { "title":"客户专员", "data": "specialist"},
            { "title":"备注", "data": "cmt"},
            { "title":"操作","data": ""}
          ] ,
          columnDefs: [
            {"targets": [10], /*"render": function(data, type, full) {
                 return '<a href="#myModal" role="button" class="btn btn-default" data-toggle="modal"><i class="fa fa-pencil"></i>编辑</a>'; 
                return '<button type="button" id="editrow" class="btn btn-default" href="#"><i class="fa fa-pencil"></i>编辑</a>';
                return '<a href="#" class="btn btn-default" onclick="editCustomer(\'' + row.id + '\')"><i class="fa fa-pencil"></i>编辑</a>';
              }*/
              "defaultContent": '<button type="button" id="editB" class="btn btn-default" href="#"><i class="fa fa-pencil"></i>编辑</a>'
            }
          ]
        });
        
        $('#datatable-fixed-header tbody').on( 'click', 'button#editB', function () {
            var table = $('#datatable-fixed-header').DataTable();
            var data = table.row( $(this).parents('tr') ).data();
            alert("AAA");
            /* var fields = $("#add-form").serializeArray();
            jQuery.each( fields, function(i, field){
                //jquery根据name属性查找
                $(":input[name='"+field.name+"']").val(data[i]);
            });
            $(":input[name='mark']").val("edit");
            $("#modal-form").modal("show");//弹出框show */
            
        });
      });
      
      function editCustomer(name) {
          alert(name);
      }
      
      function del(id, name) {
          $.ajax({
              url: "deleteCustomer",
              //在后台接受id这个参数

              data: {
                  id: id
              },
              success: function(data) {
                  if (data.flag) {
                      //如果后台删除成功，则刷新表格，并提示用户删除成功

                      //保留分页信息

                      table.ajax.reload(null, false);
                      alert(name + data.msg);
                  }
              }
          })
      }
      
    </script>
  </head>
  
  <body class="nav-md">
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
                  <li><a><i class="fa fa-desktop"></i> 产品 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu" style="">
                      <li><a href="media_gallery.html">采购订单</a></li>
                      <li><a href="form_validation.html">采购审计</a></li>
                      <li><a href="general_elements.html">产品管理</a></li>
                      <li><a href="media_gallery.html">产品追踪</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-table"></i> 仓库 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu" style="">
                      <li><a href="tables.html">仓库概览</a></li>
                      <li><a href="tables.html">仓库管理</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-table"></i> 库存 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu" style="">
                      <li><a href="tables_dynamic.html">库存管理</a></li>
                      <li><a href="tables_dynamic.html">库存调拨</a></li>
                      <li><a href="tables_dynamic.html">库存损益</a></li>
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
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3> 客户资料 </h3>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_title">
                  <div class="title_right">
                    <div class="col-md-4 col-sm-4 col-xs-12 form-group pull-middle">
                      <div class="input-group col-md-4 col-sm-4 col-xs-4 pull-left">
                        <a href="#myModal" role="button" class="btn btn-default" data-toggle="modal"><i class="fa fa-plus"></i>新增客户</a>
                      </div>
                    </div>
                  </div>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
<!--                   <table id="datatable-fixed-header" class="table table-striped table-bordered table-responsive nowrap"></table> -->
                  <table id="datatable-fixed-header" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed"></table>
                </div>
                <div class="clearfix"></div>
              </div>
            </div>
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
  
  <!-- 模态框（Modal） -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    客户资料
                </h4>
            </div>
            <div class="modal-body">
              <form name="addForm" id="addForm" class="form-horizontal form-label-left" action="addCustomer" method="POST">
                <div class="item form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12" for="compName">客户名称 <span class="required">*</span></label>
                  <div class="col-md-6 col-sm-6 col-xs-12">
                    <input id="compName"  name="compName" type="text" class="form-control col-md-7 col-xs-12" required="required" data-validate-length-range="6" data-validate-words="2">
                  </div>
                </div>
                <div class="item form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12" for="shrtName">客户编码 <span class="required">*</span></label>
                  <div class="col-md-6 col-sm-6 col-xs-12">
                    <input id="shrtName" name="shrtName" type="text" class="form-control col-md-7 col-xs-12" required="required"  data-validate-length-range="6" data-validate-words="2">
                  </div>
                </div>
                <div class="item form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12" for="compTel">电话 <span class="required">*</span></label>
                  <div class="col-md-6 col-sm-6 col-xs-12">
                    <input type="tel" id="compTel" name="compTel" class="form-control col-md-7 col-xs-12" required="required" data-validate-length-range="8,20">
                  </div>
                 </div>
                 <div class="item form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12" for="compAddr">地址 <span class="required">*</span></label>
                   <div class="col-md-6 col-sm-6 col-xs-12">
                     <input type="text" id="compAddr" name="compAddr" class="form-control col-md-7 col-xs-12" required="required" data-validate-length-range="4,100">
                   </div>
                 </div>
                 <div class="item form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12" for="cnntName">联系人 <span class="required">*</span></label>
                   <div class="col-md-6 col-sm-6 col-xs-12">
                     <input type="text" id="cnntName" name="cnntName" class="form-control col-md-7 col-xs-12" required="required" data-validate-minmax="4,10">
                   </div>
                 </div>
                 <div class="item form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12" for="cnntPhone">联系电话 <span class="required">*</span></label>
                   <div class="col-md-6 col-sm-6 col-xs-12">
                     <input type="tel" id="cnntPhone" name="cnntPhone" class="form-control col-md-7 col-xs-12" required="required" data-validate-length-range="8,20">
                   </div>
                 </div>
                 <div class="item form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12" for="position">职位 <span class="required">*</span></label>
                   <div class="col-md-6 col-sm-6 col-xs-12">
                     <input id="position" type="text" name="position" class="form-control col-md-7 col-xs-12" required="required">
                   </div>
                 </div>
                 <div class="item form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12" for="specialist">客户专员 <span class="required">*</span></label>
                   <div class="col-md-6 col-sm-6 col-xs-12">
                     <input id="specialist" type="text" name="specialist" class="form-control col-md-7 col-xs-12" required="required" data-validate-length-range="4,20">
                   </div>
                 </div>
                 <div class="item form-group">
                 <label class="control-label col-md-3 col-sm-3 col-xs-12" for="cmt">备注</label>
                   <div class="col-md-6 col-sm-6 col-xs-12">
                     <textarea id="cmt" name="cmt" class="form-control col-md-7 col-xs-12"></textarea>
                   </div>
                 </div>
                 <div class="ln_solid"></div>
                 <div class="form-group">
                   <div class="col-md-12 col-md-offset-5">
                     <button id="submit" type="submit" class="btn btn-success">提交</button>
                     <button id="cancel" type="reset" class="btn btn-primary" data-dismiss="modal">取消</button>
                   </div>
                 </div>
              </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

  <!-- jQuery -->
  <script src="css/vendors/jquery/dist/jquery.min.js"></script>
  <!-- Bootstrap -->
  <script src="css/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
  <!-- FastClick -->
<!--   <script src="css/vendors/fastclick/lib/fastclick.js"></script> -->
  <!-- NProgress -->
<!--   <script src="css/vendors/nprogress/nprogress.js"></script> -->
  <!-- Chart.js -->
<!--   <script src="css/vendors/Chart.js/dist/Chart.min.js"></script> -->
  <!-- gauge.js -->
<!--   <script src="css/vendors/gauge.js/dist/gauge.min.js"></script> -->
  <!-- bootstrap-progressbar -->
  <script src="css/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
  <!-- iCheck -->
  <script src="css/vendors/iCheck/icheck.min.js"></script>
  <!-- Skycons -->
  <script src="css/vendors/skycons/skycons.js"></script>
  <!-- Flot -->
  <script src="css/vendors/Flot/jquery.flot.js"></script>
  <script src="css/vendors/Flot/jquery.flot.pie.js"></script>
  <script src="css/vendors/Flot/jquery.flot.time.js"></script>
  <script src="css/vendors/Flot/jquery.flot.stack.js"></script>
  <script src="css/vendors/Flot/jquery.flot.resize.js"></script>
  <!-- Flot plugins -->
  <script src="css/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
  <script src="css/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
  <script src="css/vendors/flot.curvedlines/curvedLines.js"></script>
  <!-- DateJS -->
  <script src="css/vendors/DateJS/build/date.js"></script>
  <!-- JQVMap -->
  <script src="css/vendors/jqvmap/dist/jquery.vmap.js"></script>
  <script src="css/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
  <script src="css/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
  <!-- bootstrap-daterangepicker -->
  <script src="css/vendors/moment/min/moment.min.js"></script>
  <script src="css/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
  <!-- iCheck -->
  <script src="css/vendors/iCheck/icheck.min.js"></script>
  <!-- Datatables -->
  <script src="css/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
  <script src="css/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
  <script src="css/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
  <script src="css/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
  <script src="css/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
  <script src="css/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
  <script src="css/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
  <script src="css/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
  <script src="css/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
  <script src="css/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
  <script src="css/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
  <script src="css/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
  <script src="css/vendors/jszip/dist/jszip.min.js"></script>
  <script src="css/vendors/pdfmake/build/pdfmake.min.js"></script>
  <script src="css/vendors/pdfmake/build/vfs_fonts.js"></script>
  
  <!-- Custom Theme Scripts -->
  <script src="css/build/js/custom.min.js"></script>
  </body>
</html>
