<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Top 10 Movies - NeoFilm</title>
    <%@ include file="includes/head.jsp" %>
</head>
<body class="bg-light d-flex flex-column min-vh-100">

    <%@ include file="includes/navbar.jsp" %>
    <%@ include file="includes/sidebar-user.jsp" %>

    <main class="container my-5 flex-grow-1">
        <div class="text-center mb-5">
            <h1 class="fw-bold display-5">⭐ Top 10 Movies</h1>
            <p class="text-muted">Highest rated movies of all time</p>
        </div>

        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-5 g-4">
            
            <c:choose>
                <c:when test="${not empty topMovies}">
                    <c:forEach var="movie" items="${topMovies}" varStatus="status">
                        <div class="col">
                            <div class="card h-100 shadow-sm border-0 position-relative">
                                
                                <div class="position-absolute top-0 start-0 bg-warning text-dark fw-bold px-3 py-1 rounded-bottom shadow" 
                                     style="z-index: 10; font-size: 1.2rem;">
                                    #${status.count}
                                </div>

                                <div style="height: 300px; overflow: hidden;">
                                    <c:choose>
                                        <c:when test="${movie.posterPath != null && movie.posterPath.startsWith('http')}">
                                            <img src="${movie.posterPath}" class="w-100 h-100" style="object-fit: cover;" alt="${movie.title}">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${pageContext.request.contextPath}/uploads/${movie.posterPath}" 
                                                 class="w-100 h-100" style="object-fit: cover;"
                                                 alt="${movie.title}"
                                                 onerror="this.src='https://dummyimage.com/300x450/ccc/000&text=No+Image'">
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <div class="card-body">
                                    <h6 class="card-title fw-bold text-truncate" title="${movie.title}">${movie.title}</h6>
                                    <div class="d-flex justify-content-between small text-muted mb-2">
                                        <span>${movie.releaseDate}</span>
                                        <span class="text-warning fw-bold">★ ${movie.rating}</span>
                                    </div>
                                    <a href="movie-detail?id=${movie.id}" class="btn btn-sm btn-outline-primary w-100 stretched-link">View</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                
                <c:otherwise>
                    <div class="col-12 text-center">
                        <h3>No data available.</h3>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>
    </main>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>