<%-- 
    Document   : RegistrationCust
    Created on : 1 Jun, 2023, 11:52:10 AM
    Author     : User
--%>

<jsp:useBean class="DB.ConnectionClass" id="co"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form TM</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="../Assets/Template/Register/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="../Assets/Template/Register/css/style.css">
</head>
    <body><center>
        </center>
         <div class="main">

        <section class="signup">
            <!-- <img src="../Assets/Template/Register/images/signup-bg.jpg" alt=""> -->
            <div class="container">
                <div class="signup-content">
                    <form method="POST" id="signup-form" class="signup-form"    action="../Assets/ActionPages/tmAction.jsp" enctype="multipart/form-data">
                        <h2 class="form-title">Create account</h2>
                        <div class="form-group">Name
                            <input type="text" class="form-input" name="name" id="name" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$"/>
                        </div>
                        
                         <div class="form-group">Address
                             <textarea class="form-input" name="add" id="add" ></textarea>
                        </div>
                        <div class="form-group">Phone Number
                            <input type="text" class="form-input"  name="phn" pattern="[7-9]{1}[0-9]{9}" 
                title="Phone number with 7-9 and remaing 9 digit with 0-9"/>
                        </div>
                        
                        
                        <div class="form-group">Email
                            <input type="email" class="form-input" name="email" id="email"  required/>
                        </div>
                        <div class="form-group" >Place
                           <select name="place" dropdown class="form-input"  required>
                               <option></option>
                            <%
                            String sello="select * from tbl_localPlace ";
                         ResultSet rsl=co.selectCommand(sello);
                         while(rsl.next())
                         {
                             %>
                        
                             <option value="<%=rsl.getString("localPlace_id")%>" ><%=rsl.getString("localPlace_name")%></option>
                               <%
                         }
                           
                            %>
               </select>
  
                        </div>
               
              
                <div class="form-group">Service Type
                            <select name="st"  class="form-input" >
                                <option ></option>
                            <%
                            String selst="select * from tbl_servicetype ";
                         ResultSet rss=co.selectCommand(selst);
                         while(rss.next())
                         {
                             
                             %>
                             
                             <option value="<%=rss.getString("serviceType_id")%>" ><%=rss.getString("serviceType")%></option>
                               <%
                         }
                           
                         %>
                            
                            
                        </select>
                </div>
                 
                        
                <div class="form-group">Upload Photo
                            <input type="file" class="form-input" name="photo" id="photo"  />
                        </div>
                <div class="form-group">Upload Proof
                            <input type="file" class="form-input" name="proof" id="proof"  />
                        </div>
               
                        
                        <div class="form-group">Create Password
                            <input type="text" class="form-input" name="pswd" id="password" />
                            <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                        </div>
                        
                        <div class="form-group">
                            <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                            <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Sign up">
                        </div>
                    </form>
                    <p class="loginhere">
                        Already have an account ? <a href="LOGIN.jsp" class="loginhere-link">Login here</a>
                    </p>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="../Assets/Template/Register/vendor/jquery/jquery.min.js"></script>
    <script src="../Assets/Template/Register/js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>