<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
    String userEmail = (String) session.getAttribute("useremail");
    String userRole  = (String) session.getAttribute("userRole");

    // ✅ Expose to JSTL/EL
    pageContext.setAttribute("userEmail", userEmail);
    pageContext.setAttribute("userRole", userRole);
%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Competitive Exam Management</title>

    <!-- favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/assets/images/competitive exam icon.png" type="image/png"/>

    <!-- plugins -->
    <link href="${pageContext.request.contextPath}/resources/assets/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/resources/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet"/>

    <!-- Bootstrap & App CSS -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap-extended.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/css/app.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/css/icons.css" rel="stylesheet">

    <!-- Theme Style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/dark-theme.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/semi-dark.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/header-colors.css"/>

    <style>
        #profile { margin-left: auto; display: flex; align-items: center; }
        .user-info p { margin: 0; padding: 2px 8px; font-size: 14px; font-weight: 500; color: #333; }
        .user-info p:first-child { font-weight: 600; color: #0d6efd; }
        .user-info p:last-child { font-size: 13px; color: #6c757d; }
        .user-initial {
            width: 40px; height: 40px; border-radius: 50%;
            background-color: #0d6efd; color: #fff;
            font-weight: 600; font-size: 18px;
            display: flex; align-items: center; justify-content: center;
            margin-right: 10px; text-transform: uppercase;
            box-shadow: 0 2px 4px rgba(0,0,0,0.2);
        }
    </style>
</head>

<body>
<div class="wrapper">

    <!--start header -->
    <header>
        <div class="topbar d-flex align-items-center">
            <nav class="navbar navbar-expand gap-3">
                <div class="mobile-toggle-menu"><i class='bx bx-menu'></i></div>

                <div class="search-bar d-lg-block d-none" data-bs-toggle="modal" data-bs-target="#SearchModal">
                    <a href="javascript:;" class="btn d-flex align-items-center"><i class='bx bx-search'></i>Search</a>
                </div>

                <div class="d-flex align-items-center ms-auto" id="profile">
                    <!-- User Initial -->
                    <div class="user-initial">
                        <c:choose>
                            <c:when test="${not empty userEmail}">
                                ${fn:toUpperCase(fn:substring(userEmail,0,1))}
                            </c:when>
                            <c:otherwise>G</c:otherwise>
                        </c:choose>
                    </div>
                    <!-- User Email & Role -->
                    <div class="user-info text-end">
                        <p><c:out value="${userEmail != null ? userEmail : 'Guest'}"/></p>
                        <p><c:out value="${userRole != null ? userRole : 'Unknown'}"/></p>
                    </div>

                    <!-- Dropdown -->
                    <div class="dropdown ms-3">
                        <a class="dropdown-toggle d-flex align-items-center text-decoration-none" href="#" role="button"
                           id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bx bx-dots-vertical-rounded fs-4"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuLink">
                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/logout"><i class="bx bx-log-out-circle"><span>Logout</span></i>
                                </a>
                            </li>
                        </ul>
                    </div>
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
                <h4 class="logo-text text-wrap text-center fw-bold" style="font-size: 18px; color: #0d6efd; line-height: 1.2;">
                    Competitive Exam<br>Management
                </h4>
            </div>
            <div class="toggle-icon ms-auto"><i class='bx bx-arrow-back'></i></div>
        </div>

        <!--navigation-->
        <ul class="metismenu" id="menu">
            <li>
                <a href="${pageContext.request.contextPath}/user/dashborad" class="has-arrow">
                    <div class="parent-icon"><i class='bx bx-home-alt'></i></div>
                    <div class="menu-title">Dashboard</div>
                </a>
            </li>

            <!-- Student Menu -->
            <cif ${sessionScope.role=="Student" }>
            <li>
                <a href="#" class="has-arrow">
                    <div class="parent-icon"><i class='bx bx-user'></i></div>
                    <div class="m	enu-title">Student</div>
                </a>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/student/student_registration"><i class='bx bx-radio-circle'></i>Student Registration</a></li>

                    <!-- hide for students -->
                    <c:if test="${fn:toLowerCase(userRole) ne 'student'}">
                        <li><a href="${pageContext.request.contextPath}/student/student_view"><i class='bx bx-radio-circle'></i>Student View</a></li>
                    </c:if>

                    <li><a href="${pageContext.request.contextPath}/student/student_profile"><i class='bx bx-radio-circle'></i>Student Profile</a></li>
                </ul>
            </li>

            <!-- Exam Menu -->
            <li>
                <a href="#" class="has-arrow">
                    <div class="parent-icon"><i class='bx bx-edit-alt'></i></div>
                    <div class="menu-title">Exam</div>
                    
                    
                </a>
                <ul>
                    <!-- hide for students -->
                    <c:if test="${fn:toLowerCase(userRole) ne 'student'}">
                        <li><a href="${pageContext.request.contextPath}/exam/addExam"><i class='bx bx-radio-circle'></i>Exam Registration</a></li>
         
                    </c:if>
                      <li><a href="${pageContext.request.contextPath}/exam/Exam_View"><i class='bx bx-radio-circle'></i>Exam View</a></li>
                    <li><a href="${pageContext.request.contextPath}/assignQuestions/assignQuestionspage"><i class='bx bx-radio-circle'></i>Start Exam</a></li>
                </ul>
            </li>

            <!-- Questions -->
            <c:if test="${fn:toLowerCase(userRole) ne 'student'}">
            <li>
                <a href="#" class="has-arrow">
                    <div class="parent-icon"><i class='bx bx-help-circle'></i></div>
                    <div class="menu-title">Questions</div>
                </a>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/question/viewQuestions"><i class='bx bx-radio-circle'></i>Questions View</a></li>
                </ul>
            </li>
 </c:if>
            <!-- Result -->
            <li>
                <a href="#" class="has-arrow">
                    <div class="parent-icon"><i class='bx bx-edit-alt'></i></div>
                    <div class="menu-title">Result</div>
                </a>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/result/viewAllResult"><i class='bx bx-radio-circle'></i>View Result</a></li>
                </ul>
            </li>
        </ul>
        <!--end navigation-->
    </div>
    <!--end sidebar-->

</div>

<!-- JS -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/plugins/metismenu/js/metisMenu.min.js"></script>
<script>
    $(document).ready(function () {
        $('#menu').metisMenu();
    });
</script>