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
            // #avatarFile là id
            const avatarFile = $("#avatarFile");
            avatarFile.change(function (e) {
              const imgURL = URL.createObjectURL(e.target.files[0]);
              $("#avatarPreview").attr("src", imgURL);
              $("#avatarPreview").css({ "display": "block" });
            });
          });
        </script>
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
                <h1 class="mt-4">Manage Users</h1>
                <ol class="breadcrumb mb-4">
                  <a class="link" href="/admin">Dashboard/</a>
                  <a class="link" href="/admin/user">Users</a>
                </ol>
                <!-- <div class="row"> -->
                <div class="col-md-6 col-12 mx-auto">
                  <h3>Create a user</h3>
                  <hr />
                  <form:form method="post" enctype="multipart/form-data" action="/admin/user/create"
                    modelAttribute="newUser">
                    <!-- <div class="mb-3">
                      <label class="form-label">Email:</label>
                      <form:input type="email" class="form-control" path="email" />
                    </div>
                    <div class="mb-3">
                      <label class="form-label">Password:</label>
                      <form:input type="password" class="form-control" path="password" />
                    </div> -->
                    <div class="row">
                      <div class="col">
                        <c:set var="errorEmail">
                          <form:errors path="email" cssClass="invalid-feedback" />
                        </c:set>
                        <label class="form-label">Email:</label>
                        <form:input type="email" class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                          path="email" />
                        ${errorEmail}

                      </div>
                      <div class="col">
                        <!-- <c:set var="errorPassword">
                          <form:errors path="password" cssClass="invalid-feedback" />
                        </c:set> -->
                        <label class="form-label">Password</label>
                        <form:input type="password" class="form-control" path="password" />
                        <!-- ${errorPassword}-->

                      </div>
                    </div>
                    <div class="row">
                      <div class="col">
                        <c:set var="errorName">
                          <form:errors path="fullName" cssClass="invalid-feedback" />
                        </c:set>
                        <label class="form-label">Full Name</label>
                        <form:input path="fullName" type="text"
                          class="form-control ${not empty errorName ? 'is-invalid' : ''}" />
                        ${errorName}
                      </div>
                      <div class="col">
                        <label class="form-label">Phone Number</label>
                        <form:input class="form-control" path="phone" type="text" />
                      </div>
                    </div>
                    <div class="mb-3">
                      <label class="form-label">Address:</label>
                      <form:input type="text" class="form-control" path="address" />
                    </div>
                    <div class="row">
                      <div class="col">
                        <label class="form-label">Role</label>
                        <form:select class="form-select" path="role.name">
                          <option>--Select--</option>
                          <form:option value="ADMIN">ADMIN</form:option>
                          <form:option value="USER">USER</form:option>
                        </form:select>
                      </div>
                      <div class="mb-3 col-12 col-md-6">
                        <label for="avatarFile" class="form-label">Avatar:</label>
                        <input class="form-control" type="file" id="avatarFile" name="inputFile"
                          accept=" .png, .jpg, .jpeg" />
                      </div>
                      <div class="mb-3 col-12">
                        <img style="max-height: 250px; display: none;" alt="avatar preview" id="avatarPreview" />
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