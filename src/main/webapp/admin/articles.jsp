<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Article Management - NeoFilm Admin</title>
    <%@ include file="../includes/head.jsp" %>
</head>
<body>

    <div class="d-flex flex-column flex-md-row">
        
        <%@ include file="../includes/sidebar-admin.jsp" %>

        <main class="flex-grow-1 bg-light p-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="fw-bold">Article Management</h2>
                <a href="article-form.jsp" class="btn btn-primary">Add New Article</a>
            </div>

             <div class="card shadow-sm border-0">
                <div class="card-body">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Title</th>
                                <th>Author</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>