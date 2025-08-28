<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="modules/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Exam Results</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body {
            background-color: #f8f9fa;
            margin-left: 280px;
            margin-top: 100px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        h3 {
            font-weight: 600;
            color: #343a40;
        }

        .table {
            overflow: hidden;
            background: white;
        }

        .table thead {
            background: #343a40;
            color: white;
            font-size: 15px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .table-hover tbody tr:hover {
            background-color: #f1f3f5;
            cursor: pointer;
        }

        .table td, .table th {
            vertical-align: middle;
            text-align: center;
        }

        .no-data {
            color: #dc3545;
            font-weight: 500;
            text-align: center;
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

<div class="container">
    <div class="card mt-4 shadow-sm">
        <div class="card-header text-center">
            <h3 class="mb-0">Exam Results</h3>
        </div>
        <div class="card-body">

            <!-- Exam Results Table -->
            <div class="table-responsive">
                <table class="table table-hover text-center align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>Result ID</th>
                            <th>User ID</th>
                            <th>Exam ID</th>
                            <th>Score</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody id="examTableBody">
                        <c:if test="${empty result}">
                            <tr><td colspan="5" class="no-data">No results found</td></tr>
                        </c:if>
                        <c:forEach var="res" items="${result}">
                            <tr>
                                <td>${res.result_id}</td>
                                <td>${res.user_id}</td>
                                <td>${res.exam_id}</td>
                                <td>${res.score}</td>
                                <td>${res.total}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>

<%@ include file="modules/footer.jsp" %>
</body>
</html>
