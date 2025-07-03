<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="modules/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Exam List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body {
            background-color: #f8f9fa;
            margin-left: 220px;
            margin-top: 100px;
        }
        .content-wrapper {
            padding: 20px;
        }
        .card {
            border-radius: 0.75rem;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }
        .card-header {
            background-color: #0d6efd;
            color: #fff;
            font-size: 1.25rem;
            padding: 0.75rem 1.25rem;
        }
        .table th, .table td {
            vertical-align: middle;
            font-size: 0.95rem;
        }
        .btn-sm {
            padding: 0.25rem 0.5rem;
            font-size: 0.8rem;
        }
        .no-data {
            color: #dc3545;
            font-weight: 500;
        }
    </style>
</head>
<body>
<div class="content-wrapper">
    <div class="container">
        <div class="card">
            <div class="card-header text-center">
                Exams Details
            </div>
            <div class="card-body">
                <!-- Add Exam button -->
                <div class="text-end mb-3">
                    <a href="${pageContext.request.contextPath}/addExam" class="btn btn-primary btn-sm">Add Exam</a>
                </div>

                <div class="table-responsive">
                    <table class="table table-bordered table-hover text-center align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="exam" items="${exams}">
                                <tr>
                                    <td>${exam.examId}</td>
                                    <td>${exam.examName}</td>
                                    <td>
                                        <!-- Edit Icon -->
                                        <a href="${pageContext.request.contextPath}/updateExam/${exam.examId}" 
                                           class="btn btn-warning btn-sm" title="Edit">
                                            <i class="bi bi-pencil-square"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>

                            <c:if test="${empty exams}">
                                <tr>
                                    <td colspan="3" class="no-data text-center">No Exam data found</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="modules/footer.jsp" %>
</body>
</html>
