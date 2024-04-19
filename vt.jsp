<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.Connection"%>
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
           <li><a href="vt.jsp">View Time</a></li>
        <li><a href="index.html">Logout</a></li>
      </ul>
    </div>
  </div>

</header>


<%
   String email = session.getAttribute("email").toString();
   String finalt = "";
   String finalt1 = "";
try{ 
	
        Connection co = databasecon.getconnection();
        PreparedStatement pst=co.prepareStatement("select * from fogrequest  where user='"+email+"' and status='mail_sent' ");
        ResultSet rs=pst.executeQuery();
         while(rs.next()){
             
             finalt = rs.getString(9);
         }
    
         PreparedStatement pst1=co.prepareStatement("select * from cloudrequest  where user='"+email+"' and status='key5_sent' ");
        ResultSet rs1=pst1.executeQuery();
         while(rs1.next()){
             
             finalt1 = rs1.getString(9);
         }
    %>
<div class="plans-container container-fluid" >
  <div class="container">
    <div class="row section-title">
     
      
    </div>
      <br><br>
      
      <center>
          <h3 style="color:black">Fog time is :<%=finalt%></h3><br>
          <h3 style="color:black">Cloud time is :<%=finalt1%></h3><br>
      </center>
      
       <% }
	catch(Exception e)
	{
		System.out.println(e);
	}
	%>
      
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