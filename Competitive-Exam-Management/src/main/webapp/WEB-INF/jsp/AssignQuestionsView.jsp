<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="modules/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Exam Questions</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            margin-left: 250px;
            margin-top: 100px;
            padding-bottom: 50px;
        }
        .question-card {
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .question-header {
            background-color: #0d6efd;
            color: white;
            padding: 15px;
            border-radius: 10px 10px 0 0;
        }
        .options-container {
            padding: 20px;
        }
        .option-radio {
            margin-right: 10px;
        }
        .submit-btn {
            margin-top: 30px;
        }
        .timer {
            font-size: 1.3rem;
            font-weight: bold;
            color: red;
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">

    <!--  Timer -->
    <div class="timer">
        Time Left: <span id="timer"></span>
    </div>

    <form id="examForm" action="${pageContext.request.contextPath}/result/submitExam" method="post">
        <input type="hidden" name="studentId" value="${studentId}">
        <input type="hidden" name="examId" value="${examId}">
        
        <c:forEach var="question" items="${questions}" varStatus="loop">
            <div class="card question-card">
                <div class="card-header question-header">
                    <h5>Question ${loop.index + 1}</h5>
                    <p><c:out value="${question.questionText}" /></p>
                </div>
                <div class="card-body options-container">
                    <div class="form-check">
                        <input class="form-check-input option-radio" type="radio" 
                               name="answers[${question.questionId}]" id="optionA_${question.questionId}" 
                               value="A" required>
                        <label class="form-check-label" for="optionA_${question.questionId}">
                            A) <c:out value="${question.optionA}" escapeXml="true"/>
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input option-radio" type="radio" 
                               name="answers[${question.questionId}]" id="optionB_${question.questionId}" 
                               value="B">
                        <label class="form-check-label" for="optionB_${question.questionId}">
                            B) <c:out value="${question.optionB}" escapeXml="true"/>
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input option-radio" type="radio" 
                               name="answers[${question.questionId}]" id="optionC_${question.questionId}" 
                               value="C">
                        <label class="form-check-label" for="optionC_${question.questionId}">
                            C) <c:out value="${question.optionC}" escapeXml="true"/>
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input option-radio" type="radio" 
                               name="answers[${question.questionId}]" id="optionD_${question.questionId}" 
                               value="D">
                        <label class="form-check-label" for="optionD_${question.questionId}">
                            D) <c:out value="${question.optionD}" escapeXml="true"/>
                        </label>
                    </div>
                </div>
            </div>
        </c:forEach>
        
        <div class="text-center submit-btn">
            <button type="submit" class="btn btn-primary btn-lg">Submit Exam</button>
        </div>
    </form>
</div>

<!--  Countdown Script -->
<script>
    // Controller should pass totalQuestions as model attribute
    let totalQuestions = ${totalQuestions};  // Example: 20
    let totalTime = totalQuestions * 60;     // 1 min per question = seconds

    let timerElement = document.getElementById("timer");
    let examForm = document.getElementById("examForm");

    function startTimer(duration) {
        let time = duration;

        let interval = setInterval(() => {
            let minutes = Math.floor(time / 60);
            let seconds = time % 60;

            timerElement.textContent =
                String(minutes).padStart(2, "0") + ":" + String(seconds).padStart(2, "0");

            if (time <= 0) {
                clearInterval(interval);
                alert("Time is up! Your exam will be submitted.");
                examForm.submit();
            }
            time--;
        }, 1000);
    }

    // Start timer when page loads
    window.onload = function() {
        startTimer(totalTime);
    };
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="modules/footer.jsp" %>
</body>
</html>
