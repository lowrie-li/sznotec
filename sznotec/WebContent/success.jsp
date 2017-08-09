<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*,java.io.*,java.util.*, com.sznotec.dao.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Success</title>

<style type="text/css">
table {
	border: 2px #CCCCCC solid;
	width: 360px;
}

td,th {
	height: 30px;
	border: #CCCCCC 1px solid;
}
</style>
</head>
<body>
	<%
		//驱动程序名 
		String sql_str = "select * from UserRole";
		DbConnection dbconn = new DbConnection();
		ResultSet rs = dbconn.RunQuery(sql_str);
	%>
	<br>
	<br>
	<table align="center">
		<tr>
			<th>
				<%
					out.print("用户名");
				%>
			</th>
			<th>
				<%
					out.print("密码");
				%>
			</th>
			<th>
				<%
					out.print("邮箱");
				%>
			</th>
			<th>
				<%
					out.print("员工编号");
				%>
			</th>
		</tr>

		<%
			while (rs.next()) {
		%>
		<tr>
			<td>
				<%
					out.print(rs.getString(1));
				%>
			</td>
			<td>
				<%
					out.print(rs.getString(2));
				%>
			</td>
			<td>
				<%
					out.print(rs.getString(3));
				%>
			</td>
			<td>
				<%
					out.print(rs.getInt(4));
				%>
			</td>
		</tr>
		<%
			}
		%>
	</table>
	<div align="center">
		<br> <br> <br>
		<%
			out.print("数据查询成功，恭喜你");
		%>
	</div>
	<%
		rs.close();
	%>
</body>
</html>