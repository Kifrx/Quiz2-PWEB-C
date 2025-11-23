<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catalog Management - NeoFilm Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    
    <style>
      
        .sidebar {
            min-height: 100vh;
            background-color: #212529; 
        }
        .sidebar a {
            color: #fff;
            text-decoration: none;
            display: block;
            padding: 10px 15px;
        }
        .sidebar a:hover {
            background-color: #343a40;
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        
        <nav class="col-md-2 d-none d-md-block sidebar p-3">
            <h3 class="text-white mb-4">NeoFilm Admin</h3>
            <ul class="nav flex-column">
                <li class="nav-item mb-2">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/admin/movies">
                        Movie Management
                    </a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/articles">
                        Article Management
                    </a>
                </li>
            </ul>
            
            <div class="mt-5 pt-5 border-top border-secondary">
                <a href="${pageContext.request.contextPath}/index.jsp" class="text-white-50 small">
                    &larr; Back to Site
                </a>
            </div>
        </nav>

        <main class="col-md-10 ms-sm-auto px-md-5 py-4 bg-light">
            
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="h2">Catalog Management</h1>
                <a href="${pageContext.request.contextPath}/admin/movie-form.jsp" class="btn btn-primary">
                    <i class="bi bi-plus-lg"></i> Add New Movie
                </a>
            </div>

            <c:if test="${not empty sessionScope.success}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    ${sessionScope.success}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    <c:remove var="success" scope="session"/>
                </div>
            </c:if>

            <div class="card shadow-sm border-0">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Title</th>
                                    <th scope="col">Release Date</th>
                                    <th scope="col">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty movies}">
                                        <c:forEach var="movie" items="${movies}" varStatus="status">
                                            <tr>
                                                <th scope="row">${status.count}</th>
                                                <td>${movie.title}</td>
                                                <td>${movie.releaseDate}</td>
                                                <td>
                                                    <a href="editMovie?id=${movie.id}" class="btn btn-warning btn-sm text-dark me-1">
                                                        <i class="bi bi-pencil"></i> Edit
                                                    </a>
                                                    
                                                    <form action="deleteMovie" method="post" class="d-inline" onsubmit="return confirm('Are you sure you want to delete this movie?');">
                                                        <input type="hidden" name="id" value="${movie.id}">
                                                        <button type="submit" class="btn btn-danger btn-sm">
                                                            <i class="bi bi-trash"></i> Delete
                                                        </button>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="4" class="text-center text-muted p-4">
                                                No movies found. Click "Add New Movie" to add movies.
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>