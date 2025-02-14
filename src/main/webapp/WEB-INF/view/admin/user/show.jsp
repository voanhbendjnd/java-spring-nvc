<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

      <html lang="en">

      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Table User</title>
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
                <h1 class="mt-4">Manager User</h1>
                <ol class="breadcrumb mb-4">
                  <a class="link" href="/admin">Dashboard/</a>
                  <a class="link" href="/admin/user">User</a>
                </ol>
                <div class="container mt-5">
                  <div class="row">
                    <div class="d-flex justify-content-between" style="font-family: 'Times New Roman', Times, serif;">
                      <div class="display-6">Table user
                      </div>
                      <div>
                        <a href="/admin/user/create" class="btn btn-primary">Create a user</a>
                      </div>
                    </div>
                    <hr />
                    <table class="table table-bordered">
                      <thead>
                        <tr>
                          <th scope="col">ID</th>
                          <th scope="col">Email</th>
                          <th scope="col">Full Name</th>
                          <th scope="col">Role</th>
                          <th scope="col">Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach var="user" items="${tableUser}"> <!-- id for table controller-->
                          <tr>
                            <th>${user.id}</th> <!-- chữ đậm hơn thì dùng thẻ th-->
                            <td>${user.email}</td>
                            <td>${user.fullName}</td>
                            <td>${user.role.name}</td>
                            <td>
                              <a href="/admin/user/${user.id}" class="btn btn-success">View</a>
                              <!-- thẻ a mặc định là method GET-->
                              <a href="/admin/user/update/${user.id}" class="btn btn-primary">Update</a>
                              <a href="/admin/user/delete/${user.id}" class="btn btn-danger">Delete</a>
                            </td>
                          </tr>
                        </c:forEach>


                      </tbody>
                    </table>
                    <nav aria-label="...">
                      <ul class="pagination justify-content-center">
                        <li class="page-item">
                          <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                            href="/admin/user?page=${currentPage - 1}" aria-label="Previous">
                            <span aria-hidden="true">
                              Previous
                            </span>
                          </a>

                        </li>
                        <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                          <li class="page-item">
                            <a class="${(loop.index + 1)eq currentPage ? 'active page-link' : 'page-link'} "
                              href="/admin/user?page=${loop.index + 1}">
                              ${loop.index +1}

                            </a>
                          </li>
                        </c:forEach>
                        <li class="page-item">
                          <a class="${currentPage eq totalPages ? 'disabled page-link' : 'page-link'}"
                            href="/admin/user?page=${currentPage + 1}" aria-label="Previous">
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