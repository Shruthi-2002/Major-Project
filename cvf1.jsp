<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="Efficient.Ftpcon"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
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
          String hb=request.getParameter("hb");
          String tempr=request.getParameter("tempr");
          String ox=request.getParameter("ox");
          String dise=request.getParameter("dise");
          
          String filename = "myfile.txt";
          String data ="My data: "+email + " and "+hb +" and "+ox+" and "+dise;
     
         String server = "cloud"; 
         
         
         String filePath = "C:/Users/User/Desktop/Uploads/file.txt";
         
         FileWriter fileWriter = new FileWriter(filePath);
        BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);

        // Write the data string into the file
        bufferedWriter.write(data);

        // Close the resources
        bufferedWriter.close();
        fileWriter.close();
        
        
        File f = new File("C:\\Users\\User\\Desktop\\Uploads\\"+filename);
     FileWriter fw = new FileWriter(f);
     fw.write(data);
     fw.close();
     Ftpcon ftpcon = new Ftpcon();
     ftpcon.upload(f, filename,server);
		
       response.sendRedirect("cvf.jsp?m1=registration_success"); 
     
           %>
</body>
</html>

