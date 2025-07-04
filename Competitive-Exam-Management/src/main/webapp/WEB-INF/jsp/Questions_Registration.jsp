
<%@ include file="modules/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Question</title>
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
        <div class="card-header">Add Question Details</div>
        <div class="card-body">
            <form action="registerQuestion" method="post">
                <div class="row mb-3">
                    <label>Question Text</label>
                    <input type="text" name="questionText" class="form-control" required />
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label>Option A</label>
                        <input type="text" name="optionA" class="form-control" required />
                    </div>
                    <div class="col-md-6">
                        <label>Option B</label>
                        <input type="text" name="optionB" class="form-control" required />
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label>Option C</label>
                        <input type="text" name="optionC" class="form-control" required />
                    </div>
                    <div class="col-md-6">
                        <label>Option D</label>
                        <input type="text" name="optionD" class="form-control" required />
                    </div>
                </div>

                <div class="row mb-4">
                    <div class="col-md-6">
                        <label>Correct Answer (A/B/C/D)</label>
                        <input type="text" name="correctAnswer" class="form-control" required />
                    </div>
                    <div class="col-md-6">
                        <label>Exam ID</label>
                        <input type="number" name="examId" class="form-control" required />
                    </div>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary btn-save">Save</button>
                    <button type="reset" class="btn btn-cancel btn-save">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="modules/footer.jsp" %>
</body>
</html>
