<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
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
                <div class="container-fluid">
                    <!--  Row 1 -->

                    <div class="row">


                        <div class="col-lg-8 d-flex align-items-stretch" style="width: 100%">
                            <div class="card w-100" >
                                <div class="card-body p-4">
                                    <h5 class="card-title fw-semibold mb-4">TradesMen</h5>
                                    <div class="table-responsive">
                                        <table class="table text-nowrap mb-0 align-middle">
                                            <thead class="text-dark fs-4">
                                                <tr>
                                                    <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Sl.no</h6>
                                            </th>
                                            <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Name</h6>
                                            </th>
                                            <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Address</h6>
                                            </th>
                                            <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Status</h6>
                                            </th>
                                            <th class="border-bottom-0">
                                            <h6 class="fw-semibold mb-0">Registered Date</h6>
                                            </th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <%                            int i = 0;
                                                    String sel = "select * from tbl_tradesmen tm inner join tbl_servicetype st on st.serviceType_id=tm.serviceType_id";
                                                    ResultSet rs = con.selectCommand(sel);
                                                    while (rs.next()) {
                                                        i++;
                                                %>
                                                <tr>
                                                    <td class="border-bottom-0"><h6 class="fw-semibold mb-0"><%=i%></h6></td>
                                                    <td class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-1"><%=rs.getString("tm_name")%></h6>
                                                        <span class="fw-normal"><%=rs.getString("serviceType")%></span>                          
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <p class="mb-0 fw-normal"><%=rs.getString("tm_address")%></p>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <div class="d-flex align-items-center gap-2">
                                                            <%
                                                                if (rs.getString("tm_vstatus").equals("0")) {  %>
                                                            <span class="badge bg-primary rounded-3 fw-semibold">Pending</span>
                                                            <%
                                                            } else if (rs.getString("tm_vstatus").equals("1")) {
                                                            %>
                                                            <span class="badge bg-success rounded-3 fw-semibold">Accepted</span> 
                                                            <%
                                                            } else {
                                                            %>
                                                            <span class="badge bg-danger rounded-3 fw-semibold">Rejected</span>
                                                            <%
                                                                }
                                                            %>
                                                        </div>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-0 fs-4"><%=rs.getString("tm_reg_date")%></h6>
                                                    </td>
                                                </tr> 
                                                <%
                                                    }
                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script src="../Assets/Template/Admin/src/assets/libs/jquery/dist/jquery.min.js"></script>
                    <script src="../Assets/Template/Admin/src/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="../Assets/Template/Admin/src/assets/js/sidebarmenu.js"></script>
                    <script src="../Assets/Template/Admin/src/assets/js/app.min.js"></script>
                    <script src="../Assets/Template/Admin/src/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
                    <script src="../Assets/Template/Admin/src/assets/libs/simplebar/dist/simplebar.js"></script>
                    <script src="../Assets/Template/Admin/src/assets/js/dashboard.js"></script>
                    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

                    </body>

                    </html>