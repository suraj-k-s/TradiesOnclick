<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>TradiesOnClick</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
 <%@include file="SessionValidator.jsp" %>
      <link rel="stylesheet" href="../Assets/Template/form.css" />  
    <!-- Favicon -->
      <link href="../Assets/Template/Admin/src/assets/images/logos/l.png"  rel="icon">
  
    
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../Assets/Template/Customer/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../Assets/Template/Customer/lib/animate/animate.min.css" rel="stylesheet">
    <link href="../Assets/Template/Customer/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
    <link href="../Assets/Template/Customer/lib/twentytwenty/twentytwenty.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../Assets/Template/Customer/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../Assets/Template/Customer/css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary m-1" role="status">
            <span class="sr-only">Loading...</span>
        </div>
        <div class="spinner-grow text-dark m-1" role="status">
            <span class="sr-only">Loading...</span>
        </div>
        <div class="spinner-grow text-secondary m-1" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <!-- Topbar Start -->
    <div class="container-fluid bg-light ps-5 pe-0 d-none d-lg-block">
        <div class="row gx-0">
            <div class="col-md-6 text-center text-lg-start mb-2 mb-lg-0">
                <div class="d-inline-flex align-items-center">
                    <small class="py-2"></small>
                </div>
            </div>
            <div class="col-md-6 text-center text-lg-end">
                <div class="position-relative d-inline-flex align-items-center bg-primary text-white top-shape px-5">
                    <div class="me-3 pe-3 border-end py-2">
                        <p class="m-0"><i class="fa fa-envelope-open me-2"></i>tocmvpa@gmail.com</p>
                    </div>
                    <div class="py-2">
                        <p class="m-0"><i class="fa fa-phone-alt me-2"></i>0485 283 5347</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


     <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow-sm px-5 py-3 py-lg-0">
        <a href="CHomePage.jsp" class="navbar-brand p-0">
            <img src="../Assets/Template/Admin/src/assets/images/logos/l.png" width="80" alt=""  /><br><img src="../Assets/Template/Admin/src/assets/images/logos/t.png" width="100" alt="" /></i></h1>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto py-0">
                <a href="CHomePage.jsp" class="nav-item nav-link active">Home</a>
                <a href="MyProfileCUST.jsp" class="nav-item nav-link active">Profile</a>
                <a href="Mybooking.jsp" class="nav-item nav-link">Bookings</a>
                <a href="feedback.jsp" class="nav-item nav-link">Feedback</a>
                 <a href="custcomplaint.jsp" class="nav-item nav-link">Complaints</a>
            </div>
            
            <a href="logout.jsp" class="nav-item nav-link">Logout</a>
            
        </div>
    </nav>
    <!-- Navbar End -->

