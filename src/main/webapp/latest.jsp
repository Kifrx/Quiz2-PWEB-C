<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Latest Releases - NeoFilm</title>
    <%@ include file="includes/head.jsp" %>
</head>
<body class="bg-light d-flex flex-column min-vh-100">

    <%@ include file="includes/navbar.jsp" %>
    <%@ include file="includes/sidebar-user.jsp" %>

    <main class="container my-5 flex-grow-1">
        <h2 class="mb-4 fw-bold border-start border-4 border-primary ps-3">Latest Releases</h2>

        <c:choose>
            <c:when test="${not empty latestMovies}">
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    
                    <c:forEach var="movie" items="${latestMovies}">
                        <div class="col">
                            <div class="card h-100 shadow-sm border-0">
                                <div style="height: 400px; overflow: hidden; background: #000;">
                                     <c:choose>
                                        <c:when test="${movie.posterPath != null && movie.posterPath.startsWith('http')}">
                                            <img src="${movie.posterPath}" class="w-100 h-100" style="object-fit: cover; opacity: 0.9;" alt="${movie.title}">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${pageContext.request.contextPath}/uploads/${movie.posterPath}" 
                                                 class="w-100 h-100" style="object-fit: cover;"
                                                 alt="${movie.title}"
                                                 onerror="this.src='https://dummyimage.com/400x600/ccc/000&text=No+Image'">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title fw-bold">${movie.title}</h5>
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <span class="badge bg-primary">${movie.releaseDate}</span>
                                        <span class="text-warning">★ ${movie.rating}</span>
                                    </div>
                                    <p class="card-text text-muted small text-truncate">${movie.synopsis}</p>
                                    <a href="movie-detail?id=${movie.id}" class="btn btn-outline-dark w-100 stretched-link">View Details</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    
                </div>
            </c:when>
            <c:otherwise>
                <div class="text-center py-5">
                    <h3 class="text-muted">No new releases found.</h3>
                    <a href="home" class="btn btn-primary mt-3">Explore Movies</a>
                </div>
            </c:otherwise>
        </c:choose>

    </main>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>