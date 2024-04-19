<%@page import="Efficient.BlockchainDemo"%>
<%@page import="java.util.Random"%>

<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>

<html>
<body>
<%
   Connection co = null;
          
            String email=request.getParameter("email");
          String eheartbeat=request.getParameter("eheartbeat");
            
            BlockchainDemo bdemo = new BlockchainDemo();
        int bk = bdemo.blockchainkey(email);
        System.out.println("ddddddddddddddddddddddddddddddddddd" + bk);
          String bk1 = Integer.toString(bk);
		try
		{
         co = databasecon.getconnection();
                    
        PreparedStatement pst2=co.prepareStatement("update upload set bckey='uploaded' where email='"+email+"' ");
       
        
	int i= pst2.executeUpdate();
      
      if(i>0){
       response.sendRedirect("fvf.jsp?m1=registration_success"); 
      }
      else{
          response.sendRedirect("fvf.jsp?m2=registration_failed"); 
      }
       }
	  
	catch(SQLException e)
        {
		out.print(e.getMessage());
	    }  
           %>
</body>
</html>

