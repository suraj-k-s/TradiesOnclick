<%-- 
    Document   : LOGIN
    Created on : 1 Jun, 2023, 12:17:57 PM
    Author     : User
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <%@page import="java.sql.ResultSet" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="../Assets/Template/Login/logform/fonts/icomoon/style.css">

    <link rel="stylesheet" href="../Assets/Template/Login/logform/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../Assets/Template/Login/logform/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="../Assets/Template/Login/logform/css/style.css">

    <title>Login</title>
    <%@include file="header.jsp" %>
  </head>
    <body><center>
       
        <%
        if(request.getParameter("lgn")!=null)
        {
            String selus="select * from tbl_customer where customer_email='"+request.getParameter("email")+"' AND customer_password='"+request.getParameter("pwd")+"'";
            ResultSet rs=con.selectCommand(selus);
            
            String selse="select * from tbl_tradesmen where tm_email='"+request.getParameter("email")+"' AND tm_password='"+request.getParameter("pwd")+"' and tm_vstatus=1";
            ResultSet rn=con.selectCommand(selse);
            
             String selw="select * from tbl_tradesmen where tm_email='"+request.getParameter("email")+"' AND tm_password='"+request.getParameter("pwd")+"' and tm_vstatus=0";
            ResultSet rnw=con.selectCommand(selw);
            
             String selad="select * from tbl_admin where admin_email='"+request.getParameter("email")+"' AND admin_password='"+request.getParameter("pwd")+"' ";
            ResultSet rna=con.selectCommand(selad);
            if(rs.next())
            {
                session.setAttribute("Cid", rs.getString("customer_id"));
                session.setAttribute("Cname", rs.getString("customer_name"));
                response.sendRedirect("../CUSTOMERMOD/CHomePage.jsp");
            }
             
            else if(rn.next())
            {
                session.setAttribute("Sid", rn.getString("tm_id"));
                session.setAttribute("Sname", rn.getString("tm_name"));
                    response.sendRedirect("../TMMOD/TMHome.jsp");
            }
             
            else if(rna.next())
                
            {
                
                session.setAttribute("Aid", rna.getString("admin_id"));
                session.setAttribute("Aname", rna.getString("admin_name"));
                response.sendRedirect("../ADMIN/HomePage.jsp");
            }
              
            else if(rnw.next())
                
            {
              %>
              <script>
                        alert("Wait for account confirmation");
                         window.location="../index.html";
                 
                                       </script>
                  
              <%
                 
              
            }
                else
                {
                    %>
                    <script>
                        alert("WRONG USERNAME OR PASSWORD");
                        window.location="LOGIN.jsp";
                                
                                
                        
                                        </script>
                        
                    
                    <%
                }
            
        }
        
            
        %>
      <div class="content">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <img src="../Assets/Template/Login/logform/images/undraw_remotely_2j6y.svg" alt="Image" class="img-fluid">
        </div>
        <div class="col-md-6 contents">
          <div class="row justify-content-center">
            <div class="col-md-8">
              <div class="mb-4">
              <h3>Sign In</h3>
              <p class="mb-4">Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.</p>
            </div>
            <form action="#" method="post">
              <div class="form-group first">
                <label for="username">Email</label>
                <input type="email" name="email" class="form-control" id="username">

              </div>
              <div class="form-group last mb-4">
                <label for="password">Password</label>
                <input type="password"name="pwd" class="form-control" id="password">
                
              </div>
              
              <div class="d-flex mb-5 align-items-center">
                <label class="control control--checkbox mb-0"><span class="caption">Remember me</span>
                  <input type="checkbox" checked="checked"/>
                  <div class="control__indicator"></div>
                </label>
          
              </div>

              <input type="submit" name="lgn" value="Log In" class="btn btn-block btn-primary">

             
              </div>
            </form>
            </div>
          </div>
          
        </div>
        
      </div>
    </div>
  </div>

  
    <script src="../Assets/Template/Login/logform/js/jquery-3.3.1.min.js"></script>
    <script src="../Assets/Template/Login/logform/js/popper.min.js"></script>
    <script src="../Assets/Template/Login/logform/js/bootstrap.min.js"></script>
    <script src="../Assets/Template/Login/logform/js/main.js"></script>
  </body>
</html>