<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <!-- // jquery -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <!--them anh-->
                <script>
                    $(document).ready(() => {
                        // #productFile là id
                        const avatarFile = $("#productFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#productPreview").attr("src", imgURL);
                            $("#productPreview").css({ "display": "block" });
                        });
                    });
                </script>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Create a product</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

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
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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
                                    <a class="link" href="/admin/user">Products</a>
                                </ol>
                                <!-- <div class="row"> -->
                                <div class="col-md-6 col-12 mx-auto">
                                    <h3>Create a products</h3>
                                    <hr />
                                    <form:form method="post" enctype="multipart/form-data"
                                        action="/admin/product/createPost" modelAttribute="newProduct">

                                        <div class="row">
                                            <div class="col">
                                                <label class="form-label">Name:</label>
                                                <form:input type="text" class="form-control" path="name" />
                                            </div>
                                            <div class="col">
                                                <label class="form-label">Price:</label>
                                                <form:input type="number" class="form-control" path="price" />
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Detail description:</label>
                                            <form:input class="form-control" path="detailDesc" type="text" />
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <label class="form-label">Short desciption:</label>
                                                <form:input path="shortDesc" type="text" class="form-control" />
                                            </div>
                                            <div class="col">
                                                <label class="form-label">Quantity:</label>
                                                <form:input class="form-control" path="quantity" type="number" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <label class="form-label">Factory:</label>
                                                <form:select class="form-select" path="factory">
                                                    <form:option value="Apple">Apple(MacBook)</form:option>
                                                    <form:option value="Lenovo">Lenovo</form:option>
                                                </form:select>
                                            </div>
                                            <div class="col">
                                                <label class="form-label">Target:</label>
                                                <form:select class="form-select" path="target">
                                                    <form:option value="gaming">Gaming</form:option>
                                                    <form:option value="van phong">Work</form:option>
                                                </form:select>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="mb-3 col-12 col-md-6">
                                                <label for="productFile" class="form-label">Image:</label>
                                                <input class="form-control" type="file" id="productFile"
                                                    name="productFile" accept=" .png, .jpg, .jpeg" />
                                            </div>
                                            <div class="mb-3 col-12">
                                                <img style="max-height: 250px; display: none;" alt="product preview"
                                                    id="productPreview" />
                                            </div>
                                        </div>
                                        <div class="mb-5 col-12">
                                            <button type="submit" class="btn btn-primary">Create</button>
                                        </div>

                                    </form:form>
                                </div>
                            </div>
                            <!-- </div> -->
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