<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Articles - NeoFilm</title>
    <%@ include file="includes/head.jsp" %>
</head>
<body class="bg-light d-flex flex-column min-vh-100">

    <%@ include file="includes/navbar.jsp" %>
    <%@ include file="includes/sidebar-user.jsp" %>

    <main class="container my-5 flex-grow-1">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h1 class="fw-bold">Latest Articles</h1>
                </div>
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    </div>
            </div>
        </div>
    </main>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>