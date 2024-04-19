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
        <li><a href="chome.jsp">Home</a></li>
        <li><a href="cvf.jsp">View Files</a></li>
         <li><a href="cvr.jsp">View Requests</a></li>
        <li><a href="index.html">Logout</a></li>

      </ul>
    </div>
  </div>

</header>

<%
   // String email = session.getAttribute("email").toString();
try{ 
	
        Connection co = databasecon.getconnection();
        PreparedStatement pst=co.prepareStatement("select * from cloudrequest where status='key2_sent' ");
        ResultSet rs=pst.executeQuery();
    
    %>
<div class="plans-container container-fluid" >
  <div class="container">
    <div class="row section-title">
     
      
    </div>
      <br><br>
    
      <div class="container">
          <h4>View Request</h4><br>
  <table class="table">
    <thead>
      <tr>
        <th>User</th>
        <th>Owner</th>
        <th>Heartbeat</th>
        <th>Temperature</th>
        <th>Ox2</th>
         
         <th>Status</th>
          <th>Request</th>
      </tr>
    </thead>
      <%
        while(rs.next()){
        %>
    <tbody>
     <tr>
        <td><%=rs.getString(1)%></td>
        <td><%=rs.getString(2)%></td>
        <td><%=rs.getString(3)%></td>
        <td><%=rs.getString(4)%></td>
        <td><%=rs.getString(5)%></td>
       
         <td><%=rs.getString(10)%></td>
        <td><a href="cvr5.jsp?user=<%=rs.getString(1)%>&edisease=<%=rs.getString(6)%>&owner=<%=rs.getString(2)%>">Sent_Mail</a></td>
        
      </tr>
    </tbody>
    <%
        }
        %>
  </table>
</div>
     
      
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