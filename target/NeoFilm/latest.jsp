<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Latest Films - NeoFilm</title>
    <%@ include file="includes/head.jsp" %>
</head>
<body class="bg-light d-flex flex-column min-vh-100">

    <%@ include file="includes/navbar.jsp" %>
    <%@ include file="includes/sidebar-user.jsp" %>

    <main class="container my-5 flex-grow-1">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h1 class="fw-bold">Latest Releases</h1>
                </div>
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    </div>
                    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:forEach var="movie" items="${movieList}">
    <div class="col">
        <div class="card h-100 shadow-sm border-0">
            <a href="movie-detail?id=${movie.id}">
                <div style="height: 350px; overflow: hidden;">
                   <c:choose>
                        <c:when test="${movie.posterPath != null && movie.posterPath.startsWith('http')}">
                            <img src="${movie.posterPath}" class="card-img-top h-100 w-100" style="object-fit: cover;" onerror="this.src='https://dummyimage.com/300x450/ccc/000&text=No+Image'">
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/uploads/${movie.posterPath}" class="card-img-top h-100 w-100" style="object-fit: cover;" onerror="this.src='https://dummyimage.com/300x450/ccc/000&text=No+Image'">
                        </c:otherwise>
                    </c:choose>
                </div>
            </a>
            <div class="card-body">
                <h5 class="card-title text-truncate">${movie.title}</h5>
                <div class="mb-2">
                     <span class="badge bg-warning text-dark">★ ${movie.rating}</span>
                     <span class="badge bg-secondary">${movie.genre}</span>
                </div>
                <a href="movie-detail?id=${movie.id}" class="btn btn-primary btn-sm w-100">View Details</a>
            </div>
        </div>
    </div>
</c:forEach>

<c:if test="${empty movieList}">
    <div class="col-12 text-center py-5">
        <h4 class="text-muted">maintanance</h4>
        <a href="home" class="btn btn-outline-primary mt-3">Explore Movies</a>
    </div>
</c:if>
            </div>
        </div>
    </main>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>