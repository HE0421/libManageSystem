<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="hjs.ConnDB,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  type="text/css"  href="index.css"/>
</head>
<body>
	<div class="box">
	<a href="/LbManageSystem/libManage?type=self" id="self">个人中心</a><h2>图书管理系统</h2>
	<a href="/LbManageSystem/libManage?type=exit" id="self">退出登录</a>
	<form action="index.jsp" id="search" method="post"><input type="submit" id="all" value="显示全部">
	<input type="text" name="search" id="intxt"><input type="submit" value="搜索" id="btn"></form>
	<%
	request.setCharacterEncoding("UTF-8");
	int pageno = 1;
	int pagesize = 3;
	int pagecount = 0;
	int i;
	int rowcount = 0;
	String strpage;
	String search="";
	strpage = request.getParameter("topage");
	if (strpage == null) {
		pageno = 1;
	} else {
		pageno = Integer.parseInt(strpage);
		if (pageno < 1) {
			pageno = 1;
		}
	}
	ConnDB connDB = new ConnDB();
	if (request.getParameter("search") != null) {
		search = request.getParameter("search");
	}else{
		search = "";
	}
	String sql = "select * from book where name like '%" + search + "%'";
	ResultSet rs = connDB.doQuery(sql);
	rs.last();
	rowcount = rs.getRow();
	pagecount = ((rowcount % pagesize) == 0 ? (rowcount / pagesize) : (rowcount / pagesize) + 1);
	%>
	<br>
	<table align="center" border=1 class="list" cellspacing="0">
		<tr><th width="15%">名称</th><th width="16%">名称</th><th width="16%">作者</th><th width="16%">价格</th>
		<th width="16%">出版社</th><th colspan="2" width="16%">功能</th></tr>
	<%
	if (pageno > pagecount) {
		pageno = pagecount;
	}
	if (pagecount > 0) {
		rs.absolute((pageno - 1) * pagesize + 1);
		i = 0;
		while (i < pagesize && !rs.isAfterLast()) {
	%>
	<tr><td><%=rs.getString("id")%></td><td><%=rs.getString("name")%></td>
		<td><%=rs.getString("author")%></td><td><%=rs.getString("price")%></td>
		<td><%=rs.getString("publishHouse")%></td>

		<td><input type="button" value="修改" onclick='location.href=("/LbManageSystem/libManage?type=toupdate&id=<%=rs.getString("id") %>")'></td>
		<td><input type="button" value="删除" onclick='confirmDel(<%=rs.getString("id") %>)'></td>
	</tr>
	<%
		rs.next();
		i++;
		}
	}
	%>
	</table><br><hr>
	<table align="center"><tr>
	<td width="20%"><h4>当前页在第<%=pageno%>页，共<%=pagecount%>页</h4></td>
	<%
	if (pageno>1) {
	%>
		<td width="20%"><a href=index.jsp?topage=<%=pageno-1 %>>＜＜上一页</a></td>
	<% 
	}
	if (pageno<pagecount) {
	%>
		<td width="20%"><a href=index.jsp?topage=<%=pageno+1 %>>下一页＞＞</a></td>
	<%
	}
	if (pageno!=pagecount) {
	%>
		<td width="20%"><a href=index.jsp?topage=<%=pagecount %>>最后一页</a></td>
	<%} 
	if (pageno==pagecount){
	%>
		<td width="20%"><a href=index.jsp?topage=<%=1 %>>第一页</a></td>
	<%} %>
	<td width="20%">
	<form action="index.jsp" method="post">
	跳转到：<input type="text" name="topage" id="topage" style="height:20px;width:50px" value=<%=pageno %>>页
	</form>
	</td><td width="20%"><input type="button" value="添加图书" onclick='location.href=("/LbManageSystem/libManage?type=toadd")'></td></tr>
	</table>
	</div>
	<script type="text/javascript">
    function confirmDel(id)
    {
      if(window.confirm("确定删除?")){
    	  document.location="/LbManageSystem/libManage?type=del&id="+id;
      }
    }
  </script>
</body>
</html>