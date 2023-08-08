<%-- 
    Document   : EditTMPwd
    Created on : 1 Jun, 2023, 9:08:26 PM
    Author     : User
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service Provider Password Editing</title>
      <%@include file="Header.jsp" %>
    </head>
    <body>
        <br><br><br  <br><br><br>  <br><br><br>
        <div id="tab" align="center">
       
        <%
        if(request.getParameter("save")!=null)
        {
           String sel="select * from tbl_tradesmen where sp_id='"+session.getAttribute("Sid")+"'";
    ResultSet rc=con.selectCommand(sel);
           if(rc.next())
            {
            if(request.getParameter("cpwd").equals(rc.getString("sp_password")))
            {
                if(request.getParameter("npwd").equals(request.getParameter("cnpwd")))
                {
                    String upp="update tbl_tradesmen set sp_password='"+request.getParameter("npwd")+"' where sp_id='"+session.getAttribute("Sid")+"' ";
                    con.executeCommand(upp);
              %>
        <script>
            alert("Password Updated Successfully");
            window.location="../GUEST/LOGIN.jsp";
            </script>
        <%
                }
                else
                {
                         
              %>
        <script>
            alert("PASSWORD DOES NOT MATCH");
            window.location="EditTMPwd.jsp";
            </script> 
            <%
                }
                    
            }
            
            else
            {
              %>
        <script>
            alert("WRONG CURRRENT PASSWORD ");
            window.location="EditTMPwd.jsp";
            </script> 
            <%   
            }
        }
            
          
            
    }
    %>
        <form method="post">
            <table align="center">
                <tr>
                    <td>
                        Current Password</td></tr><tr><td><input type="password" name="cpwd"></td>
                    
                </tr>
                <tr>
                    <td>
                        New Password</td></tr><tr><td><input type="password" name="npwd" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required name="txt_pass"></td>
                    
                </tr>
                <tr>
                    <td>
                        Confirm Password</td></tr><tr><td><input type="password" name="cnpwd"></td>
                    
                </tr>
                <tr>
                    <td colspan="2"><center>
                    <input type="submit" name="save" value="SAVE">
                    <input type="reset" name="cancel" value="CANCEL">
                </center></td>
                </tr>
            </table>
        </form>
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
