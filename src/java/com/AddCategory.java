/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;

/**
 *
 * @author nEW u
 */
public class AddCategory extends HttpServlet {

    Connection con;
    PreparedStatement ps;
    String driver,url,user,pass,query,catId,cname;
    PrintWriter pw;
    ServletContext ctx;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        pw=response.getWriter();
        ctx=request.getServletContext();
        driver=ctx.getInitParameter("driver");
        url=ctx.getInitParameter("url");
        user=ctx.getInitParameter("user");
        pass=ctx.getInitParameter("pass");
        catId=request.getParameter("txtID");
        cname=request.getParameter("txtCategory");
        try
        {
            Class.forName(driver);
            con=DriverManager.getConnection(url, user, pass);
            query="Insert into category(categoryid,name) values(?,?)";
            ps=con.prepareStatement(query);
            ps.setString(1,catId);
            ps.setString(2,cname);
            int a=ps.executeUpdate();
            if(a==1)
            {
                pw.println("<script>alert('Category Added Successfully!');location.replace('admin/adminhome.jsp');</script>");
            }
            else
            {
                pw.println("There was some issue.Please try later! ");
                pw.println("<a href='admin/adminhome.jsp'>Retry</a>");
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
