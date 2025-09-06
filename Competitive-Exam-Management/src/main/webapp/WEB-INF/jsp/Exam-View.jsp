<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="modules/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Exam List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body { background-color: #f8f9fa; margin-left: 280px; margin-top: 100px; }
        .no-data { color: #dc3545; font-weight: 500; }
    </style>
</head>
<body>

<div class="container mt-4">
    <div class="card shadow">
        <div class="card-header text-center fw-bold">Exams Details</div>
        <div class="card-body">

            <!-- Filter Section -->
            <div class="row mb-3">
                <div class="col-md-4">
                    <input type="text" id="questionSearch" class="form-control shadow-sm" placeholder="Search exam..."/>
                </div>
                <div class="col-md-4">
                    <select id="examStatus" class="form-select shadow-sm">
                        <option value="">-- Select Status --</option>
                        <option value="Active" selected>Active</option>
                        <option value="Inactive">Inactive</option>
                    </select>
                </div>
                <!-- Hide Add Exam button for students -->
                <c:if test="${fn:toLowerCase(sessionScope.userRole) ne 'student'}">
                    <div class="col-md-4 text-end">
                        <a href="${pageContext.request.contextPath}/exam/exam_registration" class="btn btn-primary shadow-sm">
                            <i class="bi bi-plus-circle me-1"></i> Add Exam
                        </a>
                    </div>
                </c:if>
            </div>

            <!-- Exam Table -->
            <div class="table-responsive">
                <table class="table table-bordered table-hover text-center align-middle">
                    <thead id="examTableHead" class="table-light">
                        <tr>
                            <th>ID</th>
                            <th>Exam Name</th>
                            <th>Exam Duration</th>
                            <!-- Extra columns only if NOT student -->
                            <c:if test="${fn:toLowerCase(sessionScope.userRole) ne 'student'}">
                                <th>Edit</th>
                                <th>Delete</th>
                                <th>Add Questions</th>
                            </c:if>
                        </tr>
                    </thead>
                    <tbody id="examTableBody"></tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(function () {
        const contextPath = '${pageContext.request.contextPath}';
        const userRole = '${fn:toLowerCase(sessionScope.userRole)}'; // role from session
        let allExams = [];

        function renderExams(exams, status) {
            let rows = '';
            if (exams && exams.length > 0) {
                $.each(exams, function (i, exam) {
                    rows += `
                        <tr>
                            <td>\${exam.examId}</td>
                            <td>\${exam.examName}</td>
                            <td>\${exam.examDuration}</td>
                    `;

                    if (userRole !== 'student') {
                        if (exam.status && exam.status.toLowerCase() === 'active') {
                            rows += `
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
                                <td>
                                    <a href="${contextPath}/question/Questionsregister/\${exam.examId}" class="btn btn-warning btn-sm">
                                        <i class="bi bi-plus-circle me-1"></i>
                                    </a>
                                </td>
                            `;
                        } else {
                            rows += `
                                <td>
                                    <a href="${contextPath}/exam/updateExam/\${exam.examId}" class="btn btn-warning btn-sm">
                                        <i class="bi bi-pencil-square"></i>
                                    </a>
                                </td>
                                <td colspan="2"></td>
                            `;
                        }
                    }

                    rows += `</tr>`;
                });
            } else {
                const colspan = (userRole !== 'student') ? 6 : 3;
                rows = `<tr><td colspan="${colspan}" class="no-data">No exam data found</td></tr>`;
            }

            $('#examTableBody').html(rows);
            // Hide the header if status is Inactive
            if (status.toLowerCase() === 'inactive') {
                $('#examTableHead').hide();
            } else {
                $('#examTableHead').show();
            }
        }

        function loadFilteredExams(status = '') {
            $.ajax({
                url: 'http://localhost:8282/exam/Exam_view/' + status,
                method: "GET",
                dataType: 'json',
                success: function (response) {
                    allExams = response || [];
                    renderExams(allExams, status);
                },
                error: function () {
                    const colspan = (userRole !== 'student') ? 6 : 3;
                    $('#examTableBody').html(`<tr><td colspan="${colspan}" class="no-data">Error loading data</td></tr>`);
                }
            });
        }

        $("#examStatus").on("change", function () {
            loadFilteredExams($(this).val());
        });

        $('#questionSearch').on('keyup', function () {
            const searchTerm = $(this).val().toLowerCase();
            renderExams(allExams.filter(exam => exam.examName.toLowerCase().includes(searchTerm)), $('#examStatus').val());
        });

        loadFilteredExams('active'); // initial
    });
</script>

<%@ include file="modules/footer.jsp" %>
</body>
</html>
