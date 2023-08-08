<%-- 
    Document   : Mybooking
    Created on : 5 Jun, 2023, 12:21:47 PM
    Author     : User
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer -View Booking Status</title>
      <%@include file="Header.jsp" %>
    </head>
    <body>
        <br><br><br>
        <div id="tab" align="center">
         <table align="center" border="2">
                    <tr><td><b>SL.No.</b></td>
                       <td><b>Service Provider Name</b></td>
                       
                        <td><b>Place</b></td>
                       <td><b>Contact</b></td>
                       <td><b>Photo</b></td>
                       <td><b>Service</b></td>
                      <td><b>Booked Date</b></td>

                       
                       <td><b>For Date</b></td>
                       <td><b>Details</b></td>
                        
                       <td><b>Status</b></td>
                    </tr>
                    
                    
                    
                    
                    
                     <%
            int i=0;
            String sel="select * from tbl_servicedetails d inner join tbl_servicebooking b on d.sdetails_id=b.sdetails_id where b.customer_id='"+session.getAttribute("Cid")+"' ORDER BY sb_id DESC  ";
            ResultSet rse=con.selectCommand(sel);
           while(rse.next())
            {
               String selc=" select * from tbl_tradesmen s inner join tbl_localplace l on s.localPlace_id=l.localPlace_id where tm_id='"+rse.getString("tm_id")+"'";
               ResultSet rselc=con.selectCommand(selc);
               String selcs=" select * from tbl_tradesmen s inner join tbl_servicetype t on s.serviceType_id=t.serviceType_id where tm_id='"+rse.getString("tm_id")+"'";
               ResultSet rselcs=con.selectCommand(selcs);
              
               if(rselc.next() & rselcs.next())
               {
                i++;
                %>
                
                <tr>
                    
                    <td><%=i%></td>
                    <td><%=rselc.getString("tm_name")%></td>
                     
                     <td><%=rselc.getString("localPlace_name")%></td>
                      <td><%=rselc.getString("tm_contact")%></td>
                      <td><img src="../Assets/Files/TM/<%=rselc.getString("tm_photo")%>" width="150" height="100"></td>
                      <td><%=rselcs.getString("serviceType")%></td>
                       <td><%=rse.getString("sb_date")%></td>
                       <td><%=rse.getString("sb_fordate")%></td>
                        <td><%=rse.getString("sb_detail")%></td>
                        <td>
                            
                            <%
                              if(rse.getString("sb_status").equals("0"))
                         {
                             out.print("Wait for confirmation");
                             %>
                             <br>
                             <a href="Mybooking.jsp?cancelid=<%=rse.getString("sb_id")%>">Cancel</a>
                             <%
                         
                         
                         
                         }
                             else if(rse.getString("sb_status").equals("1") & rse.getString("payment_status").equals("0"))
                         {
                             out.print("ACCEPTED");
                             %>
                             <br>
                             <a href="Payment.jsp?sbid=<%=rse.getString("sb_id")%>&rate=<%=rse.getString("sb_advanceamount")%>">Pay Now</a>
                             <%
                        
                         }
                             else if(rse.getString("sb_status").equals("1") & rse.getString("payment_status").equals("1") & rse.getString("work_stat").equals("0"))
                                     {
                                     out.print("Accepted and Rs."+ rse.getString("sb_advanceamount") + " Paid");
                                     }
                             
                             
                             else if(rse.getString("sb_status").equals("1") & rse.getString("payment_status").equals("1")& rse.getString("work_stat").equals("1"))
                             {
                                 out.print("Work completed ");
                                 %>
                                 <br>
                                 <a href="TraderRating.jsp?lid=<%=rse.getString("tm_id")%>">Rate Now</a>
                                 <%
                                 
                             }
                             else if(rse.getString("sb_status").equals("3"))
                             {
                                    out.print("Cancelled");
                             }
                         
                             else  
                             {
                                    out.print("Rejected");
                             }
                         
                         %>
                           
                        </td>
                        
                </tr>
         
                         
                          <%
                
            }
               %>
               
               
            
               <%
            }
            %>
                   </table>    
                
     </div>
                   
            <%
            if(request.getParameter("cancelid")!=null)
            {
                String updateCancelId="update tbl_servicebooking set sb_status=3  where sb_id='"+request.getParameter("cancelid")+"' ";
                con.executeCommand(updateCancelId);
                response.sendRedirect("Mybooking.jsp");
            
            }
            
            
            %>
    </body>
    <%@include file="footer.jsp" %>
</html>
