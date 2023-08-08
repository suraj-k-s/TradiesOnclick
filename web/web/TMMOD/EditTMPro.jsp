<%-- 
    Document   : EditTMPro
    Created on : 1 Jun, 2023, 3:39:03 PM
    Author     : User
--%>

<jsp:useBean class="DB.ConnectionClass" id="co"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SERVICE  PROFILE EDITING</title>
      <%@include file="Header.jsp" %>
    </head>
    <body>
        <br><br><br>
         <br><br><br><br><br>
        <div id="tab" align="center">
       
    <%
        String  na="",ad="",ct="",em="",pl=""  ,st="";
    String sel="select * from tbl_tradesmen where tm_id='"+session.getAttribute("Sid")+"'";
    ResultSet rc=co.selectCommand(sel);
    if(rc.next())
    {
        
        na=rc.getString("tm_name");
        ad=rc.getString("tm_address");
        ct=rc.getString("tm_contact");
        em=rc.getString("tm_email");
        pl=rc.getString("localPlace_id");
        
        st=rc.getString("serviceType_id");
        
    }
    if(request.getParameter("submit")!=null)
    {
        String up="update tbl_tradesmen set tm_name='"+request.getParameter("name")+"', tm_address='"+request.getParameter("add")+"', tm_contact='"+request.getParameter("phn")+"', tm_email='"+request.getParameter("email")+"',localPlace_id='"+request.getParameter("place")+"',serviceType_id='"+request.getParameter("st")+"' where tm_id='"+session.getAttribute("Sid")+"'";
        co.executeCommand(up);
        
        %>
        <script>
            alert("Profile Edited Successfully");
            window.location="MyProfileTM.jsp";
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
                    <input type="text" name="name" value="<%=na%>"name="txt_name" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$">
                </td>
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

<tr>
                    <td>
                        SERVICE TYPE</td><td><select name="st"  value="<%=st%>">
                            <option >Select </option>
                            <%
                            String selst="select * from tbl_servicetype ";
                         ResultSet rss=co.selectCommand(selst);
                         while(rss.next())
                         {
                             
                             %>
                             
                             <option value="<%=rss.getString("serviceType_id")%>" <% if(st.equals(rss.getString("serviceType_id"))){
                                 out.print("selected");
              }%>><%=rss.getString("serviceType")%></option>
                               <%
                         }
                           
                            %>
                            
                            
                        </select>
                    </td>
                </tr>

<tr>
                <td colspan="2">
                  
                   <center> <input type="submit" name="submit" value="SAVE">
              

                  
                    <input type="reset" name="cancel" value="CANCEL"></center>
                </td>

            </tr>
    <tr>  <td colspan="2"><center><a href="EditTMPwd.jsp">CHANGE PASSWORD</a></center></td></tr>
                
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
