<%-- 
    Document   : MyProfile
    Created on : 1 Jun, 2023, 12:44:09 PM
    Author     : User
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Profile</title>
        <%@include file="Header.jsp" %>
      
    </head>
    <body>
        <br><br><br>
        <div id="tab" align="center">
          
    
        <%  
            
            
        String selcpro="select * from tbl_customer where customer_id='"+session.getAttribute("Cid")+"'";
        ResultSet rcpro=con.selectCommand(selcpro);
          if(rcpro.next())
        {
             String selcprol="select * from tbl_localPlace where localPlace_id='"+rcpro.getString("localPlace_id")+"'";
        ResultSet rcprol=con.selectCommand(selcprol);
         if(rcprol.next())
         {
            %>
            <table align="center">
               
               
                <tr><td><b>NAME:</b> </td><td> <%=rcpro.getString("customer_name")%></td></tr>
                <tr><td><b>ADDRESS:</b> </td><td> <%=rcpro.getString("customer_address")%></td></tr>
                 <tr><td><b>CONTACT:</b> </td><td> <%=rcpro.getString("customer_contact")%></td></tr>
                  <tr><td><b>EMAIL:</b> </td><td> <%=rcpro.getString("customer_email")%></td></tr>
                   <tr><td><b>PLACE:</b> </td><td> <%=rcprol.getString("localPlace_name")%></td></tr>
                    <tr>  <td><a href="EditCustPro.jsp">EDIT PROFILE</a></td> </tr>    
                  
                  
            </table>
            
        <%    
        }
             }
          
        
        
        
        %>
        
            
            <img
        </table>
    </div>
    </body>
    <%@include file="footer.jsp" %>
</html>
