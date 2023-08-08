<%-- 
    Document   : ReportTradiePerfomance
    Created on : 13 Jul, 2023, 12:54:40 PM
    Author     : User
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tradie Performance Report</title>
    <%@include file="Header.jsp" %>
    <!-- Add the Font Awesome CSS link here -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
</head>
<body>
    <br><br><br>
    <div id="tab" align="center">
        <center>
            <h1><b><u>Tradesmen Performance Report</u></b></h1><br><br>
            <center>
                <h3><b><u>Over View</u></b></h3><br>
                <form method="post">
                    <center>
                        <table align="center">
                            <tr>
                                <td>From</td>
                                <td><input type="date" name="fromdate"></td>
                            </tr>
                            <tr>
                                <td>To</td>
                                <td><input type="date" name="todate"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <input type="submit" name="submit" value="Submit">
                                    <input type="reset" name="cancel" value="Cancel">
                                </td>
                            </tr>
                        </table>
                    </center>
                </form>
                
                
                <%
                if(request.getParameter("submit")!=null)
                    
                {
                    %>
                     <center>
                         <br><br> <table>
                                    <tr>
                                        <th>Name</th>
                                        <th>Service Type</th>
                                        <th>No:of Bookings</th>
                                        <th>Average Ratings</th>
                                    </tr>
                    
                    <%
                  
                    String det="SELECT t.*, COUNT(sb.sb_id) AS number_of_bookings, AVG(t.avg_rating) AS avg_rating FROM tbl_tradesmen t JOIN tbl_servicedetails sd ON t.tm_id = sd.tm_id JOIN tbl_servicebooking sb ON sd.sdetails_id = sb.sdetails_id WHERE sb.sb_date >= '"+request.getParameter("fromdate")+"'  AND sb.sb_date <= '"+request.getParameter("todate")+"' GROUP BY t.tm_name ORDER BY number_of_bookings DESC";  
                    ResultSet Det = con.selectCommand(det);
                   
                    while(Det.next())
                    {
                       %>
                
                <%
                        int count=0, avgRating=0;
                        count = Det.getInt("number_of_bookings");
                        avgRating = Det.getInt("avg_rating");
                        String selst="select * from tbl_servicetype where serviceType_id='"+Det.getString("tm_id")+"'";
                        ResultSet s=con.selectCommand(selst);
                       while(s.next())
                        {
                %>
                           
                                    <tr>
                                        <td><%=Det.getString("tm_name")%></td>
                                        <td><%=s.getString("serviceType")%></td>
                                        <td><%=count%></td>
                                        <td>
                                            <% 
                                                // Loop to display stars based on the average rating
                                                for (int m = 1; m <= 5; m++) {
                                                    if (m <= avgRating) {
                                            %>
                                                <i class="fas fa-star" style="color: yellow;"></i>
                                            <%  
                                                } else {
                                            %>
                                                <i class="far fa-star" style="color: grey;"></i>
                                            <%  
                                                }
                                            } 
                                            %>
                                        </td>
                                    
                <%
                        }
                    }
                }
                %>
                </tr>
                         </table><br><br>
                            </center>
            </center>
        </center>
    </div>
</body>
<%@include file="footer.jsp" %>
</html>
