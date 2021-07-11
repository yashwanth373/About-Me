<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>    
<!DOCTYPE html>
<html>
<head>	
 	<title>Show Your Might - Dark Themed</title>
	<link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Source+Code+Pro:ital,wght@0,300;1,200&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="k8styles.css">
</head>
<body>
<% 
        String userID=request.getParameter("id");
        java.sql.Connection conn=null; 
        String name = "name";
        try { 
            Class.forName("com.mysql.jdbc.Driver"); 
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wtproj?allowPublicKeyRetrieval=true&useSSL=false", "username", "password"); 
        
            java.sql.PreparedStatement pstpersonal = conn.prepareStatement("Select * from users where userid=?"); 
            pstpersonal.setString(1, userID); 
            java.sql.ResultSet rspersonal = pstpersonal.executeQuery(); 
            if(rspersonal.next()){
            	%>
            	
	            <div class="leftBox">
					<div class="imageBox" style="background-image: linear-gradient(to top, black, transparent),
    url('<%=rspersonal.getString("IMAGE") %>');">
						<div class="imageText">
	            
		            	<h2 class="text"><%=rspersonal.getString("FNAME")+" "+rspersonal.getString("LNAME") %></h2><br />
						<%
						name = rspersonal.getString("FNAME")+" "+rspersonal.getString("LNAME");
						java.sql.PreparedStatement pstinterns = conn.prepareStatement("Select * from internship where userid=?"); 
			            pstinterns.setString(1, userID); 
			            java.sql.ResultSet rsinterns = pstinterns.executeQuery(); 
			            if(rsinterns.next()){
			              %>
			              	<h4 class="text"><%=rsinterns.getString("ROLE") %></h4>
						 	<p class="text"><i class="text"><%=rsinterns.getString("COMPANY") %></i></p>
			              <%
			              }
						%>
						
						</div>
					</div>
				</div>
				
				
				
				
				<div class="bottomBox">
				<%
				java.sql.PreparedStatement pstsoc = conn.prepareStatement("Select * from social where userid=?"); 
				pstsoc.setString(1, userID); 
	            java.sql.ResultSet rssoc = pstsoc.executeQuery(); 
	            Dictionary<String, String> social = new Hashtable<String, String>();
	            while(rssoc.next()){
	            	social.put(rssoc.getString("SITE"), rssoc.getString("LINK"));
	            }
	            
				%>
					<div class="socialLinks">
						<% if(social.get("linkedin")!=null)%> <a href="<%=social.get("linkedin") %>" target="_blank"><i class='fa fa-linkedin socialButton' style='font-size:24px; background: transparent;'></i></a>
						<% if(social.get("github")!=null)%> <a href="<%=social.get("github") %>" target="_blank"><i class='fa fa-github socialButton' style='font-size:24px; background: transparent;'></i></a>
						<% if(social.get("twitter")!=null)%> <a href="<%=social.get("twitter") %>" target="_blank"><i class='fa fa-twitter socialButton' style='font-size:24px; background: transparent;'></i></a>
					</div>
					<% if(rspersonal.getString("EMAIL")!=null)%><p class="email"><i class="fa fa-envelope icon-gradient"></i> <%=rspersonal.getString("EMAIL") %></p>
					<% if(rspersonal.getString("PHONE")!=null)%><p class="mobile"><i class="fa fa-phone icon-gradient"></i> <%=rspersonal.getString("PHONE") %></p>
				</div>	
            	<%
            }
            
            
            %>
            <div class="rightBox">
				<div class="inRight myscroller-notrack">
					<div class="header">
						<h1>Hi There!</h1>
						<br />
						<p style="display:  inline-block">I'm &nbsp;<p style="display:  inline-block; font-size: 24px;"><%=name %></p>
					</div>
            <%
            
            
            
            java.sql.PreparedStatement pstinterns = conn.prepareStatement("Select * from internship where userid=?"); 
            pstinterns.setString(1, userID); 
            java.sql.ResultSet rsinterns = pstinterns.executeQuery(); 
            if(rsinterns.next()){
            	%>
            	<div class="section">
    			<div>
    			<h3>WORK EXPERIENCE</h3>
    			<hr />
    			<div class="squareTileContainer">
	    			<div class="squareTile">
						<img class = "squareTileImage" src="<%=rsinterns.getString("IMGURL") %>">
						<h4><i class="fa fa-briefcase gradient"></i> <%=rsinterns.getString("ROLE") %></h4>
						<p><i class="fa fa-building gradient"></i> <%=rsinterns.getString("COMPANY") %></p>
					</div>
    			<%
            	}
    			while(rsinterns.next()){
    				%>
    				<div class="squareTile">
						<img class = "squareTileImage" src="<%=rsinterns.getString("IMGURL") %>">
						<h4><i class="fa fa-briefcase gradient"></i> <%=rsinterns.getString("ROLE") %></h4>
						<p><i class="fa fa-building gradient"></i> <%=rsinterns.getString("COMPANY") %></p>
					</div>
    				<%
    			}
            %>
	            </div>
				</div>
			</div>
			<br />
            <%
            
            
            
            java.sql.PreparedStatement pstproj = conn.prepareStatement("Select * from projects where userid=?"); 
            pstproj.setString(1, userID); 
            java.sql.ResultSet rsproj = pstproj.executeQuery(); 
            if(rsproj.next()){
            	%>
            	<div class="section">
    			<div>
    			<h3>PROJECTS</h3>
    			<hr />
    			<div class="squareTileContainer">
	    			<div class="squareTile">
	    				<%if(rsproj.getString("IMGURL") != null) {%>
						<img class = "squareTileImage" src="<%=rsproj.getString("IMGURL") %>">
						<%}else{ %>
						<div class="space"></div>
						<%} %>
						<h4><%=rsproj.getString("TITLE") %></h4>
					</div>
    			<%
            	}
    			while(rsproj.next()){
    				%>
    				<div class="squareTile">
	    				<%if(rsproj.getString("IMGURL") != null) {%>
						<img class = "squareTileImage" src="<%=rsproj.getString("IMGURL") %>">
						<%}else{ %>
						<div class="space"></div>
						<%} %>
						<h4><%=rsproj.getString("TITLE") %></h4>
					</div>
    				<%
    			}
            %>
	            </div>
				</div>
			</div>
			<br />
            <%
            
            
            
            
            
            
            
            java.sql.PreparedStatement psted = conn.prepareStatement("Select * from education where userid=?"); 
            psted.setString(1, userID); 
            java.sql.ResultSet rsed = psted.executeQuery(); 
            if(rsed.next()){
            	%>
            	<div class="section">
    			<div>
    			<h3>EDUCATION</h3>
    			<hr />
    			<div class="squareTileContainer">
	    			<div class="squareTile">
	    				<div class="space"></div>
						<h4><%=rsed.getString("TYPE") %></h4>
						<p><%=rsed.getString("GRADE") %></p>
						<p><%=rsed.getString("START") %>-<%=rsed.getString("END") %></p>
						<h5><%=rsed.getString("NAME") %></h5>
					</div>
    			<%
            	}
    			while(rsed.next()){
    				%>
    				<div class="squareTile">
	    				<div class="space"></div>
						<h4><%=rsed.getString("TYPE") %></h4>
						<p><%=rsed.getString("GRADE") %></p>
						<p><%=rsed.getString("START") %>-<%=rsed.getString("END") %></p>
						<h5><%=rsed.getString("NAME") %></h5>
					</div>
    				<%
    			}
            %>
	            </div>
				</div>
			</div>
			<br />
            <%
            
            
            
            
            
            
            
            java.sql.PreparedStatement psttech = conn.prepareStatement("Select * from tech where userid=?"); 
            psttech.setString(1, userID); 
            java.sql.ResultSet rstech = psttech.executeQuery(); 
            if(rstech.next()){
            	%>
            	<div class="section">
    			<div>
    			<h3>TECH</h3>
    			<hr />
    			<div class="squareTileContainer">
	    			<div class="miniTile">
						<p><%=rstech.getString("NAME") %></p>
					</div>
    			<%
            	}
    			while(rstech.next()){
    				%>
    				<div class="miniTile">
						<p><%=rstech.getString("NAME") %></p>
					</div>
    				<%
    			}
            %>
	            </div>
				</div>
			</div>
			<br />
            <%
            
           
            java.sql.PreparedStatement pslang = conn.prepareStatement("Select * from languages where userid=?"); 
            pslang.setString(1, userID); 
            java.sql.ResultSet rslang = pslang.executeQuery(); 
            if(rslang.next()){
            	%>
            	<div class="section">
    			<div>
    			<h3>PROGRAMMING LANGUAGES</h3>
    			<hr />
    			<div class="squareTileContainer">
	    			<div class="miniTile">
						<p><%=rslang.getString("NAME") %></p>
					</div>
    			<%
            	}
    			while(rslang.next()){
    				%>
    				<div class="miniTile">
						<p><%=rslang.getString("NAME") %></p>
					</div>
    				<%
    			}
            %>
	            </div>
				</div>
			</div>
			<br />
            <%
            
            
            java.sql.PreparedStatement pstach = conn.prepareStatement("Select * from achievements where userid=?"); 
            pstach.setString(1, userID); 
            java.sql.ResultSet rsach = pstach.executeQuery(); 
            int c = 0;
            if(rsach.next()){
            	%>
            	<div class="section">
    			<div>
    			<h3>ACHIEVEMENTS</h3>
    			<hr />
    			<div class="squareTileContainer">
	    			<%if(c%2 == 0) {%>
	    			<div class="blockquoteLeft">
	    			<%}else { %>
	    			<div class="blockquoteRight">
	    			<%} %>
					<%=rsach.getString("DESCRIPTION") %>
					</div>
    			<%
    			c += 1;
            	}
    			while(rsach.next()){
    				%>
    				<%if(c%2 == 0) {%>
	    			<div class="blockquoteLeft">
	    			<%}else { %>
	    			<div class="blockquoteRight">
	    			<%} %>
					<%=rsach.getString("DESCRIPTION") %>
					</div>
    				<%
    				c += 1;
    			}
            %>
	            </div>
				</div>
			</div>
			<br />
            <%
        }
        catch(SQLException ex) { 
            out.println(ex); 
            ex.printStackTrace(); 
        }
        catch(ClassNotFoundException ex){ 
            ex.printStackTrace(); 
        }
%>

			






		<div class="bottomSpace">
		</div>


	</div>
	
</div>


</body>
</html>
