<%@page import="Efficient.BlockchainDemo"%>
<%@page import="java.util.Random"%>

<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>

<html>
<body>
<%
   Connection co = null;
          
            String username=request.getParameter("username");
          String email=request.getParameter("email");
            
         
		try
		{
         co = databasecon.getconnection();
                    
        PreparedStatement pst2=co.prepareStatement("update ms set status='activated' where email='"+email+"' and username='"+username+"' ");
       
        
	int i= pst2.executeUpdate();
      
      if(i>0){
       response.sendRedirect("vms.jsp?m1=registration_success"); 
      }
      else{
          response.sendRedirect("vms.jsp?m2=registration_failed"); 
      }
       }
	  
	catch(SQLException e)
        {
		out.print(e.getMessage());
	    }  
           %>
</body>
</html>

