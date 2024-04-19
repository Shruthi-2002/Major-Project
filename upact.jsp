<%@page import="Action.EncryptFile"%>
<%@page import="Efficient.mail"%>
<%@page import="java.io.File"%>
<%@page import="javax.crypto.spec.SecretKeySpec"%>
<%@page import="Efficient.encryptimg"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="javax.crypto.Cipher"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
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
   String email=session.getAttribute("email").toString();
   String user=session.getAttribute("user").toString();
            String heartbeat=request.getParameter("heartbeat");
            String temprature=request.getParameter("temprature");
            String ox=request.getParameter("ox");
            String disease=request.getParameter("disease");
           String image1=request.getParameter("image");
           String role=request.getParameter("role");
           String t1=request.getParameter("t1");
         
            
//           int hb=Integer.parseInt("heartbeat"); 
//            if(hb > 150){
//     
//     mail m = new mail();
//   String msg ="health condition is not good";
//   m.secretMail(msg,email,email);
// }
//            
             KeyGenerator keyGen = KeyGenerator.getInstance("AES");
    keyGen.init(128);
    SecretKey secretKey = keyGen.generateKey();
    System.out.println("secret key:" + secretKey);
    
    KeyGenerator keyGen1 = KeyGenerator.getInstance("AES");
    keyGen1.init(128);
    SecretKey secretKey1 = keyGen1.generateKey();
    System.out.println("secret key1:" + secretKey1);
    
     KeyGenerator keyGen2 = KeyGenerator.getInstance("AES");
    keyGen2.init(128);
    SecretKey secretKey2 = keyGen2.generateKey();
    System.out.println("secret key2:" + secretKey2);
    
     KeyGenerator keyGen3 = KeyGenerator.getInstance("AES");
    keyGen1.init(128);
    SecretKey secretKey3 = keyGen3.generateKey();
    System.out.println("secret key:" + secretKey3);
    
      KeyGenerator keyGen4 = KeyGenerator.getInstance("AES");
    keyGen1.init(128);
    SecretKey secretKey4 = keyGen4.generateKey();
    System.out.println("secret key:" + secretKey4);
    
    //converting secretkey to String
     byte[] be = secretKey.getEncoded();//encoding secretkey
     String skey = Base64.encode(be);
     
     byte[] be1 = secretKey1.getEncoded();//encoding secretkey
     String skey1 = Base64.encode(be1);
     
     byte[] be2 = secretKey2.getEncoded();//encoding secretkey
     String skey2 = Base64.encode(be2);
     
     byte[] be3 = secretKey3.getEncoded();//encoding secretkey
     String skey3 = Base64.encode(be3);
     
     byte[] be4 = secretKey4.getEncoded();//encoding secretkey
     String skey4 = Base64.encode(be4);
     System.out.println("secret key4:" + skey4);
     System.out.println("converted secretkey to string:" + skey);
     String eheartbeat = new encryption().encrypt(heartbeat, secretKey);
     String etemprature = new encryption().encrypt(temprature, secretKey1);
     String eox = new encryption().encrypt(ox, secretKey2);
     String edisease = new encryption().encrypt(disease, secretKey3);
      
    if (request.getMethod().equalsIgnoreCase("post")) {
      Part imagePart = request.getPart("image");
        InputStream imageInputStream = imagePart.getInputStream();
        
        byte[] encryptedImage = encryptimg.encryptImage(imageInputStream, skey4, skey4);
      //  String encryptedImageBase64 = Base64.getEncodermay be removed in future release error().encodeToString(encryptedImage);
 
     File encryptedFile = new File("eimages/encryptedImage");
        FileOutputStream fos = new FileOutputStream(encryptedFile);
        fos.write(encryptedImage);
        fos.close();

        
    }
    
    
     EncryptFile encryptFile2 = new EncryptFile();  
    String fileToEncrypt2 = image1;
    String encryptedFile2 = user+"encryp3.jpg";
    String directoryPath2 = "C:\\Users\\DELL\\Documents\\NetBeansProjects\\Medical Services\\web\\upload\\";

    encryptFile2.encrypt(directoryPath2 + fileToEncrypt2,directoryPath2 + encryptedFile2, encryptedFile2, user,skey4 );
		try
		{
         co = databasecon.getconnection();
                    
        PreparedStatement pst2=co.prepareStatement("insert into upload(email,heartbeat,temprature,ox,disease,skey,skey1,skey2,skey3,eheartbeat,etemprature,eox,edisease,status,eimage,skey4,bckey,role,t1) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        pst2.setString(1,email);
	pst2.setString(2,heartbeat);
        pst2.setString(3,temprature); 
        pst2.setString(4,ox);  
        pst2.setString(5,disease);
        pst2.setString(6,skey);
	pst2.setString(7,skey1);
        pst2.setString(8,skey2); 
        pst2.setString(9,skey3);  
        pst2.setString(10,eheartbeat);
        pst2.setString(11,etemprature);
	pst2.setString(12,eox);
        pst2.setString(13,edisease); 
        pst2.setString(14,"pending");
        pst2.setString(15,image1);
        pst2.setString(16,skey4);
        pst2.setString(17,"pending");
        pst2.setString(18,role);
        pst2.setString(19,t1);
	int i= pst2.executeUpdate();
      
      if(i>0){
       response.sendRedirect("upload.jsp?m1=upload_success"); 
      }
      else{
          response.sendRedirect("upload.jsp?m2=upload_failed"); 
      }
       } 
	  
	catch(SQLException e)
        {
		out.print(e.getMessage());
	    }  
           %>
</body>
</html>
