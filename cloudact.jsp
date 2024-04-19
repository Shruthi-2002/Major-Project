   
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
    <%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try{

    	
    	
    Connection co = null;
    co = databasecon.getconnection();
    String query1="select * from cloud where username='"+username+"' and password='"+password+"'"; 
    Statement st1=co.createStatement();
    ResultSet rs=st1.executeQuery(query1);

    if(rs.next())
    {

    response.sendRedirect("chome.jsp?msg=success");
    }
    else 
    {
    response.sendRedirect("cloud.jsp?msg1=Login_Failed");
    %>

    <%
    }
    } catch (Exception e) {
    e.printStackTrace();
    }

    %>