<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<jsp:useBean id = "connDbBean" scope = "page" class = "order.OrderConn"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 align="center">Manager Site</h1>
<h3 align="center">Return <a href="index.jsp">HomePage</a></h3>
<br><br><br>
<%
ResultSet tmprs = connDbBean.executeQuery("Select order_no,title,spec,po_unit,u_req from planner");
int ref = 0;
while (tmprs.next())
{
	ref = tmprs.getInt("order_no");
	out.print(ref+" : "+tmprs.getString("title")+"  (in the spec of "+tmprs.getInt("spec")+tmprs.getString("po_unit")+"/d)  *  "+tmprs.getInt("u_req")+"ml ");
	out.print(" <a href=\'delorder.jsp? id="+ref+"\'>Finished</a><br><br>");
}
tmprs.close();
%>
</body>
</html>