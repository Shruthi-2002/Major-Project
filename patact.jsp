
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    
    try{
       
    Connection co = null;
    co = databasecon.getconnection();
    Statement st = co.createStatement();
    ResultSet rs = st.executeQuery("select * from patient where email= '"+email+"' and password='"+password+"'");
    
    if(rs.next())
    {
         String uemail = rs.getString("email");
         session.setAttribute("email",uemail);
         
         String user = rs.getString("username");
         session.setAttribute("user",user);

    response.sendRedirect("phome.jsp?m1=Login_Successfull");
    }
    else 
    {
    response.sendRedirect("patient.jsp?m2=Login_Faild");
    }
    }
    catch(Exception e)
    {
    System.out.println("Error in userl ogact"+e.getMessage());
    }
%>
