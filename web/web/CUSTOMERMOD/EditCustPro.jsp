<%-- 
    Document   : EditCustPro
    Created on : 1 Jun, 2023, 2:56:31 PM
    Author     : User
--%>
<jsp:useBean class="DB.ConnectionClass" id="co"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CUSTOMER PROFILE EDITING</title>
         <%@include file="Header.jsp" %>
    </head>
    <body>
           <br><br><br>
        <div id="tab" align="center">
       
    <%
            
        String  na="",ad="",ct="",em="",pl="" ;
    String sel="select * from tbl_customer where customer_id='"+session.getAttribute("Cid")+"'";
    ResultSet rc=co.selectCommand(sel);
    if(rc.next())
    {
        
        na=rc.getString("customer_name");
        ad=rc.getString("customer_address");
        ct=rc.getString("customer_contact");
        em=rc.getString("customer_email");
        pl=rc.getString("localPlace_id");
        
        
    }
    if(request.getParameter("submit")!=null)
    {
        String up="update tbl_customer set customer_name='"+request.getParameter("name")+"', customer_address='"+request.getParameter("add")+"', customer_contact='"+request.getParameter("phn")+"', customer_email='"+request.getParameter("email")+"',localPlace_id='"+request.getParameter("place")+"' where customer_id='"+session.getAttribute("Cid")+"'";
        co.executeCommand(up);
        
        %>
        <script>
            alert("Profile Edited Successfully");
            window.location="MyProfileCUST.jsp";
            </script>
        <%
    }
    
    
    
    %>
    <body>
        <form method="post">
             <table align="center">
                <tr>
                <td>
                    NAME</td><td>
                    <input type="text" name="name" value="<%=na%>" name="txt_name" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$">
                </td><td></td><td></td>
                </tr><tr></tr><tr></tr>
            <tr>
                <td>
                   ADDRESS</td><td>
                    <textArea name="add" ><%=ad%></textarea>
                </td>
            </tr>
 <tr>
                <td>
                   CONTACT</td><td>
                    <input type="text" name="phn" value="<%=ct%>" required name="txt_contact" pattern="[7-9]{1}[0-9]{9}" 
                title="Phone number with 7-9 and remaing 9 digit with 0-9">
                </td>
            </tr>
 <tr>
                <td>
                   EMAIL</td><td>
                    <input type="email" name="email" required value="<%=em%>">
                </td>
            </tr>
            
               
<tr>
                    <td>
                        PLACE</td><td><select name="place" value="<%=pl%>" >
                            <option >Select </option>
                            <%
                            String sello="select * from tbl_localPlace ";
                         ResultSet rsl=co.selectCommand(sello);
                         while(rsl.next())
                         {
                             
                             %>
                             
                             <option value="<%=rsl.getString("localPlace_id")%>" <% if(pl.equals(rsl.getString("localPlace_id"))){
                                 out.print("selected");
              }%>><%=rsl.getString("localPlace_name")%></option>
                               <%
                         }
                           
                            %>
                            
                            
                        </select>
                    </td>
                </tr>

                <td></td><td>
                  
                    <input type="submit" name="submit" value="SAVE">
              

                  
                    <input type="reset" name="cancel" value="CANCEL">
                </td>

            </tr>
  <tr>  <td></td><td><a href="EditCustPwd.jsp">CHANGE PASSWORD</a></td></tr>
                
            </table>
        

        </form>
        </div>                
    </body>
      <%@include file="footer.jsp" %>
</html>
