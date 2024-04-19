<%-- 
    Document   : cd6
    Created on : 16 Oct, 2023, 9:32:18 AM
    Author     : DELL
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body><%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="databaseconnection.databasecon"%>
<!doctype html>
<html lang="eng">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <title>Secure Smart Healthcare Data with Data Aggregation</title>
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/fontawsom-all.min.css">
  <link rel="stylesheet" href="assets/plugins/testimonial/css/owl.carousel.min.css">
  <link rel="stylesheet" href="assets/plugins/testimonial/css/owl.theme.min.css">
  <link rel="stylesheet" href="assets/css/style.css">
  

</head>
<script type="text/javascript">
        function delayedLoad() {
            // Delay the content display by 3 seconds (3000 milliseconds)
            setTimeout(function() {
                document.getElementById("content").style.display = "block";
            }, 3000);
        }
    </script>
<body onload="delayedLoad()">
  <header>
    <div class="container-fluid">
      <div class="row head-col">
        
          <h3 style="color: green"><b>Secure Smart Healthcare Data with Data Aggregation</b></h3>
          <a class="d-md-none small-menu" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
            <i class="fas d-lg-none  fa-bars"></i>
          </a>
        </div>
       
     </div>
     <div id="collapseExample" class="nav-col">
      <ul>
        <li><a href="mshome.jsp">Home</a></li>
        <li><a href="rtf.jsp">Request To Fog</a></li>
        <li><a href="ffd.jsp">Fog File Download</a></li>
         <li><a href="rtc.jsp">Request To Cloud</a></li>
          <li><a href="cdd.jsp">Cloud Data Download</a></li>
           <li><a href="vt.jsp">View Time</a></li>
        <li><a href="index.html">Logout</a></li>
      </ul>
    </div>
  </div>

</header>


<div class="plans-container container-fluid" id="content" style="display:none;">
  <div class="container">
    <div class="row section-title">
      
      
    </div>
      <br>
      <%
          String user=request.getParameter("user");
            String owner=request.getParameter("owner");
         String skey1=request.getParameter("skey4");
       //     String etemprature=request.getParameter("etemprature");
        //    String eox=request.getParameter("eox");
            String edisease=request.getParameter("edisease");
             String timet1=request.getParameter("timet1");
            String key = "";
            String ehb = "";
            String t1 = "";
            Connection co = null;
            co = databasecon.getconnection();
            
            
            PreparedStatement pst=co.prepareStatement("select * from upload where email='"+owner+"' and edisease = '"+edisease+"'  ");
        ResultSet rs=pst.executeQuery();
        while (rs.next()){
            
            key = rs.getString(16);
          
            ehb = rs.getString(15);
        }
        
         PreparedStatement pst2=co.prepareStatement("select * from cloudrequest where owner='"+owner+"' and edisease = '"+edisease+"'  ");
        ResultSet rs1=pst2.executeQuery();
        if (rs1.next()){
            
            t1 = rs1.getString(7);
           
        }
        
        
          if (key.equals(skey1) ){
            
             LocalTime currentTime = LocalTime.now();

        // Define the format for displaying the time (HH:mm:ss for 24-hour format)
        DateTimeFormatter timeFormat = DateTimeFormatter.ofPattern("HH:mm:ss");

        // Format the current timeuse
        String formattedTime = currentTime.format(timeFormat);
        
        
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("HH:mm:ss");
        java.util.Date startTime = sdf.parse(t1);
        java.util.Date endTime = sdf.parse(formattedTime);
         long timeDifferenceMillis = endTime.getTime() - startTime.getTime();    
          
         
          long seconds = timeDifferenceMillis / 1000;
        long minutes = seconds / 60;
        long hours = minutes / 60;

        seconds %= 60;
        minutes %= 60;

        String timeDifferenceStr = String.format("%02d:%02d:%02d", hours, minutes, seconds);
         
             PreparedStatement pst1=co.prepareStatement("update cloudrequest set t2='"+formattedTime+"',finalt='"+timeDifferenceStr+"' where owner='"+owner+"' and edisease='"+edisease+"' ");
            pst1.executeUpdate();
        
        //     String eimage=request.getParameter("eimage");
          %>
      <center>
          <h3 style="color:black;"><img src="upload/<%=ehb%>"</h3><br>
          <%}%>
          
         
                               
                               
                            </center>
      
     
      
      <br>
      
      
</div>
</div>






</body>

<script src="assets/js/jquery-3.2.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/plugins/testimonial/js/owl.carousel.min.js"></script>
<script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
<script src="assets/js/script.js"></script>
</html>
     
    </body>
</html>
