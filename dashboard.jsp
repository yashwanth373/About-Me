<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        a{
            cursor: pointer;
        }
    </style>
  </head>
  <body>
      <% 
        String userID=request.getRequestURL().toString().split("/")[5];
        String template_id=""; 
        /*=Connection to DB*/ 
        java.sql.Connection conn=null; 
        java.sql.Statement stmt=null; 
        try { 
            Class.forName("com.mysql.jdbc.Driver"); 
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/allaboutme?allowPublicKeyRetrieval=true&useSSL=false","yashwanth", "HelloWorld123"); stmt = conn.createStatement(); 
        }
        catch(SQLException ex) { 
            out.println(ex); 
            ex.printStackTrace(); 
        }
        catch(ClassNotFoundException ex){ 
            ex.printStackTrace(); 
        }
        java.sql.PreparedStatement pst = conn.prepareStatement("Select template from users where userid=?"); 
        pst.setString(1, userID); 
        java.sql.ResultSet rs = pst.executeQuery(); 
        if(rs.next()){
            template_id=rs.getString("template");
        } 
    %>
    <!-- Checking if profile viewer is the user or not -->
    <% 
        String loggedUserID="";
        String Secret="";
        if((String)session.getAttribute("userID")!=null){
            loggedUserID=(String)session.getAttribute("userID");
            Secret=(String)session.getAttribute("Secret");
        }
         if(Secret.equals("About-Me-Secret-Word") && loggedUserID.equals(userID)){ %>
             <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
    <a class="navbar-brand" >About-Me</a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle"  id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Change Template
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <% 
                    if(!template_id.equals("K8")){ %>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/changetemp/K8">K8 Template</a></li>
                <%  }
                    if(!template_id.equals("M0")){ %>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/changetemp/M0">M0 Template</a></li>
                <%    }
                    if(!template_id.equals("P2")){ %>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/changetemp/P2">P2 Template</a></li>
                <%    }
                    if(!template_id.equals("Q5")){ %>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/changetemp/Q5">Q5 Template</a></li>
                <%    }
                    if(!template_id.equals("Q9")){ %>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/changetemp/Q9">Q9 Template</a></li>
                <%    }
                    if(!template_id.equals("R0")){ %>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/changetemp/R0">R0 Template</a></li>
                <%    }
                %>
            </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%=request.getContextPath()%>/details/<%=userID%>">Edit Details</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%=request.getContextPath()%>/logout">Logout</a>
        </li>
      </ul>
    </div>
  </div>
            </nav>
      <%   }
    
    %>

    <% 
        if(template_id.equals("K8")){ %>
            <jsp:include page="/K8_template.jsp">
                <jsp:param name="id" value="<%=userID%>"/>
            </jsp:include>
    <%    }
        else if(template_id.equals("M0")){ %>
            <jsp:include page="/M0_template.jsp">
                <jsp:param name="id" value="<%=userID%>"/>
            </jsp:include>
    <%    }
        else if(template_id.equals("P2")){ %>
            <jsp:include page="/P2_template.jsp">
                <jsp:param name="id" value="<%=userID%>"/>
            </jsp:include>
    <%    }
        else if(template_id.equals("Q5")){ %>
            <jsp:include page="/Q5_template.jsp">
                <jsp:param name="id" value="<%=userID%>"/>
            </jsp:include>
    <%    }
        else if(template_id.equals("Q9")){ %>
            <jsp:include page="/Q9_template.jsp">
                <jsp:param name="id" value="<%=userID%>"/>
            </jsp:include>
    <%    }
        else if(template_id.equals("R0")){ %>
            <jsp:include page="/R0_template.jsp">
                <jsp:param name="id" value="<%=userID%>"/>
            </jsp:include>
    <%    }
    
    
    %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  </body>
</html>
