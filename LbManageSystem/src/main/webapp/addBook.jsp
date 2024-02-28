<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  type="text/css"  href="init.css"/>
<style>
.box {
	width:25%;
	height:340px;
}
</style>
</head>
<body>
	<form action="/LbManageSystem/libManage?type=add" method="post">
	<div class="box">
	<a href="/LbManageSystem/libManage?type=return">＜返回</a>
	<h2>请输入添加的信息：</h2>
		<table align="center">
			<tr><th>名称</th><td><input type="text" name="upname"></td></tr>
			<tr><th>作者</th><td><input type="text" name="upauthor"></td></tr>
			<tr><th>价格</th><td><input type="text" name="upprice"></td></tr>
			<tr><th>出版社</th><td><input type="text" name="uppublishHouse"></td></tr>
		</table>
		<input type="submit" value="确认添加" >
	</div>
	</form>
</body>
</html>