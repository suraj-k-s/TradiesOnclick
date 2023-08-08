<%-- 
    Document   : SearchService
    Created on : 2 Jun, 2023, 12:43:00 PM
    Author     : User
--%>
<jsp:useBean class="DB.ConnectionClass" id="co"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Customer Search Service</title>
   <%@include file="Header.jsp" %>
    </head>
    <body>
        <br><br><br>
        <div id="tab" align="center">
            <center><h2><b><u>SEARCH SERVICES</u></b></h2></center><br><br>
    <center><form  method="post"><table alig="center" ><tr>
                    <td>
                        Select Place</td><td> <select name="lp" id="lp" onchange="getService()">
                              <option >Select </option>
                            <%
                            String sel="select * from tbl_localplace ";
                         ResultSet rts1=co.selectCommand(sel);
                         while(rts1.next())
                         {
                             
                             %>
                             
                             <option value="<%=rts1.getString("localPlace_id")%>" ><%=rts1.getString("localPlace_name")%></option>
                               <%
                         }
                           
                            %>
                            
                            
                        </select>
                    </td>
                

                    <td>
                       Select Service Type</td><td><select name="stype" id="stype" onchange="getService()">
                            <option >Select </option>
                            <%
                            String sel3="select * from tbl_servicetype ";
                         ResultSet rts2=co.selectCommand(sel3);
                         while(rts2.next())
                         {
                             
                             %>
                             
                             <option value="<%=rts2.getString("serviceType_id")%>" ><%=rts2.getString("serviceType")%></option>
                               <%
                         }
                           
                            %>
                            
                            
                        </select>
                    </td>
              
                            
                            
                            
                        </select>
                    </td>
                    
                    
                </tr></table>
    </div>
                            <div id="tb">
     <table border="0" cellpadding="50px" align="center">
           
           <tr >
    <%
        int i=0;
   String show="select * from tbl_tradesmen where tm_vstatus=1";
   ResultSet rsh=co.selectCommand(show);
   
   while(rsh.next())
   {
       
       String selcprol="select * from tbl_localPlace where localPlace_id='"+rsh.getString("localPlace_id")+"'";
        ResultSet rcprol=co.selectCommand(selcprol);
        String selcpros="select * from tbl_servicetype where servicetype_id='"+rsh.getString("serviceType_id")+"'";
         ResultSet rcpros=co.selectCommand(selcpros);
         if(rcprol.next()& rcpros.next())
         {
           i++;
           
                                                            int average_rating = 0;
                                                            int total_review = 0;
                                                            int five_star_review = 0;
                                                            int four_star_review = 0;
                                                            int three_star_review = 0;
                                                            int two_star_review = 0;
                                                            int one_star_review = 0;
                                                            int total_user_rating = 0;

                                                            String query = "SELECT * FROM tbl_review where tm_id = '" + rsh.getString("tm_id") + "' ORDER BY review_id DESC";
                                                            ResultSet rs1 = co.selectCommand(query);
                                                            while (rs1.next()) {
                                                                if (rs1.getString("user_rating").equals("5")) {
                                                                    five_star_review++;
                                                                }
                                                                if (rs1.getString("user_rating").equals("4")) {
                                                                    four_star_review++;
                                                                }
                                                                if (rs1.getString("user_rating").equals("3")) {
                                                                    three_star_review++;
                                                                }
                                                                if (rs1.getString("user_rating").equals("2")) {
                                                                    two_star_review++;
                                                                }
                                                                if (rs1.getString("user_rating").equals("1")) {
                                                                    one_star_review++;
                                                                }
                                                                total_review++;
                                                                total_user_rating = total_user_rating + Integer.parseInt(rs1.getString("user_rating"));
                                                            }
                                                            if (total_user_rating > 0) {
                                                                average_rating = total_user_rating / total_review;
                                                            }

       %>
       
      <td colspan="3"><center><p><img src="../Assets/Files/TM/<%=rsh.getString("tm_photo")%>" width="150" height="100"></center><br>
           <center>
    <!--Rating star code start-->
                            
                            
                                                                <h style="color:Red"> Rating  </h>&nbsp;
                                                                  <%

                                                                        if (average_rating == 5) {
                                                                    %> 
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                 <%
                                                                    }
                                                                    if (average_rating == 4) {
                                                                %>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                 <%
                                                                    }
                                                                    if (average_rating == 3) {
                                                                %>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                 <%
                                                                    }
                                                                    if (average_rating == 2) {
                                                                %>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                   <%
                                                                    }
                                                                    if (average_rating == 1) {
                                                                %>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                <%
                                                                    }
                                                                    if (average_rating == 0) {
                                                                %>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                <%
                                                                    }


                                                                %>
                                                                
           </center>
                            
                            
                            
                            
                            
                            <!--Rating star code end-->
    <br>
    <b>NAME:</b> <%=rsh.getString("tm_name")%><br>
    <b>CONTACT:</b>  <%=rsh.getString("tm_contact")%><br>
    <b>PLACE:</b>  <%=rcprol.getString("localPlace_name")%><br>
    <b>SERVICE TYPE:</b> <%=rcpros.getString("serviceType")%><br>
    <center><a href="viewDetails.jsp?seid=<%=rsh.getString("tm_id")%>">VIEW DETAILS</a></center></p></td>&nbsp;
    <%
    
     
      
   }
       if(i%4==0)
            {
                out.println("</tr>");
                                
                out.println("<tr>");
                 i=0;
            }
    
    
   }
    
    %>
         </table> 
       </div>
        
   
    </body>
    <%@include file="footer.jsp" %>
</html>
<script src="../Assets/JQuery/jQuery.js"></script>
                        <script>
                            function getService()
                            {
                                var lid=document.getElementById("lp").value;
                                var stid=document.getElementById("stype").value;
                                $.ajax({url:"../Assets/AjaxPages/Ajaxservice.jsp?lid=" + lid + "&stid=" + stid,
                                success: function(result){
                                    $("#tb").html(result);
                                }
                            })
                            }
                           
                        </script>
