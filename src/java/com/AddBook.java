/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.servlet.*;
/**
 *
 * @author nEW u
 */
public class AddBook extends HttpServlet {

    PrintWriter pw;
    ServletContext ctx;
    Connection con;
    PreparedStatement ps;
    String driver,url,user,pass,query,id,title,desc,catid,path;
    int qty;
    double price;
    ServletFileUpload sfu;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        pw=response.getWriter();
        ctx=request.getServletContext();
        driver=ctx.getInitParameter("driver");
        url=ctx.getInitParameter("url");
        user=ctx.getInitParameter("user");
        pass=ctx.getInitParameter("pass");
        path=ctx.getInitParameter("path");
        boolean isMultipart=ServletFileUpload.isMultipartContent(request);
        if(isMultipart)
        {
            sfu=new ServletFileUpload();
            try
            {
                FileItemIterator fii=sfu.getItemIterator(request);
                while(fii.hasNext())
                {
                    FileItemStream fis=fii.next();
                    if(fis.isFormField())
                    {
                        //form logic
                        String field=fis.getFieldName();
                        InputStream is=fis.openStream();
                        byte[] b=new byte[is.available()];
                        is.read(b);
                        String val=new String(b);
                        if(field.equalsIgnoreCase("txtid"))
                        {
                            id=val;
                        }
                        else if(field.equals("txtTitle"))
                        {
                            title=val;
                        }
                        else if(field.equals("txtDesc"))
                        {
                            desc=val;
                        }
                        else if(field.equals("txtPrice"))
                        {
                            price=Double.parseDouble(val);
                        }
                        else if(field.equals("txtQty"))
                        {
                            qty=Integer.parseInt(val);
                        }
                        else if(field.equals("ddlCatID"))
                        {
                            catid=val;
                        }
                    }
                    else
                    {
                        //file uplaoding logic
                        if(Uploader.processFile(path, fis, title))
                        {
                            
                        }
                    }
                }
            }
            catch(FileUploadException fue)
            {
                pw.println(fue.getMessage());
            }
            
            try
            {
                Class.forName(driver);
                con=DriverManager.getConnection(url, user, pass);
                query="Insert into product values(?,?,?,?,?,?)";
                ps=con.prepareStatement(query);
                ps.setString(1,id);
                ps.setString(2,title);
                ps.setString(3,desc);
                ps.setDouble(4, price);
                ps.setInt(5,qty);
                ps.setString(6,catid);
                int a=ps.executeUpdate();
                if(a==1)
                {
                    pw.println("<script type=text/javascript>alert('Book Added Successfully!');location.replace('admin/adminhome.jsp');</script>");
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
