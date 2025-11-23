<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - NeoFilm</title>
    <%@ include file="../includes/head.jsp" %>
</head>
<body>

    <div class="d-flex flex-column flex-md-row">
        
        <%@ include file="../includes/sidebar-admin.jsp" %>

        <main class="flex-grow-1 bg-light p-4 d-flex flex-column justify-content-center align-items-center" style="min-height: 100vh;">
            <h1 class="mb-5 fw-bold text-dark">Welcome, Admin</h1>
            <div class="d-flex flex-column flex-md-row gap-4">
                <a href="movies.jsp" class="btn btn-primary menu-btn shadow p-4">Movie Management</a>
                <a href="articles.jsp" class="btn btn-success menu-btn shadow p-4">Article Management</a>
            </div>
        </main>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>