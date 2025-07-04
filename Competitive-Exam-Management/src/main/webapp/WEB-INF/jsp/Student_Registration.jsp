<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="modules/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
             margin-left:220px;
            margin-top:100px;
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
            Add Student Details
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/student_save" method="post">
                <div class="row g-3 mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Name</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Contact</label>
                        <input type="text" name="contactNumber" class="form-control" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>
                    
                     <div class="col-md-6">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>
                    
                    <div class="col-md-6">
                        <label class="form-label">Qualification</label>
                        <select name="qualification" class="form-select" required>
                            <option value="">Select Qualification</option>
                            <option value="SSC">SSC</option>
                            <option value="HSC">HSC</option>
                            <option value="Diploma">Diploma</option>
                            <option value="Graduate">Graduate</option>
                            <option value="Post Graduate">Post Graduate</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">College Name</label>
                        <input type="text" name="collegeName" class="form-control">
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Passing Year</label>
                        <select name="passingYear" class="form-select" required>
                            <option value="">Select Year</option>
                            <c:forEach var="i" begin="2010" end="2025">
                                <option value="${i}">${i}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Exam ID</label>
                        <input type="text" name="examId" class="form-control">
                    </div>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary px-4">Save</button>
        <button type="reset" class="btn btn-secondary">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="modules/footer.jsp" %>
</body>
</html>
