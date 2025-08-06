<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="modules/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student List</title>
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
                Student Details
            </div>
            <div class="card-body">

                <!-- Search and Status Filter -->
                <div class="row mb-3">
                    <div class="col-md-4">
                        <input type="text" id="studentSearch" class="form-control shadow-sm" placeholder="Search student..." />
                    </div>
                    <div class="col-md-4">
                        <select id="studentStatus" name="studentStatus" class="form-select shadow-sm">
                            <option value="">-- Select Status --</option>
                            <option value="active">Active</option>
                            <option value="inactive">Inactive</option>
                        </select>
                    </div>
                    <div class="col-md-4 text-end">
                        <a href="${pageContext.request.contextPath}/student/student_registration" class="btn btn-primary btn-sm">
                            <i class="bi bi-person-plus-fill me-1"></i> Add Student
                        </a>
                    </div>
                </div>

                <!-- Student Table -->
                <div class="table-responsive">
                    <table class="table table-bordered table-hover text-center align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Contact</th>
                                <th>Email</th>
                                <th>Qualification</th>
                                <th>College</th>
                                <th>Passing Year</th>
                                <th>Exam ID</th>
                                <th colspan="2">Action</th>
                            </tr>
                        </thead>
                        <tbody id="studentTableBody">
                            <!-- AJAX data loads here -->
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
</div>

<!-- JQuery + Bootstrap -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    $(document).ready(function () {
        const contextPath = '${pageContext.request.contextPath}';

        // Load students by status
        function loadStudentsByStatus(status) {
            if (!status) {
                $('#studentTableBody').html('');
                return;
            }

            $.ajax({
                url: 'http://localhost:8282/student/student_view/' + status,
                method: 'GET',
                dataType: 'json',
                success: function (response) {
                    let rows = '';
                    if (response && response.length > 0) {
                        $.each(response, function (i, student) {
                            rows += `
                                <tr>
                                    <td>\${student.id || ''}</td>
                                    <td>\${student.name || ''}</td>
                                    <td>\${student.contactNumber || ''}</td>
                                    <td>\${student.email || ''}</td>
                                    <td>\${student.qualification || ''}</td>
                                    <td>\${student.collegeName || ''}</td>
                                    <td>\${student.passingYear || ''}</td>
                                    <td>\${student.examId || ''}</td>
                                    <td>
                                        <a href='${contextPath}/student/student_update/\${student.id}' class='btn btn-sm btn-warning'>
                                            <i class='bi bi-pencil-square'></i>
                                        </a>
                                    </td>
                                    <td>
                                        \${status === 'active' ? `
                                            <a href='${contextPath}/student/student_delete/\${student.id}' class='btn btn-sm btn-danger' 
                                               onclick='return confirm("Are you sure you want to delete this student?");'>
                                                <i class='bi bi-trash'></i>
                                            </a>` : ''}
                                    </td>
                                </tr>
                            `;
                        });
                    } else {
                        rows = `<tr><td colspan='10' class='no-data text-center'>No student data found</td></tr>`;
                    }
                    $('#studentTableBody').html(rows);
                    $('#studentSearch').trigger('input'); // ✅ reapply filter immediately
                },
                error: function () {
                    $('#studentTableBody').html(`<tr><td colspan='10' class='no-data text-center'>Error loading data</td></tr>`);
                }
            });
        }

        // Filter table rows by search text
        function filterStudents(keyword) {
            keyword = keyword.toLowerCase();
            $('#studentTableBody tr').each(function () {
                const rowText = $(this).text().toLowerCase();
                $(this).toggle(rowText.indexOf(keyword) > -1);
            });
        }

        // Trigger filter on keyup or input
        $('#studentSearch').on('keyup input', function () {
            const keyword = $(this).val();
            filterStudents(keyword);
        });

        // Status filter change
        $('#studentStatus').on('change', function () {
            const selectedStatus = $(this).val();
            loadStudentsByStatus(selectedStatus);
        });

        // Initial load
        $('#studentStatus').val('active').trigger('change');
    });
</script>

<%@ include file="modules/footer.jsp" %>
</body>
</html>
