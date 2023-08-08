<%-- 
    Document   : serviceDetails.jsp
    Created on : 2 Jun, 2023, 10:44:07 AM
    Author     : User
--%>
<jsp:useBean class="DB.ConnectionClass" id="co"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Service Details</title>
    <%@include file="Header.jsp" %>
    </head>
    <body>
        <br><br><br> <br><br><br> <br><br><br> 
        <div id="tab" align="center">
       
    <%
        String sc="",sr="" ,sid="";
    if (request.getParameter("sub")!=null)
    {
        if(request.getParameter("hidsd").equals(""))
        {
        
    
        String ins="insert into tbl_servicedetails (sdetails_content,sdetails_rate,tm_id) values('"+request.getParameter("sd")+"','"+request.getParameter("rate")+"','"+session.getAttribute("Sid")+"')";
        co.executeCommand(ins);
          %>
            <script>
                alert("DETAILS ENTERD");
                window.location="serviceDetails.jsp";
            </script>
            <%
        }
        
        else 
        {
            String up="update tbl_servicedetails set sdetails_content='"+request.getParameter("sd")+"',sdetails_rate='"+request.getParameter("rate")+"' where sdetails_id= '"+request.getParameter("hidsd")+"'";
            co.executeCommand(up);
             response.sendRedirect("serviceDetails.jsp");
            
            
        }
    }
    if(request.getParameter("esdi")!=null)
    {
        String se="select * from tbl_servicedetails where sdetails_id='"+request.getParameter("esdi")+"'";
        ResultSet rdet1=co.selectCommand(se);
        if(rdet1.next())
        {
            sid=rdet1.getString("sdetails_id");
             sc=rdet1.getString("sdetails_content");
        sr=rdet1.getString("sdetails_rate");
        }
       
    }
        
     if(request.getParameter("dsdi")!=null)
        {
            String delup="delete from tbl_servicedetails where sdetails_id='"+request.getParameter("dsdi")+"'";
           co.executeCommand(delup);
           response.sendRedirect("serviceDetails.jsp");
        }
            
    %>
    
    <center>
        <h2><b><u>Add Your Service Details</u></b></h2></center>
    
       <form method="post">
           <table align="center"><br>
            <tr><td>Service Details</td><td><textarea name="sd" ><%=sc%>  </textarea></td></tr>
            <tr><td>Rate</td><td><input type="text" name="rate" value="<%=sr%>" ></td></tr>
            <input type="hidden" name="hidsd" value="<%=sid%>">
            <tr><td colspan="2"><center><input type="submit" name="sub" value="Save"> 
                    
                <input type="submit" name="cancel" value="Cancel"></center></td></tr>
        </table>
       </form><br><br>
    <table align="center" border="2" layout="fixed">
        <tr><td><b>Service Details</b></td><td><b>Rate</b></td><td><b>Action</b></td></tr>
        <%
    String seldet="select * from tbl_servicedetails where tm_id='"+session.getAttribute("Sid")+"'";
    ResultSet rdet=co.selectCommand(seldet);
    while(rdet.next())
    {
        %>
        <tr rowspan="2"><td> <%=rdet.getString("sdetails_content")%></td><td><%=rdet.getString("sdetails_rate")%></td>
            <td><a href="serviceDetails.jsp?esdi=<%=rdet.getString("sdetails_id")%>">Edit</a>
                <a href="serviceDetails.jsp?dsdi=<%=rdet.getString("sdetails_id")%>">Delete</a>
            </td></tr>
                <%
    }
    %>
        
    </table>
       </div> 
    <br><br><br><br><br>
            <div>
                
             <br><br><br><br><br>   
              
            </div>
            
            <div>
                
             <br><br><br><br><br>   
              
            </div>
    </body>
    <%@include file="footer.jsp" %>
</html>
