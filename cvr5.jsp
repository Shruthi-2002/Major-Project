<%@page import="Efficient.mail"%>
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
  
            String user=request.getParameter("user");
            String owner=request.getParameter("owner");
            String edisease=request.getParameter("edisease");
          //  String address=request.getParameter("address");
            
            String skey="";
            String skey1="";
            String skey2="";
            String skey3="";
            String skey4 = "";
             co = databasecon.getconnection();
            PreparedStatement pst=co.prepareStatement("select * from upload where email='"+owner+"' and edisease = '"+edisease+"'  ");
        ResultSet rs=pst.executeQuery();
        

    while(rs.next()){
        
        skey = rs.getString(6);
        skey1 = rs.getString(7);
        skey2 = rs.getString(8);
        skey3 = rs.getString(9);
         skey4 = rs.getString(16);
    }
    
mail m = new mail();
   String msg ="File Keys: "+skey2;
   m.secretMail(msg,user,user);
          
   
   PreparedStatement pst1=co.prepareStatement("update cloudrequest set status='key3_sent' where user='"+user+"' and owner='"+owner+"' and edisease='"+edisease+"'  ");
      pst1.executeUpdate();
       response.sendRedirect("cvr6.jsp?m1=mail_sent_success"); 
    
           %>
</body>
</html>
