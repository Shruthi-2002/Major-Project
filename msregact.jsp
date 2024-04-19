<%@page import="java.util.Random"%>

<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>

<html>
<body>
<%
   Connection co = null;
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            String email=request.getParameter("email");
            session.setAttribute("email", email);
            session.setAttribute("user", username);
         //   String type=request.getParameter("type");
            String mobile=request.getParameter("mobile");
             String role=request.getParameter("role");
          //  String address=request.getParameter("address");
          
		try
		{
         co = databasecon.getconnection();
                    
        PreparedStatement pst2=co.prepareStatement("insert into ms(username,password,email,mobile,role,status) values(?,?,?,?,?,?)");
        pst2.setString(1,username);
	pst2.setString(2,password);
        pst2.setString(3,email); 
        pst2.setString(4,mobile); 
         pst2.setString(5,role); 
         pst2.setString(6,"pending"); 
       
       ;
      
        
	int i= pst2.executeUpdate();
      
      if(i>0){
       response.sendRedirect("ms.jsp?m1=registration_success"); 
      }
      else{
          response.sendRedirect("msreg.jsp?m2=registration_success"); 
      }
       }
	  
	catch(SQLException e)
        {
		out.print(e.getMessage());
	    }  
           %>
</body>
</html>
