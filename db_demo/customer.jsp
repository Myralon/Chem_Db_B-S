<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.*"%> 
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript" type="text/javascript" src="dynamic_select.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="Infor" align="center" >
	<h1>Please Submit your order information</h1>
	<h2>Input and press 'submit'</h2>
</div>
<div class="cust_order" align="center">
	 <form action="OrderAdd.jsp" method="POST" name="cust_form" >
	 实验室：<input type="text" name="lab"><br><br>
	 名称：<select name="title" onChange="title_change()">
	 <% 
try 
   {  
	String sitePath = request.getRealPath("/"); 
	String dbPath = sitePath+"che_db.mdb"; 
	String strurl="jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ="+dbPath;  
       
       Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
       Connection conn = DriverManager.getConnection(strurl); 
       Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);      
       String sql = "SELECT distinct title FROM user";       
       ResultSet rs = stmt.executeQuery(sql); 
       int i=0;
       while (rs.next()) 
          {
             out.print("<option value='" + rs.getString("title") + "'>" + rs.getString("title") + "</option>");
          }  
        rs.close();  
        stmt.close(); 
        conn.close(); 
     } 
 catch (Exception e)
    {  
       out.print("Error as follow:<br>"); 
       out.print(e.getMessage()); 
    } 
%>
	 </select>
	 包装规格：<select name="spec_po_unit">
	 <option value=500>500ml(bottle)</option>
	 <option value=5000>5000ml(bucket)</option>
	 </select>
	 数量：<input type="text" name="quan"><br><br>
	 联系人：<input type="text" name="contact"><br><br>
    <input type="submit">&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="reset">
    </form>
</div>	
</body>
</html>