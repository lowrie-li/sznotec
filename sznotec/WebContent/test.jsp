<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta charset="utf-8">
	<link href="resource/Bootstrap-3.3.6/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="resource/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
	
	<script type="text/javascript" src="resource/jquery/dist/jquery.min.js" charset="UTF-8"></script>
	<script type="text/javascript" src="resource/Bootstrap-3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resource/datetimepicker/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="resource/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	<script type="text/javascript">
	$(function(){
	
	    $('#input-date').datetimepicker({
 	        language:  'en',
	        weekStart: 1,
	        todayBtn:  1,
	        autoclose: 1,
	        todayHighlight: 1,
	        startView: 2,
	        minView: 2,
	        forceParse: 0
	    });
	    
	    $('.query').click(function(){  
            //取出时间戳  
            var datetime1 =$('#input-date').data().date;  
            var datetimestamp = Date.parse(datetime1).toString();  
            var dts = datetimestamp.substr(0,datetimestamp.length-3);  

            alert(datetime1);  
        });
	
	});
</script>


</head>

<body>
<div class="container">
            <div class="form-group">
                <label class="col-md-3 col-sm-3 col-xs-12 control-label">Date Picking</label>
                <div id="input-date" class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy MM dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input class="form-control" size="16" type="text" value="">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
            </div>
            
            <input type="button" class="query"  value="点击">
</div>

</body>
</html>
