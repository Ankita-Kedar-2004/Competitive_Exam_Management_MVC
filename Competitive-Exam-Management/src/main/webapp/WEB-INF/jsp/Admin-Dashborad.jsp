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
                        <h4 class="fw-bold text-primary">Admin Dashboard</h4>
                        <p class="text-muted">Welcome, Admin! Manage students, exams, and results from here.</p>
                    </div>
                </div>
            </div>

            <!-- Management Cards -->
            <div class="col-md-4">
                <div class="card text-center shadow-sm border-0 rounded-3">
                    <div class="card-body">
                        <i class="bx bx-user fs-1 text-primary"></i>
                        <h5 class="card-title mt-2">Manage Students</h5>
                        <a href="${pageContext.request.contextPath}/student/student_view" class="btn btn-primary btn-sm">Go</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card text-center shadow-sm border-0 rounded-3">
                    <div class="card-body">
                        <i class="bx bx-edit-alt fs-1 text-success"></i>
                        <h5 class="card-title mt-2">Manage Exams</h5>
                        <a href="${pageContext.request.contextPath}/exam/Exam_View" class="btn btn-success btn-sm">Go</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card text-center shadow-sm border-0 rounded-3">
                    <div class="card-body">
                        <i class="bx bx-help-circle fs-1 text-warning"></i>
                        <h5 class="card-title mt-2">Manage Questions</h5>
                        <a href="${pageContext.request.contextPath}/question/viewQuestions" class="btn btn-warning btn-sm">Go</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="modules/footer.jsp" %>
</body>
</html>
