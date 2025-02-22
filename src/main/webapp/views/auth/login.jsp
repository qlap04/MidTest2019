<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/auth/login.css"/>
    <title>Login</title>
</head>
<body>
<section class="vh-100">
    <div class="container py-5 h-100">
        <div class="row d-flex align-items-center justify-content-center h-100">
            <div class="col-md-8 col-lg-7 col-xl-6">
                <img
                        src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"
                        class="img-fluid"
                        alt="Phone image"
                />
            </div>
            <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
                <form action="login" method="POST">
                    <!-- Email input with floating label -->
                    <div class="form-outline form-label-floating mb-4">
                        <input
                                type="text"
                                id="username"
                                name="username"
                                class="form-control form-control-lg"
                                placeholder=""
                                required
                        />
                        <label for="username">Email address or username</label>
                    </div>

                    <!-- Password input with floating label -->
                    <div class="form-outline form-label-floating mb-4">
                        <input
                                type="password"
                                id="password"
                                name="password"
                                class="form-control form-control-lg"
                                placeholder=""
                                required
                        />
                        <label for="password">Password</label>
                    </div>

                    <div class="d-flex justify-content-around align-items-center mb-4">
                        <!-- Checkbox -->
                        <div class="form-check">
                            <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="remember"
                                    name="remember"
                            />
                            <label class="form-check-label" for="remember">Remember me</label>
                        </div>
                        <a href="forgot-password">Forgot password?</a>
                    </div>

                    <!-- Submit button -->
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Log in</button>

                    <div class="divider d-flex align-items-center my-4">
                        <p class="text-center fw-bold mx-3 mb-0 text-muted">OR</p>
                    </div>

                    <!-- Social buttons -->
                    <a
                            href="#!"
                            role="button"
                            class="btn btn-primary btn-lg btn-block"
                            style="background-color: #3b5998"
                    >
                        <i class="fab fa-facebook-f me-2"></i>Continue with Facebook
                    </a>
                    <a
                            href="#!"
                            role="button"
                            class="btn btn-primary btn-lg btn-block"
                            style="background-color: #55acee"
                    >
                        <i class="fab fa-twitter me-2"></i>Continue with Twitter
                    </a>

                    <!-- Success or Alert Messages -->
                    <h5 class="text-success">
                        <%
                            Object success = request.getSession().getAttribute("success");
                            if (success != null) {
                                out.print(success);
                                request.getSession().removeAttribute("success");
                            }
                        %>
                    </h5>
                    <h5 class="text-danger">
                        <%
                            Object alert = request.getAttribute("alert");
                            if (alert != null) {
                                out.print(alert);
                            }
                        %>
                    </h5>
                </form>
                <p class="mt-4">Not registered? <a href="register">Create new account</a></p>
            </div>
        </div>
    </div>
</section>
</body>
</html>
