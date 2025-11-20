<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
    <title>Admin Movie - NeoFilm</title>
 
    <%@ include file="../includes/head.jsp" %>
</head>
<body>

    <div class="d-flex flex-column flex-md-row">
        

        <%@ include file="../includes/sidebar-admin.jsp" %>

        <main class="flex-grow-1 bg-light p-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="fw-bold">Movie Management</h2>
                
               
                <a href="${pageContext.request.contextPath}/admin/movie-form.jsp" class="btn btn-primary">Add New Movie</a>
            </div>

            <div class="card shadow-sm border-0">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>Genre</th>
                                    <th>Date</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                               
                                <c:forEach var="movie" items="${listMovies}">
                                <tr>
                                    <td>${movie.title}</td>
                                    <td>${movie.genre}</td>
                                    <td>${movie.releaseDate}</td>
                                    <td>
    <a href="${pageContext.request.contextPath}/MovieServlet?action=edit&id=${movie.id}" 
       class="btn btn-sm btn-warning">Edit</a>
    
    <a href="${pageContext.request.contextPath}/MovieServlet?action=delete&id=${movie.id}" 
       class="btn btn-sm btn-danger" 
       onclick="return confirm('Are you sure you want to delete this movie?');">Delete</a>
</td>
                                </tr>
                                </c:forEach>
                                
                                <c:if test="${empty listMovies}">
                                <tr>
                                    <td colspan="4" class="text-center text-muted">No movies found.</td>
                                </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>