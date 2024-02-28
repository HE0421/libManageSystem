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
	height: 400px;
}
</style>
</head>
<body>
    <form action="registerServlet" method="post">
        <div class="box">
            <h2>用户注册</h2>
            <table align="center">
                <tr><td><i>*</i> 用户名：</td><td><input type="text" name="rname"></td></tr>
                <tr><td><i>*</i> 密码：</td><td><input type="password" name="rpwd"></td></tr>
                <tr><td><i>*</i> 性别：</td><td>
                <input type="radio" name="sex" id="nan" value="男"> <label for="nan">男</label>
                <input type="radio" name="sex" id="nv" value="女" checked="checked"> <label for="nv">女</label>
                </td></tr>
                <tr><td><i>*</i> 电话号码：</td><td><input type="text" name="tel"></td></tr>
                <tr><td><i>*</i> 邮箱：</td><td><input type="text" name="email"></td></tr>
                <tr><td colspan="2"><input type="submit" value="立即注册"></td></tr>
            </table>
        </div>
    </form>
</body>
</html>