<%-- 
    Document   : VerSps
    Created on : 1 Jun, 2023, 11:37:25 AM
    Author     : User
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="co"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verified TM</title>
        <%@include file="Header.jsp" %>
        
    </head>
    <body>
        <br><br><br>
        <div id="tab" align="center">
        <%
             if (request.getParameter("rid")!=null)
        {
            String upr="update tbl_tradesmens set tm_vstatus=2 where tm_id='"+request.getParameter("rid")+"'";
            co.executeCommand(upr);
            
           response.sendRedirect("VerTM.jsp");
           
            
        }
        %>
         <form method="post" >
            <table border ="2" align="center">
                <tr><td><b>SL.NO</b></td>
                <td><b>NAME</b></td>
                <td><b>CONTACT</b></td>
                <td><b>ADDRESS</b></td>
               <td><b>EMAIL</b></td>
               <td><b>PLACE</b></td>
               <td><b>SERVICE TYPE</b></td>
                <td><b>PHOTO</b></td>
               <td><b>PROOF</b></td>
               
                <td><b>ACTION</b></td></tr>
                
                <%
                    int i=0;
                String sel="select * from tbl_tradesmen where tm_vstatus=1";
                ResultSet re=co.selectCommand(sel);
                while(re.next())
                {
                    i++;
                    String selln="select * from tbl_localPlace where localPlace_id='"+re.getString("localPlace_id")+"'";
                ResultSet re1=co.selectCommand(selln);
                 String sestyp="select * from tbl_servicetype where serviceType_id='"+re.getString("serviceType_id")+"'";
                ResultSet resy=co.selectCommand(sestyp);
                   if(re1.next() & resy.next())
                   {
                
                    %>
                    <tr>
                        <td><%=i%></td>
                                <td><%=re.getString("tm_name")%></td>
                                <td><%=re.getString("tm_address")%></td>
                                <td><%=re.getString("tm_contact")%></td>
                                <td><%=re.getString("tm_email")%></td>
                                 <td><%=re1.getString("localPlace_name")%></td>
                                <td><%=resy.getString("serviceType")%></td>
                                
                                <td><img src="../Assets/Files/TM/<%=re.getString("tm_photo")%>" width="100" height="100"></td>
                                <td><a href="../Assets/Files/TM/<%=re.getString("tm_proof")%>" download>Download</a></td>
                                <td>
                               <a href="VerSps.jsp?rid=<%=re.getString("tm_id")%>">REJECT</a></td>
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
