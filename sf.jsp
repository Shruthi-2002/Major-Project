<%@page import="java.util.Random"%>

<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>

<html>
<body>
<%
   Connection co = null;
            String email=request.getParameter("email");
            String edisease=request.getParameter("edisease");
            String eox=request.getParameter("eox");
         
          
		try
		{
         co = databasecon.getconnection();
                    
        PreparedStatement pst2=co.prepareStatement("update upload set status='senttofog' where email='"+email+"' and edisease='"+edisease+"'");
        
        
	int i= pst2.executeUpdate();
      
      if(i>0){
       response.sendRedirect("vcd.jsp?m1=Send_success"); 
      }
      else{
          response.sendRedirect("vcd.jsp?m2=Send_Failed"); 
      }
       }
	  
	catch(SQLException e)
        {
		out.print(e.getMessage());
	    }  
           %>
</body>
</html>
