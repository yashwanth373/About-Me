import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.List;
import java.sql.*;
import java.lang.*;

public class Logout extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        // Get all details from from url.
        HttpSession session = request.getSession(false);
        session.removeAttribute("userID");
        session.removeAttribute("Secret");

        // Create cookie.
        // Write output to browser.
        pw.close();
}
}