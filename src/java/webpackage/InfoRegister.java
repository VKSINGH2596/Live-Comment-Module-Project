/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webpackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.*;
/**
 *
 * @author sureshkumar
 */
public class InfoRegister extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        if(request.getParameter("adminlogin") != null) {
            
        }
        
        else if(request.getParameter("normalpost") != null) {
          
            String uname = request.getParameter("username");
            String email = request.getParameter("useremail");
            String mobile = request.getParameter("usermobile");
            String message = request.getParameter("comment");
            //Making connection to the Database
            try{
                Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/WebApp";
            try { 
            Connection con = DriverManager.getConnection(url,"","");
            String query = "INSERT INTO LiveUpdate VALUES(?,?,?,?)";                    //Storing Data to database
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,uname);
            ps.setString(2,email);
            ps.setString(3,mobile);
            ps.setString(4,message);
            int i = ps.executeUpdate();
            
            if(i>0) {
//                    UserBean ub = new UserBean();
//                    ub.setEmail(email);
//                    ub.setMessage(message);
//                    ub.setUserName(uname);
//                    ub.setMobile(mobile);
//                
                    HttpSession session = request.getSession(true);
                    session.setAttribute("newPost", con);

                    response.sendRedirect("index.jsp");
            }
            }
            catch(SQLException e) {
                e.printStackTrace();
                System.out.println("Connection Error!");
            }
            } catch(ClassNotFoundException e) {
                System.out.println(e);
            }
            
        }
    }
}
