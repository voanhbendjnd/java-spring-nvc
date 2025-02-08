<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html>

                <head>

                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                </head>

                <body class="bg-primary">

                    <div id="layoutAuthentication">
                        <div id="layoutAuthentication_content">
                            <main>
                                <div class="container">
                                    <div class="row justify-content-center">
                                        <div class="col-lg-7">
                                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                                <div class="card-header">
                                                    <h3 class="text-center font-weight-light my-4">Create Account</h3>
                                                </div>
                                                <div class="card-body">
                                                    <form:form action="/registerPost" method="post"
                                                        modelAttribute="registerUser">
                                                        <c:set var="errorPassword">
                                                            <form:errors cssClass="invalid-feedback"
                                                                path="confirmPassword" />
                                                        </c:set>
                                                        <c:set var="errorEmail">
                                                            <form:errors cssClass="invalid-feedback" path="email" />
                                                        </c:set>
                                                        <c:set var="errorFirstName">
                                                            <form:errors cssClass="invalid-feedback" path="firstName" />
                                                        </c:set>
                                                        <div class="row mb-3">
                                                            <div class="col-md-6">
                                                                <div class="form-floating mb-3 mb-md-0">
                                                                    <form:input
                                                                        class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                                        type="text" path="firstName"
                                                                        placeholder="Enter your first name" />
                                                                    <label for="inputFirstName">First name</label>
                                                                    ${errorFirstName}
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-floating">
                                                                    <form:input class="form-control" path="lastName"
                                                                        type="text"
                                                                        placeholder="Enter your last name" />
                                                                    <label for="inputLastName">Last name</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-floating mb-3">
                                                            <form:input
                                                                class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                                path="email" type="email"
                                                                placeholder="name@example.com" />
                                                            <label for="inputEmail">Email address</label>
                                                            ${errorEmail}
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-md-6">
                                                                <div class="form-floating mb-3 mb-md-0">
                                                                    <form:input class="form-control" path="password"
                                                                        type="password"
                                                                        placeholder="Create a password" />
                                                                    <label for="inputPassword">Password</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-floating mb-3 mb-md-0">
                                                                    <form:input
                                                                        class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                                        path="confirmPassword" type="password"
                                                                        placeholder="Confirm password" />
                                                                    <label for="inputPasswordConfirm">Confirm
                                                                        Password</label>
                                                                    ${errorPassword}
                                                                    <form:errors path="confirmPassword" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mt-4 mb-0">
                                                            <div class="d-grid"><button
                                                                    class="btn btn-primary btn-block">Create
                                                                    Account</button>
                                                            </div>
                                                        </div>
                                                    </form:form>
                                                </div>
                                                <div class="card-footer text-center py-3">
                                                    <div class="small"><a>Have an account? Go to
                                                            login</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </main>
                        </div>

                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/js/scripts.js"></script>
                </body>

                </html>