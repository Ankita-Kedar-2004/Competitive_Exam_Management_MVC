<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="modules/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Exam List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <style>
        body {
            background-color: #f8f9fa;
            color: #212529;
             margin-left:280px;
            margin-top:100px;
        }
        .custom-alert {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background-color: #d1e7dd;
            color: #0f5132;
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

<div class="container mt-4">
    <div class="card shadow">
        <div class="card-header text-center fw-bold">
            Exams Details
        </div>
        <div class="card-body">
            <!-- Filter Section -->
            <div class="row mb-3">
                <div class="col-md-4">
                    <input type="text" id="questionSearch" class="form-control shadow-sm" placeholder="Search exam..."/>
                </div>
                <div class="col-md-4">
                    <select id="examStatus" class="form-select shadow-sm">
                        <option value="">-- Select Status --</option>
                        <option value="active" selected>Active</option>
                        <option value="inactive">Inactive</option>
                    </select>
                </div>
                <div class="col-md-4 text-end">
                    <a href="${pageContext.request.contextPath}/exam/exam_registration" class="btn btn-primary shadow-sm">
                        <i class="bi bi-plus-circle me-1"></i> Add Exam
                    </a>
                </div>
            </div>

            <!-- Exam Table -->
            <div class="table-responsive">
                <table class="table table-bordered table-hover text-center align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Duration</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody id="examTableBody">
                        <!-- Dynamic Content -->
                        <c:forEach var="exam" items="${exams}">
                            <tr>
                                <td>${exam.examId}</td>
                                <td>${exam.examName}</td>
                                <td>${exam.examDuration}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/exam/updateExam/${exam.examId}" 
                                       class="btn btn-warning btn-sm" title="Edit">
                                       <i class="bi bi-pencil-square"></i>
                                    </a>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/exam/exam_delete/${exam.examId}" 
                                       class="btn btn-danger btn-sm" 
                                       onclick="return confirm('Are you sure you want to delete this exam?');">
                                       <i class="bi bi-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty exams}">
                            <tr><td colspan="5" class="text-center">No Exam data found</td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Success Alert -->
<c:if test="${not empty successMsg}">
    <div id="delayedAlert" class="alert alert-success alert-dismissible fade show custom-alert" role="alert">
        <i class="bi bi-check-circle-fill me-2"></i> ${successMsg}
    </div>
</c:if>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    $(document).ready(function () {
        const contextPath = '${pageContext.request.contextPath}';
        let allExams = [];

        // Show alert after load
        const alertBox = document.getElementById('delayedAlert');
        if (alertBox) {
            alertBox.style.display = 'flex';
            setTimeout(() => {
                alertBox.style.display = 'none';
            }, 5000);
        }

        // Render table rows
        function renderExams(exams) {
            let rows = '';
            if (exams && exams.length > 0) {
                $.each(exams, function (i, exam) {
                    rows += `
                        <tr>
                            <td>\${exam.examId}</td>
                            <td>\${exam.examName}</td>
                            <td>\${exam.examDuration}</td>
                            <td>
                                <a href="${contextPath}/exam/updateExam/\${exam.examId}" class="btn btn-warning btn-sm">
                                    <i class="bi bi-pencil-square"></i>
                                </a>
                            </td>
                            <td>
                                <a href="${contextPath}/exam/exam_delete/\${exam.examId}" class="btn btn-danger btn-sm"
                                   onclick="return confirm('Are you sure you want to delete this exam?');">
                                    <i class="bi bi-trash"></i>
                                </a>
                            </td>
                        </tr>`;
                });
            } else {
                rows = `<tr><td colspan="5" class="text-center">No exam data found</td></tr>`;
            }
            $('#examTableBody').html(rows);
        }

        // Fetch exams by status
        function loadFilteredExams(status = '') {
            $.ajax({
                url: 'http://localhost:8282/exam/Exam_view/' + status,
                method: "GET",
                dataType: 'json',
                success: function (response) {
                    allExams = response || [];
                    renderExams(allExams);
                },
                error: function () {
                    $('#examTableBody').html(`<tr><td colspan="5" class="text-center">Error loading data</td></tr>`);
                }
            });
        }

        // Status filter
        $("#examStatus").on("change", function () {
            const status = $(this).val();
            loadFilteredExams(status);
        });

        // Search filter
        $('#questionSearch').on('keyup', function () {
            const searchTerm = $(this).val().toLowerCase();
            const filteredExams = allExams.filter(exam =>
                exam.examName.toLowerCase().includes(searchTerm)
            );
            renderExams(filteredExams);
        });

        // Initial load
        loadFilteredExams('active');
    });
</script>

<%@ include file="modules/footer.jsp" %>
</body>
</html>
