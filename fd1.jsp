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
          String user=request.getParameter("user");
            String owner=request.getParameter("owner");
            String edisease=request.getParameter("edisease");
            String timet1=request.getParameter("timet1");
          %>
      <center>
           <h3 style="color:black;">Verify</h3><br>
        <form style="width: 40%;" action="fd2.jsp" >
                                
  <!-- Email input -->
  <div class="form-outline mb-4">
      <input type="text"  name="skey" id="form2Example1" placeholder="Key1" required class="form-control" />
  </div>

  <!-- Password input -->
  <div class="form-outline mb-4">
      <input type="text" name="skey1" id="form2Example2" placeholder="Key2" required="" class="form-control" />
  </div>

  <div class="form-outline mb-4">
      <input type="text" name="skey2" id="form2Example1" placeholder="Key3" required class="form-control" />
  </div>
  
  <div class="form-outline mb-4">
      <input type="text" name="skey3" id="form2Example1" placeholder="Key4" required class="form-control" />
  </div>
  
  <div class="form-outline mb-4">
      <input type="text" name="skey4" id="form2Example1" placeholder="Key5" required class="form-control" />
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