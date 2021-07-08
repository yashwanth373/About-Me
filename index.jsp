<%@ page import="java.sql.*"%>
<%@ page import="java.time.Instant" %>  
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <style>
    .bg {
      display: flex;
      align-items: center;
      justify-content: center;
      height: 80vh;
      
    }
    .login {
      background-color: lightgreen;
      width: 50rem;
      height: 20rem;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }
    .register {
      background-color: lightpink;
      width: 50rem;
      height: 20rem;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }
    input,
    textarea {
      margin-left: 10px;
      margin-bottom: 15px;
      width: 200px;
      height: 20px;
    }
    label {
      display: inline-block;
      width: 200px;
      text-align: left;
    }
  </style>
  <body>
    <%
        
        String loggedUserID="";
        String Secret="";
        if((String)session.getAttribute("userID")!=null){
          loggedUserID=(String)session.getAttribute("userID");
          Secret=(String)session.getAttribute("Secret");
        }
         if(!Secret.equals("") && Secret.equals("About-Me-Secret-Word") && !loggedUserID.equals("")){ 
            response.sendRedirect(request.getContextPath() + "/profile/"+loggedUserID);
         }
           
      %>
    <%
          /*= Connection to DB*/
          java.sql.Connection conn=null;
          java.sql.Statement stmt=null;
          try { 
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/allaboutme?allowPublicKeyRetrieval=true&useSSL=false", "yashwanth", "HelloWorld123");
            stmt = conn.createStatement();
            
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
            if(request.getParameter("submit").equals("login")){
              String email = request.getParameter("email");
              String password = request.getParameter("pass");
              java.sql.PreparedStatement pst = conn.prepareStatement("Select * from users where email=? and password=?");
              pst.setString(1, email);
              pst.setString(2, password);
              java.sql.ResultSet rs = pst.executeQuery();
              
              if(rs.next()){
                session.setAttribute("userID",rs.getString("userid"));
                session.setAttribute("Secret","About-Me-Secret-Word");
                response.sendRedirect(request.getContextPath() + "/profile/"+rs.getString("userid"));
              }        
                
              else
                out.println("<h1>Invalid login credentials</h1>");   
            }
            else if(request.getParameter("submit").equals("register")){
              String email = request.getParameter("email");
              String password = request.getParameter("pass");
              String fname = request.getParameter("fname");
              String lname = request.getParameter("lname");
              java.sql.PreparedStatement pst = conn.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?,?)");
              Timestamp instant= Timestamp.from(Instant.now());
              String userID=Long.toString(instant.getTime()).substring(5,13);
              pst.setString(1, userID);
              pst.setString(2, email);
              pst.setString(3,password);
              pst.setString(4,null);
              pst.setString(5,fname);
              pst.setString(6,lname);
              pst.setString(7,null);
              pst.setString(8,null);
              pst.setString(9,null);
              pst.setString(10,null);
              pst.setString(11,null);
              int i = pst.executeUpdate();
              
              if(i>0){
                response.sendRedirect(request.getContextPath() + "/details/"+userID);
              }
              
                
               




              
            }

          }
        
        %>
    <div class="bg">
      <div class="login">
        <h1>Login</h1>
        <form
          style="text-align: center; font-size: 20px"
          method="POST"
        >
          <label for="email">Enter Email: </label>
          <input type="text" name="email" id="email" /> <br />
          <label for="pass">Password: </label>
          <input type="password" name="pass" id="pass" /> <br />
          <label for=""><button type="submit" name="submit" value="login">Log In</button></label>
        </form>
      </div>
      <div class="register">
        <h1>Register2</h1>
        <form
          style="text-align: center; font-size: 20px"
          method="POST"
        >
          <label for="name">Enter First Name: </label>
          <input type="text" name="fname" id="fname" /> <br />

          <label for="name">Enter Last Name: </label>
          <input type="text" name="lname" id="lname" /> <br />
          
          <label for="email">Enter Email: </label>
          <input type="text" name="email" id="email" /> <br />
          
          <label for="pass">Password: </label>
          <input type="password" name="pass" id="pass" /> <br />
          <label for=""><button type="submit" name="submit" value="register">Register</button></label>
        </form>

        
      </div>
      </div>
    </div>
  </body>
</html>
