<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>
    <title>NeoFilm - Movies</title>
    <%@ include file="includes/head.jsp" %>
</head>
<body class="bg-light d-flex flex-column min-vh-100">

    <%@ include file="includes/navbar.jsp" %>
    
    <div class="container-fluid">
        <div class="row">
            
            <div class="col-md-3 col-lg-2 p-0 bg-white border-end">
                 <%@ include file="includes/sidebar-user.jsp" %>
            </div>

            <main class="col-md-9 col-lg-10 my-4 px-4">
                
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="fw-bold text-dark">Movies Collection</h2>
                    
                    <form action="search" method="GET" class="d-flex" role="search">
                        <input class="form-control me-2" type="search" name="q" placeholder="Search movies..." aria-label="Search">
                        <button class="btn btn-outline-primary" type="submit">Search</button>
                    </form>
                </div>

                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-xl-4 g-4">
                    
                    <c:forEach var="movie" items="${movieList}">
                        <div class="col">
                            <div class="card h-100 border-0 shadow-sm movie-card hover-effect">
                                
                                <a href="movie-detail?id=${movie.id}" class="text-decoration-none">
                                    <div style="height: 350px; overflow: hidden; background: #eee;">
                                        <c:choose>
                                            
                                            <c:when test="${movie.posterPath != null && movie.posterPath.startsWith('http')}">
                                                <img src="${movie.posterPath}" 
                                                     class="card-img-top w-100 h-100" 
                                                     style="object-fit: cover;"
                                                     alt="${movie.title}"
                                                     onerror="this.src='https://dummyimage.com/300x450/ccc/000&text=No+Image'">
                                            </c:when>
                                           
                                            <c:otherwise>
                                                <img src="${pageContext.request.contextPath}/uploads/${movie.posterPath}" 
                                                     class="card-img-top w-100 h-100" 
                                                     style="object-fit: cover;"
                                                     alt="${movie.title}"
                                                     onerror="this.src='https://dummyimage.com/300x450/ccc/000&text=No+Image'">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </a>

                                <div class="card-body d-flex flex-column">
                                    <h5 class="card-title fw-bold text-truncate" title="${movie.title}">
                                        <a href="movie-detail?id=${movie.id}" class="text-decoration-none text-dark">
                                            ${movie.title}
                                        </a>
                                    </h5>
                                    
                                    <div class="mb-2">
                                        <span class="badge bg-warning text-dark">★ ${movie.rating}</span>
                                        <span class="badge bg-secondary">${movie.genre != null ? movie.genre : 'Movie'}</span>
                                    </div>

                                    <p class="card-text text-muted small" 
                                       style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
                                        ${movie.synopsis}
                                    </p>
                                    
                                    <a href="movie-detail?id=${movie.id}" class="btn btn-outline-primary mt-auto w-100">
                                        View Details
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    </div>
                <c:if test="${empty movieList}">
                    <div class="alert alert-info text-center mt-5">
                        <h4>Belum ada film yang tersedia.</h4>
                        <p>Silakan tambahkan data film di database.</p>
                    </div>
                </c:if>

            </main>
        </div>
    </div>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>