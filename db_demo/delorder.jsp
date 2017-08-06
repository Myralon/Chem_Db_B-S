<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="order.OrderConn"/>

<%
	String d_id = request.getParameter(" id");
	connDbBean.executeUpdate("Update planner Set u_req = 0 where order_no = " + d_id);
%>
<jsp:forward page="index.jsp"/>
