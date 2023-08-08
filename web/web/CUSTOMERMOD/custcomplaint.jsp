<%-- 
    Document   : custcomplaint
    Created on : 2 Jun, 2023, 10:12:41 PM
    Author     : User
--%>
<jsp:useBean class="DB.ConnectionClass" id="co"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint page</title>
    <%@include file="Header.jsp" %>
    </head>
    <body>
        <br>
        <div id="tab" align="center">
       
         
        <%
            String t="",c="" ,id="";
            
        if(request.getParameter("sub")!=null)
        {
            if(request.getParameter("hidc").equals(""))
            {
            String in="insert into tbl_complaint (complaint_title,complaint_content,complaint_date,customer_id) values('"+request.getParameter("compT")+"','"+request.getParameter("compC")+"',curdate(),'"+session.getAttribute("Cid")+"')";
            co.executeCommand(in);
           %>
           <script>
               alert("Complaint Submitted Successfully");
               window.location="custcomplaint.jsp";
               </script>
                    
                   <%
        }
            
            else
            {
                String updQ="update tbl_complaint set complaint_title='"+request.getParameter("compT")+"' , complaint_content='"+request.getParameter("compC")+"',complaint_date=curdate() where complaint_id='"+request.getParameter("hidc")+"'  ";
                co.executeCommand(updQ);
                 response.sendRedirect("custcomplaint.jsp");
            
            }
            
        }
        
        if(request.getParameter("de")!=null)
        {
            String del1="delete from tbl_complaint where complaint_id='"+request.getParameter("de")+"'";
            co.executeCommand(del1);
            response.sendRedirect("custcomplaint.jsp");
            
           
        }
                
         if(request.getParameter("ed")!=null)
         {
            String seled=" select * from tbl_complaint where complaint_id='"+request.getParameter("ed")+"'";
            ResultSet r=co.selectCommand(seled);
            if(r.next())
            {
             c=r.getString("complaint_content");
             t=r.getString("complaint_title");
             id=r.getString("complaint_id");
             
             
         }
                
         }
        
        %>
        
        
        <form method="post">
            <table align="center"><tr><td>
                        <h3> Title</h3>
                    </td><td><input type="text" name="compT" value="<%=t%>"</td></tr>
                <input type="hidden" name="hidc" value="<%=id%>">
                <tr><td><h3>Complaint</h3></td><td><textarea name="compC" ><%=c%></textarea></td></tr>
                <tr><td colspan="2"><center><input type="submit" name="sub" value="Submit">
                    <input type="reset" name="canc" value="Cancel"></center>
                    </td></tr>
            </table>
            
            
        </form><br><br>
        <table align="center" border="2">
                    <tr><td><b>SL.No.</b></td>
                       <td><b>Title</b></td>
                       <td><b>Complaint</b></td>
                        <td><b>Date</b></td>
                       <td><b>Reply</b></td>
                       
                       <td><b>Action</b></td></tr>
                       
        
        <%
        int i=0;
        String select1="select * from tbl_complaint where customer_id='"+session.getAttribute("Cid")+"'";
        ResultSet rs0=co.selectCommand(select1);
        while(rs0.next())
        {
             i++;
          %>
         
          <tr><td>
              <%=i%>
              </td>
              <td><%=rs0.getString("complaint_title")%></td>
              <td><%=rs0.getString("complaint_content")%></td>
              <td><%=rs0.getString("complaint_date")%></td>
              <td><%=rs0.getString("complaint_reply")%></td>
              <td>
                  <%
                  if(rs0.getString("complaint_reply").equals("not replied"))
                  {
                      %>
                 
                  <a href="custcomplaint.jsp?de=<%=rs0.getString("complaint_id")%>">Delete</a>
                  <a href="custcomplaint.jsp?ed=<%=rs0.getString("complaint_id")%>">Edit</a>
                  <%
                  }
                 %>
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
