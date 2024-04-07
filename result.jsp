<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% response.setHeader("cache-control", "no-cache, no-store"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Result</title>
<link rel="stylesheet" type="text/css" href="style1.css">
</head>
<body>
		<header>
			<div class="title">
			<p>Government of Tamil Nadu</p>
			<p>Directorate of Government Examinations</p>
			</div>
		</header>
		<div class="sslc">
		<div class="simg"><img src="images/icon07.gif"></div>
		<h2>SSLC  Examination Results  April 2023</h2>
		</div>
		
		<%@ page import="java.sql.Connection" %>
		<%@ page import="java.sql.*" %>
		<%@ page import="java.sql.DriverManager" %>
		<%@ page import="java.sql.ResultSet" %>
		<%@ page import="java.sql.PreparedStatement" %>
	<% 
    String name = "";
    int tamil = 0;
    int eng = 0;
    int maths = 0;
    int science = 0;
    int social = 0;
    
    int total=0;
    
    String res="";
    String rollno = request.getParameter("rollno");
    String dob = request.getParameter("dob");
    
    try {
        String dburl = "jdbc:mysql://localhost/sslc";
        String user = "root";
        String dbpass = "bala";
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(dburl, user, dbpass);
        String q = "SELECT * FROM result WHERE rollno = ? AND dob = ?;";
        PreparedStatement pst = con.prepareStatement(q);
        pst.setString(1, rollno);
        pst.setString(2, dob);
        
        ResultSet rs = pst.executeQuery();
        
        if (rs.next()) {
            name = rs.getString("name");
            tamil = rs.getInt("tamil");
            eng = rs.getInt("eng");
            maths = rs.getInt("maths");
            science = rs.getInt("science");
            social = rs.getInt("social");
        } else {
            response.sendRedirect("error.html");
            return;
        }
        
        rs.close();
        pst.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error Occurred: " + e.getMessage());
    }
	%>


	<% if(tamil>35 && eng>35 && maths>35 && science>35 && social>35){
			res="PASS";
		}
	
	else if(tamil<35 || eng<35 || maths<35 || science<35 || social<35){
			res="FAIL";
		}
	 total=(tamil+eng+maths+science+social);
	%>
		<div class="restab">
			<table border="1" rules="all" >
			<tr><td colspan="2"><%= name+" ("+rollno+")" %></td></tr>
			<tr><td>SUBJECT</td><td>MARKS</td></tr>
			<tr><td>TAMIL</td><td><%= tamil %></td></tr>
			<tr><td>ENGLISH</td><td><%= eng %></td></tr>
			<tr><td>MATHS</td><td><%= maths %></td></tr>
			<tr><td>SCIENCE<br/>(THEORY + PARCTICAL)</td><td><%= science %></td></tr>
			<tr><td>SOCIAL SCIENCE</td><td><%= social %></td></tr>
			<tr><td>TOTAL</td><td><%= total %></td></tr>
			<tr><td>RESULT</td><td><%= res %></td></tr>
		</table>
		</div><br><br>
		 
        <div class="back">
        <a href="index.html">Back</a> 
        </div>
        <div class="data" style="font-family: Arial, Helvetica, sans-serif;
									font-size: 12px;
									font-weight: bold;
									text-decoration: none;
									padding:.1.2em; display: flex;
	justify-content:center;">
        <p>Data Processed at Government Data Centre, Chennai</p>
        </div>
</body>
</html>
