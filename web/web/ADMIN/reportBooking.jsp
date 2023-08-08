<%-- 
    Document   : reportBooking
    Created on : 11 Jul, 2023, 10:54:56 AM
    Author     : User
--%>

<%@page import="java.sql.ResultSet "%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Report</title>
    <%@include file="Header.jsp" %>
    <link rel="stylesheet" href="../Assets/Template/form.css" />
    </head>
   <body>
        <br><br><br>
          <div id="tab" align="center">
        
        <center><h1><b><u>Booking Report</u></b></h1><br>
      <form method="post">
          <center>  <table align="center">
                <tr><td>From</td><td><input type="date" name="fromdate" ></tr>
                <tr><td>To</td><td><input type="date" name="todate" ></tr>
                <tr><td></td><td><input type="submit" name="submit" value="Submit">
                    <input type="reset" name="cancel" value="Cancel">
                    </td></tr>
              </table></center>
        </form>
            
            <%
            
        if(request.getParameter("submit")!=null)
        {
            
            
           
            
            
             String sel= "select count(*) as count from tbl_servicebooking  where sb_date BETWEEN '"+request.getParameter("fromdate")+"' AND  '"+request.getParameter("todate")+"' "; 
           ResultSet bookrep = con.selectCommand(sel);
         while(bookrep.next())
               
            {
                int count=0,countc=0,countr=0,countw=0,countca=0 ; double avgda=0, avgw=0, avgm=0;
                String confirmed= "select count(*) as countc from tbl_servicebooking  where sb_date BETWEEN '"+request.getParameter("fromdate")+"' AND  '"+request.getParameter("todate")+"' and sb_status = 1 "; 
           ResultSet Confirmed = con.selectCommand(confirmed);
            
          
           String rejected= "select count(*) as countr from tbl_servicebooking  where sb_date BETWEEN '"+request.getParameter("fromdate")+"' AND  '"+request.getParameter("todate")+"' and sb_status=2 "; 
           ResultSet Rejected = con.selectCommand(rejected);
            
           String completed= "select count(*) as countca from tbl_servicebooking  where sb_date BETWEEN '"+request.getParameter("fromdate")+"' AND  '"+request.getParameter("todate")+"' and work_stat=1 "; 
           ResultSet Completed = con.selectCommand(completed);
            
           String wconfi= "select count(*) as countw from tbl_servicebooking  where sb_date BETWEEN '"+request.getParameter("fromdate")+"' AND  '"+request.getParameter("todate")+"' and sb_status= 0 "; 
           ResultSet Wait = con.selectCommand(wconfi);
           if(Rejected.next() & Wait.next() & Completed.next() & Confirmed.next() )
               
           {
               
               countr=Rejected.getInt("countr");
            countw=Wait.getInt("countw");
            countca=Completed.getInt("countca");
            countc=Confirmed.getInt("countc");
              String avgday=" SELECT COUNT(*) / COUNT(DISTINCT DATE(sb_date)) AS average_bookings_per_day FROM tbl_servicebooking WHERE sb_date BETWEEN '"+request.getParameter("fromdate")+"' AND  '"+request.getParameter("todate")+"'";

            ResultSet AvgD = con.selectCommand(avgday);
            String avgwe="SELECT COUNT(*) / COUNT(DISTINCT WEEK(sb_date)) AS average_bookings_per_week FROM tbl_servicebooking WHERE sb_date BETWEEN '"+request.getParameter("fromdate")+"' AND  '"+request.getParameter("todate")+"'";
            ResultSet AvgW = con.selectCommand(avgwe);
            String avgmo=" SELECT COUNT(*) / COUNT(DISTINCT MONTH(sb_date)) AS average_bookings_per_month FROM tbl_servicebooking WHERE sb_date BETWEEN '"+request.getParameter("fromdate")+"' AND  '"+request.getParameter("todate")+"'";
            ResultSet AvgM = con.selectCommand(avgmo);
            if(AvgD.next() & AvgW.next() & AvgM.next())
            {
                avgda=AvgD.getDouble("average_bookings_per_day");
                avgw=AvgW.getDouble("average_bookings_per_week");
                avgm=AvgM.getDouble("average_bookings_per_month");
                
           
                
            }
               
           }
               %>
   
        <h3>Date range: <%=request.getParameter("fromdate")%> - <%=request.getParameter("todate")%> </h3> 
    <h3>Booking Overview:</h3></center> 
   <center> <table border="2" align ="center"><tr><th>Total Bookings</th><td><%=bookrep.getInt("count")%></td></tr>
        <tr><th>Confirmed</th><td style="width: 200px;"><%=countc%></td></tr>
    <tr><th>Rejected</th><td><%=countr%></td></tr>
    <tr><th>Completed</th><td><%=countca%></td></tr>
    <tr><th>Waiting For Confirmation</th><td><%=countw%></td></tr></table></center><br><br>
    
    <center> <h3>Booking Frequency:</h3><br></center> 
    <center> <table border="2" align ="center"><tr><th>Average Bookings Per Day</th><td style="width: 200px;"><%=avgda%></td></tr>
        <tr><th>Average Bookings Per Week</th><td ><%=avgw%></td></tr>
    <tr><th>Average Bookings Per Week</th><td><%=avgm%></td></tr>
        </table><br></center>
    <center> <h3>Most Popular Service Booked:</h3><br></center> 
    <center>  <table border="2" align ="center"><tr><th>Service Type</th><th>Booking Count</th>
           <% 
           
            String serviceBook = " SELECT st.serviceType AS service_type, COUNT(*) AS booking_count FROM tbl_servicebooking sb JOIN tbl_servicedetails sd ON sb.sdetails_id = sd.sdetails_id JOIN tbl_tradesmen tm ON sd.tm_id = tm.tm_id JOIN tbl_servicetype st ON tm.serviceType_id = st.serviceType_id GROUP BY st.serviceType";
              ResultSet sbo = con.selectCommand(serviceBook); 
           while (sbo.next()) { %>
    <tr>
      <td><%= sbo.getString("service_type") %></td>
      <td><%= sbo.getInt("booking_count") %></td>
    </tr>
  <% } %>
  
        </table></center>

    
               <%
           
            }
          
          
        }
        %>
          </div>
    </body>
     <%@include file="footer.jsp" %>
</html>
