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
import java.util.LinkedList;
/**
 *
 * @author JAhnvi
 */
public class AddToCart extends HttpServlet {

    String pid,driver,url,user,pass,name,desc,query;
    int qty;
    double price;
    Connection con;
    Statement stat;
    ResultSet rs;
    ServletContext ctx;
    PrintWriter pw;
    Cart cart;
    HttpSession session;
    LinkedList<Cart> lstCart=new LinkedList<Cart>();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        pid=request.getParameter("q");
        pw=response.getWriter();
        ctx=request.getServletContext();
        driver=ctx.getInitParameter("driver");
        url=ctx.getInitParameter("url");
        user=ctx.getInitParameter("user");
        pass=ctx.getInitParameter("pass");
        
        try
        {
            Class.forName(driver);
            con=DriverManager.getConnection(url,user,pass);
            query="Select pname,description,price,qty from product where pid='"+pid+"'";
            stat=con.createStatement();
            rs=stat.executeQuery(query);
            while(rs.next())
            {
                name=rs.getString(1);
                desc=rs.getString(2);
                price=Double.parseDouble(rs.getString(3));
                qty=Integer.parseInt(rs.getString(4));
            }
            cart=new Cart();
            cart.setName(name);
            cart.setDesc(desc);
            cart.setPrice(price);
            cart.setQty(qty);
            lstCart.add(cart);
            session=request.getSession();
            LinkedList<Cart> c=(LinkedList<Cart>)session.getAttribute("Cart");
            if(c==null)
            {
                session.setAttribute("Cart",lstCart);
            }
            pw.println("<script type=text/javascript>alert('Item Added Successfully!');location.replace('DisplayCategory.jsp');</script>");
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
