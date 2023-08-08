/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author User
 */
@WebService(serviceName = "Newwebservice")
public class Newwebservice {

    ConnectionClass con = new ConnectionClass();
    private static final Logger logger = Logger.getLogger(Newwebservice.class.getName());

    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "login")
    public String login(@WebParam(name = "email") String email, @WebParam(name = "password") String password) {

        String selqry = "select * from tbl_customer where customer_email='" + email + "' and customer_password='" + password + "'";
        ResultSet rs = con.selectCommand(selqry);

        JSONArray j = new JSONArray();

        try {
            if (rs.next()) {
                JSONObject jo = new JSONObject();

                try {
                    jo.put("id", rs.getString("customer_id"));
                    jo.put("name", rs.getString("customer_name"));

                    j.put(jo);

                } catch (JSONException ex) {
                    Logger.getLogger(Newwebservice.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(Newwebservice.class.getName()).log(Level.SEVERE, null, ex);
        }

        //TODO write your implementation code here:
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "registration")
    public String registration(@WebParam(name = "localplace") String localplace, @WebParam(name = "name") String name, @WebParam(name = "phone") String phone, @WebParam(name = "address") String address, @WebParam(name = "email") String email, @WebParam(name = "password") String password) {
        String insq = "insert into tbl_customer (customer_name,customer_address,customer_contact,customer_email,customer_password,customer_reg_date,localPlace_id)values('" + name + "', '" + address + "','" + phone + "','" + email + "', '" + password + "',curdate(),'" + localplace + "')";

        String flag = "0";
        boolean status = con.executeCommand(insq);

        if (status == true) {
            flag = "1";
        } else {
            flag = "2";
        }
        return flag;

    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "myprofile")
    public String myprofile(@WebParam(name = "id") String id) {
        String select = "select * from tbl_customer c inner join tbl_localplace p on p.localPlace_id=c.localPlace_id where customer_id='" + id + "'";
        ResultSet rs = con.selectCommand(select);
        System.out.println(select);
        JSONArray j = new JSONArray();
        try {
            if (rs.next()) {
                JSONObject jo = new JSONObject();
                try {
                    jo.put("name", rs.getString("customer_name"));
                    jo.put("place", rs.getString("localPlace_name"));
                    jo.put("phone", rs.getString("customer_contact"));
                    jo.put("email", rs.getString("customer_email"));
                    jo.put("address", rs.getString("customer_address"));
                    jo.put("contact", rs.getString("customer_contact"));
                    jo.put("accStartDate", rs.getString("customer_reg_date"));

                    j.put(jo);
                } catch (JSONException ex) {
                    Logger.getLogger(Newwebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Newwebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    /**
     * Web service operation
     */
    @WebMethod(operationName = "selectLocalPlace")
    public String selectLocalPlace() {
        //TODO write your implementatioStrn code here:
        String sel = "select * from tbl_localplace";
        ResultSet rs = con.selectCommand(sel);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                try {
                    jo.put("pid", rs.getString("localPlace_id"));
                    jo.put("pname", rs.getString("localPlace_name"));
                    j.put(jo);
                } catch (JSONException ex) {
                    Logger.getLogger(Newwebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Newwebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        return j.toString();
    }

    @WebMethod(operationName = "selectServiceType")
    public String selectServiceType() {
        //TODO write your implementatioStrn code here:
        String sel = "select * from tbl_servicetype";
        ResultSet rs = con.selectCommand(sel);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                try {
                    jo.put("sid", rs.getString("serviceType_id"));
                    jo.put("sname", rs.getString("serviceType"));
                    j.put(jo);
                } catch (JSONException ex) {
                    Logger.getLogger(Newwebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Newwebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "editprofile")
    public String editprofile(@WebParam(name = "userid") String userid, @WebParam(name = "username") String username, @WebParam(name = "useraddress") String useraddress, @WebParam(name = "usercontact") String usercontact, @WebParam(name = "useremail") String useremail) {
        //TODO write your implementation code here:

        String s = "";
        String upQry = "update tbl_customer set customer_name='" + username + "',customer_contact='" + usercontact + "',customer_email='" + useremail + "',customer_address='" + useraddress + "' where customer_id='" + userid + "' ";
        System.out.println(upQry);
        boolean b = con.executeCommand(upQry);
        if (b == true) {
            s = "Success";
        } else {
            s = "Fail";
        }
        return s;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "searchResultTM")
    public String searchResultTM(@WebParam(name = "ip") String ip, @WebParam(name = "localplaceid") String localplaceid, @WebParam(name = "servicetypeid") String servicetypeid) {
        String select = "select * from tbl_servicedetails sd inner join tbl_tradesmen tm on sd.tm_id=tm.tm_id inner join tbl_servicetype st on tm.serviceType_id = st.serviceType_id  inner join tbl_localplace lp on tm.localPlace_id= lp.localPlace_id where true and tm.tm_vstatus=1 ";
        if (!localplaceid.equals("")) {
            select += " and tm.localPlace_id='" + localplaceid + "'";
        }
        if (!servicetypeid.equals("")) {
            select += " and  tm.serviceType_id='" + servicetypeid + "'";
        }

        System.out.println(select);
        ResultSet rs = con.selectCommand(select);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                try {
                    jo.put("id", rs.getString("tm_id"));
                    jo.put("name", rs.getString("tm_name"));
                    jo.put("photo", "http://" + ip + ":8084/TradiesOnclick/Assets/Files/TM/" + rs.getString("tm_photo"));
                    jo.put("servicetype", rs.getString("serviceType"));
                    jo.put("charge", rs.getString("sdetails_rate"));
                    j.put(jo);
                } catch (JSONException ex) {
                    Logger.getLogger(Newwebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Newwebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "tradieDetails")
    public String tradieDetails(@WebParam(name = "id") String id, @WebParam(name = "ip") String ip) {
        String selectT = "select * from tbl_servicedetails sd inner join tbl_tradesmen tm on sd.tm_id=tm.tm_id  where tm.tm_id='" + id + "' ";
        ResultSet rs = con.selectCommand(selectT);
        float avg;
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                try {
                    avg = Integer.parseInt(rs.getString("sdetails_rate")) / 2;
                    jo.put("name", rs.getString("tm_name"));
                    jo.put("address", rs.getString("tm_address"));
                    jo.put("phone", rs.getString("tm_contact"));
                    jo.put("photo", "http://" + ip + ":8084/TradiesOnclick/Assets/Files/TM/" + rs.getString("tm_photo"));
                    jo.put("average_rating", rs.getString("avg_rating"));
                    jo.put("charge", rs.getString("sdetails_rate"));
                    jo.put("about", rs.getString("sdetails_content"));
                    jo.put("advance", avg);
                    jo.put("sdid", rs.getString("sdetails_id"));

                    j.put(jo);
                } catch (JSONException ex) {
                    Logger.getLogger(Newwebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Newwebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "customerReviews")
    public String customerReviews(@WebParam(name = "id") String id, @WebParam(name = "ip") String ip) {

        String selectR = "select * from tbl_review r inner join tbl_customer cu on r.customer_id= cu.customer_id where r.tm_id='" + id + "' group by r.customer_id";
        System.out.println(selectR);
        ResultSet rs = con.selectCommand(selectR);
        System.out.println(selectR);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                try {
                    jo.put("name", rs.getString("customer_name"));
                    jo.put("dateNtime", rs.getString("review_datetime"));
                    jo.put("review", rs.getString("user_review"));

                    jo.put("rating", rs.getString("user_rating"));

                    j.put(jo);
                } catch (JSONException ex) {
                    Logger.getLogger(Newwebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Newwebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "bookWork")
    public String bookWork(@WebParam(name = "id") String id, @WebParam(name = "sdid") String sdid, @WebParam(name = "fordate") String fordate, @WebParam(name = "details") String details, @WebParam(name = "advance") String advance, @WebParam(name = "todate") String todate, @WebParam(name = "starttime") String starttime) {

        String s = "";
        String inQry = "insert into tbl_servicebooking (sb_date,sb_fordate,sb_detail,customer_id,sdetails_id,sb_advanceamount,sb_todate,sb_starttime) values(curdate(),'" + fordate + "','" + details + "','" + id + "','" + sdid + "','" + advance + "','" + todate + "','"+starttime+"')";
        System.out.println(inQry);
        boolean b = con.executeCommand(inQry);
        if (b == true) {
            s = "Success";
        } else {
            s = "Fail";
        }
        return s;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "myBookings")
    public String myBookings(@WebParam(name = "id") String id) {
        //TODO write your implementation code here:
        String selB = "select * from tbl_servicebooking sb inner join tbl_servicedetails sd on sd.sdetails_id=sb.sdetails_id inner join  tbl_tradesmen t on sd.tm_id =t.tm_id inner join tbl_servicetype st on t.serviceType_id=st.serviceType_id where sb.customer_id='" + id + "'";
        System.out.println(selB);
        ResultSet rs = con.selectCommand(selB);
        System.out.println(selB);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                try {
                    jo.put("bid", rs.getString("sb_id"));
                    jo.put("name", rs.getString("tm_name"));
                    jo.put("phone", rs.getString("tm_contact"));
                    jo.put("bdate", rs.getString("sb_date"));
                    jo.put("fdate", rs.getString("sb_fordate"));
                    jo.put("serivce", rs.getString("serviceType"));
                    jo.put("rstatus", rs.getString("sb_status"));
                    jo.put("wstatus", rs.getString("work_stat"));
                    jo.put("pstatus", rs.getString("payment_status"));
                    jo.put("tid",rs.getString("tm_id"));
                    j.put(jo);
                } catch (JSONException ex) {
                    Logger.getLogger(Newwebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Newwebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "Feedback")
    public String Feedback(@WebParam(name = "id") String id, @WebParam(name = "data") String data) {
        String in = "insert into tbl_feedback (fb_content,fb_date,customer_id) values('" + data + "',curdate(),'" + id + "')";
        con.executeCommand(in);
        return "Feedback Submitted";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "Complaint")
    public String Complaint(@WebParam(name = "id") String id, @WebParam(name = "title") String title, @WebParam(name = "data") String data) {
        String in="insert into tbl_complaint (complaint_title,complaint_content,complaint_date,customer_id) "
                + "values('"+title+"','"+data+"',curdate(),'"+id+"')";
        con.executeCommand(in);
        return "Complaint Submitted Successfully";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "CancelRequest")
    public String CancelRequest(@WebParam(name = "id") String id) {
        String in="delete from tbl_servicebooking where sb_id='"+id+"'";
        System.out.println(in);
        con.executeCommand(in);
        return "Booking Deleted";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "PaymentUpdate")
    public String PaymentUpdate(@WebParam(name = "id") String id,@WebParam(name = "amount") String amount) {
        String in="update tbl_servicebooking set payment_status=1 where sb_id='"+id+"'";
        con.executeCommand(in);
        
         System.out.println(in);
        return "Payment Completed";
    }

 
    @WebMethod(operationName = "reviewFromCustomers")
    public String reviewFromCustomers(@WebParam(name = "id") String id, @WebParam(name = "username") String username, @WebParam(name = "rating") String rating,  @WebParam(name = "tid") String tid,@WebParam(name = "reviewContent") String reviewContent) {
       String insq="INSERT INTO tbl_review(user_name,user_rating,user_review,review_datetime,tm_id,customer_id) VALUES('"+username+"','"+rating+"','"+reviewContent+"',SYSDATE(),'"+tid+"','"+id+"')";
      
       
      System.out.println(insq);
        boolean b = con.executeCommand(insq);
        if(b== true){
       String sel="select *,count(review_id) as count from tbl_review where tm_id='"+tid+"' GROUP BY tm_id";
       ResultSet selR=con.selectCommand(sel);
          System.out.println(sel);
      int count=0,totalrating=0;
      float avg_rating;
     JSONArray j = new JSONArray();
      try {
            while (selR.next()) {
                JSONObject jo = new JSONObject();
                try {
                    jo.put("userrating", selR.getInt("user_rating"));
                    jo.put("Count", selR.getString("count"));
                    
                    j.put(jo);
                    
                    count++;
                    totalrating=totalrating + selR.getInt("user_rating");
                    
                } catch (JSONException ex) {
                    Logger.getLogger(Newwebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                
            }
            
              if(totalrating!=0)
              {

           avg_rating = totalrating / count;
           String up="update tbl_tradesmen set avg_rating= '"+avg_rating+"' where tm_id='" + tid + "'   ";
          con.executeCommand(up);
           System.out.println(up);
           }
        } catch (SQLException ex) {
            Logger.getLogger(Newwebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
       }  
       return "Review Added";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "Notification")
    public String Notification(@WebParam(name = "id") String id) {
        String selB = "select * from tbl_notification where user_id='" + id + "' ORDER BY notification_id DESC";
        ResultSet rs = con.selectCommand(selB);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                try {
                    jo.put("date", rs.getString("notification_date"));
                    jo.put("title", rs.getString("notification_title"));
                    jo.put("content", rs.getString("notification_content"));
                    j.put(jo);
                } catch (JSONException ex) {
                    Logger.getLogger(Newwebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Newwebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        return j.toString();
    
    }

   
}
    
    
    
