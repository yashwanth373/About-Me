<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>P2 Template</title>
  </head>
  <body></body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TEMPLATE P2</title>
<link href="https://fonts.googleapis.com/css2?family=DM+Mono&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>
<link rel="stylesheet" href= "./style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div align = "center" >
	<div class = "container" id = "boundary" >
   		<input id = "Username" placeholder  = "Full Name"  style = "text-align :center; "></input>
	   	<div id = "Userdetails">
	   		<div style = "float:left ;" >
	   			<div class="row">
				  <div class="col-sm-4" style = "margin : 0 px ; padding :0px ; ">
				  	<ul class= "labels">
				  	   <li>Status </li>
				  	   <li>Dob </li>
				  	   <li>Address </li>
				  	   <li>Know me </li>
				  	</ul>
				  </div>
				  <div class="col-sm-8">
					  <ul>
					  	<li><input /></li>
					  	<li><input type= "date" /></li>
					  	<li><input /></li>
					  	<li><textarea style = "resize : none ; height: 200px;  width:400px; overflow :none;" ></textarea></li>
					  </ul>
				  	
				  </div>
				</div>
	   		</div>
	   		<div>
	   			<img id = "Profileimage" src = "./Picture1.png" alt = "profile image" onclick = "getImage()" /><br/>
	   			click on the image to choose profile picture
	   			<input  type="file" id="imagefile" style = "display : none ; ">
	   		</div>
	   		<script type="text/javascript">
	   			function getImage(){
	   			var  e = document.getElementById("imagefile"); 
	   			e.click();
	   			}
	   		</script>
	   	</div>
	   	<div align="start">
	   	<h2>Education</h2>
	   	<pr>Enter past 3 years details</pr>
	   	</div>
	   	<div class = "row" id = "EduDetails">
	   		<div class = "school col-lg-4" align = "start">
	   			<p>Name: </p> <input type = "text" name = "schoolName"/>
	   			<p>From: </p> <input type = "date" name = "schoolFrom"/>
	   			<p>To: </p> <input type = "date" name = "schoolTo"/>
	   		</div>
	   		<div class = "school col-lg-4" align = "start">
	   			<p>Name: </p> <input type = "text" name = "schoolName"/>
	   			<p>From: </p> <input type = "date" name = "schoolFrom"/>
	   			<p>To: </p> <input type = "date" name = "schoolTo"/>
	   		</div>
	   		<div class = "school col-lg-4" align = "start">
	   			<p>Name: </p> <input type = "text" name = "schoolName"/>
	   			<p>From: </p> <input type = "date" name = "schoolFrom"/>
	   			<p>To: </p> <input type = "date" name = "schoolTo"/>
	   		</div>
	   	</div>
	   	<div align= "start">
	   	<h2>Technical Skills</h2>
	   	<p>enter all your technical skills seperated by ";"</p>
	   	</div>
	   	<div id = "Techskills">
	   		<input type = "text" >
	   		<script type="text/javascript">
	   			
	   		</script>
	   	</div>
	   	<div align= "start">
		   	<h2>Experience</h2>
		   	<p>enter your past three experiences, if any</p>
		</div>
	   	<div class = "row" id = "Experience">
	   		<div class = "school col-lg-4" align = "start">
	   			<p>Job Role: </p> <input type = "text" name = "jobRole"/>
	   			<p>At: </p> <input type = "text" name = "jobAt"/>
	   			<p>From: </p> <input type = "date" name = "jobFrom"/>
	   			<p>To: </p> <input type = "date" name = "jobTo"/>
	   			<p>Description: </p> <textarea style = "resize : none ; height: 100px;  width:350px; overflow :none;" name = "jobDesc" ></textarea>
	   		</div>
	   		<div class = "school col-lg-4" align = "start">
	   			<p>Job Role: </p> <input type = "text" name = "jobRole"/>
	   			<p>At: </p> <input type = "text" name = "jobAt"/>
	   			<p>From: </p> <input type = "date" name = "jobFrom"/>
	   			<p>To: </p> <input type = "date" name = "jobTo"/>
	   			<p>Description: </p> <textarea style = "resize : none ; height: 100px;  width:350px; overflow :none;" name = "jobDesc" ></textarea>
	   		</div>
	   		<div class = "school col-lg-4" align = "start">
	   			<p>Job Role: </p> <input type = "text" name = "jobRole"/>
	   			<p>At: </p> <input type = "text" name = "jobAt"/>
	   			<p>From: </p> <input type = "date" name = "jobFrom"/>
	   			<p>To: </p> <input type = "date" name = "jobTo"/>
	   			<p>Description: </p> <textarea style = "resize : none ; height: 100px;  width:350px; overflow :none;" name = "jobDesc" ></textarea>
	   		</div>
	   	</div>
	   	<div align= "start">
		   	<h2>Projects</h2>
		   	<p>enter your past three projects, if any</p>
		</div>
	   	<div id = "Projects" class = "row">
	   		<div class = "school col-lg-4" align = "start">
	   			<p>Title: </p> <input type = "text" name = "projTitle"/>
	   			<p>Link: </p> <input type = "text" name = "projLink"/>
	   			<p>TechStack: </p> <input type = "date" name = "proDesc"/>
	   			<p>Description: </p> <textarea style = "resize : none ; height: 100px;  width:350px; overflow :none;" name = "jobDesc" ></textarea>
	   		</div>
	   		<div class = "school col-lg-4" align = "start">
	   			<p>Title: </p> <input type = "text" name = "projTitle"/>
	   			<p>Link: </p> <input type = "text" name = "projLink"/>
	   			<p>TechStack: </p> <input type = "date" name = "proDesc"/>
	   			<p>Description: </p> <textarea style = "resize : none ; height: 100px;  width:350px; overflow :none;" name = "jobDesc" ></textarea>
	   		</div>
	   		<div class = "school col-lg-4" align = "start">
	   			<p>Title: </p> <input type = "text" name = "projTitle"/>
	   			<p>Link: </p> <input type = "text" name = "projLink"/>
	   			<p>TechStack: </p> <input type = "date" name = "proDesc"/>
	   			<p>Description: </p> <textarea style = "resize : none ; height: 100px;  width:350px; overflow :none;" name = "jobDesc" ></textarea>
	   		</div>
	   	</div>
	   	<div align= "start">
		   	<h2>Achievements</h2>
		   	<p>Enter if any</p>
		</div>
	   	<div id = "Achievements" class  = "row">
	   		<div class = "school col-lg-4" align = "start">
	   			<p>Title:</p> <input type = "text" name = "projTitle"/>
	   			<p>Description: </p> <textarea style = "resize : none ; height: 100px;  width:350px; overflow :none;" name = "jobDesc" ></textarea>
	   		</div>
	   		<div class = "school col-lg-4" align = "start">
	   			<p>Title:</p> <input type = "text" name = "projTitle"/>
	   			<p>Description: </p> <textarea style = "resize : none ; height: 100px;  width:350px; overflow :none;" name = "jobDesc" ></textarea>
	   		</div>
	   		<div class = "school col-lg-4" align = "start">
	   			<p>Title:</p> <input type = "text" name = "projTitle"/>
	   			<p>Description: </p> <textarea style = "resize : none ; height: 100px;  width:350px; overflow :none;" name = "jobDesc" ></textarea>
	   		</div>
	   	</div>
	   	<div align= "start">
		   	<h2>Coding Profiles</h2>
		   	<p>Rating based</p>
		</div>
		<div class  = "row" id = "CodingProfiles" align = "start">
			<div class  = "col-md-4" >
			<p>Profile Link:</p> <input>
			<p>Current Rating:</p> <input>
			</div>
			<div class  = "col-md-4" >
			<p>Profile Link:</p> <input>
			<p>Current Rating:</p> <input>
			</div>
			<div class  = "col-md-4"  id = "graph" align = "start" >
				<div class = "levelbar" style = "width:30%; background-color:#F04E1A;" align = "end">30%</div>
				<div class = "levelbar" style = "width:63%; background-color:#5EE055;"align = "end">63%</div>
				<div class = "levelbar" style = "width:55%; background-color: #4A42E6;"align = "end" >55%</div>
			</div>
		</div>
   	</div>

</div>
   
</body>
</html>