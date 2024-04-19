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
        <li><a href="thome.jsp">Home</a></li>
        <li><a href="vms.jsp">View Medical Services</a></li>
        <li><a href="index.html">Logout</a></li>
      </ul>
    </div>
  </div>

</header>


<%
   // String email = session.getAttribute("email").toString();
try{ 
	
        Connection co = databasecon.getconnection();
        PreparedStatement pst=co.prepareStatement("select * from ms  ");
        ResultSet rs=pst.executeQuery();
    
    %>
<div class="plans-container container-fluid" >
  <div class="container">
    <div class="row section-title">
     
      
    </div>
      <br><br>
      <center>
      <div class="container">
          <h4>View </h4><br>
          <table class="table" style="width: 80%">
    <thead>
      <tr>
        <th>Username</th>
        <th>Email</th>
        <th>Mobile</th>
        <th>Role</th>
         <th>Status</th>
         <th>Activate</th>
   
      </tr>
    </thead>
      <%
        while(rs.next()){
        %>
    <tbody>
     <tr>
        <td><%=rs.getString(1)%></td>
        <td><%=rs.getString(3)%></td>
        <td><%=rs.getString(4)%></td>
        <td><%=rs.getString(5)%></td>
        <td><%=rs.getString(6)%></td>
         <td><a href="vms1.jsp?username=<%=rs.getString(1)%>&email=<%=rs.getString(3)%>">Activate</a></td>
    
        
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