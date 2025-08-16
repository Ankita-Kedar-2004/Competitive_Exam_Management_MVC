<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="modules/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Questions List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body {
            background-color: #f8f9fa;
            padding: 30px;
        }
        .card {
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }
        .card-header {
            background: linear-gradient(90deg, #198754, #20c997);
            color: white;
            font-weight: 600;
        }
        .table thead {
            background-color: #f1f3f5;
        }
        .table th {
            font-size: 0.9rem;
            font-weight: 600;
            text-transform: uppercase;
        }
        .table td {
            font-size: 0.9rem;
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
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.15);
            font-size: 0.95rem;
            padding: 0.9rem 1.3rem;
            z-index: 1055;
            min-width: 300px;
            max-width: 380px;
            display: none;
            align-items: center;
            animation: slideIn 0.4s ease-out;
        }
        @keyframes slideIn {
            from { transform: translateY(25px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
    </style>
</head>
<body>

<div class="container-fluid px-4">
    <div class="card mt-4">
        <div class="card-header text-center">
            <h5 class="mb-0"><i class="bi bi-question-circle me-2"></i>Questions List</h5>
        </div>
        <div class="card-body">

            <!-- Search and Filter -->
            <div class="row mb-4 align-items-center">
                <div class="col-md-4 mb-2">
                    <input type="text" id="questionSearch" class="form-control shadow-sm" placeholder="🔍 Search question..." />
                </div>
                <div class="col-md-4 mb-2">
                    <select id="examFilter" class="form-select shadow-sm">
                        <option value="">-- Select Exam --</option>
                        <c:forEach var="name" items="${examNames}">
                            <option value="${name}">${name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-4 text-end">
                    <a href="${pageContext.request.contextPath}/question/registerQuestions" class="btn btn-success btn-sm shadow-sm">
                        <i class="bi bi-plus-circle me-1"></i> Add Question
                    </a>
                </div>
            </div>

            <!-- Questions Table -->
            <div class="table-responsive">
                <table class="table table-hover align-middle text-center shadow-sm">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Question</th>
                            <th>Option A</th>
                            <th>Option B</th>
                            <th>Option C</th>
                            <th>Option D</th>
                            <th>Correct</th>
                            <th>Exam</th>
                            <th colspan="2">Action</th>
                        </tr>
                    </thead>
                    <tbody id="questionTableBody">
                        <c:forEach var="question" items="${questions}">
                            <tr>
                                <td>${question.questionId}</td>
                                <td class="text-start">${question.questionText}</td>
                                <td>${question.optionA}</td>
                                <td>${question.optionB}</td>
                                <td>${question.optionC}</td>
                                <td>${question.optionD}</td>
                                <td><span class="badge bg-info">${question.correctAnswer}</span></td>
                                <td><span class="badge bg-primary">${question.examName}</span></td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/question/updateQuestions/${question.questionId}" 
                                       class="btn btn-sm btn-warning shadow-sm" title="Edit">
                                       <i class="bi bi-pencil-square"></i>
                                    </a>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/question/deleteQuestions/${question.questionId}" 
                                       class="btn btn-sm btn-danger shadow-sm" title="Delete"
                                       onclick="return confirm('Are you sure you want to delete this question?');">
                                       <i class="bi bi-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty questions}">
                            <tr><td colspan="10" class="no-data">No question data found</td></tr>
                        </c:if>
                    </tbody>
                </table>
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

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // Show success alert
    setTimeout(() => {
        const alertBox = document.getElementById('delayedAlert');
        if (alertBox) {
            alertBox.style.display = 'flex';
            setTimeout(() => { alertBox.style.display = 'none'; }, 5000);
        }
    }, 200);

    // Filtering
    function filterQuestions() {
        const keyword = $('#questionSearch').val().toLowerCase();
        const selectedExam = $('#examFilter').val().toLowerCase();
        $('#questionTableBody tr').each(function () {
            const rowText = $(this).text().toLowerCase();
            const examCell = $(this).find('td:nth-child(8)').text().toLowerCase();
            const matchesSearch = rowText.includes(keyword);
            const matchesExam = !selectedExam || examCell === selectedExam;
            $(this).toggle(matchesSearch && matchesExam);
        });
    }

    $('#questionSearch').on('keyup input', filterQuestions);
    $('#examFilter').on('change', filterQuestions);
</script>

<%@ include file="modules/footer.jsp" %>
</body>
</html>
