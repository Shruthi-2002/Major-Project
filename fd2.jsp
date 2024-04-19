<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
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

<body>
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
<div class="plans-container container-fluid" >
  <div class="container">
    <div class="row section-title">
      
      
    </div>
      <br>
      <%
       //   String user=request.getParameter("user");
            String owner=request.getParameter("owner");
            String edisease=request.getParameter("edisease");
             String skey=request.getParameter("skey");
             String skey1=request.getParameter("skey1");
             String skey2=request.getParameter("skey2");
             String skey3=request.getParameter("skey3");
             String skey4=request.getParameter("skey4");
             String timet1=request.getParameter("timet1");
            String key = ""; 
            String key1 = ""; 
            String key2 = ""; 
            String key3 = ""; 
            String key4 = ""; 
            String ehb = "";
             String etemp = "";
              String eo = "";
               String eimage = "";
               String ed = "";
               String t1 = "";
             int t11 = 0;
              Connection co = null;
              co = databasecon.getconnection();
            PreparedStatement pst=co.prepareStatement("select * from upload where email='"+owner+"' and edisease = '"+edisease+"'  ");
        ResultSet rs=pst.executeQuery();
        while (rs.next()){
            
            key = rs.getString(6);
            key1 = rs.getString(7);
            key2 = rs.getString(8);
            key3 = rs.getString(9);
            key4 = rs.getString(16);
            ehb = rs.getString(2);
            etemp = rs.getString(3);
            eo = rs.getString(4);
            eimage = rs.getString(15);
            ed = rs.getString(5);
        }
        
             PreparedStatement pst2=co.prepareStatement("select * from fogrequest where owner='"+owner+"' and edisease = '"+edisease+"'  ");
        ResultSet rs1=pst2.executeQuery();
        if (rs1.next()){
            
            t1 = rs1.getString(7);
           
        }
        
        
          Date currentDate = new Date();

    // Define the desired date format
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    // Format the current date using the specified format
    String ft = dateFormat.format(currentDate);

//out.println("Current time: " + ft);
        
        
        if (key.equals(skey) && key1.equals(skey1) && key2.equals(skey2) &&key3.equals(skey3) && key4.equals(skey4) && timet1.equals(ft) ){
            
            
            LocalTime currentTime = LocalTime.now();

        // Define the format for displaying the time (HH:mm:ss for 24-hour format)
        DateTimeFormatter timeFormat = DateTimeFormatter.ofPattern("HH:mm:ss");

        // Format the current timeuse
        String formattedTime = currentTime.format(timeFormat);
        
        
        java.text.SimpleDateFormat sdf1 = new java.text.SimpleDateFormat("HH:mm:ss");
        java.util.Date startTime = sdf1.parse(t1);
        java.util.Date endTime = sdf1.parse(formattedTime);
         long timeDifferenceMillis = endTime.getTime() - startTime.getTime();    
          
         
          long seconds = timeDifferenceMillis / 1000;
        long minutes = seconds / 60;
        long hours = minutes / 60;

        seconds %= 60;
        minutes %= 60;

        String timeDifferenceStr = String.format("%02d:%02d:%02d", hours, minutes, seconds);
         
             PreparedStatement pst1=co.prepareStatement("update fogrequest set t2='"+formattedTime+"',finalt='"+timeDifferenceStr+"' where owner='"+owner+"' and edisease='"+edisease+"' ");
            pst1.executeUpdate();
        
            
         
            
        
          %>
      <center>
          <div class="container">
          <h4>View Decryption Data</h4><br>
  <table class="table">
    <thead>
      <tr>
        <th>Owner</th>
        <th>Heartbeat</th>
        <th>Temperature</th>
        <th>Ox2</th>
         <th>Disease</th>
         <th>Image</th>
      </tr>
    </thead>
      
    <tbody>
     <tr>
        <td><%=owner%></td>
        <td><%=ehb%></td>
        <td><%=etemp%></td>
        <td><%=eo%></td>
        <td><%=ed%></td>
        <td><img src="upload/<%=eimage%>"</td>
        
      </tr>
    </tbody>
    <%
        }
        %>
  </table>
</div>
                               
                               
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