<%-- 
    Document   : viewFeedback
    Created on : 5 Jun, 2023, 9:11:58 PM
    Author     : User
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin view Feedback </title>
        <%@include file="Header.jsp" %>
    </head>
    <body>
         <br><br><br>
        <div id="tab" align="center">
       
         <table align="center" border="2">
                    <tr><td><b>SL.No.</b></td>
                    
                       <td><b>Feedback</b></td>
                        <td><b>Date</b></td>
                         <td><b>Customer Name</b></td>
                        
                     
                       
                       
                    
                    <%
                        int i=0;
                        String selc="select * from tbl_feedback c inner join tbl_customer i on c.customer_id=i.customer_id";
                        ResultSet rs=con.selectCommand(selc);
                        while(rs.next())
                        {
                            i++;
                            %>
                            <tr>
                                <td><%=i%></td>
                                <td><%=rs.getString("fb_content")%></td>
                                
                                <td>  <%=rs.getString("fb_date")%></td>
                                <td> <%=rs.getString("customer_name")%></td>
                                
                                
                                
                            </tr>
                            
                             <%   
                                    
                                    
                        }
                        
                        %>
                       
        </table>
        </div>
    </body>
    <%@include file="footer.jsp" %>
</html>
