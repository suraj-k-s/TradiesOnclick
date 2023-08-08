<%-- 
    Document   : MyProfile
    Created on : 1 Jun, 2023, 12:45:25 PM
    Author     : User
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service Provider Profile</title>
        <%@include file="Header.jsp" %>
    </head>
    <body>
    
    <center><br><br<br><br><br><br><br><br><br><br><br><br>
        <h2><b><u>My Profile</u></b></h2></center>
       <div id="tab" align="center">
        <%     
             
        String selcpro="select * from tbl_tradesmen where tm_id='"+session.getAttribute("Sid")+"'";
        ResultSet rcpro=con.selectCommand(selcpro);
          if(rcpro.next())
        {
             String selcprol="select * from tbl_localPlace where localPlace_id='"+rcpro.getString("localPlace_id")+"'";
        ResultSet rcprol=con.selectCommand(selcprol);
        String selcpros="select * from tbl_servicetype where servicetype_id='"+rcpro.getString("serviceType_id")+"'";
         ResultSet rcpros=con.selectCommand(selcpros);
         if(rcprol.next()& rcpros.next())
         {
            %>
    <center>   <table >
            <tr><td colspan="2"><center><img src="../Assets/Files/TM/<%=rcpro.getString("tm_photo")%>" width="150" height="100"></center></td>
                
                 <tr><td><b>NAME:</b> </td><td> <%=rcpro.getString("tm_name")%></td></tr>
                <tr><td><b>ADDRESS:</b> </td><td> <%=rcpro.getString("tm_address")%></td></tr>
                 <tr><td><b>CONTACT:</b> </td><td> <%=rcpro.getString("tm_contact")%></td></tr>
                  <tr><td><b>EMAIL:</b> </td><td> <%=rcpro.getString("tm_email")%></td></tr>
                   <tr><td><b>PLACE:</b> </td><td> <%=rcprol.getString("localPlace_name")%></td></tr>
                   <tr><td><b>SERVICE TYPE:</b> </td><td> <%=rcpros.getString("serviceType")%></td></tr>
                   <tr>  <td colspan="2"><center><a href="EditTMPro.jsp">EDIT PROFILE</a></center></td> </tr>  
                  
                  
        </table></center>
            
        <%    
        }
             }
        
        
        %>
        
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
