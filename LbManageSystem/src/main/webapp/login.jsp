<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  type="text/css"  href="init.css"/>
</head>
<body>
    <form action="loginServlet" method="post">
        <div class="box">
            <h2>图书管理系统</h2>
            <table align="center" border="0">
                <tr><td>用户名：</td><td><input type="text" name="uname"></td></tr>
                <tr><td>密码：</td><td><input type="password" name="password"></td></tr>
                <tr><td colspan="2">还没有账号？<a href="register.jsp">立即注册</a></td></tr>
                <tr><td colspan="2"><input type="submit" value="立即登录"></td></tr>
            </table>
        </div>
    </form>
</body>
</html>