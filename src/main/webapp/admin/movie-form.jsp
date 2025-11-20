<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>${movie != null ? 'Edit Movie' : 'Add New Movie'} - Admin</title>
    <%@ include file="../includes/head.jsp" %>
</head>
<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
        <div class="container">
            <span class="navbar-brand mb-0 h1 fw-bold">NeoFilm Admin</span>
            <a href="${pageContext.request.contextPath}/MovieServlet" class="btn btn-outline-light btn-sm">Back to List</a>
        </div>
    </nav>

    <div class="container mb-5 mt-4">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                
                <h2 class="mb-4">${movie != null ? 'Edit Movie' : 'Add New Movie'}</h2>

                <div class="card shadow-sm border-0">
                    <div class="card-body p-4">
                        
                        <form action="${pageContext.request.contextPath}/MovieServlet" method="POST">
                            
                            <input type="hidden" name="id" value="${movie != null ? movie.id : ''}">

                            <h5 class="text-primary fw-bold mb-3">Movie Info</h5>
                            <div class="mb-3">
                                <label class="form-label">Title</label>
                                <input type="text" name="title" class="form-control" 
                                       value="${movie != null ? movie.title : ''}" required>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Release Date</label>
                                    <input type="date" name="releaseDate" class="form-control" 
                                           value="${movie != null ? movie.releaseDate : ''}" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Initial Rating (0-10)</label>
                                    <input type="number" name="rating" step="0.1" max="10" class="form-control" 
                                           value="${movie != null ? movie.rating : ''}" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Duration (Minutes)</label>
                                    <input type="number" name="duration" class="form-control" 
                                           value="${movie != null ? movie.duration : ''}" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Genre</label>
                                    <input type="text" name="genre" class="form-control" placeholder="e.g. Action, Horror" 
                                           value="${movie != null ? movie.genre : ''}" required>
                                </div>
                            </div>

                            <hr class="my-4">
                            <h5 class="text-primary fw-bold mb-3">Crew & Cast</h5>
                            <div class="mb-3">
                                <label class="form-label">Director</label>
                                <input type="text" name="director" class="form-control" 
                                       value="${movie != null ? movie.director : ''}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Actors</label>
                                <input type="text" name="actors" class="form-control" placeholder="Separate with comma" 
                                       value="${movie != null ? movie.actors : ''}" required>
                            </div>

                            <hr class="my-4">
                            <h5 class="text-primary fw-bold mb-3">Details & Visuals</h5>
                            <div class="mb-3">
                                <label class="form-label">Synopsis</label>
                                <textarea name="synopsis" class="form-control" rows="4" required>${movie != null ? movie.synopsis : ''}</textarea>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label">Poster Image URL (Online)</label>
                                <input type="text" name="posterUrl" class="form-control" placeholder="https://..." 
                                       value="${movie != null ? movie.posterUrl : ''}" required>
                                <small class="text-muted">Masukkan URL gambar online (misalnya dari Wikipedia, TMDb).</small>
                            </div>
                            
                            <div class="d-flex justify-content-end gap-2 mt-4">
                                <a href="${pageContext.request.contextPath}/MovieServlet" class="btn btn-secondary">Cancel</a>
                                <button type="submit" class="btn btn-success">
                                    ${movie != null ? 'Update Movie' : 'Save Movie'}
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>