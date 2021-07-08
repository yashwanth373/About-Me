import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.List;
import java.sql.*;
import java.lang.*;

public class ChangeTemp extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        // Get all details from from url.
        String userID="";
        HttpSession session = request.getSession(false);
        userID=(String)session.getAttribute("userID");

        String newTemp=request.getRequestURL().toString().split("/")[5];
        //conn to db
        Connection conn = null;
        PreparedStatement ps = null;
        try { 
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/allaboutme?allowPublicKeyRetrieval=true&useSSL=false", "yashwanth", "HelloWorld123");
            String sql="Update users set template=? where userid=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,newTemp);
            ps.setString(2,userID);
            int i = ps.executeUpdate();
            if(i>0){
                log("Successfully updated");
                response.sendRedirect(request.getContextPath() + "/profile/"+userID);
            }
            
        }
        catch(SQLException ex) {
            pw.println(ex);
            ex.printStackTrace();
        }
        catch(ClassNotFoundException ex){
            ex.printStackTrace();
        }

        // Create cookie.
        // Write output to browser.
        pw.close();
}
}