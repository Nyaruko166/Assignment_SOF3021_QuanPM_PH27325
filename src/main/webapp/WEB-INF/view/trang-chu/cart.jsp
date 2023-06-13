<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--<c:set var="url">${pageContext.request.contextPath}</c:set>--%>
<html>
<head>
    <title>Giỏ hàng</title>
    <base href="${fn:substring(url, 0, fn:length(url) - fn:length(pageContext.request.requestURI))}${pageContext.request.contextPath}/"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/cart.css">
    <link rel="stylesheet" href="/css/index.css">
</head>
<body>

<%@include file="../layout/header.jsp" %>

<section class="container">
    <form name="form2" id="form2" method="post">
        <section class="h-100 h-custom" style="background-color: #d2c9ff;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12">
                        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                            <div class="card-body p-0">
                                <div class="row g-0">
                                    <div class="col-lg-8">
                                        <div class="p-5">
                                            <div class="d-flex justify-content-between align-items-center mb-5">
                                                <h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>
                                                <h6 class="mb-0 text-muted">${cart.size()} tài khoản</h6>
                                            </div>
                                            <hr class="my-4">
                                            <c:forEach items="${cart}" var="y">
                                                <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                    <div class="col-md-2 col-lg-2 col-xl-2">
                                                        <img
                                                                src="${y.anh}"
                                                                class="img-fluid rounded-3" alt="Cotton T-shirt">
                                                    </div>
                                                    <div class="col-md-3 col-lg-3 col-xl-3">
                                                        <h6 class="text-muted">${y.server}</h6>
                                                        <h6 class="text-black mb-0">${y.ten}</h6>
                                                    </div>
                                                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                                        <button class="btn-add-quantity"
                                                                style="height: 31px"
                                                                form="form2" formaction="/cart/del1/${y.id}"
                                                                formmethod="post">
                                                            <i class="fa-solid fa-minus"></i>
                                                        </button>

                                                        <input id="" min="0" name="soLuong"
                                                               value="${y.soLuongTrongGio}"
                                                               type="number"
                                                               class="form-control form-control-sm"
                                                        />

                                                        <button class="btn-add-quantity"
                                                                style="height: 31px"
                                                                form="form2" formaction="/cart/add1/${y.id}"
                                                                formmethod="post"
                                                        >
                                                            <i class="fa-solid fa-plus"></i>
                                                        </button>
                                                    </div>
                                                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                        <h6 class="mb-0">${y.tongTien} VNĐ</h6>
                                                    </div>
                                                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                        <button form="form2" formaction="/cart/delete/${y.id}"
                                                                formmethod="post" class="text-muted"
                                                                style="border: none;background: none"
                                                                onclick="return confirm('Bạn có muốn xoá khỏi giỏ hàng?')">
                                                            <i
                                                                    class="fas fa-times"></i></button>
                                                    </div>
                                                </div>

                                                <hr class="my-4">
                                            </c:forEach>

                                            <div class="pt-5">
                                                <h6 class="mb-0"><a href="http://localhost:27325" class="text-body"><i
                                                        class="fas fa-long-arrow-alt-left me-2"></i>Back to shop</a>
                                                </h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 bg-grey">
                                        <div class="p-5">
                                            <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
                                            <hr class="my-4">

                                            <div class="d-flex justify-content-between mb-4">
                                                <h5 class="text-uppercase">${cart.size()} tài khoản</h5>
                                                <%--                                                <h5>€ 132.00</h5>--%>
                                            </div>

                                            <%--                                        <h5 class="text-uppercase mb-3">Shipping</h5>--%>

                                            <%--                                        <div class="mb-4 pb-2">--%>
                                            <%--                                            <select class="select">--%>
                                            <%--                                                <option value="1">Standard-Delivery- €5.00</option>--%>
                                            <%--                                                <option value="2">Two</option>--%>
                                            <%--                                                <option value="3">Three</option>--%>
                                            <%--                                                <option value="4">Four</option>--%>
                                            <%--                                            </select>--%>
                                            <%--                                        </div>--%>

                                            <h5 class="text-uppercase mb-3">Voucher</h5>

                                            <div class="mb-5">
                                                <div class="form-outline">
                                                    <input type="text" id="form3Examplea2"
                                                           class="form-control form-control-lg"/>
                                                    <label class="form-label" for="form3Examplea2">Enter your
                                                        code</label>
                                                </div>
                                            </div>

                                            <hr class="my-4">

                                            <div class="d-flex justify-content-between mb-5">
                                                <h5 class="text-uppercase">Tổng Tiền</h5>
                                                <h5>${tongTien} VNĐ</h5>
                                            </div>

                                            <button type="submit" class="btn btn-dark btn-block btn-lg"
                                                    data-mdb-ripple-color="dark">Thanh Toán
                                            </button>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
</section>

<%@include file="../layout/footer.jsp" %>

<script>
    function updateGio() {
        document
    }
</script>
<script src="https://kit.fontawesome.com/6189a5b91e.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>
</html>