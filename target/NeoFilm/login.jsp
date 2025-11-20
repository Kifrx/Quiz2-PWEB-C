<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - NeoFilm</title>
    <%@ include file="includes/head.jsp" %>
</head>
<body class="bg-light d-flex flex-column min-vh-100">

    <%@ include file="includes/navbar.jsp" %>
    <%@ include file="includes/sidebar-user.jsp" %>

    <div class="container my-auto">
        <div class="row justify-content-center pt-4 pb-5">
            <div class="col-md-5 col-lg-4"> 
                <div class="card shadow-sm border-0">
                    <div class="card-body p-4">
                        <h4 class="fw-bold text-center mb-4">Welcome Back</h4>
                        
                        <form action="LoginServlet" method="POST"> 
                            <div class="mb-3">
                                <label class="form-label">Email Address</label>
                                <input type="email" name="email" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input type="password" name="password" class="form-control" required>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">Log In</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="text-center mt-4">
                    <p class="text-muted">Don't have an account? 
                        <a href="register.jsp" class="text-decoration-none">Register</a>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>