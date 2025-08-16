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
            margin-left:280px;
            margin-top:100px;
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
        <div class="card mt-4">
            <div class="card-header text-center">
                <h5 class="mb-0">Student Details</h5>
            </div>
            <div class="card-body">

                <!-- Search and Filter -->
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
                            <c:if test="${empty students}">
                                <tr><td colspan="10" class="no-data">No student data found</td></tr>
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

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

    $(document).ready(function () {
        const contextPath = '${pageContext.request.contextPath}';

        function loadStudentsByStatus(status) {
            if (!status) {
                $('#studentTableBody').html('');
                return;
            }

            $.ajax({
                url: contextPath + 'http://localhost:8282/student/student_view/' + status,
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
                                        <a href='\${contextPath}/student/student_update/\${student.id}' class='btn btn-sm btn-warning'>
                                            <i class='bi bi-pencil-square'></i>
                                        </a>
                                    </td>
                                    <td>
                                        \${status === 'active' ? `
                                            <a href='\${contextPath}/student/student_delete/\${student.id}' class='btn btn-sm btn-danger' 
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
                    $('#studentSearch').trigger('input');
                },
                error: function () {
                    $('#studentTableBody').html(`<tr><td colspan='10' class='no-data text-center'>Error loading data</td></tr>`);
                }
            });
        }

        function filterStudents(keyword) {
            keyword = keyword.toLowerCase();
            $('#studentTableBody tr').each(function () {
                const rowText = $(this).text().toLowerCase();
                $(this).toggle(rowText.indexOf(keyword) > -1);
            });
        }

        $('#studentSearch').on('keyup input', function () {
            const keyword = $(this).val();
            filterStudents(keyword);
        });

        $('#studentStatus').on('change', function () {
            const selectedStatus = $(this).val();
            loadStudentsByStatus(selectedStatus);
        });

        // Load active students by default
        $('#studentStatus').val('active').trigger('change');
    });
</script>

<%@ include file="modules/footer.jsp" %>
</body>
</html>
