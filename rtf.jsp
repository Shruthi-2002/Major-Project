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
         <li><a href="rtc.jsp">Request To Cloud</a></li>
          <li><a href="cdd.jsp">Cloud Data Download</a></li>
           <li><a href="vt.jsp">View Time</a></li>
        <li><a href="index.html">Logout</a></li>
      </ul>
    </div>
  </div>

</header>

<%
   // String email = session.getAttribute("email").toString();
try{ 
	
        Connection co = databasecon.getconnection();
        PreparedStatement pst=co.prepareStatement("select * from upload where status='senttofog' ");
        ResultSet rs=pst.executeQuery();
    
    %>
<div class="plans-container container-fluid" >
  <div class="container">
    <div class="row section-title">
     
      
    </div>
      <br><br>
      <center>
      <div class="container">
          <h4>View Data</h4><br>
  <table class="table">
    <thead>
      <tr>
        <th>Email</th>
        <th>Heartbeat</th>
        <th>Temperature</th>
        <th>Ox2</th>
         <th>Disease</th>
         <th>Date</th>
          <th>Request</th>
      </tr>
    </thead>
      <%
        while(rs.next()){
        %>
    <tbody>
     <tr>
        <td><%=rs.getString(1)%></td>
        <td><%=rs.getString(10)%></td>
        <td><%=rs.getString(11)%></td>
        <td><%=rs.getString(12)%></td>
        <td><%=rs.getString(13)%></td>
        <td><%=rs.getString(19)%></td>
        <td><a href="rtf1.jsp?email=<%=rs.getString(1)%>&edisease=<%=rs.getString(13)%>&eox=<%=rs.getString(12)%>&eheartbeat=<%=rs.getString(10)%>&etemprature=<%=rs.getString(11)%>&eimage=<%=rs.getString(15)%>&role=<%=rs.getString(18)%>&t1=<%=rs.getString(19)%>">Send_to_fog</a></td>
        
      </tr>
    </tbody>
    <%
        }
        %>
  </table>
</div>
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