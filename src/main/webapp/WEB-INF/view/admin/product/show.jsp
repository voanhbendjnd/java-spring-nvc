<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>Table Products</title>
                    <!-- Latest compiled and minified CSS -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet" />

                    <!-- Latest compiled JavaScript -->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                    <!-- <link href="/css/demo.css" rel="stylesheet"> -->
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="" />
                    <meta name="author" content="" />
                    <title>Dashboard - SB Admin</title>
                    <!-- <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" /> -->
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <!--side bar-->
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Manage Products</h1>
                                    <ol class="breadcrumb mb-4">
                                        <a class="link" href="/admin">Dashboard/</a>
                                        <a class="link" href="/admin/product">Product</a>
                                    </ol>
                                    <div class="container mt-5">
                                        <div class="row">
                                            <div class="d-flex justify-content-between"
                                                style="font-family: 'Times New Roman', Times, serif;">
                                                <div class="display-6">Table product
                                                </div>
                                                <div>
                                                    <a href="/admin/product/createNew" class="btn btn-primary">Create a
                                                        product</a>
                                                </div>
                                            </div>
                                            <hr />
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Price</th>
                                                        <th scope="col">Factory</th>
                                                        <th scope="col">Action</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="product" items="${tableProduct}">
                                                        <!-- id for table controller-->
                                                        <tr>
                                                            <th>${product.id}</th> <!-- chữ đậm hơn thì dùng thẻ thth-->
                                                            <td>${product.name}</td>
                                                            <td>
                                                                <fmt:formatNumber type="number"
                                                                    value="${product.price}" /> đ
                                                            </td>

                                                            <td>${product.factory}</td>

                                                            <td>
                                                                <a href="/admin/product/${product.id}"
                                                                    class="btn btn-success">View</a>
                                                                <!-- thẻ a mặc định là method GET-->
                                                                <a href="/admin/product/update/${product.id}"
                                                                    class="btn btn-primary">Update</a>
                                                                <a href="/admin/product/delete/${product.id}"
                                                                    class="btn btn-danger">Delete</a>
                                                            </td>

                                                        </tr>
                                                    </c:forEach>


                                                </tbody>
                                            </table>
                                            <nav aria-label="...">
                                                <ul class="pagination justify-content-center">
                                                    <li class="page-item">
                                                        <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                            href="/admin/product?page=${currentPage - 1}"
                                                            aria-label="Previous">
                                                            <span aria-hidden="true">
                                                                Previous
                                                            </span>
                                                        </a>

                                                    </li>
                                                    <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                                        <li class="page-item">
                                                            <a class="${(loop.index + 1)eq currentPage ? 'active page-link' : 'page-link'} "
                                                                href="/admin/product?page=${loop.index + 1}">
                                                                ${loop.index +1}

                                                            </a>
                                                        </li>
                                                    </c:forEach>
                                                    <li class="page-item">
                                                        <a class="${currentPage eq totalPages ? 'disabled page-link' : 'page-link'}"
                                                            href="/admin/product?page=${currentPage + 1}"
                                                            aria-label="Previous">
                                                            <span aria-hidden="true">
                                                                Next
                                                            </span>
                                                        </a>

                                                    </li>
                                                </ul>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </main>
                            <jsp:include page="../layout/footer.jsp" />
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="js/scripts.js"></script>
                    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" -->
                    <!-- crossorigin="anonymous"></script> -->
                    <!-- <script src="js/chart-area-demo.js"></script>
                  <script src="js/chart-bar-demo.js"></script> -->
                    <!-- <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                      crossorigin="anonymous"></script> -->
                    <!-- <script src="js/datatables-simple-demo.js"></script> -->
                </body>

                </html>