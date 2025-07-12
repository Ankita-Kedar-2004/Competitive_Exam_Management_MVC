<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="modules/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Questions List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
        .custom-alert {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background-color: #d1e7dd;
            color: #0f5132;
            border: none;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            font-size: 1rem;
            padding: 1rem 1.5rem;
            z-index: 1055;
            min-width: 320px;
            max-width: 400px;
            display: none;
            align-items: center;
            animation: slideIn 0.5s ease-out;
        }

        @keyframes slideIn {
            from { transform: translateY(30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
    </style>
</head>
<body>
<div class="content-wrapper">
    <div class="container">
        <div class="card">
            <div class="card-header text-center">
                Questions List
            </div>
            <div class="card-body">
              
                <div class="d-flex justify-content-between mb-3">
    <input type="text" id="questionSearch" class="form-control form-control-sm w-50" placeholder="Search question...">
    <a href="${pageContext.request.contextPath}/registerQuestions" class="btn btn-primary btn-sm">Add Question</a>
</div>
                
              

                <div class="table-responsive">
                    <table class="table table-bordered table-hover text-center align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>ID</th>
                                <th>Question</th>
                                <th>Option A</th>
                                <th>Option B</th>
                                <th>Option C</th>
                                <th>Option D</th>
                                <th>Correct Answer</th>
                                <th>Exam ID</th>
                                <th colspan="2">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="question" items="${questions}">
                                <tr>
                                    <td>${question.questionId}</td>
                                    <td>${question.questionText}</td>
                                    <td>${question.optionA}</td>
                                    <td>${question.optionB}</td>
                                    <td>${question.optionC}</td>
                                    <td>${question.optionD}</td>
                                    <td>${question.correctAnswer}</td>
                                    <td>${question.examId}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/updateQuestions/${question.questionId}" 
                                           class="btn btn-sm btn-warning" title="Edit">
                                            <i class="bi bi-pencil-square"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/question_delete/${question.questionId}" 
                                           class="btn btn-sm btn-danger" title="Delete"
                                           onclick="return confirm('Are you sure you want to delete this question?');">
                                            <i class="bi bi-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty questions}">
                                <tr>
                                    <td colspan="10" class="no-data text-center">No question data found</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Success Message -->
<c:if test="${not empty successMsg}">
    <div id="delayedAlert" class="alert alert-success alert-dismissible fade show custom-alert" role="alert">
        <i class="bi bi-check-circle-fill me-2"></i> ${successMsg}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    setTimeout(() => {
        const alertBox = document.getElementById('delayedAlert');
        if (alertBox) {
            alertBox.style.display = 'flex';
            setTimeout(() => {
                alertBox.style.display = 'none';
            }, 5000);
        }
    }, 100);
    
    document.getElementById('questionSearch').addEventListener('keyup', function () {
        const searchValue = this.value.toLowerCase();
        const rows = document.querySelectorAll("table tbody tr");

        rows.forEach(row => {
            const rowText = row.innerText.toLowerCase();
            if (rowText.includes(searchValue)) {
                row.style.display = "";
            } else {
                row.style.display = "none";
            }
        });
    });

</script>
<%@ include file="modules/footer.jsp" %>
</body>
</html>
