<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <!-- // jquery -->
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <!--update picturepicture-->
                <script>
                    $(document).ready(function () {
                        const avatarFile = $("#productFile");
                        const orgImage = "${updateProduct.image}";
                        if (orgImage) { // update
                            const urlImage = "/images/product/" + orgImage;
                            $("#productPreview").attr("src", urlImage);
                            $("#productPreview").css("display", "block");
                        }
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#productPreview").attr("src", imgURL);
                            $("#productPreview").css("display", "block");
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
                                    <a class="link" href="/admin/product">Products</a>
                                </ol>
                                <!-- <div class="row"> -->
                                <div class="col-md-6 col-12 mx-auto">
                                    <h3>Create a products</h3>
                                    <hr />
                                    <form:form method="post" enctype="multipart/form-data"
                                        action="/admin/product/update" modelAttribute="updateProduct">
                                        <div class="row">
                                            <label class="form-label" style="display: none;">Id</label>
                                            <form:input path="id" class="form-control" type="text"
                                                style="display: none;" />
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <c:set var="errorName">
                                                    <form:errors cssClass="invalid-feedback" path="name" />
                                                </c:set>

                                                <label class="form-label">Name:</label>
                                                <form:input type="text"
                                                    class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                                                    path="name" />
                                                ${errorName}
                                            </div>
                                            <div class="col">
                                                <label class="form-label">Price:</label>
                                                <form:input type="number" class="form-control" path="price" />
                                            </div>
                                        </div>
                                        <div class="mb-3 col-12">
                                            <label class="form-label">Detail description:</label>
                                            <form:textarea type="text" class="form-control" path="detailDesc" />

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
                                                    <option>--Select--</option>
                                                    <form:option value="HP">Apple(MacBook)</form:option>
                                                    <form:option value="LENOVO">Lenovo</form:option>
                                                    <form:option value="ASUS">ASUS</form:option>
                                                    <form:option value="ACER">Acer</form:option>
                                                    <form:option value="DELL">DELL</form:option>
                                                    <form:option value="MSI">MSI</form:option>
                                                    <form:option value="SAMSUNG">Samsung</form:option>
                                                    <form:option value="LG">LG</form:option>
                                                </form:select>
                                            </div>
                                            <div class="col">
                                                <label class="form-label">Target:</label>
                                                <form:select class="form-select" path="target">
                                                    <option>--Select--</option>
                                                    <form:option value="GAMING">Gaming</form:option>
                                                    <form:option value="AI">Laptop AI</form:option>
                                                    <form:option value="HOCTAP_VANPHONG">Học tập, văn phòng
                                                    </form:option>
                                                    <form:option value="DOHOA">Đồ họa</form:option>
                                                    <form:option value="KYTHUAT">Kỹ thuật</form:option>
                                                    <form:option value="MONGMHE">Mỏng nhẹ</form:option>
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
                <!-- <script src="/client/js/scripts.js"></script> -->
                <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" -->
                <!-- crossorigin="anonymous"></script> -->
                <!-- <script src="js/chart-area-demo.js"></script>
                  <script src="js/chart-bar-demo.js"></script> -->
                <!-- <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                      crossorigin="anonymous"></script> -->
                <!-- <script src="js/datatables-simple-demo.js"></script> -->

            </body>

            </html>