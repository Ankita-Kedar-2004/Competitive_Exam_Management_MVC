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
                Exam Details
            </div>
            <div class="card-body">

                <!-- Status Filter and Add Button -->
                <div class="row mb-3">
                    <div class="col-md-4">
                        <input type="text" id="questionSearch" class="form-control shadow-sm" placeholder="Search exam..." />
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
                                <th>Exam Name</th>
                                <th>Exam Duration</th>
                                <th colspan="2">Action</th>
                            </tr>
                        </thead>
                        <tbody id="examTableBody">
                            <!-- Data will be injected here by jQuery -->
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
</div>

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        const contextPath = '${pageContext.request.contextPath}';
        let allExams = [];

        function renderExams(exams) {
            let rows = '';
            if (exams && exams.length > 0) {
                $.each(exams, function (i, exam) {
                    const isActive = exam.examStatus && exam.examStatus.toLowerCase() === 'active';
                    rows += `
                        <tr>
                            <td>\${exam.examId}</td>
                            <td>\${exam.examName}</td>
                            <td>\${exam.examDuration}</td>
                            <td>
                                <a href="${contextPath}/exam/updateExam/\${exam.examId}" class="btn btn-sm btn-warning">
                                    <i class="bi bi-pencil-square"></i>
                                </a>
                            </td>
                            <td>
                        
                            <a href="${pageContext.request.contextPath}/exam/exam_delete/\${exam.examId}" class="btn btn-sm btn-danger"
                            	   onclick="return confirm('Are you sure you want to delete this exam?');">
                            	   <i class="bi bi-trash"></i>
                            	</a>
                            </td>
                        </tr>
                    `;
                });
            } else {
                rows = `<tr><td colspan="6" class="no-data text-center">No exam data found</td></tr>`;
            }
            $('#examTableBody').html(rows);
        }

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
                    $('#examTableBody').html(`<tr><td colspan="6" class="no-data text-center">Error loading data</td></tr>`);
                }
            });
        }

        // Filter by status
        $("#examStatus").on("change", function () {
            const status = $(this).val();
            loadFilteredExams(status);
        });

        // Search by exam name
        $('#questionSearch').on('keyup', function () {
            const searchTerm = $(this).val().toLowerCase();
            const filteredExams = allExams.filter(exam =>
                exam.examName.toLowerCase().includes(searchTerm)
            );
            renderExams(filteredExams);
        });

        // Initial load with default status = active
        loadFilteredExams('active');
    });
</script>

<%@ include file="modules/footer.jsp" %>
</body>
</html>
