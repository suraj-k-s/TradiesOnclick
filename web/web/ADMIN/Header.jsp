<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@include file="SessionValidator.jsp" %>
     
  <title>Tradies On Click</title>
 <link rel="shortcut icon" type="image/png" href="../Assets/Template/Admin/src/assets/images/logos/l.png" />
        <link rel="stylesheet" href="../Assets/Template/Admin/src/assets/css/styles.min.css" />
        <link rel="alternate stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="another stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <link rel="stylesheet" href="../Assets/Template/form.css" />
</head>

<body>
  <!--  Body Wrapper -->
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <!-- Sidebar Start -->
            <aside class="left-sidebar">
                <!-- Sidebar scroll-->
                <div>
                    <div class="brand-logo d-flex align-items-center justify-content-between">
                        <a href="HomePage.jsp" class="text-nowrap logo-img">
                            <img src="../Assets/Template/Admin/src/assets/images/logos/l.png" width="100" alt="" /> <img src="../Assets/Template/Admin/src/assets/images/logos/t.png" width="145" alt="" />
                        </a>
                        <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                            <i class="ti ti-x fs-8"></i>
                        </div>
                    </div>
                    <!-- Sidebar navigation-->
                    <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
                        <ul id="sidebarnav">
                            <li class="nav-small-cap">
                                <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                                <span class="hide-menu">Home</span>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="HomePage.jsp" aria-expanded="false">
                                    <span>
                                        <i class="ti ti-layout-dashboard"></i>
                                    </span>
                                    <span class="hide-menu">Dashboard</span>
                                </a>
                            </li>
                            <li class="nav-small-cap">
                                <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                                <span class="hide-menu">Activities</span>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="TMVeri.jsp" aria-expanded="false">
                                    <span>
                                        <i class="ti ti-article"></i>
                                    </span>
                                    <span class="hide-menu">TM Verification</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="localPlace.jsp" aria-expanded="false">
                                    <span>
                                        <i class="ti ti-cards"></i>
                                    </span>
                                    <span class="hide-menu">Manage Local Places</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="serviceType.jsp" aria-expanded="false">
                                    <span>
                                        <i class="ti ti-file-description"></i>
                                    </span>
                                    <span class="hide-menu">Manage Services</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="viewComplaint.jsp" aria-expanded="false">
                                    <span>
                                        <i class="ti ti-typography"></i>
                                    </span>
                                    <span class="hide-menu">Complaints</span>
                                </a>
                            </li>

                            <li class="nav-small-cap">
                                <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                                <span class="hide-menu">View</span>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="ViewCustomers.jsp" aria-expanded="false">
                                    <span>
                                        <i class="ti ti-alert-circle"></i>
                                    </span>
                                    <span class="hide-menu">Customers</span>
                                </a>
                            </li>
                             <li class="sidebar-item">
                                <a class="sidebar-link" href="#" data-toggle="collapse" data-target="#options">
                                    <span>
                                        <i class="ti ti-cards"></i>
                                    </span>
                                    <span class="hide-menu">Reports</span>
                                    <span class="ml-auto">
                                        <i class="bi bi-caret-down-fill"></i> <!-- Add the Font Awesome arrow icon here -->
                                    </span>
                                </a>
                                <div class="collapse" id="options">
                                    <ul class="list-unstyled">
                                        <li class="sidebar-item">
                                            <a class="sidebar-link" href="Report1.jsp" aria-expanded="false">
                                                <span>
                                                   
                                                </span>
                                                <span class="hide-menu">Service Type Report</span>
                                            </a>
                                        </li>
                                         <li class="sidebar-item">
                                            <a class="sidebar-link" href="reportLocalplace.jsp" aria-expanded="false">
                                                <span>
                                                   
                                                </span>
                                                <span class="hide-menu">Local Place Report</span>
                                            </a>
                                        </li>
                                        <li class="sidebar-item">
                                            <a class="sidebar-link" href="ReportUser.jsp" aria-expanded="false">
                                                <span>
                                                   
                                                </span>
                                                <span class="hide-menu">User Report</span>
                                            </a>
                                        </li>
                                        <li class="sidebar-item">
                                              <a class="sidebar-link" href="reportBooking.jsp" aria-expanded="false">
                                                <span>
                                                   
                                                </span>
                                                <span class="hide-menu">Booking Report</span>
                                            </a>
                                        </li>
                                        <li class="sidebar-item">
                                            <a class="sidebar-link" href="ReportTradiePerformance.jsp" aria-expanded="false">
                                                <span>
                                                   
                                                </span>
                                                <span class="hide-menu">Tradie Perfomance Report</span>
                                            </a>
                                        </li>
                                        <!-- Add more options here as needed -->
                                    </ul>
                                </div>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="viewFeedback.jsp" aria-expanded="false">
                                    <span>
                                        <i class="ti ti-cards"></i>
                                    </span>
                                    <span class="hide-menu">Feedbacks</span>
                                </a>
                            </li>     
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="VerTM.jsp" aria-expanded="false">
                                    <span>
                                        <i class="ti ti-cards"></i>
                                    </span>
                                    <span class="hide-menu">Verified TM</span>
                                </a>
                            </li>
                             
                        </ul>

                    </nav>
                    <!-- End Sidebar navigation -->
                </div>
                <!-- End Sidebar scroll-->
            </aside>
            <!--  Sidebar End -->
            <!--  Main wrapper -->
            <div class="body-wrapper">
                <!--  Header Start -->
                <header class="app-header">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <ul class="navbar-nav">
                            <li class="nav-item d-block d-xl-none">
                                <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                                    <i class="ti ti-menu-2"></i>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link nav-icon-hover" href="javascript:void(0)">
                                    <i class="ti ti-bell-ringing"></i>
                                    <div class="notification bg-primary rounded-circle"></div>
                                </a>
                            </li>
                        </ul>
                        <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
                            <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">

                                <li class="nav-item dropdown">
                                    <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
                                       aria-expanded="false">
                                        <img src="../Assets/Template/Admin/src/assets/images/profile/user-1.jpg" alt="" width="35" height="35" class="rounded-circle">
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
                                        <div class="message-body">


                                            <a href="logout.jsp" class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </header>
                <!--  Header End -->
      <br><br><br>