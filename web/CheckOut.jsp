<%-- 
    Document   : mainpage
    Created on : 21 Jul, 2016, 3:42:50 PM
    Author     : JAhnvi
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    String uname;
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type='text/css' rel='stylesheet' href='style.css'/>
        
        <title>JSP Page</title>
    </head>
    <body>
        <%
            uname=(String)session.getAttribute("uname");
            if(uname==null)
            {
                response.sendRedirect("index.jsp");
            }
            %>
            <div id="templatemo_container">
	<div id="templatemo_menu">
    	<ul>
            <li><a href="mainpage.jsp" class="current">Home</a></li>
            <li><a href="showcart.jsp">My Cart</a></li>
            <li><a href="subpage.html">Books</a></li>            
            <li><a href="subpage.html">New Releases</a></li>  
            <li><a href="#">Company</a></li> 
            <li><a href="contactus.jsp">Contact</a></li>
            <li><a href="logout.jsp">LogOut</a></li>
            <li style="text-align:right;">Welcome ${uname}</li>
            <li><img src="uploads/${uname}.jpg" width="50" height="30" style="vertical-align:top" /></li>
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
                    <li><a href="displaycategory.jsp?q=C001">C Programming</a></li>
                    <li><a href="displaycategory.jsp?q=C002">C++ Programming</a></li>
                    <li><a href="displaycategory.jsp?q=C003">Core Java Programming</a></li>
                    <li><a href="displaycategory.jsp?q=C004">Advance Java Programming</a></li>
                    <li><a href="displaycategory.jsp?q=C005">C# Programming</a></li>
                    <li><a href="displaycategory.jsp?q=C006">PHP Programming</a></li>
                    <li><a href="displaycategory.jsp?q=C007">HTML5 Programming</a></li>
                    <li><a href="displaycategory.jsp?q=C008">Python Programming</a></li>
                    <li><a href="displaycategory.jsp?q=C009">Asp.net Programming</a></li>
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
                <a href="http://validator.w3.org/check?uri=referer"><img style="border:0;width:88px;height:31px" src="http://www.w3.org/Icons/valid-xhtml10" alt="Valid 
XHTML 1.0 Transitional" width="88" height="31" vspace="8" border="0" /></a>
<a href="http://jigsaw.w3.org/css-validator/check/referer"><img style="border:0;width:88px;height:31px"  src="http://jigsaw.w3.org/css-validator/images/vcss-blue" 
alt="Valid CSS!" vspace="8" border="0" /></a>
			</div>
        </div> <!-- end of content left -->
        

        <div id="templatemo_content_right">
            <%!
                String amount;
                %>
                <%
                    amount=request.getParameter("q");
                    
                    %>
                    <p>
                        Thanks for shopping from our website.Your total 
                        amount for shopping is <%=amount%> .We will deliver your order
                        at the mentioned address with in next 7 working days.Have a nice time ahead.
                    </p>
        </div>
    
    <div id="templatemo_footer">
    
	       <a href="subpage.html">Home</a> | <a href="subpage.html">Search</a> | <a href="subpage.html">Books</a> | <a href="#">New Releases</a> | <a 
href="#">FAQs</a> | <a href="#">Contact Us</a><br />
        Copyright © 2024 <a href="#"><strong>Your Company Name</strong></a> 
        <!-- Credit: www.templatemo.com -->	</div> 
    <!-- end of footer -->
<!--  Free CSS Template www.templatemo.com -->
</div> <!-- end of container -->
    </body>
</html>
