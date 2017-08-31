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
    
    <!-- Datatables -->
    <link href="css/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="css/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="css/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="css/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="css/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
    
    <link href="resource/Bootstrap-3.3.6/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="resource/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    
    <script type="text/javascript" src="resource/jquery/dist/jquery.min.js" charset="UTF-8"></script>

    <script type="text/javascript">
        var empTable = null;
        var url = null;
        
        $(function() {
            $("#onboardDate").Datetimepicker({
                language:  'en',
                weekStart: 1,
                todayBtn:  1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                minView: 2,
                forceParse: 0
            });
            
            var empTable = initializeTable();

            $('#employeeTable').on( 'dblclick', 'tr', function () {
                var id = empTable.row(this).data();
                alert( '被点击行的id是 '+ id.empAddr );
            });
            
            $(document).on('click', 'button#addBtn', function() {
                url = "addEmployee";
                $("#addForm")[0].reset();
                $("input[name*=empName]").attr("disabled",false);
                $("input[name*=shrtName]").attr("disabled",false);
                
                $("#onboardDate").datetimepicker({
                    language:  'en', 
                    weekStart: 1,
                    todayBtn:  1,
                    autoclose: 1,
                    todayHighlight: 1,
                    startView: 2,
                    minView: 2,
                    forceParse: 0
                });
                
                $("#myModal").modal("show");//弹出框show
            });
            
            $('#employeeTable tbody').on( 'click', 'button#editBtn', function () {
                url = "updateEmployee";
                
                var data = empTable.row($(this)).data();

                $("input[name=empSno]").val(data.empSno);
                $("input[name=empName]").val(data.empName).attr("disabled",true);
                $("input[name=empAddr]").val(data.empAddr);
                $("input[name=empTel]").val(data.empTel);
                $("input[name=cnntName]").val(data.cnntName);
                $("input[name=cnntPhone]").val(data.cnntPhone);
                $("input[name=position]").val(data.position);
                $("input[name=specialist]").val(data.specialist);
                $("textarea[name=cmt]").val(data.cmt);
                
                $("#myModal").modal("show");//弹出框show
                /* initializeTable(); */
            });
        });
        
         $(document).on('click', 'button#submit', function() {
            alert(url);
            $.ajax({
                "url": url,
                "data": {
                    compSno: $("input[name=compSno]").val(),
                    compName: $("input[name=compName]").val(),
                    shrtName: $("input[name=shrtName]").val(),
                    compAddr: $("input[name=compAddr]").val(),
                    compTel: $("input[name=compTel]").val(),
                    cnntName: $("input[name=cnntName]").val(),
                    cnntPhone: $("input[name=cnntPhone]").val(),
                    position: $("input[name=position]").val(),
                    specialist: $("input[name=specialist]").val(),
                    cmt: $("textarea[name=cmt]").val(),
                },
                complete: function(json) {
                    if (json.isSuccess="true") {
                        //如果后台删除成功，则刷新表格，并提示用户删除成功

                        //保留分页信息
                        alert(json.msg);
                        $("#message").text(json.msg);
                        $("#msgModal").modal("show");//弹出框show
                        setTimeout(function(){$("#msgModal").modal("hide");},1000);
                        cusTable.ajax.reload();
                    } else {
                        alert(json.msg);
                        $("#message").text(json.msg);
                        $("#msgModal").modal("show");//弹出框show
                        setTimeout(function(){$("#msgModal").modal("hide");},1000);
                    }
                }/* ,
                error: function(json,status,errorMsg) {
                    alert("Status: " + status + " Msg: " + errorMsg);
                } */
            });
            url = null;
        });
        
        function initializeTable() {
            var table = $('#customersTable').DataTable({
                retrieve: "true",
                 scroll:"no",
                autoWidth:"false",
                ajax:{
                    "url":"getJson",
                     "dataSrc": function(json) {
/*                          alert(JSON.stringify(json.data)); */
                         return json.data;
                    }/* , 
                    "success": function(json) {
                        alert(JSON.stringify(json.data));
                    } */
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
                ],
                columnDefs: [
                    {"targets": [10], /*"render": function(data, type, full) {
                     return '<a href="#myModal" role="button" class="btn btn-default" data-toggle="modal"><i class="fa fa-pencil"></i>编辑</a>'; 
                     return '<button type="button" id="editrow" class="btn btn-default" href="#"><i class="fa fa-pencil"></i>编辑</a>';
                     return '<a href="#" class="btn btn-default" onclick="editCustomer(\'' + row.id + '\')"><i class="fa fa-pencil"></i>编辑</a>';
                     }*/
                    "defaultContent": '<button type="button" id="editB" class="btn btn-default" href="#"><i class="fa fa-pencil"></i>编辑</a>'
                    }
                ],
                language:{
                    "emptyTable":     "表中数据为空",
                    "info":           "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 记录",
                    "infoEmpty":      "显示第 0 至 0 项结果，共 0 记录",
                    "infoFiltered":   "(从 _MAX_ 项记录中过滤)",
                    "infoPostFix":    "",
                    "infoThousands":      ",",
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
                }
            });
            return table;
        }

    </script>
</head>
  
<body>
    <div>
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
                                        <button id="addBtn" class="btn btn-default"><i class="fa fa-plus"></i>新增客户</a>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>

                        <div>
                            <div scroll="no">
                                <table id="customersTable" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed" style="width:100%"></table>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /page content -->
        
        <div class="item form-group">
                    <label class="ontrol-label col-md-3 col-sm-3 col-xs-12">入职日期 <span class="required">*</label>
                    <div id="onboardDate" class="input-group date form_date col-md-6 col-sm-6 col-xs-12" data-date="" data-date-format="yyyy MM dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                        <input class="form-control" size="8" type="text" value="">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                    </div>
                    <input type="hidden" id="dtp_input2" value="" /><br/>
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
                员工资料
            </h4>
        </div>
        <div class="modal-body">
            <form name="addForm" id="addForm" class="form-horizontal form-label-left">
                <div class="item form-group" style="display:none">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="empSno"> 序号 </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input id="empSno"  name="empSno" type="text" class="form-control col-md-7 col-xs-12">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="empName"> 姓名 <span class="required">*</span></label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input id="empName"  name="empName" type="text" class="form-control col-md-7 col-xs-12" required="required" data-validate-length-range="6" data-validate-words="2">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12"> 性别 </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div id="gender" class="btn-group" data-toggle="buttons">
                            <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                <input type="radio" name="gender" value="male" data-parsley-multiple="gender"> &nbsp; 男 &nbsp;
                            </label>
                            <label class="btn btn-primary" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                              <input type="radio" name="gender" value="female" data-parsley-multiple="gender"> 女
                            </label>
                        </div>
                    </div>
                </div>
                <div class="item form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="idNum"> 身份证号 <span class="required">*</span></label>
                    <div class="col-md-9 col-sm-9 col-xs-12">
                        <input type="text" id="idNum" name="idNum" class="form-control col-md-7 col-xs-12" required="required" data-validate-length-range="18">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="phone"> 电话 <span class="required">*</span></label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="tel" id="phone" name="phone" class="form-control col-md-7 col-xs-12" required="required" data-validate-length-range="11,12">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email"> 邮箱 <span class="required">*</span></label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="email" id="email" class="form-control" name="email" data-parsley-trigger="change" required="">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="empAddr"> 地址 <span class="required">*</span></label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="empAddr" name="empAddr" class="form-control col-md-7 col-xs-12" required="required" data-validate-length-range="4,100">
                    </div>
                </div>
                <div class="form-group">
				    <label class="control-label col-md-3 col-sm-3 col-xs-12"> 部&nbsp&nbsp门 <span class="required">*</label>
				        <div class="col-md-6 col-sm-6 col-xs-12">
				        <select class="form-control">
				            <option>请选择</option>
				            <option>总经理办公室</option>
				            <option>行政部</option>
				            <option>财务部</option>
				            <option>市场部</option>
				            <option>采购部</option>
				            <option>技术部</option>
				        </select>
				    </div>
				</div>
                <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12"> 职&nbsp&nbsp务 <span class="required">*</label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <select class="form-control">
                            <option>请选择</option>
                            <option>总监</option>
                            <option>助理</option>
                            <option>专员</option>
                        </select>
                    </div>
                </div>
                <div class="item form-group">
	                <label class="ontrol-label col-md-3 col-sm-3 col-xs-12">入职日期 <span class="required">*</label>
	                <div id="onboardDate" class="input-group date form_date col-md-6 col-sm-6 col-xs-12" data-date="" data-date-format="yyyy MM dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
	                    <input class="form-control" size="8" type="text" value="">
	                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	                </div>
	                <input type="hidden" id="dtp_input2" value="" /><br/>
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
                       <button id="submit" class="btn btn-success" onclick="submit()">提交</button>
                       <button id="cancel" type="reset" class="btn btn-primary" data-dismiss="modal">取消</button>
                   </div>
               </div>
           </form>
       </div>
    </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="msgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <p id="message"></p>
        </div>
    </div>
</div>

<!-- jQuery -->
<script src="css/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="css/vendors/bootstrap/dist/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="resource/Bootstrap-3.3.6/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="resource/datetimepicker/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="resource/datetimepicker/js/locales/bootstrap-datetimepicker.zh-TW.js" charset="UTF-8"></script>


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

</body>
</html>
