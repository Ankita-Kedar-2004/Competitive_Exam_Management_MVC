<%@ include file="modules/header.jsp" %>

<div class="container d-flex justify-content-center align-items-center" style="min-height: 80vh;">
    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">Add Exam</h4>
        </div>
        <div class="card-body">
           <form action="/exam/registerExam" method="post">
    <div class="mb-3 row">
        <label for="examName" class="col-sm-4 col-form-label text-end">Exam Name</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" id="examName" name="examName" required />
        </div>
    </div>

    <div class="mb-3 row">
        <label for="examDuration" class="col-sm-4 col-form-label text-end">Duration (minutes)</label>
        <div class="col-sm-8">
            <input type="number" class="form-control" id="examDuration" name="examDuration" required min="1" />
        </div>
    </div>
     <div class="mb-3 row">
                        <label class="examStatus">Status</label>
                        <select name="status" class="form-select" required>
                            <option value="">Select Status</option>
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>
                </div>

    <div class="d-flex justify-content-end">
        <button type="submit" class="btn btn-primary me-2">Save</button>
        <button type="reset" class="btn btn-secondary">Cancel</button>
    </div>
</form>

        </div>
    </div>
</div>

<%@ include file="modules/footer.jsp" %>
