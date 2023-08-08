<%-- 
    Document   : viewDetails
    Created on : 2 Jun, 2023, 1:37:19 PM
    Author     : User
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer View TM Profile</title>
         <%@include file="Header.jsp" %>
  </head>
    <body>
        <br><br><br>
        <div id="tab" align="center">
        <%     
             
        String selcpro="select * from tbl_tradesmen where tm_id='"+request.getParameter("seid")+"'";
        ResultSet rcpro=con.selectCommand(selcpro);
          if(rcpro.next())
        {
             String selcprol="select * from tbl_localPlace where localPlace_id='"+rcpro.getString("localPlace_id")+"'";
        ResultSet rcprol=con.selectCommand(selcprol);
        String selcpros="select * from tbl_servicetype where servicetype_id='"+rcpro.getString("serviceType_id")+"'";
         ResultSet rcpros=con.selectCommand(selcpros);
         
         String selsv="select * from tbl_servicedetails where tm_id='"+request.getParameter("seid")+"'";
         ResultSet rsv=con.selectCommand(selsv);
         
         if(rcprol.next()& rcpros.next() &rsv.next())
         {
            %>
            <table align="center" border="2">
                <tr><td></td><td ><center><img src="../Assets/Files/TM/<%=rcpro.getString("tm_photo")%>" width="150" height="100"></center></td>
                
        </tr> <tr><td><b>NAME:</b> </td><td> <%=rcpro.getString("tm_name")%></td></tr>
                <tr><td><b>ADDRESS:</b> </td><td> <%=rcpro.getString("tm_address")%></td></tr>
                 <tr><td><b>CONTACT:</b> </td><td> <%=rcpro.getString("tm_contact")%></td></tr>
                  
                   <tr><td><b>PLACE:</b> </td><td> <%=rcprol.getString("localPlace_name")%></td></tr>
                   <tr><td><b>SERVICE TYPE:</b> </td><td> <%=rcpros.getString("serviceType")%></td></tr>
                   <tr><td><b>SERVICE DETAILS:</b> </td><td> <%=rsv.getString("sdetails_content")%></td></tr>
                   <tr><td><b>RATE:</b> </td><td> <%=rsv.getString("sdetails_rate")%></td></tr>
                   <tr><td colspan="2"><center> <a href="servicebooking.jsp?serid=<%=rsv.getString("sdetails_id")%>&rate=<%=rsv.getString("sdetails_rate")%>">Book Service</a></center></td>
                  
                  
            </table>
            
        <%    
        }
             }
        
        
        %>
        
            
            
        </table>
  </div>
    </body>
    <%@include file="footer.jsp" %>
</html>
