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
public class SaveContact extends HttpServlet {

   Connection con;
   PrintWriter pw;
   PreparedStatement ps;
   ServletContext ctx;
   String query,qname,qemail,qmobile,qaddress,qquery,driver,url,pass,user;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        pw=response.getWriter();
        try{
        
            ctx=request.getServletContext();
            driver=ctx.getInitParameter("driver");
            url=ctx.getInitParameter("url");
            user=ctx.getInitParameter("user");
            pass=ctx.getInitParameter("pass");
            qname=request.getParameter("txtName");
            qemail=request.getParameter("txtEmail");
            qmobile=request.getParameter("txtMobile");
            qaddress=request.getParameter("txtAdd");
            qquery=request.getParameter("txtQuery");
            Class.forName(driver);
            con=DriverManager.getConnection(url, user, pass);
            query="insert into contact(qname,qemail,qmobile,qaddress,qquery)values(?,?,?,?,?)";
            ps=con.prepareStatement(query);
            ps.setString(1, qname);
            ps.setString(2, qemail);
            ps.setString(3, qmobile);
            ps.setString(4, qaddress);
            ps.setString(5, qquery);
            int a=ps.executeUpdate();
            if(a==1)
            {
                pw.println("<script type=text/javascript>alert('Query Saved..!!Our Head will soon try to contact you.');location.replace('MainPage.jsp');</script>");
            }
            else
            {
                pw.println("<script type=text/javascript>alert('Oops!Something went wrong.');location.replace('index.jsp');</script>");
            }
        }
        catch(ClassNotFoundException cnfe)
        {
            pw.println(cnfe.getMessage());
        
        }
        catch(SQLException sqle)
        {
            pw.println(sqle.getMessage());
        }
        catch(Exception e)
        {
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
