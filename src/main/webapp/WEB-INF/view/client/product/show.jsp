<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

            <body>
                <!-- Spinner Start -->
                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>
                <!-- Spinner End -->

                <!-- Navbar start -->
                <jsp:include page="../layout/header.jsp" />
                <!-- Navbar End -->

                <!-- banner-->
                <jsp:include page="../layout/banner.jsp" />
                <!-- Laptop Shop Start-->
                <div class="container-fluid fruite py-5">
                    <div class="container py-5">
                        <div class="tab-class text-center">
                            <div class="row g-4">
                                <div class="col-lg-4 text-start">
                                    <h5>
                                        <a href="/">Home/</a>
                                        <a href="/product">Danh Sách Sản Phẩm</a>
                                    </h5>
                                </div>
                                <div class="col-lg-8 text-end">
                                    <ul class="nav nav-pills d-inline-flex text-center mb-5">
                                    </ul>
                                </div>
                            </div>
                            <div class="row g-4 fruite">
                                <div class="col-12 col-md-4">
                                    <h4 class="text-center">Danh Mục Sản Phẩm</h4>
                                    <div class="row mb-2"></div>
                                    <h6 class="text-start">Thương hiệu</h6>
                                    <div class="row mb-1" id="factoryFilter">
                                        <div class="col-md-3">
                                            <div class="form-check text-start">
                                                <input class="form-check-input" type="checkbox" value="LENOVO"
                                                    id="flexCheckDefault11">
                                                <label class="form-check-label">Lenovo</label>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-check text-start">
                                                <input class="form-check-input" type="checkbox" value="APPLE"
                                                    id="flexCheckChecked12">
                                                <label class="form-check-label">Macbook</label>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-check text-start">
                                                <input class="form-check-input" type="checkbox" value="ASUS"
                                                    id="flexCheckDefault13">
                                                <label class="form-check-label">ASUS</label>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-check text-start">
                                                <input class="form-check-input" type="checkbox" value="ACER"
                                                    id="flexCheckChecked14">
                                                <label class="form-check-label">Acer</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-1">
                                        <div class="col-md-3">
                                            <div class="form-check text-start">
                                                <input class="form-check-input" type="checkbox" value="HP"
                                                    id="flexCheckDefault15">
                                                <label class="form-check-label">HP</label>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-check text-start">
                                                <input class="form-check-input" type="checkbox" value="DELL"
                                                    id="flexCheckChecked16">
                                                <label class="form-check-label">DELL</label>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-check text-start">
                                                <input class="form-check-input" type="checkbox" value="LG"
                                                    id="flexCheckDefault17">
                                                <label class="form-check-label">LG</label>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-check text-start">
                                                <input class="form-check-input" type="checkbox" value="MSI"
                                                    id="flexCheckChecked18">
                                                <label class="form-check-label">MSI</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2"></div>
                                    <h6 class="text-start">Mục đích sử dụng</h6>
                                    <div class="row mb-1" id="targetFilter">
                                        <div class="row mb-1">
                                            <div class="col-md-3">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="GAMING"
                                                        id="flexCheckDefault19">
                                                    <label class="form-check-label">Gaming</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox"
                                                        value="SINHVIEN-VANPHONG" id="flexCheckChecked20">
                                                    <label class="form-check-label">Sinh
                                                        viên-văn phòng</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-1">
                                        </div>
                                        <div class="row mb-1">
                                            <div class="col-md-5">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox"
                                                        value="THIET-KE-DO-HOA" id="flexCheckDefault21">
                                                    <label class="form-check-label">Đồ họa-thiết
                                                        kế</label>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="MONG-NHE"
                                                        id="flexCheckChecked22">
                                                    <label class="form-check-label">Mỏng
                                                        nhẹ</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-1">
                                            <div class="col-md-4">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="DOANH-NHAN"
                                                        id="flexCheckDefault23">
                                                    <label class="form-check-label">Doanh
                                                        nhân</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2"></div>
                                    <h6 class="text-start">Mức giá</h6>
                                    <div class="row mb-1" id="priceFilter">
                                        <div class="row mb-1">
                                            <div class="col-md-5">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox"
                                                        value="duoi-10-trieu" id="flexCheckDefault24">
                                                    <label class="form-check-label">Dưới 10
                                                        triệu</label>
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox"
                                                        value="10-toi-15-trieu" id="flexCheckChecked25">
                                                    <label class="form-check-label">Từ 10 - 15
                                                        triệu</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-1">
                                            <div class="col-md-5">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox"
                                                        value="15-toi-20-trieu" id="flexCheckDefault26">
                                                    <label class="form-check-label">Từ 15 - 20
                                                        triệu</label>
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox"
                                                        value="tren-20-trieu" id="flexCheckChecked27">
                                                    <label class="form-check-label">Trên 20
                                                        triệu</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2"></div>
                                    <h6 class="text-start">Sắp xếp</h6>
                                    <div class="row mb-1" id="sortFilter">
                                        <div class="col-md-6">
                                            <div class="form-check">
                                                <input value="gia-tang-dan" class="form-check-input" type="radio"
                                                    name="flexRadioDefault" id="flexRadioDefault1">
                                                <label class="form-check-label">Sắp xếp tăng
                                                    dần</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-check">
                                                <input value="gia-giam-dan" class="form-check-input" type="radio"
                                                    name="flexRadioDefault" id="flexRadioDefault2">
                                                <label class="form-check-label">Sắp xếp giảm
                                                    dần</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-1">
                                        <div class="col-md-6">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" checked
                                                    name="flexRadioDefault" id="flexRadioDefault3">
                                                <label class="form-check-label">Không sắp
                                                    xếp</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-2"></div>
                                        <div class="col-8">
                                            <button id="btnFilter"
                                                class="btn border border-secondary text-primary rounded-pill px-4 py-3">Lọc
                                                sản phẩm</button>
                                        </div>
                                        <div class="col-2"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-8 text-center">
                                    <div class="tab-content">
                                        <div id="tab-1" class="tab-pane fade show p-0 active">
                                            <div class="row g-4">
                                                <div class="col-lg-12">
                                                    <div class="row g-4">
                                                        <c:if test="${totalPages == 0}">
                                                            <div>Không tìm thấy sản phẩm</div>
                                                        </c:if>
                                                        <c:forEach var="product" items="${products}">
                                                            <div class="col-md-6 col-lg-4 col-xl-3">
                                                                <div class="rounded position-relative fruite-item">
                                                                    <div class="fruite-img">
                                                                        <img src="/images/product/${product.image}"
                                                                            class="img-fluid w-100 rounded-top" alt="">
                                                                    </div>
                                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                        style="top: 10px; left: 10px;">Gamming</div>
                                                                    <div
                                                                        class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                        <h4 style="font-size: 15px;">
                                                                            <a
                                                                                href="/product/${product.id}">${product.name}</a>
                                                                        </h4>
                                                                        <p style="font-size: 13px;">${product.shortDesc}
                                                                        </p>
                                                                        <div
                                                                            class="d-flex flex-lg-wrap justify-content-center flex-column">
                                                                            <p style="font-size: 15px; text-align: center; width: 100%"
                                                                                class="text-dark fw-bold mb-3">
                                                                                <fmt:formatNumber type="number"
                                                                                    value="${product.price}" /> đ
                                                                            </p>
                                                                            <form
                                                                                action="/add-product-to-cart/${product.id}"
                                                                                method="post">
                                                                                <input type="hidden"
                                                                                    name="${_csrf.parameterName}"
                                                                                    value="${_csrf.token}" />
                                                                                <button
                                                                                    class="mx-auto btn border border-secondary rounded-pill px-3 text-primary">
                                                                                    <i
                                                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                                    Add to cart
                                                                                </button>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--Page-->
                            <div class="col-12">
                                <div class="pagination d-flex justify-content-center mt-5">
                                    <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                        href="/product?page=${currentPage - 1}${queryString}" aria-label="Previous">
                                        <span aria-hidden="true">Previous</span>
                                    </a>
                                    <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                        <li class="page-item">
                                            <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                                href="/product?page=${loop.index + 1}${queryString}">
                                                ${loop.index + 1}
                                            </a>
                                        </li>
                                    </c:forEach>
                                    <a class="${currentPage eq totalPages ? 'disabled page-link' : 'page-link'}"
                                        href="/product?page=${currentPage + 1}${queryString}" aria-label="Next">
                                        <span aria-hidden="true">Next</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Laptop Shop End-->
                <!--feature-->
                <jsp:include page="../layout/feature.jsp" />
                <!--footer-->
                <jsp:include page="../layout/footer.jsp" />
                <!-- Copyright Start -->
                <div class="container-fluid copyright bg-dark py-4">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                                <span class="text-light"><a href="#"><i
                                            class="fas fa-copyright text-light me-2"></i>Your Site Name</a>, All right
                                    reserved.</span>
                            </div>
                            <div class="col-md-6 my-auto text-center text-md-end text-white">
                                <!--/*** This template is free as long as you keep the below author’s credit link/attribution link/backlink. ***/-->
                                <!--/*** If you'd like to use the template without the below author’s credit link/attribution link/backlink, ***/-->
                                <!--/*** you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". ***/-->
                                Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Copyright End -->
                <!-- Back to Top -->
                <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                        class="fa fa-arrow-up"></i></a>
                <!-- JavaScript Libraries -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/client/lib/easing/easing.min.js"></script>
                <script src="/client/lib/waypoints/waypoints.min.js"></script>
                <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
                <!-- Template Javascript -->
                <script src="/client/js/main.js"></script> <!-- client == webapp/resources-->
            </body>

            </html>