<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% 
    
    if(session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Favorites - NeoFilm</title>
    <%@ include file="includes/head.jsp" %>
</head>
<body class="bg-light d-flex flex-column min-vh-100">

    <%@ include file="includes/navbar.jsp" %>
    <%@ include file="includes/sidebar-user.jsp" %>

    <main class="container my-5 flex-grow-1">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <h1 class="mb-4 fw-bold">My Favorite Movies</h1>
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    </div>
            </div>
        </div>
    </main>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>