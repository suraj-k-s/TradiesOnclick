<%-- 
    Document   : servicebooking
    Created on : 5 Jun, 2023, 9:52:42 AM
    Author     : User
--%>
<jsp:useBean class="DB.ConnectionClass" id="co"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer -Service Booking Page</title>
         <%@include file="Header.jsp" %>
    </head>
    <body>
        <br><br><br>
        <div id="tab" align="center">
       
        <%
            session.setAttribute("rate", request.getParameter("rate"));
            int a=0,b=0;
      a=Integer.parseInt(request.getParameter("rate"));
     b=a/2;
     %>
     <%
     
     if(request.getParameter("book")!=null)
     {
         String insQ="insert into tbl_servicebooking (sb_date,sb_fordate,sb_detail,customer_id,sdetails_id,sb_advanceamount) values(curdate(),'"+request.getParameter("ford")+"','"+request.getParameter("detco")+"','"+session.getAttribute("Cid")+"','"+request.getParameter("serid")+"','"+request.getParameter("adva")+"') ";
         co.executeCommand(insQ);
         %>
         
    <script>
        alert("Service is booked.Wait for confirmation");
        window.location="SearchService.jsp";
        
    </script>
        
   
         <%
     }
        %>
      
        <form method="post" >
            <table align="center">
                <tr>
                    <td>FOR DATE</td>
                    <td><input type="date" name="ford" required></td>
                </tr>
                <tr>
                    <td>DETAILS</td>
                    <td><textarea name="detco" required></textarea></td>
                </tr>
                <tr>
                    <td>ADVANCE AMOUNT</td>
                    <td><input type="text" name="adva" value="<%=b%>" readonly> </td>
                </tr>
                <tr></tr>
                <tr><td colspan="2"><center><input type="submit" name="book" value="BOOK" >
                    <input type="reset" name="cancel" value="CANCEL" ></center></td>
                    
                </tr>
            </table>
                
                
        </form>
     </div>
    </body>
    <%@include file="footer.jsp" %>
</html>
