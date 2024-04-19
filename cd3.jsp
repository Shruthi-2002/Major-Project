<%@page import="java.sql.ResultSet"%>
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
         String skey1=request.getParameter("skey1");
       //     String etemprature=request.getParameter("etemprature");
        //    String eox=request.getParameter("eox");
            String edisease=request.getParameter("edisease");
             String timet1=request.getParameter("timet1");
            String key = "";
            String ehb = "";
            Connection co = null;
            co = databasecon.getconnection();
            PreparedStatement pst=co.prepareStatement("select * from upload where email='"+owner+"' and edisease = '"+edisease+"'  ");
        ResultSet rs=pst.executeQuery();
        while (rs.next()){
            
            key = rs.getString(7);
          
            ehb = rs.getString(3);
        }
        
        
          if (key.equals(skey1) ){
            
            
        //     String eimage=request.getParameter("eimage");
          %>
      <center>
          <h3 style="color:black;">Temperature : <%=ehb%></h3><br>
          <%}%>
          
           <h3 style="color:black;">Verify</h3><br>
        <form style="width: 40%;" action="cd4.jsp" >
                                
  <!-- Email input -->
  <div class="form-outline mb-4">
      <input type="text"  name="skey2" id="form2Example1" placeholder="Key3" required class="form-control" />
  </div>

  
<input type="hidden" name="user" value="<%=user%>" id="form2Example1" placeholder="Key5" required class="form-control" />
<input type="hidden" name="owner" value="<%=owner%>" id="form2Example1" placeholder="Key5" required class="form-control" />
<input type="hidden" name="edisease" value="<%=edisease%>" id="form2Example1" placeholder="Key5" required class="form-control" />
<input type="hidden" name="timet1" value="<%=timet1%>" id="form2Example1" placeholder="Key5" required class="form-control" />
  <!-- 2 column grid layout for inline styling -->
 

  <!-- Submit button -->
  <button type="submit" class="btn btn-primary">Submit</button>


</form>
                               
                               
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