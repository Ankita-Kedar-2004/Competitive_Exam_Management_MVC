<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Exam Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #ff416c, #ff4b2b);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }
        .result-card {
            max-width: 700px;
            margin: 50px auto;
            border-radius: 20px;
            background: #fff;
            padding: 30px;
            text-align: center;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.2);
        }
        .result-header {
            font-size: 2.2rem;
            font-weight: bold;
            color: #dc3545;
        }
        .score-box {
            font-size: 1.8rem;
            padding: 20px;
            border-radius: 12px;
            background: #ffe6e6;
            color: #dc3545;
            margin-top: 20px;
            font-weight: bold;
        }
        .btn-custom {
            background: linear-gradient(45deg, #ff416c, #ff4b2b);
            color: white;
            padding: 12px 30px;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: bold;
            border: none;
            transition: 0.3s;
            cursor: pointer;
        }
        .btn-custom:hover {
            background: linear-gradient(45deg, #ff4b2b, #ff416c);
            transform: scale(1.08);
        }
        .question-box {
            text-align: left;
            margin-top: 15px;
            padding: 15px;
            border-radius: 10px;
            background: #f8f9fa;
        }
        .correct { color: green; font-weight: bold; }
        .incorrect { color: red; font-weight: bold; }
    </style>
</head>
<body>

<%@ include file="modules/header.jsp" %>

<div class="result-card">
    <h2 class="result-header">🎉 Congratulations 🎉</h2>
    <div class="score-box">Your Score: <strong>${score}</strong></div>

    <div class="mt-4">
        <button class="btn btn-custom" type="button" data-bs-toggle="collapse" data-bs-target="#questionsSection">
            View Questions
        </button>
    </div>

    <!-- Collapsible question list -->
    <div id="questionsSection" class="collapse mt-4">
        <c:forEach var="q" items="${questions}">
    <div class="question-box">
        <p><strong>Q:</strong> ${q.questionText}</p>
        <p><strong>Your Answer:</strong> 
            <span class="${q.studentAnswer == q.correctAnswer ? 'correct' : 'incorrect'}">
                ${q.studentAnswer}
            </span>
        </p>
        <p>Correct Answer: <span class="correct">${q.correctAnswer}</span></p>
    </div>
</c:forEach>
    </div>
</div>

<%@ include file="modules/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
