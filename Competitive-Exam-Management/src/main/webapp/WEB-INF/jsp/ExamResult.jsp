<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Exam Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body { background: linear-gradient(to right, #ff416c, #ff4b2b); font-family: 'Segoe UI', sans-serif; margin:0; padding:0; }
        .result-card { max-width: 800px; margin:50px auto; border-radius:20px; background:#fff; padding:30px; text-align:center; box-shadow:0px 8px 20px rgba(0,0,0,0.2); }
        .result-header { font-size:2.2rem; font-weight:bold; color:#dc3545; }
        .score-box { font-size:1.8rem; padding:20px; border-radius:12px; background:#ffe6e6; color:#dc3545; margin-top:20px; font-weight:bold; }
        .btn-custom { background: linear-gradient(45deg,#ff416c,#ff4b2b); color:white; padding:12px 30px; border-radius:12px; font-size:1.1rem; font-weight:bold; border:none; cursor:pointer; transition:0.3s; }
        .btn-custom:hover { background: linear-gradient(45deg,#ff4b2b,#ff416c); transform: scale(1.08); }
        .question-box { text-align:left; margin-top:15px; padding:15px; border-radius:10px; background:#f8f9fa; }
        .correct { color: green; font-weight:bold; }
        .incorrect { color: red; font-weight:bold; }
        .not-answered { color: gray; font-style: italic; }
    </style>
</head>
<body>

<%@ include file="modules/header.jsp" %>

<div class="result-card">
    <h2 class="result-header">🎉 Congratulations 🎉</h2>
    <div class="score-box">Your Score: <strong>${score}</strong></div>

    <div class="mt-4">
        <button class="btn btn-custom" id="toggleBtn" type="button">View Questions</button>
    </div>

    <div id="questionsSection" class="mt-4" style="display:none;">
        <c:forEach var="q" items="${question}" varStatus="status">
            <div class="question-box">
                <p><strong>Q${status.index + 1}:</strong> <c:out value="${q.questionText}" /></p>

                <c:set var="studentAns" value="${answers[q.questionId]}" />

                <ul>
                    <!-- Option A -->
                    <li class="${studentAns == 'A' && q.correctAnswer == 'A' ? 'correct' : (studentAns == 'A' && studentAns != q.correctAnswer ? 'incorrect' : (q.correctAnswer == 'A' ? 'correct' : ''))}">
                        A) <c:out value="${q.optionA}" />
                        <c:if test="${studentAns == 'A'}">(Your Answer)</c:if>
                    </li>

                    <!-- Option B -->
                    <li class="${studentAns == 'B' && q.correctAnswer == 'B' ? 'correct' : (studentAns == 'B' && studentAns != q.correctAnswer ? 'incorrect' : (q.correctAnswer == 'B' ? 'correct' : ''))}">
                        B) <c:out value="${q.optionB}" />
                        <c:if test="${studentAns == 'B'}">(Your Answer)</c:if>
                    </li>

                    <!-- Option C -->
                    <li class="${studentAns == 'C' && q.correctAnswer == 'C' ? 'correct' : (studentAns == 'C' && studentAns != q.correctAnswer ? 'incorrect' : (q.correctAnswer == 'C' ? 'correct' : ''))}">
                        C) <c:out value="${q.optionC}" />
                        <c:if test="${studentAns == 'C'}">(Your Answer)</c:if>
                    </li>

                    <!-- Option D -->
                    <li class="${studentAns == 'D' && q.correctAnswer == 'D' ? 'correct' : (studentAns == 'D' && studentAns != q.correctAnswer ? 'incorrect' : (q.correctAnswer == 'D' ? 'correct' : ''))}">
                        D) <c:out value="${q.optionD}" />
                        <c:if test="${studentAns == 'D'}">(Your Answer)</c:if>
                    </li>
                </ul>

                <p>✅ Correct Answer:
                    <span class="correct">
                        <c:choose>
                            <c:when test="${q.correctAnswer == 'A'}"><c:out value="${q.optionA}" /></c:when>
                            <c:when test="${q.correctAnswer == 'B'}"><c:out value="${q.optionB}" /></c:when>
                            <c:when test="${q.correctAnswer == 'C'}"><c:out value="${q.optionC}" /></c:when>
                            <c:when test="${q.correctAnswer == 'D'}"><c:out value="${q.optionD}" /></c:when>
                        </c:choose>
                    </span>
                </p>

                <c:if test="${empty studentAns}">
                    <p class="not-answered">Not Answered ❌</p>
                </c:if>
            </div>
        </c:forEach>
    </div>
</div>

<%@ include file="modules/footer.jsp" %>

<script>
    $("#toggleBtn").click(function(){
        $("#questionsSection").toggle(); // simple show/hide
    });
</script>

</body>
</html>
