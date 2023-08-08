<%-- 
    Document   : serviceType
    Created on : 31 May, 2023, 3:35:51 PM
    Author     : User
--%>
<jsp:useBean class="DB.ConnectionClass" id="con1"></jsp:useBean>
    <%@page import="java.sql.ResultSet" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-ServiceType Entry</title>
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <br><br><br>
        <div id="tab" align="center">
          <%
              String stid="",stna="";
        if(request.getParameter("save")!=null)
        {
                        if(request.getParameter("hidsty").equals(""))

        {
            
            String insQu="insert into tbl_serviceType(serviceType) value('"+request.getParameter("st")+"')";
            con1.executeCommand(insQu);
            %>
            <script>
                alert("SERVICE TYPE ENTERD");
                window.location="serviceType.jsp";
            </script>
            <%
            
        }
             else
             {
                 String uploc="update tbl_serviceType set serviceType='"+request.getParameter("st")+"' where serviceType_id='"+request.getParameter("hidsty")+"'";  
                    con1.executeCommand(uploc);
                    response.sendRedirect("serviceType.jsp");
             }
        }
         if(request.getParameter("eid")!=null)
        {
            String seledi="select * from tbl_serviceType where serviceType_id='"+request.getParameter("eid")+"'";
            ResultSet re=con1.selectCommand(seledi);
            if(re.next())
            {
                stid=re.getString("serviceType_id");
                stna=re.getString("serviceType");
            }
        }  
            if(request.getParameter("did")!=null)
        {
            String delup="delete from tbl_serviceTyp where  serviceType_id='"+request.getParameter("did")+"'";
           con1.executeCommand(delup);
           response.sendRedirect(" serviceType.jsp");
        }
            
        %>
       <form method="post">
            <table align ="center">
                <tr>
                    <td>
                       ENTER SERVICE TYPE
                    </td>
                </tr>
                 <tr>
                    <td>
                        <input type="text" name="st" value="<%=stna%>">
                         <input type="hidden" name="hidsty" value="<%=stid%>" >
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
                    <b>SERVICE TYPE</b> 
                </td>
                <td>
                    <b>ACTION</b> 
                </td>
            </tr>
            <%
        int i=0;
            String seldis="select * from tbl_serviceType";
            ResultSet rs2=con1.selectCommand(seldis);
            while(rs2.next())
            {
                i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs2.getString("serviceType")%></td>
                    <td><a href="serviceType.jsp?did=<%=rs2.getString("serviceType_id")%>">DELETE</a>
                    <a href="serviceType.jsp?eid=<%=rs2.getString("serviceType_id")%>">EDIT</a></td></tr>
                <%
            }
            
            
            %>
        </table>
            </div>       
    </body>
    <%@include file="footer.jsp" %>
</html>
