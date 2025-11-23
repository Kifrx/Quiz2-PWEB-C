<div class="sidebar d-flex flex-column p-3 text-white bg-dark">
    <a href="${pageContext.request.contextPath}/admin/dashboard.jsp" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
        <span class="fs-4 fw-bold">NeoFilm Admin</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item">
            <a href="movies.jsp" class="nav-link text-white ${param.page == 'movie' ? 'active' : ''}">
                Movie Management
            </a>
        </li>
        <li>
           <a href="${pageContext.request.contextPath}/admin/articles">
        </li>
    </ul>
    <hr>
    
    <div class="dropdown">
    <a href="${pageContext.request.contextPath}/home" class="d-flex align-items-center text-white text-decoration-none">
        <strong>&larr; Back to Site</strong>
    </a>
</div>
</div>
</div>