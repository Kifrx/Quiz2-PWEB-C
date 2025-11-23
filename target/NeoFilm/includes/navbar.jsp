<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
    <div class="container-fluid px-lg-5">
        <button class="btn btn-dark me-2 border-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#sidebarMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/home">NeoFilm</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon" style="width: 0.8em;"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home">Home</a></li>
                <a class="nav-link" href="${pageContext.request.contextPath}/articles">Articles</a>
            </ul>
            <div class="d-flex gap-2">
                <% if (session.getAttribute("user") == null) { %>
                    <a href="login.jsp" class="btn btn-outline-light">Login</a>
                    <a href="register.jsp" class="btn btn-primary">Register</a>
                <% } else { %>
                    <a href="logout" class="btn btn-danger">Logout</a>
                <% } %>
            </div>
        </div>
    </div>
</nav>