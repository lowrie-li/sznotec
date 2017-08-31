<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/vendors/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/vendors/font-awesome/css/font-awesome.min.css>
<!--bootstrap-tab样式-->
<link rel="stylesheet" href="css/bootstrap-tab.css">

<script src="css/vendors/jquery/dist/jquery.min.js"></script>
<script src="css/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="js/bootstrap-tab.js"></script>

<title>Insert title here</title>

<script type="text/javascript">
  $(function() {
    $("#tabContainer").tabs({
        data: [{
            id: 'home',
            text: '百度一下',
            url: "test.jsp",
            closeable: true
        }, {
            id: 'admineap',
            text: 'AdminEAP',
            url: "tab_second.html"
        }, {
            id: 'edit',
            text: '编辑人员',
            url: "tab_content.html",
            closeable: true
        }],
        showIndex: 1,
        loadAll: false
    });

    $("#tabContainer").data("tabs").addTab({id: 'test', text: 'addTab', closeable: true, url: 'customer.jsp'});
  });
</script>
</head>
<body>
   <div id="tabContainer"></div>
</body>

</html>