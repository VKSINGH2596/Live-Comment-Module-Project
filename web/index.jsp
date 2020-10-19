<%-- 
    Document   : index.jsp
    Created on : 29 Sep, 2020, 2:47:11 PM
    Author     : sureshkumar
--%>

<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import="java.sql.*"
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<style>
   body {
      font-family: Arial;
      color: black;
   }
   .left {
      height: 100%;
      width: 30%;
      position: fixed;
      overflow-x: hidden;
      padding-top: 20px;
   }
    .right {
      height: 100%;
      width: 70%;
      position: fixed;
      overflow-x: hidden;
      padding-top: 20px;
   }
   .left {
      left: 0;
      background-color: #EFECD9;
   }
   .right {
      right: 0;
      background-color: #E1EAFF;
   }
   .centered {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      text-align: center;
   }
   .centered img {
      width: 150px;
      border-radius: 50%;
   }
</style>
</head>
<body>
<h1 style="color: black;">Two column layout grid example</h1>
<div class="left">
    
    <form method="post" action="InfoRegister"><center><table>
        <tr><td><h1>Admin Login</h1></td></tr>
        <tr><td>Email ID:</td><td><input type="text" name="email" value="" required/></td></tr><br/>
        <tr><td>Password:</td><td><input type="password" name="pass" value="" required/></td></tr><br/>
        <tr><td><input type="submit" name="adminlogin" value="LOGIN" /></td></tr>
        </form></table></center>
        <hr>
        <form method="post" action="InfoRegister"><center><table>
        <tr><td><h1>Post your request</h1></td></tr>
        <tr><td>Name:</td><td><input type="text" name="username" value="" required/></td></tr><br/>
        <tr><td>Email:</td><td><input type="email" name="useremail" required/></td></tr><br/>
        <tr><td>Mobile:</td><td><input type="text" name="usermobile" /></td></tr><br/>
        <tr><td>Message:</td><td><textarea rows="4" name="comment" required></textarea></td></tr><br/>
        <tr><td><input type="submit" name="normalpost" value="SUBMIT" onclick=""/></td></tr></table>
        </form>
        
</div>
<div class="right">
    <h1 align="center">iPara</h1>
    
        <div id="add_to_me">
            <% if(session.getAttribute("newPost") != null) {
            String query = "SELECT * FROM LiveUpdate";
            Connection con = (Connection)session.getAttribute("newPost");
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                out.print("<hr/><h2>Comments:</h2>");  
                do {  
                    out.print("<div class='box'>");  
                    out.print("<p>"+rs.getString(4)+"</p>");  
                    out.print("<p><strong>By: "+rs.getString(1)+"</strong></p>");  
                    out.print("</div>");  
                } while(rs.next());
            }
            session.invalidate();
            }%>
        </div>
        
</div>
</body>
</html>