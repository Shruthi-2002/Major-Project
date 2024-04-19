<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Efficient.encryption"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="javax.crypto.KeyGenerator"%>
<%@page import="java.util.Random"%>

<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>


<html>
<body>
<%
   Connection co = null;
   String user = session.getAttribute("email").toString();
            String owner=request.getParameter("email");
            String eheartbeat=request.getParameter("eheartbeat");
            String etemprature=request.getParameter("etemprature");
            String eox=request.getParameter("eox");
            String edisease=request.getParameter("edisease");
             String eimage=request.getParameter("eimage");
              String role=request.getParameter("role");
              String timet1=request.getParameter("t1");
          //  String address=request.getParameter("address");
            

    

       LocalTime currentTime = LocalTime.now();

        // Define the format for displaying the time (HH:mm:ss for 24-hour format)
        DateTimeFormatter timeFormat = DateTimeFormatter.ofPattern("HH:mm:ss");

        // Format the current time
        String formattedTime = currentTime.format(timeFormat);
            
          
		try
		{
         co = databasecon.getconnection();
                    
        PreparedStatement pst2=co.prepareStatement("insert into cloudrequest(user,owner,eheartbeat,etemprature,eox,edisease,t1,t2,finalt,status,status1,eimage,role,timet1) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        pst2.setString(1,user);
	pst2.setString(2,owner);
        pst2.setString(3,eheartbeat); 
        pst2.setString(4,etemprature);  
        pst2.setString(5,eox);
        pst2.setString(6,edisease);
	pst2.setString(7,formattedTime);
        pst2.setString(8,""); 
        pst2.setString(9,"");  
        pst2.setString(10,"");
        pst2.setString(11,"pending");
         pst2.setString(12,eimage);
         pst2.setString(13,role);
          pst2.setString(14,timet1);
	int i= pst2.executeUpdate();
       PreparedStatement pst3=co.prepareStatement("update cloudrequest set status='request_sent' where user = '"+user+"'  and owner = '"+owner+"' and edisease = '"+edisease+"'    ");
       pst3.executeUpdate();
       
      if(i>0){
       response.sendRedirect("rtc.jsp?m1=upload_success"); 
      }
      else{
          response.sendRedirect("rtc.jsp?m2=upload_failed"); 
      }
       }
	  
	catch(SQLException e)
        {
		out.print(e.getMessage());
	    }  
           %>
</body>
</html>
