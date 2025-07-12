<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--favicon-->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/assets/images/competitive exam icon.png" type="image/png"/>
    <!--plugins-->
    <link href="${pageContext.request.contextPath}/resources/assets/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/resources/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet"/>
    <!-- loader-->
    <link href="${pageContext.request.contextPath}/resources/assets/css/pace.min.css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/resources/assets/js/pace.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap-extended.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&amp;display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/css/app.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/css/icons.css" rel="stylesheet">
    <!-- Theme Style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/dark-theme.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/semi-dark.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/header-colors.css"/>
    <title>Competitive Exam Management</title>
    <style type="text/css">
 #profile {
    margin-left: auto;
    display: flex;
    align-items: center;
}
#profile .user-img {
    margin-right: 10px;
}

    </style>
</head>

<body>
<!--wrapper-->
<div class="wrapper">
    <!--start header -->
    <header>
        <div class="topbar d-flex align-items-center">
            <nav class="navbar navbar-expand gap-3">
                <div class="mobile-toggle-menu"><i class='bx bx-menu'></i></div>

                <div class="search-bar d-lg-block d-none" data-bs-toggle="modal" data-bs-target="#SearchModal">
                    <a href="javascript:;" class="btn d-flex align-items-center"><i class='bx bx-search'></i>Search</a>
                </div>

                <!-- User Box Only (settings removed) -->
                <div class="user-box dropdown px-3" id="profile">
                    <a class="d-flex align-items-center nav-link dropdown-toggle gap-3 dropdown-toggle-nocaret" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="resources/assets/images/avatars/avatar-2.png" class="user-img" alt="user avatar">
                        <div class="user-info">
                            <p class="user-name mb-0">Pauline Seitz</p>
                            <p class="designattion mb-0">Web Designer</p>
                        </div>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item d-flex align-items-center" href="javascript:;"><i class="bx bx-user fs-5"></i><span>Profile</span></a></li>
                        <li><a class="dropdown-item d-flex align-items-center" href="javascript:;"><i class="bx bx-home-circle fs-5"></i><span>Dashboard</span></a></li>
                        <li><a class="dropdown-item d-flex align-items-center" href="javascript:;"><i class="bx bx-dollar-circle fs-5"></i><span>Earnings</span></a></li>
                        <li><a class="dropdown-item d-flex align-items-center" href="javascript:;"><i class="bx bx-download fs-5"></i><span>Downloads</span></a></li>
                        <li><div class="dropdown-divider mb-0"></div></li>
                        <li><a class="dropdown-item d-flex align-items-center" href="javascript:;"><i class="bx bx-log-out-circle"></i><span>Logout</span></a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </header>
    <!--end header -->

    <!--start sidebar-->
    <div class="sidebar-wrapper" data-simplebar="true">
        <div class="sidebar-header">
            <div><img src="${pageContext.request.contextPath}/resources/assets/images/competitive exam icon.jpg" class="logo-icon" alt="logo icon"></div>
            <div>
                <h4 class="logo-text text-wrap text-center fw-bold" style="font-size: 18px; color: #0d6efd; line-height: 1.2;">Competitive Exam<br>Management</h4>
            </div>
            <div class="toggle-icon ms-auto"><i class='bx bx-arrow-back'></i></div>
        </div>
        <!--navigation-->
        <ul class="metismenu" id="menu">
            <li>
                <a href="dashborad" class="has-arrow">
                    <div class="parent-icon"><i class='bx bx-home-alt'></i></div>
                    <div class="menu-title">Dashboard</div>
                </a>
            </li>
            <li>
                <a href="#" class="has-arrow">
                    <div class="parent-icon"><i class='bx bx-user'></i></div>
                    <div class="menu-title">Student</div>
                </a>
                <ul>
                    <li><a href="student_registration"><i class='bx bx-radio-circle'></i>Student Registration</a></li>
                    <li><a href="student_view"><i class='bx bx-radio-circle'></i>Student View</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="has-arrow">
                    <div class="parent-icon"><i class='bx bx-edit-alt'></i></div>
                    <div class="menu-title">Exam</div>
                </a>
                <ul>
                    <li><a href="addExam"><i class='bx bx-radio-circle'></i>Exam Registration</a></li>
                    <li><a href="Exam_View"><i class='bx bx-radio-circle'></i>Exam View</a></li>
                </ul>
            </li>
            
           <li>
    <a href="#" class="has-arrow">
        <div class="parent-icon"><i class='bx bx-help-circle'></i></div> <!-- Updated icon here -->
        <div class="menu-title">Questions</div>
    </a>
    <ul>
        <li><a href="registerQuestions"><i class='bx bx-radio-circle'></i>Questions Registration</a></li>
        <li><a href="viewQuestions"><i class='bx bx-radio-circle'></i>Questions View</a></li>
    </ul>
</li>

        </ul>
        <!--end navigation-->
    </div>
    <!--end sidebar-->
</div>

<!-- JS Scripts -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/plugins/metismenu/js/metisMenu.min.js"></script>
<script>
    $(document).ready(function () {
        $('#menu').metisMenu();
    });
</script>
</body>
</html>
