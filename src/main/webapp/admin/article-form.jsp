<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Article Form - Admin</title>
    <%@ include file="../includes/head.jsp" %>
</head>
<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
        <div class="container">
            <span class="navbar-brand mb-0 h1 fw-bold">NeoFilm Admin</span>
            <a href="articles.jsp" class="btn btn-outline-light btn-sm">Back to List</a>
        </div>
    </nav>

    <div class="container mb-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <h2 class="mb-4">Add New Article</h2>
                <div class="card shadow-sm border-0">
                    <div class="card-body p-4">
                        <form action="../ArticleServlet" method="POST">
                            <input type="hidden" name="action" value="add">
                            
                            <div class="mb-3">
                                <label class="form-label">Article Title</label>
                                <input type="text" name="title" class="form-control" placeholder="Enter title here..." required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Content</label>
                                <textarea name="content" class="form-control" rows="10" placeholder="Write your article content here..."></textarea>
                            </div>
                            
                            <div class="d-flex justify-content-end gap-2 mt-4">
                                <a href="articles.jsp" class="btn btn-secondary">Cancel</a>
                                <button type="submit" class="btn btn-success">Save Article</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>