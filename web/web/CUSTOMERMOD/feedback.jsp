<%-- 
    Document   : feedback
    Created on : 5 Jun, 2023, 8:11:10 PM
    Author     : User
--%>

<jsp:useBean class="DB.ConnectionClass" id="co"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer gives feedback</title>
    <%@include file="Header.jsp" %>
    </head>
    <body>
        <br><br><br>
        <div id="tab" align="center">
       
   
        <%
            String t="",c="" ,id="";
            
        if(request.getParameter("sub")!=null)
        {
            if(request.getParameter("hidc").equals(""))
            {
            String in="insert into tbl_feedback (fb_content,fb_date,customer_id) values('"+request.getParameter("fb")+"',curdate(),'"+session.getAttribute("Cid")+"')";
            co.executeCommand(in);
           %>
           <script>
               alert("Feedback Submitted Successfully");
               window.location="feedback.jsp";
               </script>
                    
                   <%
        }
            
            else
            {
                String updQ="update tbl_feedback set fb_content='"+request.getParameter("fb")+"' ,fb_date=curdate() ,customer_id='"+session.getAttribute("Cid")+"' where fb_id='"+request.getParameter("hidc")+"'  ";
                co.executeCommand(updQ);
                 response.sendRedirect("feedback.jsp");
            
            }
            
        }
        
        if(request.getParameter("de")!=null)
        {
            String del1="delete from tbl_feedback where fb_id='"+request.getParameter("de")+"'";
            co.executeCommand(del1);
            response.sendRedirect("feedback.jsp");
            
           
        }
                
         if(request.getParameter("ed")!=null)
         {
            String seled=" select * from tbl_feedback where fb_id='"+request.getParameter("ed")+"'";
            ResultSet r=co.selectCommand(seled);
            if(r.next())
            {
             c=r.getString("fb_content");
            
             id=r.getString("fb_id");
             
             
         }
                
         }
        
        %>
        
        
        <form method="post">
            <table align="center"><tr>
                <input type="hidden" name="hidc" value="<%=id%>">
                <td><h3>Feedback</h3></td><td><textarea name="fb" ><%=c%></textarea></td></tr>
            <tr><td colspan="2"><center><input type="submit" name="sub" value="Submit">
                <input type="reset" name="canc" value="Cancel"></center>
                    </td></tr>
            </table>
            
            
        </form><br><br>     
        <table align="center" border="2">
                    <tr><td><b>SL.No.</b></td>
                      
                       <td><b>Feedback</b></td>
                        <td><b>Date</b></td>
                      
                       
                       <td><b>Action</b></td></tr>
                       
        
        <%
        int i=0;
        String select1="select * from tbl_feedback where customer_id='"+session.getAttribute("Cid")+"'";
        ResultSet rs0=co.selectCommand(select1);
        while(rs0.next())
        {
             i++;
          %>
         
          <tr><td>
              <%=i%>
              </td>
              <td><%=rs0.getString("fb_content")%></td>
              <td><%=rs0.getString("fb_date")%></td>
              
              <td>
                  
                 
                  <a href="feedback.jsp?de=<%=rs0.getString("fb_id")%>">Delete</a>
                  <a href="feedback.jsp?ed=<%=rs0.getString("fb_id")%>">Edit</a>
                
              </td>
          </tr>
          
       
                       
                       
             <%          
                            
             }
             
                               %>
        </table>
    </div>
    </body>
    <%@include file="footer.jsp" %>
</html>
