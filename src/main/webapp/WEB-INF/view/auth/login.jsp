<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--<c:set var="url">${pageContext.request.contextPath}</c:set>--%>
<html>
<head>
    <title>Đăng nhập</title>
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
    <c:if test="${not empty err}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>${err}</strong>
            <a class="btn-close" data-bs-dismiss="alert" aria-label="Close"
               style="margin: 0"></a>
        </div>
    </c:if>
    <c:if test="${not empty mess}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>${mess}</strong>
            <a class="btn-close" data-bs-dismiss="alert" aria-label="Close"
               style="margin: 0"></a>
        </div>
    </c:if>
    <c:if test="${not empty datmk}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>${datmk}</strong>
            <a class="btn-close" data-bs-dismiss="alert" aria-label="Close"
               style="margin: 0"></a>
        </div>
    </c:if>
</section>

<div class="login-page">
    <div class="container">
        <div class="row">
            <div class="col-lg-10 offset-lg-1">
                <h3 class="mb-3">Login Now</h3>
                <div class="bg-white shadow rounded">
                    <div class="row">
                        <div class="col-md-7 pe-0">
                            <div class="form-left h-100 py-5 px-5">
                                <form action="/login" method="post" class="row g-4">
                                    <div class="col-12">
                                        <label>Username<span class="text-danger">*</span></label>
                                        <div class="input-group">
                                            <div class="input-group-text">
                                                <i class="fa-solid fa-user"></i>
                                            </div>
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    placeholder="Enter Username"
                                                    name="username"
                                            />
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label>Password<span class="text-danger">*</span></label>
                                        <div class="input-group">
                                            <div class="input-group-text">
                                                <i class="fa-solid fa-lock"></i>
                                            </div>
                                            <input
                                                    type="password"
                                                    class="form-control"
                                                    placeholder="Enter Password"
                                                    name="password"
                                            />
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="checkbox"
                                                    id="inlineFormCheck"
                                            />
                                            <label class="form-check-label" for="inlineFormCheck"
                                            >Remember me</label
                                            >
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <a href="/quen-mk" class="float-end text-primary"
                                        >Quên mật khẩu?</a
                                        >
                                    </div>

                                    <div style="text-align: left" class="col-sm-6">
                    <span style="margin-right: 5px">Chưa có tài khoản?</span
                    ><a href="/dang-ky">Đăng ký</a>
                                    </div>

                                    <div class="col-sm-6">
                                        <a href="/doi-mk" class="float-end text-primary"
                                        >Đổi mật khẩu</a
                                        >
                                    </div>

                                    <div class="col-12">
                                        <button
                                                class="btn btn-primary px-4 float-end mt-4"
                                                type="submit"
                                        >
                                            Login
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-md-5 ps-0 d-none d-md-block">
                            <div
                                    class="form-right h-100 bg-primary text-white text-center pt-5"
                            >
                                <i class="fa-solid fa-cart-shopping"></i>
                                <h2 class="fs-1">Welcome Back!!!</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="../layout/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="/js/all.js"></script>
<script src="/js/v4-shims.js"></script>
</body>
</html>