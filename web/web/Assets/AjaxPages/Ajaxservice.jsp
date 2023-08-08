<%@page import="java.sql.ResultSet"  %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

        
<%
    String lid="",stid="";
    lid=request.getParameter("lid");
    stid=request.getParameter("stid");
  
    
    String sel="select * from tbl_tradesmen s inner join tbl_localplace l  on l.localPlace_id= s.localPlace_id inner join tbl_servicetype t on s.serviceType_id=t.serviceType_id where s.tm_vstatus='1'";
    if(lid!="")
    {
        sel+=" and l.localPlace_id='"+lid+"' ";
    }
    if(stid!="")
    {
        sel+=" and t.serviceType_id='"+stid+"' ";
    }
   
    %>
<table align="center" border="1">
    <tr>
<%
    ResultSet rs=con.selectCommand(sel);
    System.out.println(sel);
    int i=0;
    while(rs.next())
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

                                                            String query = "SELECT * FROM tbl_review where tm_id = '" + rs.getString("tm_id") + "' ORDER BY review_id DESC";
                                                            ResultSet rs1 = con.selectCommand(query);
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
      <td ><p >
              <img src="../Assets/Files/TM/<%=rs.getString("tm_photo")%>" width="150" height="100"><br>
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
              <b>NAME:</b><%=rs.getString("tm_name")%><br>
               
          <b>CONTACT:</b>  <%=rs.getString("tm_contact")%><br>
          <b>PLACE:</b>  <%=rs.getString("localPlace_name")%><br>
          <b>SERVICE TYPE:</b>  <%=rs.getString("serviceType")%><br>
          <a href="viewDetails.jsp?seid=<%=rs.getString("tm_id")%>">VIEW DETAILS</a>
           </p></td>
     <% 
            if(i%4==0)
            {
                out.println("</tr>");
                                
                out.println("<tr>");
                 i=0;
            }
    }
%>
