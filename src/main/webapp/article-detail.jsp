<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>${article.title} - NeoFilm</title>
    <%@ include file="includes/head.jsp" %>
</head>
<body class="bg-light d-flex flex-column min-vh-100">

    <%@ include file="includes/navbar.jsp" %>

    <main class="container my-5 flex-grow-1">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                
                <a href="${pageContext.request.contextPath}/articles" class="text-decoration-none mb-3 d-inline-block">
                    &larr; Back to Articles
                </a>

                <article class="bg-white p-5 rounded shadow-sm">
                    <h1 class="fw-bold display-5 mb-3">${article.title}</h1>
                    
                    <div class="text-muted mb-4 pb-3 border-bottom">
                        <i class="bi bi-calendar3 me-2"></i> ${article.createdAt}
                    </div>
                    
                    <div class="article-content" style="line-height: 1.8; font-size: 1.1rem; color: #333;">
                        <p style="white-space: pre-wrap;">${article.content}</p>
                    </div>
                </article>

            </div>
        </div>
    </main>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>