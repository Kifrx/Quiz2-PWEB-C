<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Articles - NeoFilm</title>
    <%@ include file="includes/head.jsp" %>
</head>
<body class="bg-light d-flex flex-column min-vh-100">

    <%@ include file="includes/navbar.jsp" %>

    <main class="container my-5 flex-grow-1">
        <h2 class="mb-4 fw-bold border-start border-4 border-primary ps-3">Latest Articles</h2>

        <div class="row g-4">
            <c:choose>
                <c:when test="${not empty articles}">
                    <c:forEach var="article" items="${articles}">
                        <div class="col-md-6 col-lg-4">
                            <div class="card h-100 shadow-sm border-0 hover-shadow transition">
                                <div class="card-body">
                                    <h5 class="card-title fw-bold text-primary">${article.title}</h5>
                                    <h6 class="card-subtitle mb-2 text-muted small">
                                        <i class="bi bi-calendar-event me-1"></i> ${article.createdAt}
                                    </h6>
                                    
                                    <p class="card-text text-secondary">
                                        <c:out value="${article.content.length() > 100 ? article.content.substring(0, 100) : article.content}" />...
                                    </p>
                                    
                                    <a href="article-detail?id=${article.id}" class="btn btn-outline-primary btn-sm mt-2">Read More</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                
                <c:otherwise>
                    <div class="col-12 text-center py-5">
                        <div class="text-muted mb-3">
                            <i class="bi bi-journal-x display-1"></i>
                        </div>
                        <h3>No articles found.</h3>
                        <p>Check back later for updates!</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </main>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>