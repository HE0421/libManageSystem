<%@page import="hjs.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	background-color: skyblue;
}
.box {
	width:60%;
	margin: 100px auto;
	background-color: rgba(144, 133, 133, 0.2);
}
h2 {
	text-align: center;
}

table {
	height: 300px;
	font-size: 20px;
}

table th {
	width: 40%
}
</style>
</head>
<body>
	<div class="box">
		<h2>个人信息</h2>
		<a href="/LbManageSystem/libManage?type=return">＜返回首页</a>
		<table align="center">
			<tr>
				<th>姓名：</th>
				<td><%=session.getAttribute("name")%></td>
			</tr>
			<tr>
				<th>密码：</th>
				<td><%=session.getAttribute("pwd")%></td>
			</tr>
			<tr>
				<th>性别：</th>
				<td><%=session.getAttribute("sex")%></td>
			</tr>
			<tr>
				<th>电话：</th>
				<td><%=session.getAttribute("tel")%></td>
			</tr>
			<tr>
				<th>邮箱：</th>
				<td><%=session.getAttribute("email")%></td>
			</tr>
		</table>
	</div>

</body>
</html>