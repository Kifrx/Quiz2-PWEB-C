<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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
                    
                    <c:choose>
                        <c:when test="${not empty favoriteMovies}">
                            
                            <c:forEach var="movie" items="${favoriteMovies}">
                                <div class="col">
                                    <div class="card h-100 shadow-sm border-0">
                                        <div style="height: 350px; overflow: hidden;">
                                            <c:choose>
                                                <c:when test="${movie.posterPath != null && movie.posterPath.startsWith('http')}">
                                                    <img src="${movie.posterPath}" class="card-img-top h-100 w-100" style="object-fit: cover;" alt="${movie.title}">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${pageContext.request.contextPath}/uploads/${movie.posterPath}" 
                                                         class="card-img-top h-100 w-100" style="object-fit: cover;"
                                                         alt="${movie.title}"
                                                         onerror="this.src='https://dummyimage.com/400x600/ccc/000&text=No+Image'">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>

                                        <div class="card-body">
                                            <h5 class="card-title fw-bold text-truncate">${movie.title}</h5>
                                            <p class="card-text text-muted small">
                                                ${movie.releaseDate} | ${movie.genre}
                                            </p>
                                            
                                            <a href="movie-detail?id=${movie.id}" class="btn btn-primary w-100 mt-2">
                                                View Detail
                                            </a>
                                            
                                            <form action="${pageContext.request.contextPath}/addToFavorites" method="POST" class="mt-2">
                                                <input type="hidden" name="movieId" value="${movie.id}">
                                                <button type="submit" class="btn btn-outline-danger w-100 btn-sm">
                                                    Remove
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </c:when>
                        
                        <c:otherwise>
                            <div class="col-12 text-center py-5">
                                <div class="text-muted mb-3">
                                    <i class="bi bi-heart-break display-1"></i>
                                </div>
                                <h3>You haven't added any favorites yet.</h3>
                                <p class="text-secondary">Explore our collection and save movies you like!</p>
                                <a href="home" class="btn btn-primary px-4 mt-2">Browse Movies</a>
                            </div>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
        </div>
    </main>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>