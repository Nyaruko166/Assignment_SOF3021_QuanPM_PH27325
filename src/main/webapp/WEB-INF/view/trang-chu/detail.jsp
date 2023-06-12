<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>
<%--<c:set var="url">${pageContext.request.contextPath}</c:set>--%>
<html>
<head>
    <title>Bootstrap demo</title>
    <%--    <base href="${fn:substring(url, 0, fn:length(url) - fn:length(pageContext.request.requestURI))}${pageContext.request.contextPath}/"/>--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet"
          type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
          rel="stylesheet" type="text/css"/>
    <link href="/css/css.css" rel="stylesheet"/>
</head>
<body>

<%@include file="../layout/header.jsp" %>

<section class="container">
    <h3 class="title">Sản Phẩm Detail</h3>
    <form action="/cart/add/${tk.id}" method="post">
        <div class="card mb-3 box" style="max-width: 100%">
            <div class="row g-0">
                <div class="col-md-6">
                    <img
                            src="${tk.anh}"
                            class="img-fluid rounded-start"
                            alt="..."
                    />
                </div>
                <div class="col-md-6">
                    <div style="text-align: left" class="card-body">
                        <h2 style="margin-top: 20px" class="card-title">${tk.ten}</h2>
                        <div style="margin-top: 10px" class="detail-body">
                            <h6>Giá:</h6>
                            <h4>${tk.donGia} VNĐ</h4>
                        </div>
                        <div>
                            <h6 style="margin-top: 10px" class="font-14">Số lượng</h6>
                            <div class="d-flex">
                                <input
                                        type="number"
                                        min="1"
                                        value="1"
                                        class="form-control"
                                        style="width: 90px"
                                        name="soLuong"
                                />
                                <button type="submit" class="btn btn-outline-success">
                                    Thêm vào giỏ
                                </button>
                            </div>
                        </div>
                        <div style="margin-top: 10px">
                            <h6>Server:</h6>
                            <p>${tk.server}</p>
                        </div>
                        <div style="margin-top: 10px">
                            <h6>Số lượng tồn:</h6>
                            <p>${tk.soLuong}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</section>
<section class="container">
    <h2 class="title">Các sản phẩm tương tự</h2>
    <div class="row" style="margin: 0 auto">
        <c:forEach items="${lstTK}" var="x" varStatus="y">
            <div class="col-4" style="margin-bottom: 40px;display: flex;justify-content: center;">
                <a href="/detail/${x.id}" style="color: black; text-decoration: none">
                    <div class="card" style="width: 18rem;">
                        <img src="${x.anh}" class="card-img-top" alt="...">
                        <div class="card-body text-center">
                            <h5 class="card-title">${x.ten}</h5>
                            <div style="font-weight: bold">
                                <p class="card-text">Server: ${x.server}</p>
                                <p class="card-text">${x.donGia} VNĐ</p>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
</section>

<%@include file="../layout/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>
</html>