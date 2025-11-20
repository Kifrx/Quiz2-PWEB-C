<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>${movie.title} - NeoFilm</title>
    <%@ include file="includes/head.jsp" %>
</head>
<body class="bg-light d-flex flex-column min-vh-100">

    <%@ include file="includes/navbar.jsp" %>

    <main class="container my-5 flex-grow-1">
        
        <a href="home" class="btn btn-outline-secondary mb-4">
            &larr; Back to Home
        </a>

        <div class="card border-0 shadow-sm overflow-hidden">
            <div class="row g-0">
            
                <div class="col-md-4 bg-dark text-center">
                     <c:choose>
                         <c:when test="${movie.posterPath != null && movie.posterPath.startsWith('http')}">
                            <img src="${movie.posterPath}" class="img-fluid w-100" style="height: 100%; object-fit: cover;" alt="${movie.title}">
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/uploads/${movie.posterPath}" 
                                 class="img-fluid w-100" 
                                 style="height: 100%; object-fit: cover;"
                                 alt="${movie.title}"
                                 onerror="this.src='https://dummyimage.com/400x600/ccc/000&text=No+Image'">
                        </c:otherwise>
                    </c:choose>
                </div>
                
                <div class="col-md-8">
                    <div class="card-body p-4 p-lg-5">
                        <h1 class="fw-bold display-5 mb-2">${movie.title}</h1>
                        
                        <div class="mb-4">
                            <span class="badge bg-warning text-dark fs-6 me-2">★ ${movie.rating}</span>
                            <span class="badge bg-secondary fs-6 me-2">${movie.genre}</span>
                            <span class="text-muted ms-2">${movie.releaseDate} | ${movie.duration} min</span>
                        </div>

                        <h5 class="fw-bold">Synopsis</h5>
                        <p class="card-text text-secondary mb-4" style="line-height: 1.8;">${movie.synopsis}</p>

                        <div class="row mb-4">
                            <div class="col-6">
                                <h6 class="fw-bold">Director</h6>
                                <p>${movie.director}</p>
                            </div>
                            <div class="col-6">
                                <h6 class="fw-bold">Actors</h6>
                                <p>${movie.actors}</p>
                            </div>
                        </div>

                        <div class="d-flex gap-2 mt-4 border-top pt-4">
                            <form action="FavoriteServlet" method="POST">
                                <input type="hidden" name="movieId" value="${movie.id}">
                                
                                <c:choose>
                                    <c:when test="${isFavorite}">
                                        <input type="hidden" name="action" value="remove">
                                        <button type="submit" class="btn btn-danger px-4">
                                            <i class="bi bi-heart-fill"></i> Remove from Favorites
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="hidden" name="action" value="add">
                                        <button type="submit" class="btn btn-outline-danger px-4">
                                            <i class="bi bi-heart"></i> Add to Favorites
                                        </button>
                                    </c:otherwise>
                                </c:choose>
                            </form>
                            
                            </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-5">
            
            <div class="col-md-5">
                <div class="card shadow-sm border-0">
                    <div class="card-body p-4">
                        <h4 class="fw-bold mb-3">Leave a Review</h4>
                        
                        <c:choose>
                            <c:when test="${not empty sessionScope.user}">
                                <form action="submitReview" method="POST">
                                    <input type="hidden" name="movieId" value="${movie.id}">
                                    
                                    <div class="mb-3">
                                        <label for="rating" class="form-label">Rating (1-5)</label>
                                        <select name="rating" id="rating" class="form-select" required>
                                            <option value="">Choose a rating</option>
                                            <option value="1">1 Star</option>
                                            <option value="2">2 Stars</option>
                                            <option value="3">3 Stars</option>
                                            <option value="4">4 Stars</option>
                                            <option value="5">5 Stars</option>
                                        </select>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="comment" class="form-label">Comment</label>
                                        <textarea name="comment" id="comment" rows="4" class="form-control" placeholder="Write your review..." required></textarea>
                                    </div>
                                    
                                    <button type="submit" class="btn btn-primary w-100">Submit Review</button>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <div class="alert alert-info text-center">
                                    Please <a href="login.jsp" class="fw-bold text-decoration-none">login</a> to leave a review.
                                </div>
                            </c:otherwise>
                        </c:choose>
                        
                    </div>
                </div>
            </div>

            <div class="col-md-7">
                <h4 class="fw-bold mb-3">User Reviews</h4>
                
                <c:choose>
                    <c:when test="${not empty reviewList}">
                        <c:forEach var="review" items="${reviewList}">
                            <div class="card shadow-sm border-0 mb-3">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <h6 class="fw-bold mb-0">${review.username}</h6>
                                        <span class="text-warning fw-bold">★ ${review.rating}/5</span>
                                    </div>
                                    <p class="mb-0 mt-2 text-secondary">${review.comment}</p>
                                    <small class="text-muted mt-2 d-block">${review.date}</small>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="card shadow-sm border-0">
                            <div class="card-body text-center text-muted py-5">
                                <i class="bi bi-chat-square-text fs-1 mb-3 d-block"></i>
                                <p class="mb-0">No reviews yet. Be the first to review this movie!</p>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            
        </div>

    </main>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>