<%-- 
    Document   : viewUserbooking
    Created on : 5 Jun, 2023, 11:15:17 AM
    Author     : User
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> TM -view Service requests</title>
    <%@include file="Header.jsp" %>
    </head>
    <body>
        <br><br><br>  <br><br><br>  <br><br>
        <div id="tab" align="center">
       
       
        <%
             if (request.getParameter("acc")!=null)
        {
           String id = request.getParameter("id");
           
           String ins = "insert into tbl_notification(notification_date,notification_title,notification_content,user_id)"
                   + "value(curdate(),'Booking Accepted','Your Booking is  accepted by the tradie.Pay the advance and confirm the booking now.','"+id+"')";
           con.executeCommand(ins);
           
            String upa="update tbl_servicebooking set sb_status=1 where sb_id='"+request.getParameter("acc")+"'";
            con.executeCommand(upa);
            
           response.sendRedirect("viewUserbooking.jsp");
           
            
        }
        if (request.getParameter("rej")!=null)
        {
            String id = request.getParameter("id");
              String ins = "insert into tbl_notification(notification_date,notification_title,notification_content,user_id)"
                   + "value(curdate(),'Booking Rejected','Your Booking is  rejected by the tradie.Please try for another tradie.','"+id+"')";
           con.executeCommand(ins);
           
            String upr="update  tbl_servicebooking set sb_status=2 where sb_id='"+request.getParameter("rej")+"'";
            con.executeCommand(upr);
            
            
           response.sendRedirect("viewUserbooking.jsp");
           
            
        }
        
        
        
        
        
        
        %>
            
            
            
        <table align="center" border="2">
                    <tr><td><b>SL.No.</b></td>
                       <td><b>Customer name</b></td>
                       <td><b>Address</b></td>
                        <td><b>Place</b></td>
                       <td><b>Contact</b></td>
                       
                       <td><b>For Date</b></td>
                       <td><b>Details</b></td>
                       <td><b>Booked Date</b></td>
                        
                       <td><b>Action</b></td>
                    </tr>
        <%
            int i=0;
            String sel="select * from tbl_servicedetails d inner join tbl_servicebooking b on d.sdetails_id=b.sdetails_id where d.tm_id='"+session.getAttribute("Sid")+"' and sb_status=0";
            ResultSet rse=con.selectCommand(sel);
           while(rse.next())
            {
               String selc=" select * from tbl_customer c inner join tbl_localplace l on c.localPlace_id=l.localPlace_id where customer_id='"+rse.getString("customer_id")+"'";
               ResultSet rselc=con.selectCommand(selc);
              
               if(rselc.next())
               {
                i++;
                %>
                
                <tr>
                    
                    <td><%=i%></td>
                    <td><%=rselc.getString("customer_name")%></td>
                     <td><%=rselc.getString("customer_address")%></td>
                     <td><%=rselc.getString("localPlace_name")%></td>
                      <td><%=rselc.getString("customer_contact")%></td>
                       <td><%=rse.getString("sb_fordate")%></td>
                        <td><%=rse.getString("sb_detail")%></td>
                         <td><%=rse.getString("sb_date")%></td>
                        
                         <td><a href="viewUserbooking.jsp?acc=<%=rse.getString("sb_id")%>&id=<%=rse.getString("customer_id")%>">Accept</a>
                    <a href="viewUserbooking.jsp?rej=<%=rse.getString("sb_id")%>&id=<%=rse.getString("customer_id")%>">Reject</a></td>
              
                       
           
                <%
                
            }
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
