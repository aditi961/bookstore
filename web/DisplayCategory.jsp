<%-- 
    Document   : MainPage
    Created on : May 18, 2018, 2:06:46 AM
    Author     : nEW u
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%!
    String uname, title, desc, price, qty, query, driver, url, user, pass, q;
    Connection con;
    Statement stat;
    ResultSet rs;
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Book Store Template, Free CSS Template, CSS Website Layout</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <%
            String user=(String)session.getAttribute("uname");
            if(user==null)
            {
                response.sendRedirect("index.jsp");
            }
            
        %>
<!--  Free CSS Templates from www.templatemo.com -->
<div id="templatemo_container">
	<div id="templatemo_menu">
    	<ul>
            <li><a href="MainPage.jsp" class="current">Home</a></li>
            <li><a href="subpage.html">Search</a></li>
            <li><a href="subpage.html">Books</a></li>            
            <li><a href="subpage.html">New Releases</a></li>  
            <li><a href="#">Company</a></li> 
            <li><a href="ContactUs.jsp">Contact</a></li>
            <li><a href ="LogOut.jsp">LogOut</a></li>
            <li>Welcome  <%=user%></li>
            <li><img src="<%=user%>.jpg"/></li>
    	</ul>
    </div> <!-- end of menu -->
    
    <div id="templatemo_header">
    	<div id="templatemo_special_offers">
        	<p>
                <span>25%</span> discounts for
        purchase over $80
        	</p>
			<a href="subpage.html" style="margin-left: 50px;">Read more...</a>
        </div>
        
        
        <div id="templatemo_new_books">
        	<ul>
                <li>Suspen disse</li>
                <li>Maece nas metus</li>
                <li>In sed risus ac feli</li>
            </ul>
            <a href="subpage.html" style="margin-left: 50px;">Read more...</a>
        </div>
    </div> <!-- end of header -->
    
    <div id="templatemo_content">
    	
        <div id="templatemo_content_left">
        	<div class="templatemo_content_left_section">
            	<h1>Categories</h1>
                <ul>
                    <li><a href="DisplayCategory.jsp?q=C001">C Programming</a></li>
                    <li><a href="DisplayCategory.jsp?q=C002">C++ Programming</a></li>
                    <li><a href="DisplayCategory.jsp?q=C003">Core Java Programming</a></li>
                    <li><a href="DisplayCategory.jsp?q=C004">Advance Java Programming</a></li>
                    <li><a href="DisplayCategory.jsp?q=C005">C# Programming</a></li>
                    <li><a href="DisplayCategory.jsp?q=C006">PHP Programming</a></li>
                    <li><a href="DisplayCategory.jsp?q=C007">HTML5 Programming</a></li>
                    <li><a href="DisplayCategory.jsp?q=C008">Python Programming</a></li>
                    <li><a href="DisplayCategory.jsp?q=C009">Asp.net Programming</a></li>
            	</ul>
            </div>
			<div class="templatemo_content_left_section">
            	<h1>Bestsellers</h1>
                <ul>
                    <li><a href="#">Let Us C</a></li>
                    <li><a href="#">Test Your C Skills</a></li>
                    <li><a href="#">PHP & MySQL Development</a></li>
                    <li><a href="#">Programming In Python 3</a></li>
                    <li><a href="#">Java Black Book</a></li>
                    <li><a href="#">Programming With Java</a></li>
                    <li><a href="#">Dive Into Python 3</a></li>
                    <li><a href="#">HTML5 Unleashed</a></li>
                    <li><a href="#">Advanced PHP Programming</a></li>
                    <li><a href="http://www.photovaco.com" target="_parent">Head First SQL</a></li>
            	</ul>
            </div>
            
            <div class="templatemo_content_left_section">                
                <a href="http://validator.w3.org/check?uri=referer"><img style="border:0;width:88px;height:31px" src="http://www.w3.org/Icons/valid-xhtml10" alt="Valid XHTML 1.0 Transitional" width="88" height="31" vspace="8" border="0" /></a>
<a href="http://jigsaw.w3.org/css-validator/check/referer"><img style="border:0;width:88px;height:31px"  src="http://jigsaw.w3.org/css-validator/images/vcss-blue" alt="Valid CSS!" vspace="8" border="0" /></a>
			</div>
        </div> <!-- end of content left -->
        
        <div id="templatemo_content_right">
             <%
                        q = request.getParameter("q");
                        driver = config.getServletContext().getInitParameter("driver");
                        url = config.getServletContext().getInitParameter("url");
                        user = config.getServletContext().getInitParameter("user");
                        pass = config.getServletContext().getInitParameter("pass");
                        Class.forName(driver);
                        con = DriverManager.getConnection(url, user, pass);
                        query = "select * from product where categoryid='" + q + "'";
                        stat = con.createStatement();
                        rs = stat.executeQuery(query);
                        while (rs.next()) {
                    %>
        	<div class="templatemo_product_box">
            	<h1><%= rs.getString(2)%> </h1>
                        <img src="uploads/<%= rs.getString(2)%>.jpg" alt="image" width="100" height="150"/>
                        <div class="product_info">
                            <p><%= rs.getString(3)%></p>
                            <h3>Rs. <%=rs.getString(4)%></h3>
                            <div class="buy_now_button"><a href="AddToCart?q=<%= rs.getString(1)%>">Add To Cart</a></div>
<!--                            <div class="detail_button"><a href="subpage.html">Detail</a></div>-->
                        </div>
                        <div class="cleaner">&nbsp;</div>
                    </div>
<%
                        }
                    %>
            
            <div class="cleaner_with_width">&nbsp;</div>
            </div>
            
            <div class="cleaner_with_height">&nbsp;</div>
    </div> <!-- end of content -->
    
    <div id="templatemo_footer">
    
	       <a href="subpage.html">Home</a> | <a href="subpage.html">Search</a> | <a href="subpage.html">Books</a> | <a href="#">New Releases</a> | <a href="#">FAQs</a> | <a href="#">Contact Us</a><br />
        Copyright © 2024 <a href="#"><strong>Your Company Name</strong></a> 
        <!-- Credit: www.templatemo.com -->	</div> 
    <!-- end of footer -->
<!--  Free CSS Template www.templatemo.com -->
</div> <!-- end of container -->
<!-- templatemo 086 book store -->
<!-- 
Book Store Template 
http://www.templatemo.com/preview/templatemo_086_book_store 
-->
</body>
</html>

