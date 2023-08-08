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



    <!-- Full Screen Search Start -->
    <div class="modal fade" id="searchModal" tabindex="-1">
        <div class="modal-dialog modal-fullscreen">
            <div class="modal-content" style="background: rgba(9, 30, 62, .7);">
                <div class="modal-header border-0">
                    <button type="button" class="btn bg-white btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body d-flex align-items-center justify-content-center">
                    <div class="input-group" style="max-width: 600px;">
                        <input type="text" class="form-control bg-transparent border-primary p-3" placeholder="Type search keyword">
                        <button class="btn btn-primary px-4"><i class="bi bi-search"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Full Screen Search End -->


    <!-- Carousel Start -->
    <div class="container-fluid p-0">
        <div id="header-carousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="../Assets/Template/Customer/img/tdonflow.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 900px;">
                            <h5 class="text-white text-uppercase mb-3 animated slideInDown">Trade Services On A Click</h5>
                            <h1 class="display-1 text-white mb-md-4 animated zoomIn">Get Best Services,<br>Any Time.</h1>
                            <a href="SearchService.jsp" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInCenter">Book Now</a>
                          
                        </div>
                    </div>
                </div>
               
            </div>
          
        </div>
    </div>
    <!-- Carousel End -->


    <!-- Banner Start -->
    <div class="container-fluid banner mb-5">
        <div class="container">
            <div class="row gx-0">
                <div class="col-lg-4 wow zoomIn" data-wow-delay="0.1s">
                    
                </div>
              
               
            </div>
        </div>
    </div>
    <!-- Banner Start -->


    <!-- About Start -->
    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-7">
                    <div class="section-title mb-4">
                        <h5 class="position-relative d-inline-block text-primary text-uppercase">About Us</h5>
                        <h1 class="display-5 mb-0">Muvattupuzha's Best Tradie Booking Platform</h1>
                    </div>
                    <h4 class="text-body fst-italic mb-4">Get Services From Tradesmen  Anywhere In Muvattupuzha</h4>
                    <p class="mb-4">Are you looking for tradesmen who can be trusted and could meet your expectation. We are here to help you. Connecting you with tradesmen in Muvattupuzha. Search find best tradesmen who are verified and trusted by both people and municipality</p>
                    <div class="row g-3">
                        <div class="col-sm-6 wow zoomIn" data-wow-delay="0.3s">
                            <h5 class="mb-3"><i class="fa fa-check-circle text-primary me-3"></i>Verifie Traesmen</h5>
                            <h5 class="mb-3"><i class="fa fa-check-circle text-primary me-3"></i>Anytime and Everywhere</h5>
                        </div>
                        <div class="col-sm-6 wow zoomIn" data-wow-delay="0.6s">
                            <h5 class="mb-3"><i class="fa fa-check-circle text-primary me-3"></i>Easy booking</h5>
                            <h5 class="mb-3"><i class="fa fa-check-circle text-primary me-3"></i>Fair Prices</h5>
                        </div>
                    </div>
                    <a href="SearchService.jsp" class="btn btn-primary py-3 px-5 mt-4 wow zoomIn" data-wow-delay="0.6s">Search Now</a>
                </div>
                <div class="col-lg-5" style="min-height: 500px;">
                    <div class="position-relative h-100">
                        <img class="position-absolute w-100 h-100 rounded wow zoomIn" data-wow-delay="0.9s" src="../Assets/Template/TM/assets/img/tradesman.jpg" style="object-fit: cover;">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->


  
    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-light py-5 wow fadeInUp" data-wow-delay="0.3s" style="margin-top: -75px;">
        <div class="container pt-5">
            <div class="row g-5 pt-4">
                <div class="col-lg-3 col-md-6">
                    <h3 class="text-white mb-4">Quick Links</h3>
                    <div class="d-flex flex-column justify-content-start">
                  
                     <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Home</a>
                        <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>About Us</a>
                    <a class="btn btn-link" href="https://www.facebook.com/MuvattupuzhaMunicipality/">Municipal Page</a>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6">
                    <h3 class="text-white mb-4">Get In Touch</h3>
                    <p class="mb-2"><i class="bi bi-geo-alt text-primary me-2"></i>Muvattupuzha Old Bridge Rd, Thottumkalpeedika, Muvattupuzha, Kerala 686673</p>
                    <p class="mb-2"><i class="bi bi-envelope-open text-primary me-2"></i>tocmvpa@gmail.com</p>
                    <p class="mb-0"><i class="bi bi-telephone text-primary me-2"></i>0485 283 5347</p>
                </div>
               
            </div>
        </div>
    </div>
    <div class="container-fluid text-light py-4" style="background: #051225;">
        <div class="container">
            <div class="row g-0">
                <div class="col-md-6 text-center text-md-start">
                    <p class="mb-md-0">&copy; <a class="text-white border-bottom" href="#">TradiesOnClick </a>. All Rights Reserved.</p>
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <p class="mb-0">Designed by <a class="text-white border-bottom" href="https://www.linkedin.com/in/amncl/">AMCODEX</a><br>
                        Distributed by <a class="text-white border-bottom" href="https://www.facebook.com/MuvattupuzhaMunicipality/">Muvattupuzha Municipality</a>              
                    </p>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../Assets/Template/Customer/lib/wow/wow.min.js"></script>
    <script src="../Assets/Template/Customer/lib/easing/easing.min.js"></script>
    <script src="../Assets/Template/Customer/lib/waypoints/waypoints.min.js"></script>
    <script src="../Assets/Template/Customer/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="../Assets/Template/Customer/lib/tempusdominus/js/moment.min.js"></script>
    <script src="../Assets/Template/Customer/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="../Assets/Template/Customer/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
    <script src="../Assets/Template/Customer/lib/twentytwenty/jquery.event.move.js"></script>
    <script src="../Assets/Template/Customer/lib/twentytwenty/jquery.twentytwenty.js"></script>

    <!-- Template Javascript -->
    <script src="../Assets/Template/Customer/js/main.js"></script>
</body>

</html>