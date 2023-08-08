<%-- 
    Document   : ViewCustomers
    Created on : 5 Jun, 2023, 9:15:30 PM
    Author     : User
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="co"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin view customers</title>
   <%@include file="Header.jsp" %>
    </head>
    <body>
        <br><br><br>
        <div id="tab" align="center">
     
        <form method="post" >
            <table border ="2" align="center">
                <tr><td><b>SL.NO</b></td>
                <td><b>NAME</b></td>
                
                <td><b>ADDRESS</b></td>
                <td><b>CONTACT</b></td>
               <td><b>EMAIL</b></td>
               <td><b>PLACE</b></td>
              
              
              
             
                
                <%
                    int i=0;
                String sel="select * from tbl_customer ";
                ResultSet re=co.selectCommand(sel);
                 
                while(re.next())
                {
                    i++;
                    String selln="select * from tbl_localPlace where localPlace_id='"+re.getString("localPlace_id")+"'";
                ResultSet re1=co.selectCommand(selln);
                 
                   if(re1.next())
                   {
                
                
                    %>
                    <tr>
                        <td><%=i%></td>
                                <td><%=re.getString("customer_name")%></td>
                                <td><%=re.getString("customer_address")%></td>
                                <td><%=re.getString("customer_contact")%></td>
                                <td><%=re.getString("customer_email")%></td>
                                
                                <td><%=re1.getString("localPlace_name")%></td>
 
                    </tr>
                    <%
                   }
                }
                %>
            </table>
            
        </form>
   </div>
    </body>
    <%@include file="footer.jsp" %>
</html>

