/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

/**
 *
 * @author nEW u
 */
public class VerifyUser extends HttpServlet {

    Connection con;
    PrintWriter pw;
    Statement stat;
    ResultSet rs;
    HttpSession session;
    ServletContext ctx;
    Cookie c,c1;
    String drv,url,user,pass,query,rem, uname, pswd;
    int a;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        pw = response.getWriter();
        try {
            ctx=request.getServletContext();
            drv=ctx.getInitParameter("driver");
            url=ctx.getInitParameter("url");
            user=ctx.getInitParameter("user");
            pass=ctx.getInitParameter("pass");
            rem=request.getParameter("rem");
            uname = request.getParameter("txtUser");
            pswd = request.getParameter("txtPswd");
            Class.forName(drv);
            con = DriverManager.getConnection(url, user, pass);
            stat = con.createStatement();
            query = "select count(*) from profile where username='" + uname + "' and pswd='" + pswd + "'";
            rs = stat.executeQuery(query);
            while (rs.next()) {
                a = Integer.parseInt(rs.getString(1));
            }
            if (a == 1) {
                session=request.getSession();
                session.setAttribute("uname",uname);
                if(rem!=null && rem.equals("yes"))
                {
                    c=new Cookie("uname",uname);
                    c.setMaxAge(365*24*60*60);
                    response.addCookie(c);
                    c1=new Cookie("pswd",pswd);
                    c1.setMaxAge(365*24*60*60);
                    response.addCookie(c1);
                    response.sendRedirect("MainPage.jsp");
                }
                else
                {
                    response.sendRedirect("MainPage.jsp");
                }
                
            }
            else
            {
                pw.println("<script type=text/javascript>alert('Invalid Username or Password!');location.replace('index.jsp');</script>");
            }
        } catch (ClassNotFoundException cnfe) {
            pw.println(cnfe.getMessage());
        } catch (SQLException sqle) {
            pw.println(sqle.getMessage());
        } catch (Exception e) {
            pw.println(e.getMessage());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
