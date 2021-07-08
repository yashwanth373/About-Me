<%@ page import="java.sql.*"%>
<%@ page import="java.io.InputStream"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <style>
    input,
    textarea,select {
      margin-left: 10px;
      margin-bottom: 15px;
      width: 200px;
      height: 25px;
    }
    label {
      display: inline-block;
      width: 200px;
      text-align: left;
    }
  </style>
  <body>
    <%
    /*= Connection to DB*/
          java.sql.Connection conn=null;
          try { 
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/allaboutme?allowPublicKeyRetrieval=true&useSSL=false", "yashwanth", "HelloWorld123");
            
          }
          catch(SQLException ex) {
            out.println(ex);
            ex.printStackTrace();
          }
          catch(ClassNotFoundException ex){
            ex.printStackTrace();
          }

          /*= User login and Signup Hnadling */
          if(request.getParameter("submit")!=null){
            if(request.getParameter("submit").equals("edit")){

              String userID=request.getRequestURL().toString().split("/")[5];
              
              String loggedUserID="";
              String Secret="";

              if((String)session.getAttribute("userID")!=null){
                  loggedUserID=(String)session.getAttribute("userID");
                  Secret=(String)session.getAttribute("Secret");
               }
              
           
          
              if(!Secret.equals("") && !loggedUserID.equals("") && Secret.equals("About-Me-Secret-Word") && userID.equals(loggedUserID)){
                InputStream inputStream = null;
  
                String temp = request.getParameter("temp");
                String dob = request.getParameter("dob");
                String address = request.getParameter("address");
                String desc = request.getParameter("desc");
                Long contact=Long.parseLong(request.getParameter("phone"));
                Part filePart = request.getPart("dp");
                if (filePart != null) {
                  inputStream = filePart.getInputStream();
                }
  
                try{
                java.sql.PreparedStatement stmt=conn.prepareStatement("update users set template=?,dob=?,address=?,about=?,phone=?,image=? where userid=?");
                stmt.setString(1,temp);
                stmt.setString(2,dob);
                stmt.setString(3,address);
                stmt.setString(4,desc);
                stmt.setLong(5,contact);
                stmt.setBlob(6,inputStream);
                stmt.setString(7,userID);
                stmt.executeUpdate(); 

                java.sql.PreparedStatement stmted = conn.prepareStatement("update education set grade=?,start=?,end=?,type=?,name=? where userid=?");
                stmted.setFloat(1,Float.parseFloat(request.getParameter("10thcgpa")));
                stmted.setString(2,request.getParameter("10thstart"));
                stmted.setString(3,request.getParameter("10thend"));
                stmted.setString(4,"Secondary Education");
                stmted.setString(5,request.getParameter("10th"));
                stmted.setString(6,userID);
                stmted.addBatch();

                stmted.setFloat(1,Float.parseFloat(request.getParameter("intercgpa")));
                stmted.setString(2,request.getParameter("interstart"));
                stmted.setString(3,request.getParameter("interend"));
                stmted.setString(4,"Intermediate");
                stmted.setString(5,request.getParameter("inter"));
                stmted.setString(6,userID);
                stmted.addBatch();

              
                stmted.setFloat(1,Float.parseFloat(request.getParameter("btechcgpa")));
                stmted.setString(2,request.getParameter("btechstart"));
                stmted.setString(3,request.getParameter("btechend"));
                stmted.setString(4,"Bachelors");
                stmted.setString(5,request.getParameter("btech"));
                stmted.setString(6,userID);
                stmted.addBatch();

                stmted.executeBatch();

                java.sql.PreparedStatement stmtpro = conn.prepareStatement("update projects set title=?,source=?,tech=?,description=? where userid=?");
                stmtpro.setString(1,request.getParameter("pro1"));
                stmtpro.setString(2,request.getParameter("pro1link"));
                stmtpro.setString(3,request.getParameter("pro1tech"));
                stmtpro.setString(4,request.getParameter("pro1desc"));
                stmtpro.setString(5,userID);
                stmtpro.addBatch();

                stmtpro.setString(1,request.getParameter("pro2"));
                stmtpro.setString(2,request.getParameter("pro2link"));
                stmtpro.setString(3,request.getParameter("pro2tech"));
                stmtpro.setString(4,request.getParameter("pro2desc"));
                stmtpro.setString(5,userID);
                stmtpro.addBatch();

                
                stmtpro.setString(1,request.getParameter("pro3"));
                stmtpro.setString(2,request.getParameter("pro3link"));
                stmtpro.setString(3,request.getParameter("pro3tech"));
                stmtpro.setString(4,request.getParameter("pro3desc"));
                stmtpro.setString(5,userID);
                stmtpro.addBatch();

                
                stmtpro.setString(1,request.getParameter("pro4"));
                stmtpro.setString(2,request.getParameter("pro4link"));
                stmtpro.setString(3,request.getParameter("pro4tech"));
                stmtpro.setString(4,request.getParameter("pro4desc"));
                stmtpro.setString(5,userID);
                stmtpro.addBatch();

                stmtpro.executeBatch();

                java.sql.PreparedStatement stmtprof = conn.prepareStatement("update coding set rating=?,name=?,link=? where userid=?");
                
                stmtprof.setString(1,request.getParameter("prof1rating"));
                stmtprof.setString(2,request.getParameter("prof1"));
                stmtprof.setString(3,request.getParameter("prof1link"));
                stmtprof.setString(4,userID);
                stmtprof.addBatch();

                
                stmtprof.setString(1,request.getParameter("prof2rating"));
                stmtprof.setString(2,request.getParameter("prof2"));
                stmtprof.setString(3,request.getParameter("prof2link"));
                stmtprof.setString(4,userID);
                stmtprof.addBatch();

                
                stmtprof.setString(1,request.getParameter("prof3rating"));
                stmtprof.setString(2,request.getParameter("prof3"));
                stmtprof.setString(3,request.getParameter("prof3link"));
                stmtprof.setString(4,userID);
                stmtprof.addBatch();

                stmtprof.executeBatch();

                java.sql.PreparedStatement stmtintern = conn.prepareStatement("update internship set role=?,company=?,description=? where userid=?");
                stmtintern.setString(4,userID);
                stmtintern.setString(1,request.getParameter("intern1"));
                stmtintern.setString(2,request.getParameter("intern1comp"));
                stmtintern.setString(3,request.getParameter("intern1desc"));
                stmtintern.addBatch();

                stmtintern.setString(4,userID);
                stmtintern.setString(1,request.getParameter("intern2"));
                stmtintern.setString(2,request.getParameter("intern2comp"));
                stmtintern.setString(3,request.getParameter("intern2desc"));
                stmtintern.addBatch();

                stmtintern.executeBatch();

                java.sql.PreparedStatement stmtach = conn.prepareStatement("update achievements set title=?,date=?,position=? where userid=?)");
                stmtach.setString(4,userID);
                stmtach.setString(1,request.getParameter("ach1"));
                stmtach.setString(2,request.getParameter("ach1date"));
                stmtach.setString(3,request.getParameter("ach1pos"));
                stmtach.addBatch();

                stmtach.setString(4,userID);
                stmtach.setString(1,request.getParameter("ach2"));
                stmtach.setString(2,request.getParameter("ach2date"));
                stmtach.setString(3,request.getParameter("ach2pos"));
                stmtach.addBatch();

                stmtach.executeBatch();

                }
                catch(Exception e){
                  out.println(e);
                }
                
                response.sendRedirect(request.getContextPath() + "/profile/"+loggedUserID);
              }
              else if(Secret.equals("") && loggedUserID.equals("")){
          
  
                InputStream inputStream = null;
  
                String temp = request.getParameter("temp");
                String dob = request.getParameter("dob");
                String address = request.getParameter("address");
                String desc = request.getParameter("desc");
                Long contact=Long.parseLong(request.getParameter("phone"));
                Part filePart = request.getPart("dp");
                if (filePart != null) {
                  inputStream = filePart.getInputStream();
                }
  
                try{
                java.sql.PreparedStatement stmt=conn.prepareStatement("update users set template=?,dob=?,address=?,about=?,phone=?,image=? where userid=?");
                stmt.setString(1,temp);
                stmt.setString(2,dob);
                stmt.setString(3,address);
                stmt.setString(4,desc);
                stmt.setLong(5,contact);
                stmt.setBlob(6,inputStream);
                stmt.setString(7,userID);
                stmt.executeUpdate(); 

                java.sql.PreparedStatement stmted = conn.prepareStatement("insert into education values(?,?,?,?,?,?)");
                stmted.setString(1,userID);
                stmted.setFloat(2,Float.parseFloat(request.getParameter("10thcgpa")));
                stmted.setString(3,request.getParameter("10thstart"));
                stmted.setString(4,request.getParameter("10thend"));
                stmted.setString(5,"Secondary Education");
                stmted.setString(6,request.getParameter("10th"));
                stmted.addBatch();

                stmted.setString(1,userID);
                stmted.setFloat(2,Float.parseFloat(request.getParameter("intercgpa")));
                stmted.setString(3,request.getParameter("interstart"));
                stmted.setString(4,request.getParameter("interend"));
                stmted.setString(5,"Intermediate");
                stmted.setString(6,request.getParameter("inter"));
                stmted.addBatch();

              
                stmted.setString(1,userID);
                stmted.setFloat(2,Float.parseFloat(request.getParameter("btechcgpa")));
                stmted.setString(3,request.getParameter("btechstart"));
                stmted.setString(4,request.getParameter("btechend"));
                stmted.setString(5,"Bachelors");
                stmted.setString(6,request.getParameter("btech"));
                stmted.addBatch();

                stmted.executeBatch();

                java.sql.PreparedStatement stmtpro = conn.prepareStatement("insert into projects values(?,?,?,?,?)");
                stmtpro.setString(1,userID);
                stmtpro.setString(2,request.getParameter("pro1"));
                stmtpro.setString(3,request.getParameter("pro1link"));
                stmtpro.setString(4,request.getParameter("pro1tech"));
                stmtpro.setString(5,request.getParameter("pro1desc"));
                stmtpro.addBatch();

                stmtpro.setString(1,userID);
                stmtpro.setString(2,request.getParameter("pro2"));
                stmtpro.setString(3,request.getParameter("pro2link"));
                stmtpro.setString(4,request.getParameter("pro2tech"));
                stmtpro.setString(5,request.getParameter("pro2desc"));
                stmtpro.addBatch();

                stmtpro.setString(1,userID);
                stmtpro.setString(2,request.getParameter("pro3"));
                stmtpro.setString(3,request.getParameter("pro3link"));
                stmtpro.setString(4,request.getParameter("pro3tech"));
                stmtpro.setString(5,request.getParameter("pro3desc"));
                stmtpro.addBatch();

                stmtpro.setString(1,userID);
                stmtpro.setString(2,request.getParameter("pro4"));
                stmtpro.setString(3,request.getParameter("pro4link"));
                stmtpro.setString(4,request.getParameter("pro4tech"));
                stmtpro.setString(5,request.getParameter("pro4desc"));
                stmtpro.addBatch();

                stmtpro.executeBatch();

                java.sql.PreparedStatement stmtprof = conn.prepareStatement("insert into coding values(?,?,?,?)");
                stmtprof.setString(1,userID);
                stmtprof.setString(2,request.getParameter("prof1rating"));
                stmtprof.setString(3,request.getParameter("prof1"));
                stmtprof.setString(4,request.getParameter("prof1link"));
                stmtprof.addBatch();

                stmtprof.setString(1,userID);
                stmtprof.setString(2,request.getParameter("prof2rating"));
                stmtprof.setString(3,request.getParameter("prof2"));
                stmtprof.setString(4,request.getParameter("prof2link"));
                stmtprof.addBatch();

                stmtprof.setString(1,userID);
                stmtprof.setString(2,request.getParameter("prof3rating"));
                stmtprof.setString(3,request.getParameter("prof3"));
                stmtprof.setString(4,request.getParameter("prof3link"));
                stmtprof.addBatch();

                stmtprof.executeBatch();

                java.sql.PreparedStatement stmtintern = conn.prepareStatement("insert into internship values(?,?,?,?)");
                stmtintern.setString(1,userID);
                stmtintern.setString(2,request.getParameter("intern1"));
                stmtintern.setString(3,request.getParameter("intern1comp"));
                stmtintern.setString(4,request.getParameter("intern1desc"));
                stmtintern.addBatch();

                stmtintern.setString(1,userID);
                stmtintern.setString(2,request.getParameter("intern2"));
                stmtintern.setString(3,request.getParameter("intern2comp"));
                stmtintern.setString(4,request.getParameter("intern2desc"));
                stmtintern.addBatch();

                stmtintern.executeBatch();

                java.sql.PreparedStatement stmtach = conn.prepareStatement("insert into achievements values(?,?,?,?)");
                stmtach.setString(1,userID);
                stmtach.setString(2,request.getParameter("ach1"));
                stmtach.setString(3,request.getParameter("ach1date"));
                stmtach.setString(4,request.getParameter("ach1pos"));
                stmtach.addBatch();

                stmtach.setString(1,userID);
                stmtach.setString(2,request.getParameter("ach2"));
                stmtach.setString(3,request.getParameter("ach2date"));
                stmtach.setString(4,request.getParameter("ach2pos"));
                stmtach.addBatch();

                stmtach.executeBatch();

                }
                catch(Exception e){
                  out.println(e);
                }
                
                
                
  
  
              session.setAttribute("userID",userID);
              session.setAttribute("Secret","About-Me-Secret-Word");
              response.sendRedirect(request.getContextPath() + "/profile/"+userID);
              }
            }
          }

        %>
    <div
      style="
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
      "
    >
      <form style="width: 40%" method="POST" enctype="multipart/form-data">
        <div>
          <h1>Personal Details</h1>
          <label for="temp">Select a template</label>
          <select name="temp" id="">
            <option value="K8">K8</option>
            <option value="M0">M0</option>
            <option value="P2">P2</option>
            <option value="Q5">Q5</option>
            <option value="Q9">Q9</option>
            <option value="R0">R0</option>
          </select>
          <br />
          <label for="dob">Enter Date of Birth</label>
          <input type="date" name="dob" />
          <label for="address" style="position: relative;bottom:25px;">Enter Address</label>
          <textarea name="address" cols="30" rows="10"></textarea>
          <label for="desc" style="position: relative;bottom:25px;">Write about yourself</label>
          <textarea name="desc" cols="30" rows="10"></textarea>
          <label for="phone">Enter Contact number</label>
          <input type="number" name="phone" />
          <label for="dp">Upload a photo</label>
          <input type="file" name="dp" />
        </div>
        <hr>
        <div>
          <h1>Education</h1>
          <h3>Secondary Education</h3>
          <br />
          <label for="10th">Enter Institute name</label>
          <input type="text" name="10th" />
          <label for="10thstart">From</label>
          <input type="number" name="10thstart">
          <label for="10thend">To</label>
          <input type="number" name="10thend">
          <label for="10thcgpa">CGPA</label>
          <input type="text" name="10thcgpa" />
          <h3>Intermediate</h3>
          <br />
          <label for="inter">Enter Institute name</label>
          <input type="text" name="inter" />
          <label for="interstart">From</label>
          <input type="number" name="interstart">
          <label for="interend">To</label>
          <input type="number" name="interend">
          <label for="intercgpa">CGPA</label>
          <input type="text" name="intercgpa" />
          <h3>Bachelors</h3>
          <br />
          <label for="btech">Enter Institute name</label>
          <input type="text" name="btech" />
          <label for="btechstart">From</label>
          <input type="number" name="btechstart">
          <label for="btechend">To</label>
          <input type="number" name="btechend">
          <label for="btechcgpa">CGPA</label>
          <input type="text" name="btechcgpa" />
        </div>
        <hr>
        <div>
          <h1>Projects</h1>
          <h3>Project-1</h3>
          <br />
          <label for="pro1">Title</label>
          <input type="text" name="pro1" />
          <label for="pro1link">Repository Link</label>
          <input type="text" name="pro1link">
          <label for="pro1tech">Tech Stack used</label>
          <input type="text" name="pro1tech">
          <label for="pro1desc" style="position: relative;bottom:25px;">Description</label>
          <textarea name="pro1desc" cols="30" rows="10"></textarea>
          <h3>Project-2</h3>
          <br />
          <label for="pro2">Title</label>
          <input type="text" name="pro2" />
          <label for="pro2link">Repository Link</label>
          <input type="text" name="pro2link">
          <label for="pro2tech">Tech Stack used</label>
          <input type="text" name="pro2tech">
          <label for="pro2desc" style="position: relative;bottom:25px;">Description</label>
          <textarea name="pro2desc" cols="30" rows="10"></textarea>
          <h3>Project-3</h3>
          <br />
          <label for="pro3">Title</label>
          <input type="text" name="pro3" />
          <label for="pro3link">Repository Link</label>
          <input type="text" name="pro3link">
          <label for="pro3tech">Tech Stack used</label>
          <input type="text" name="pro3tech">
          <label for="pro3desc" style="position: relative;bottom:25px;">Description</label>
          <textarea name="pro3desc" cols="30" rows="10"></textarea>
          <h3>Project-4</h3>
          <br />
          <label for="pro4">Title</label>
          <input type="text" name="pro4" />
          <label for="pro4link">Repository Link</label>
          <input type="text" name="pro4link">
          <label for="pro4tech">Tech Stack used</label>
          <input type="text" name="pro4tech">
          <label for="pro4desc" style="position: relative;bottom:25px;">Description</label>
          <textarea name="pro4desc" cols="30" rows="10"></textarea>
        </div>
        <hr>
        <div>
          <h1>Coding Profiles</h1>
          <h3>Profile-1</h3>
          <br />
          <label for="prof1">Name</label>
          <input type="text" name="prof1" />
          <label for="prof1link">Profile Link</label>
          <input type="text" name="prof1link">
          <label for="prof1rating">Rating</label>
          <input type="number" name="prof1rating">
          <h3>Profile-2</h3>
          <br />
          <label for="prof2">Name</label>
          <input type="text" name="prof2" />
          <label for="prof2link">Profile Link</label>
          <input type="text" name="prof2link">
          <label for="prof2rating">Rating</label>
          <input type="number" name="prof2rating">
          <h3>Profile-3</h3>
          <br />
          <label for="prof3">Name</label>
          <input type="text" name="prof3" />
          <label for="prof3link">Profile Link</label>
          <input type="text" name="prof3link">
          <label for="prof3rating">Rating</label>
          <input type="number" name="prof3rating">
          
        </div>
        <hr>
        <div>
          <h1>Internships</h1>
          <h3>Internship-1</h3>
          <br />
          <label for="intern1">Role</label>
          <input type="text" name="intern1" />
          <label for="intern1comp">Company</label>
          <input type="text" name="intern1comp">
          <label for="intern1desc" style="position: relative;bottom:25px;">Description</label>
          <textarea name="intern1desc" cols="30" rows="10"></textarea>
          <h3>Internship-2</h3>
          <br />
          <label for="intern2">Role</label>
          <input type="text" name="intern2" />
          <label for="intern2comp">Company</label>
          <input type="text" name="intern2comp">
          <label for="intern2desc" style="position: relative;bottom:25px;">Description</label>
          <textarea name="intern2desc" cols="30" rows="10"></textarea>
          
        </div>
        <hr>
        <div>
          <h1>Other Achievements</h1>
          <h3>Achievement-1</h3>
          <br />
          <label for="ach1">Title</label>
          <input type="text" name="ach1" />
          <label for="ach1pos">Position</label>
          <input type="text" name="ach1pos">
          <label for="ach1date">Date</label>
          <input type="date" name="ach1date">
          <h3>Achievement-2</h3>
          <br />
          <label for="ach2">Title</label>
          <input type="text" name="ach2" />
          <label for="ach2pos">Position</label>
          <input type="text" name="ach2pos">
          <label for="ach2date">Date</label>
          <input type="date" name="ach2date">
        </div>
        <hr>
        <button type="submit" name="submit" value="edit">Edit Details</button>
      </form>
    </div>
  </body>
</html>
