<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="modules/header.jsp" %>

<div class="page-wrapper">
    <div class="page-content">
        <div class="row">
            <!-- Welcome Card -->
            <div class="col-md-12 mb-3">
                <div class="card shadow-sm border-0 rounded-3">
                    <div class="card-body">
                        <h4 class="fw-bold text-primary">Student Dashboard</h4>
                        <p class="text-muted">Welcome, Student! Access your exams, results, and profile here.</p>
                    </div>
                </div>
            </div>

            <!-- Student Features -->
            <div class="col-md-4">
                <div class="card text-center shadow-sm border-0 rounded-3">
                    <div class="card-body">
                        <i class="bx bx-user-circle fs-1 text-primary"></i>
                        <h5 class="card-title mt-2">My Profile</h5>
                        <a href="${pageContext.request.contextPath}/student/student_profile" class="btn btn-primary btn-sm">Go</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card text-center shadow-sm border-0 rounded-3">
                    <div class="card-body">
                        <i class="bx bx-play-circle fs-1 text-success"></i>
                        <h5 class="card-title mt-2">Start Exam</h5>
                        <a href="${pageContext.request.contextPath}/assignQuestions/assignQuestionspage" class="btn btn-success btn-sm">Go</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card text-center shadow-sm border-0 rounded-3">
                    <div class="card-body">
                        <i class="bx bx-bar-chart-alt-2 fs-1 text-warning"></i>
                        <h5 class="card-title mt-2">My Results</h5>
                        <a href="${pageContext.request.contextPath}/result/viewAllResult" class="btn btn-warning btn-sm">Go</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="modules/footer.jsp" %>
</body>
</html>