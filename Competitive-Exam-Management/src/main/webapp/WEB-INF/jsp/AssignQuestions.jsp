<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="modules/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Enter Student Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4e73df;
            --secondary-color: #f8f9fc;
            --accent-color: #2e59d9;
            --text-color: #5a5c69;
        }
        
        body {
            background-color: var(--secondary-color);
            color: var(--text-color);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            marign-left:280px;
            margin-top:100px;
        }
        
        .container {
            max-width: 600px;
            animation: fadeIn 0.5s ease-in-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .card {
            border: none;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 25px rgba(0, 0, 0, 0.12);
        }
        
        .card-header {
            background-color: var(--primary-color);
            color: white;
            padding: 1.5rem;
            text-align: center;
            font-weight: 600;
        }
        
        h3 {
            color: var(--primary-color);
            font-weight: 700;
            margin-bottom: 1.5rem;
            position: relative;
            padding-bottom: 10px;
        }
        
        h3::after {
            content: '';
            position: absolute;
            left: 50%;
            bottom: 0;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background-color: var(--accent-color);
            border-radius: 3px;
        }
        
        .form-label {
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: var(--text-color);
        }
        
        .form-control {
            padding: 0.75rem 1rem;
            border-radius: 8px;
            border: 1px solid #d1d3e2;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(78, 115, 223, 0.25);
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            padding: 0.75rem;
            border-radius: 8px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
        }
        
        .btn-primary:hover {
            background-color: var(--accent-color);
            border-color: var(--accent-color);
            transform: translateY(-2px);
        }
        
        .btn-primary:active {
            transform: translateY(0);
        }
        
        .footer {
            margin-top: 2rem;
            text-align: center;
            color: var(--text-color);
            font-size: 0.9rem;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 0 15px;
            }
            
            .card {
                margin-top: 1rem;
            }
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="card shadow p-4">
        <h3 class="text-center mb-4">Enter Student Details</h3>

        <form action="/assignQuestions/assignQuestions" method="post">
            <div class="mb-4">
                <label for="studentId" class="form-label">Student ID</label>
                <input type="number" class="form-control" id="studentId" name="studentId" placeholder="Enter your Student ID" required>
            </div>

            <div class="mb-4">
                <label for="examId" class="form-label">Exam ID</label>
                <input type="number" class="form-control" id="examId" name="examId" placeholder="Enter Exam ID" required>
            </div>

            <div class="d-grid mt-4">
                <button type="submit" class="btn btn-primary py-2">Start Exam</button>
            </div>
        </form>
    </div>
</div>

</body>
<%@ include file="modules/footer.jsp" %>
</html>