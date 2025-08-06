<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="modules/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Exam</title>
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
            max-width: 600px;
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
        .form-control {
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
            Update Exam Details
        </div>

        <div class="card-body">
            <form action="${pageContext.request.contextPath}/exam/exam_update" method="post">
                <!-- Hidden input for examId -->
                <input type="hidden" name="examId" value="${exam.examId}" />

                <div class="mb-3">
                    <label for="examName" class="form-label">Exam Name</label>
                    <input type="text" name="examName" id="examName" class="form-control" value="${exam.examName}" required>
                </div>
                
                <div class="mb-3 row">
        <label for="examDuration" class="col-sm-4 col-form-label text-end">Duration (minutes)</label>
        <div class="col-sm-8">
            <input type="number" class="form-control" id="examDuration" name="examDuration" value="${exam.examDuration}"  required min="1" />
        </div>
    </div>
                

                <!-- Action Buttons -->
                <div class="text-center">
                    <button type="submit" class="btn btn-success px-4">Update</button>
                    <a href="${pageContext.request.contextPath}/exam/Exam_View" class="btn btn-secondary px-4 ms-2">Back</a>
                    <a href="${pageContext.request.contextPath}/exam/addExam" class="btn btn-primary px-4 ms-2">Add New Exam</a>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="modules/footer.jsp" %>
</body>
</html>
