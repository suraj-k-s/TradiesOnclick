<%-- 
    Document   : ReportCustomer
    Created on : 13 Jul, 2023, 8:02:49 AM
    Author     : User
--%>
<%@page import="java.sql.ResultSet "%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <title>User Report</title>
        
          <%@include file="Header.jsp" %>
    </head>
   <body>
        <br><br><br>
         <div id="tab" align="center">
        
        <center><h1><b><u>Customer Report</u></b></h1><br>
      <form method="post">
          <center> <table align="center">
                <tr><td>From</td><td><input type="date" name="fromdate" ></tr>
                <tr><td>To</td><td><input type="date" name="todate" ></tr>
                <tr><td></td><td colspan="2"><input type="submit" name="submit" value="Submit">
                    <input type="reset" name="cancel" width="80%" value="Cancel">
                    </td></tr>
              </table></center>
                  </form>

           <%
            int totalreg=0;
        if(request.getParameter("submit")!=null)
        {
          String sel= "select count(*) as count from tbl_customer where customer_reg_date BETWEEN '"+request.getParameter("fromdate")+"' AND  '"+request.getParameter("todate")+"' "; 
           ResultSet countcust = con.selectCommand(sel);
           String selT= "select count(*) as counttm from tbl_tradesmen where tm_reg_date BETWEEN '"+request.getParameter("fromdate")+"' AND  '"+request.getParameter("todate")+"' "; 
           ResultSet countTM = con.selectCommand(selT);
         while(countcust.next() & countTM.next()) 
         {
          totalreg= countcust.getInt("count")  + countTM.getInt("counttm");     
            
           %>
        <h3>Date range: <%=request.getParameter("fromdate")%> - <%=request.getParameter("todate")%> </h3> 
    <h3>Registration Overview:</h3></center> 
   <center> <table border="2" align ="center"><tr><th>Total Registrations</th><td  style="width: 200px;"><%=totalreg%></td></tr>
        <tr><th>Customer Registrations</th><td ><%= countcust.getInt("count")%></td></tr>
    <tr><th>Tradesmen Registrations</th><td><%=countTM.getInt("counttm")%></td></tr>
       </table></center><br>
    <%
    String selTv= "select count(*) as counttmv from tbl_tradesmen where tm_reg_date BETWEEN '"+request.getParameter("fromdate")+"' AND  '"+request.getParameter("todate")+"' and tm_vstatus=1"; 
           ResultSet countTMv = con.selectCommand(selTv);
           String selTwv= "select count(*) as counttmw from tbl_tradesmen where tm_reg_date BETWEEN '"+request.getParameter("fromdate")+"' AND  '"+request.getParameter("todate")+"' and tm_vstatus=0"; 
           ResultSet countTMwv = con.selectCommand(selTwv);
           String selTr= "select count(*) as counttmr from tbl_tradesmen where tm_reg_date BETWEEN '"+request.getParameter("fromdate")+"' AND  '"+request.getParameter("todate")+"' and tm_vstatus=2"; 
           ResultSet countTMr = con.selectCommand(selTr);
           
           
           if(countTMv.next() & countTMr.next() & countTMwv.next())
           {
              
               %>
                <center>  <h3>Tradesmen Verification:</h3></center> 
                <center> <table border="2" align ="center"><tr><th>Tradesmen Registrations</th><td  style="width: 200px;"><%=countTM.getInt("counttm")%></td></tr>
        <tr><th>Verified </th><td ><%= countTMv.getInt("counttmv")%></td></tr>
    <tr><th>Waiting For Verification</th><td><%=countTMwv.getInt("counttmw")%></td></tr>
    <tr><th>Rejected</th><td><%=countTMr.getInt("counttmr")%></td></tr>
                    </table></center>
               <%
               
               
           }
         }
        }
    %>
                
                
     
           <center>  <h3>Registration Frequency:</h3></center> 
           <form method="post">
               <center> <table align="center">
                   <tr valign="bottom"><td>
                       Year<select id="yearDropdown" name="year">
  <option value="">---Select---</option>
</select>

<script>
  var select = document.getElementById("yearDropdown");
  var currentYear = new Date().getFullYear();
  var startYear = 2018;

  for (var year = startYear; year <= currentYear; year++) {
    var option = document.createElement("option");
    option.value = year;
    option.text = year;
    select.appendChild(option);
  }
</script>

                       </td>  
                       <td>    
         Month<select id="monthDropdown" name="month">
  <option value="">---Select---</option>
</select>

<script>
  var select = document.getElementById("monthDropdown");
  var months = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  ];

  for (var i = 0; i < months.length; i++) {
    var option = document.createElement("option");
    option.value = months[i];
    option.text = months[i];
    select.appendChild(option);
  }
</script></td><td width="200px"><input type='submit'  name='go'  value='Go'</td>
                      
                   
                   </tr>

                   </table></center>
  </form>
           
           <%
           if(request.getParameter("go")!=null)
           {
            
              
               String avgregiTM= "SELECT AVG(registration_count) AS avtm FROM ( SELECT COUNT(*) AS registration_count  FROM tbl_tradesmen WHERE MONTHNAME(tm_reg_date) = '"+request.getParameter("month")+"' AND YEAR(tm_reg_date) = '"+request.getParameter("year")+"' GROUP BY DATE(tm_reg_date)) AS subquery ";
               ResultSet avtm= con.selectCommand(avgregiTM);
                String avgregiC= "SELECT AVG(registration_countc) AS avc FROM ( SELECT COUNT(*) AS registration_countc  FROM tbl_customer WHERE MONTHNAME(customer_reg_date) = '"+request.getParameter("month")+"' AND YEAR(customer_reg_date) = '"+request.getParameter("year")+"' GROUP BY DATE(customer_reg_date)) AS subquery ";
               ResultSet avc= con.selectCommand(avgregiC);
              if( avtm.next() & avc.next())
               {
               
               
              %>
             
              <center> <table border="2" align ="center">
        <tr><th>Average Customer Registrations </th><td style="width: 200px;" ><%= avc.getDouble("avc")%></td></tr>
    <tr><th>Average Tradesmen Registration</th><td><%=avtm.getDouble("avtm")%></td></tr>
   
                  </table></center>
    <%
           }
           
  
           }
    
       
             
    
        
        
         %> 
         </div>
    </body>
     <%@include file="footer.jsp" %>
</html>
