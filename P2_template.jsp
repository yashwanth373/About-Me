<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>P2 Template</title>
  </head>
  <body>
    <h1>P2</h1>
    <% 
        String userID=request.getParameter("id");
        java.sql.Connection conn=null; 
        try { 
            Class.forName("com.mysql.jdbc.Driver"); 
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/allaboutme?allowPublicKeyRetrieval=true&useSSL=false","yashwanth", "HelloWorld123"); 
            java.sql.PreparedStatement pstpersonal = conn.prepareStatement("Select * from users where userid=?"); 
            pstpersonal.setString(1, userID); 
            java.sql.ResultSet rspersonal = pstpersonal.executeQuery(); 
            if(rspersonal.next()){
              out.println("personal details ready");
            }
            
            java.sql.PreparedStatement psted = conn.prepareStatement("Select * from education where userid=?"); 
            psted.setString(1, userID); 
            java.sql.ResultSet rsed = psted.executeQuery(); 
            if(rsed.next()){
              out.println("Education details ready");
            }
            
            java.sql.PreparedStatement pstinterns = conn.prepareStatement("Select * from internship where userid=?"); 
            pstinterns.setString(1, userID); 
            java.sql.ResultSet rsinterns = pstinterns.executeQuery(); 
            if(rsinterns.next()){
              out.println("Internship details ready");
            }
            
            java.sql.PreparedStatement pstcoding = conn.prepareStatement("Select * from coding where userid=?"); 
            pstcoding.setString(1, userID); 
            java.sql.ResultSet rscoding = pstcoding.executeQuery(); 
            if(rscoding.next()){
              out.println("Coding details ready");
            }
            
            java.sql.PreparedStatement pstproj = conn.prepareStatement("Select * from projects where userid=?"); 
            pstproj.setString(1, userID); 
            java.sql.ResultSet rsproj = pstproj.executeQuery(); 
            if(rsproj.next()){
              out.println("Projects details ready");
            }
            
            java.sql.PreparedStatement pstach = conn.prepareStatement("Select * from achievements where userid=?"); 
            pstach.setString(1, userID); 
            java.sql.ResultSet rsach = pstach.executeQuery(); 
            if(rsach.next()){
              out.println("Achievements details ready");
            }
        }
        catch(SQLException ex) { 
            out.println(ex); 
            ex.printStackTrace(); 
        }
        catch(ClassNotFoundException ex){ 
            ex.printStackTrace(); 
        }
    
    
    
    
    
    
    
    
    %>
  </body>
</html>
