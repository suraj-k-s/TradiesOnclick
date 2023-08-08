<%-- 
    Document   : Reply
    Created on : 5 Jun, 2023, 7:37:53 PM
    Author     : User
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin -Complaint Reply page</title>
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <br><br><br>
        <div id="tab" align="center">
        <right>   <a href="AdminHome.jsp">BACK</a></right>
        <%
        if(request.getParameter("sub")!=null)
        {
            String s="update tbl_complaint set complaint_reply='"+request.getParameter("reply")+"'where complaint_id='"+request.getParameter("cid")+"' ";
         con.executeCommand(s);
         %>
         <script>
             alert("Successfully replied");
             window.location="viewComplaint.jsp";
             
         </script>
         <%
        }
                
        %>
        <form method="post">
            <table align="center">
                <tr><td><b>REPLY</b></td><td><textarea name="reply"></textarea></td></tr>
                <tr><td><center><input type="submit" name="sub" value="Submit">
                    <input type="reset" name="can" value="Cancel"></center>  </td>
            </table>
            
            
        </form>
         </div>
    </body>
    <%@include file="footer.jsp" %>
</html>
