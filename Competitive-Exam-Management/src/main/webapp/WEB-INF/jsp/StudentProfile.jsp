<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Header -->
<%@ include file="modules/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #f5f7fa;
            min-height: 100vh;
            margin-left:50px;
            margin-top:50px;
            padding: 20px;
        }

        .profile-card {
            background: #fff;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            max-width: 900px;
            margin-left: 260px; /* adjust according to your sidebar width */
        }

        .profile-card h2 {
            font-weight: bold;
            letter-spacing: 1px;
            color: #007bff;
            border-bottom: 2px solid #007bff;
            display: inline-block;
            padding-bottom: 5px;
        }

        .table th {
            background-color: #f8f9fa;
            font-weight: 600;
            width: 30%;
        }

        .table td {
            background-color: #ffffff;
        }
    </style>
</head>
<body>

<div class="profile-card">
 <h2 class="text-center mb-4" style="text-align:center"> Student Profile ✨</h2>

    <!-- Check if student object exists -->
    <c:if test="${not empty student}">
        <div class="table-responsive">
            <table class="table table-bordered table-striped text-center align-middle">
                <tbody>
                    <tr>
                        <th>ID</th>
                        <td>${student.id}</td>
                    </tr>
                    <tr>
                        <th>Name</th>
                        <td>${student.name}</td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td>${student.email}</td>
                    </tr>
                    <tr>
                        <th>Contact Number</th>
                        <td>${student.contactNumber}</td>
                    </tr>
                    <tr>
                        <th>Qualification</th>
                        <td>${student.qualification}</td>
                    </tr>
                    <tr>
                        <th>Passing Year</th>
                        <td>${student.passingYear}</td>
                    </tr>
                    <tr>
                        <th>College Name</th>
                        <td>${student.collegeName}</td>
                    </tr>
                    <tr>
                        <th>Exam ID</th>
                        <td>${student.examId}</td>
                    </tr>
                    <tr>
                        <th>Status</th>
                        <td>
                            <c:choose>
                                <c:when test="${student.status == 'Active'}">
                                    <span class="badge bg-success px-3 py-2">Active</span>
                                </c:when>
                                <c:when test="${student.status == 'Inactive'}">
                                    <span class="badge bg-danger px-3 py-2">Inactive</span>
                                </c:when>
                                
                            </c:choose>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        
    </c:if>

    <!-- If student is missing -->
    <c:if test="${empty student}">
        <div class="alert alert-danger text-center">
            No student profile available.
        </div>
    </c:if>
</div>

</body>
<!-- Footer -->
<%@ include file="modules/footer.jsp" %>
</html>
