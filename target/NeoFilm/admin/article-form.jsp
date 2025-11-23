<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${not empty article ? 'Edit Article' : 'Add New Article'} - NeoFilm Admin</title>
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
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/movies">
                        Movie Management
                    </a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link active bg-secondary rounded" href="${pageContext.request.contextPath}/admin/articles">
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
            
            <h1 class="h2 mb-4">
                <c:choose>
                    <c:when test="${not empty article}">Edit Article</c:when>
                    <c:otherwise>Add New Article</c:otherwise>
                </c:choose>
            </h1>

            <div class="card shadow-sm border-0">
                <div class="card-body">

                    <c:if test="${not empty errors}">
                        <div class="alert alert-danger">
                            <strong>Whoops!</strong> There were some problems with your input.
                            <ul class="mt-2 mb-0">
                                <c:forEach var="error" items="${errors}">
                                    <li>${error}</li>
                                </c:forEach>
                            </ul>
                        </div>
                    </c:if>
                    
                    <form action="${pageContext.request.contextPath}/saveArticle" method="POST">
                        
                        <input type="hidden" name="id" value="${article.id}">

                        <div class="mb-3">
                            <label for="title" class="form-label fw-bold">Article Title</label>
                            <input type="text" class="form-control" id="title" name="title" 
                                   value="${article.title}" required>
                        </div>

                        <div class="mb-3">
                            <label for="content" class="form-label fw-bold">Content</label>
                            <textarea class="form-control" id="content" name="content" rows="10" required>${article.content}</textarea>
                        </div>
                        
                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-success px-4">
                                <c:choose>
                                    <c:when test="${not empty article}">Update Article</c:when>
                                    <c:otherwise>Save Article</c:otherwise>
                                </c:choose>
                            </button>
                            
                            <a href="${pageContext.request.contextPath}/admin/articles" class="btn btn-secondary">Cancel</a>
                        </div>

                    </form>
                </div>
            </div>

        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>