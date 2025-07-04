<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="modules/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            max-width: 800px;
            margin: auto;
        }
        .card-header {
            background-color: #0d6efd;
            color: white;
            font-size: 1.2rem;
        }
        .form-label {
            font-weight: 500;
            font-size: 0.9rem;
        }
        .form-control, .form-select {
            font-size: 0.9rem;
            padding: 0.4rem 0.75rem;
        }
        .btn {
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

<div class="content-wrapper">
    <div class="card">
        <div class="card-header text-center">
            Update Student Details
        </div>

        <div class="card-body">
            <form action="${pageContext.request.contextPath}/student_update" method="post">
                <input type="hidden" name="id" value="${student.id}" />
                <div class="row g-3 mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Name</label>
                        <input type="text" name="name" class="form-control" value="${student.name}" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Contact</label>
                        <input type="text" name="contactNumber" class="form-control" value="${student.contactNumber}" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" value="${student.email}" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" value="${student.password}" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Qualification</label>
                        <select name="qualification" class="form-select" required>
                            <option value="">Select Qualification</option>
                            <option value="SSC" ${student.qualification == 'SSC' ? 'selected' : ''}>SSC</option>
                            <option value="HSC" ${student.qualification == 'HSC' ? 'selected' : ''}>HSC</option>
                            <option value="Diploma" ${student.qualification == 'Diploma' ? 'selected' : ''}>Diploma</option>
                            <option value="Graduate" ${student.qualification == 'Graduate' ? 'selected' : ''}>Graduate</option>
                            <option value="Post Graduate" ${student.qualification == 'Post Graduate' ? 'selected' : ''}>Post Graduate</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">College Name</label>
                        <input type="text" name="collegeName" class="form-control" value="${student.collegeName}">
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Passing Year</label>
                        <select name="passingYear" class="form-select" required>
                            <option value="">Select Year</option>
                            <c:forEach var="i" begin="2010" end="2025">
                                <option value="${i}" ${student.passingYear == i ? 'selected' : ''}>${i}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Exam ID</label>
                        <input type="text" name="examId" class="form-control" value="${student.examId}">
                    </div>
                </div>

                <!-- Bottom action buttons -->
                <div class="text-center">
                    <button type="submit" class="btn btn-success px-4">Update</button>
                    <a href="${pageContext.request.contextPath}/student_view" class="btn btn-secondary px-4 ms-2">Back</a>
                    <a href="${pageContext.request.contextPath}/student_registration" class="btn btn-primary px-4 ms-2">Add Student</a>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="modules/footer.jsp" %>
</body>
</html>
