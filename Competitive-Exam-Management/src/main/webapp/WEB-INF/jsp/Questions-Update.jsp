<%@ include file="modules/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Question</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card {
            margin-left: 250px;
            margin-top: 70px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }
        .card-header {
            background-color: #0d6efd;
            color: white;
            font-size: 20px;
            font-weight: 600;
            text-align: center;
            border-radius: 10px 10px 0 0;
        }
        label {
            font-weight: 500;
        }
        .btn-save {
            width: 100px;
        }
        .btn-cancel {
            background-color: #6c757d;
            color: white;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="card">
        <div class="card-header">Update Question Details</div>
        <div class="card-body">
            <form action="/question/questions_update_data" method="post">
                <input type="hidden" name="questionId" value="${question.questionId}" />

                <div class="mb-3">
                    <label>Question Text</label>
                    <input type="text" name="questionText" class="form-control" value="${question.questionText}" required />
                </div>

                <div class="row mb-3">
                    <div class="col">
                        <label>Option A</label>
                        <input type="text" name="optionA" class="form-control" value="${question.optionA}" required />
                    </div>
                    <div class="col">
                        <label>Option B</label>
                        <input type="text" name="optionB" class="form-control" value="${question.optionB}" required />
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col">
                        <label>Option C</label>
                        <input type="text" name="optionC" class="form-control" value="${question.optionC}" required />
                    </div>
                    <div class="col">
                        <label>Option D</label>
                        <input type="text" name="optionD" class="form-control" value="${question.optionD}" required />
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col">
                        <label>Correct Answer (A/B/C/D)</label>
                        <input type="text" name="correctAnswer" class="form-control" value="${question.correctAnswer}" required />
                    </div>
                      <div class="col">
                        <label>Exam Name</label>
                        <input type="text" name="examId" class="form-control" value="${question.examName}" required />
                    </div>
                </div>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Update</button>
                    <a href="/question/viewQuestions" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="modules/footer.jsp" %>
</body>
</html>
