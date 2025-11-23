<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Article Management - NeoFilm Admin</title>
    <%@ include file="../includes/head.jsp" %>
</head>
<body>

    <div class="d-flex flex-column flex-md-row" style="min-height: 100vh;">
        
        <%@ include file="../includes/sidebar-admin.jsp" %>

        <main class="flex-grow-1 bg-light p-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="fw-bold">Article Management</h2>
                <a href="article-form.jsp" class="btn btn-primary">
                    <i class="bi bi-plus-lg"></i> Add New Article
                </a>
            </div>

             <div class="card shadow-sm border-0">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>#</th>
                                    <th>Title</th>
                                    <th>Date Created</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty articles}">
                                        <c:forEach var="article" items="${articles}" varStatus="status">
                                            <tr>
                                                <td>${status.count}</td>
                                                <td class="fw-bold">${article.title}</td>
                                                <td>${article.createdAt}</td>
                                                <td>
                                                    <a href="article-form.jsp?id=${article.id}" class="btn btn-sm btn-warning me-1">
                                                        <i class="bi bi-pencil"></i> Edit
                                                    </a>
                                                    
                                                    <a href="${pageContext.request.contextPath}/deleteArticle?id=${article.id}" 
                                                       class="btn btn-sm btn-danger"
                                                       onclick="return confirm('Are you sure you want to delete this article?')">
                                                        <i class="bi bi-trash"></i> Delete
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="4" class="text-center py-4 text-muted">
                                                No articles found. Click "Add New Article" to create one.
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>