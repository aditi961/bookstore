
package com;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.servlet.*;


/**
 *
 * @author nEW u
 */
public class SaveUser extends HttpServlet {

     Connection con;
PrintWriter pw;
PreparedStatement ps;
HttpSession session;
ServletContext ctx;
String uname,pswd,state,city,gender,SecQues,SecAns,query,drv,url,user,pass,us,path;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        pw=response.getWriter();
        uname=request.getParameter("txtName");
         pswd=request.getParameter("txtPswd");
         state=request.getParameter("state");
         city=request.getParameter("city");
         gender=request.getParameter("gender");
         SecQues=request.getParameter("SecQues");
         SecAns=request.getParameter("SecAns");
         ctx=request.getServletContext();
            drv=ctx.getInitParameter("driver");
            url=ctx.getInitParameter("url");
            user=ctx.getInitParameter("user");
            pass=ctx.getInitParameter("pass");
            path=ctx.getInitParameter("path");
        ServletFileUpload sfu;
        boolean isMultipart=ServletFileUpload.isMultipartContent(request);
        if(isMultipart)
        {
        try 
        { 
            sfu=new ServletFileUpload();
            FileItemIterator fii=sfu.getItemIterator(request);
            while(fii.hasNext())
            {
               FileItemStream fis=fii.next();
               if(fis.isFormField())
               {
                String field=fis.getFieldName();
                InputStream is=fis.openStream();
                byte[] b=new byte[is.available()];
                is.read(b);
                String val=new String(b);
                if(field.equals("txtUser"))
                 uname=val;
                else if(field.equals("txtPswd"))
                    pswd=val;
                else if(field.equals("state"))
                    state=val;
                else if(field.equals("city"))
                    city=val;
                else if(field.equals("gender"))
                    gender=val;
                else if(field.equals("SecQues"))
                    SecQues=val;
                else if(field.equals("SecAns"))
                    SecAns=val;
               }
               else
               {
                   Uploader.processFile(path,fis,uname);
               }
            }
        }
         catch(FileUploadException fue)
        {
            pw.println(fue.getMessage());
        }
        }
        try
        {
         Class.forName(drv);
         con=DriverManager.getConnection(url,user,pass);
         uname=request.getParameter("txtName");
         pswd=request.getParameter("txtPswd");
         state=request.getParameter("state");
         city=request.getParameter("city");
         gender=request.getParameter("gender");
         SecQues=request.getParameter("SecQues");
         SecAns=request.getParameter("SecAns");
        query="insert into profile values(?,?,?,?,?,?,?)";
         ps=con.prepareStatement(query);
         ps.setString(1,uname);
         ps.setString(2,pswd);
         ps.setString(3,state);
         ps.setString(4,city);
         ps.setString(5,gender);
         ps.setString(6,SecQues);
         ps.setString(7,SecAns);
         int a=ps.executeUpdate();
         if(a==1)
         {
             session=request.getSession();
                session.setAttribute("uname",uname);
             response.sendRedirect("MainPage.jsp");
         }
         else
         { 
             pw.println("Sorry!Error occured");
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
