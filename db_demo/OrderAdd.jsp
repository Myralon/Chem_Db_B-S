<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="UTF-8"%>
   <%@ page import="java.sql.*" %>
   <jsp:useBean id="connDbBean" scope="page" class="order.OrderConn"/>
   
  <%
   String la = request.getParameter("lab");
  String tit = request.getParameter("title");
   String single = request.getParameter("spec_po_unit");
   String quan = request.getParameter("quan");
   String conta = request.getParameter("contact");
   out.print(quan);
   String fin = Integer.toString(Integer.parseInt(quan)*Integer.parseInt(single));
   if (tit != null && tit != "select one" && tit != "")
   {
	   String sql = "Update planner Set u_req = u_req + "+ fin + " where title = '"+tit +"' and spec = " + single + " ;";
	   connDbBean.executeUpdate(sql);
	   String sql2 = "Insert into user (Lab,Title,Spec,Quan,Contact) values ('"+la+"','"+tit+"',"+single+","+quan+",'"+conta+"');";
	   connDbBean.executeUpdate(sql2);
   }
   %>
    
   <jsp:forward page="index.jsp"/>