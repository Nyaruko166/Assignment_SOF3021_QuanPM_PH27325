<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>QuanPM_PH27325_SOF3011</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
          crossorigin="anonymous">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet"
          type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
          rel="stylesheet" type="text/css"/>
    <link href="../../css/css.css" rel="stylesheet"/>

</head>
<body>

<%@include file="../layout/header.jsp" %>

<%--<header class="masthead">--%>
<%--    <div class="container position-relative px-4 px-lg-5">--%>
<%--        <div class="row gx-4 gx-lg-5 justify-content-center">--%>
<%--            <div class="col-md-10 col-lg-8 col-xl-7">--%>
<%--                <div class="site-heading">--%>
<%--                    <h1>Assignment</h1>--%>
<%--                    <span class="subheading"> SOF3021</span>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</header>--%>

<section class="container text-center" style="margin: auto">
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel"
         style="width: 60%;height: 60%;margin: 0 auto">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                    aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                    aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active" data-bs-interval="5000">
                <img src="https://assetsio.reedpopcdn.com/honkai-star-rail-regular-stellar-warp.jpg?width=1920&height=1920&fit=bounds&quality=80&format=jpg&auto=webp"
                     class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item" data-bs-interval="5000">
                <img src="https://assetsio.reedpopcdn.com/honkai-star-rail-seele-event-warp.jpg?width=1920&height=1920&fit=bounds&quality=80&format=jpg&auto=webp"
                     class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item" data-bs-interval="5000">
                <img src="https://assetsio.reedpopcdn.com/honkai-star-rail-jing-yuan-event-warp.jpg?width=1920&height=1920&fit=bounds&quality=80&format=jpg&auto=webp"
                     class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</section>

<section class="container">
    <h3 class="title text-center" style="margin: 40px">Danh sách tài khoản game</h3>
    <div class="row" style="margin: 0 auto">
        <c:forEach items="${lstTK}" var="x">

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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>