<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--<c:set var="url">${pageContext.request.contextPath}</c:set>--%>
<html>
<head>
    <title>Đổi mật khẩu</title>
    <base href="${fn:substring(url, 0, fn:length(url) - fn:length(pageContext.request.requestURI))}${pageContext.request.contextPath}/"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet"
          type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
          rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="/css/css.css">
</head>
<body>

<%@include file="../layout/header.jsp" %>

<section class="container">

    <c:if test="${not empty mess}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>${mess}</strong>
            <a class="btn-close" data-bs-dismiss="alert" aria-label="Close"
               style="margin: 0"></a>
        </div>
    </c:if>

    <c:if test="${not empty err}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>${err}</strong>
            <a class="btn-close" data-bs-dismiss="alert" aria-label="Close"
               style="margin: 0"></a>
        </div>
    </c:if>

    <div class="container d-flex flex-column">
        <div class="row align-items-center justify-content-center">
            <div class="col-12 col-md-8 col-lg-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <div class="mb-4">
                            <h5>Đổi mật khẩu</h5>
                            <p class="mb-2">Nhập mật khẩu và email để đổi mật khẩu</p>
                        </div>
                        <form method="post" action="/change-pass">
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input
                                        type="text"
                                        id="email"
                                        class="form-control"
                                        name="email"
                                        placeholder="Nhập Email"
                                />
                                <label for="email" class="form-label">Current Password</label>
                                <input
                                        type="password"
                                        id="password"
                                        class="form-control"
                                        placeholder="Nhập Password hiện tại"
                                        name="currentPass"
                                />
                                <label for="email1" class="form-label">New Password</label>
                                <input
                                        type="password"
                                        id="email1"
                                        class="form-control"
                                        placeholder="Nhập Password mới"
                                        name="newPass"
                                />
                                <label for="email2" class="form-label">Confirm Password</label>
                                <input
                                        type="password"
                                        id="email2"
                                        class="form-control"
                                        placeholder="Nhập lại Password mới"
                                        name="reNewPass"
                                />
                            </div>
                            <div class="mb-3 d-grid">
                                <button type="submit" class="btn btn-primary">
                                    Đổi mật khẩu
                                </button>
                            </div>
                            <span>Quên mật khẩu?</span><a href="/quen-mk">Đặt lại mật khẩu</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="../layout/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>
</html>