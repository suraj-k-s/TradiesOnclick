<%-- 
    Document   : viewComplaint
    Created on : 5 Jun, 2023, 6:20:51 PM
    Author     : User
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin view complaint page</title>
         <%@include file="Header.jsp" %>
    </head>
    <body>
         <br><br><br>
        <div id="tab" align="center">
         <table align="center" border="2">
                    <tr><td><b>SL.No.</b></td>
                       <td><b>Title</b></td>
                       <td><b>Complaint</b></td>
                        <td><b>Date</b></td>
                         <td><b>Customer Name</b></td>
                        
                     
                       
                       <td><b>Reply</b></td></tr>
                    
                    <%
                        int i=0;
                        String selc="select * from tbl_complaint c inner join tbl_customer i on c.customer_id=i.customer_id";
                        ResultSet rs=con.selectCommand(selc);
                        while(rs.next())
                        {
                            i++;
                            %>
                            <tr>
                                <td><%=i%></td>
                                <td><%=rs.getString("complaint_title")%></td>
                                <td><%=rs.getString("complaint_content")%></td>
                                <td>  <%=rs.getString("complaint_date")%></td>
                                <td> <%=rs.getString("customer_name")%></td>
                                <td>
                                    <%
                                    if(rs.getString("complaint_reply").equals("not replied"))
                                    {
                                         %>
                                     
                                       <a href="Reply.jsp?cid=<%=rs.getString("complaint_id")%>">Reply</a>
                                           <%
                                    }
                                    else
                                    {
                                      out.print( rs.getString("complaint_reply")); 
                                     
                                  
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
