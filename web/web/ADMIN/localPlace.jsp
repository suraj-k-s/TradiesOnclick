<%-- 
    Document   : localPlace
    Created on : 31 May, 2023, 3:08:11 PM
    Author     : User
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <%@page import="java.sql.ResultSet" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TradiesOnClick Admin-localPlace</title>
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <br><br><br>
        <div id="tab" align="center">
       
        <%
            String lid="",lna="";
        if(request.getParameter("save")!=null)
        {
            if(request.getParameter("hidloc").equals(""))
            {
            String insQ="insert into tbl_localPlace (localPlace_name) value('"+request.getParameter("locplace")+"')";
            con.executeCommand(insQ);
            %>
            <script>
                alert("LOCAL PLACE ENTERD");
                window.location="localPlace.jsp";
            </script>
            <%
            }
            
          else
                {
                    String uploc="update tbl_localPlace set localPlace_name='"+request.getParameter("locplace")+"' where localPlace_id='"+request.getParameter("hidloc")+"'";  
                    con.executeCommand(uploc);
                    response.sendRedirect("localPlace.jsp");
                        }
        }
        if(request.getParameter("eid")!=null)
        {
            String seledi="select * from tbl_localPlace where localPlace_id='"+request.getParameter("eid")+"'";
            ResultSet re=con.selectCommand(seledi);
            if(re.next())
            {
                lid=re.getString("localPlace_id");
                lna=re.getString("localPlace_name");
            }
        }  
            if(request.getParameter("did")!=null)
        {
            String delup="delete from tbl_localPlace where localPlace_id='"+request.getParameter("did")+"'";
           con.executeCommand(delup);
           response.sendRedirect("localPlace.jsp");
        }
            
        
        %>
        <form method="post">
            <table align ="center">
                <tr>
                    <td>
                       ENTER LOCAL PLACE
                    </td>
                </tr>
                 <tr>
                    <td>
                        <input type="text" name="locplace" value="<%=lna%>">
                        <input type="hidden" name="hidloc" value="<%=lid%>" >
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="save" value="SAVE">
                        <input type="reset" name="cancel" value="CANCEL">
                    </td>
                </tr>
                
                
                
                
            </table>
        </form>
    <br><br><table align="center" border="2">
            <tr>
                <td>
                    <b>SL.NO</b> 
                </td>
                <td>
                    <b>PLACE</b> 
                </td>
                <td>
                    <b>ACTION</b> 
                </td>
            </tr>
            <%
        int i=0;
            String seldis="select * from tbl_localPlace";
            ResultSet rs1=con.selectCommand(seldis);
            while(rs1.next())
            {
                i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs1.getString("localPlace_name")%></td>
                    <td><a href="localPlace.jsp?did=<%=rs1.getString("localPlace_id")%>">DELETE</a>
                    <a href="localPlace.jsp?eid=<%=rs1.getString("localPlace_id")%>">EDIT</a></td></tr>
                <%
            }
            
            
            %>
        </table>
        </div>
    </body>
    <%@include file="footer.jsp" %>
</html>
