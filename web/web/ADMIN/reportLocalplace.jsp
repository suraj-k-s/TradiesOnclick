<%@page import="java.sql.ResultSet "%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
 <%@include file="Header.jsp" %>
<body>
<div id="tab" align="center">
<canvas id="myChart1" style="width:100%;max-width:600px"></canvas>

<script>


var xValues = [
<%

  String sel="select * from tbl_localplace";
  ResultSet rs=con.selectCommand(sel);
  while(rs.next())
  {
      out.print (rs.getString("localPlace_id")+",");
      
  }

%>
];

var yValues = [
<%
  String sel2="select * from tbl_localplace";
  //System.out.println (sel2);
  ResultSet rss=con.selectCommand(sel2);
  while(rss.next())
  {
	  
	String sel1="select COUNT(sb_id) as sbcount from tbl_servicebooking sb inner join tbl_servicedetails sd on sd.sdetails_id=sb.sdetails_id inner join tbl_tradesmen tm on tm.tm_id=sd.tm_id inner join tbl_localplace lo on tm.localPlace_id=lo.localPlace_id where tm.localPlace_id='"+rss.getString("localPlace_id")+"'";
	
        System.out.println (sel1);
	  
    ResultSet rs1=con.selectCommand(sel1);
  while(rs1.next())
	  {
        out.print (rs1.getString("sbcount")+",");
	  }
  }

%>
];



var barColors = [
  "#b91d47",
  "#00aba9",
  "#2b5797",
  "#e8c3b9",
  "#1e7145",
  "#aaa"
];

new Chart("myChart1", {
  type: "doughnut",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
    title: {
      display: true,
      text: "All Bookings"
    }
  }
});
</script>

</div>
</body>
 <%@include file="footer.jsp" %>
</html>
