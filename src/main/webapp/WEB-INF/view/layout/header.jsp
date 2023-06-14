<%--
  Created by IntelliJ IDEA.
  User: youngboizseetinh
  Date: 3/23/2023
  Time: 10:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="http://localhost:27325">Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ms-auto py-4 py-lg-0" style="font-weight: bold">
                <%--                <li class="nav-item">--%>
                <%--                </li>--%>
                <div id="nav1" class="navbar-nav">
                    <c:if test="${empty user}"><a class="nav-link" href="/dang-nhap">Đăng nhập</a></c:if>
                    <c:if test="${not empty user}"><a class="nav-link" href="/thong-tin">Thông Tin Cá Nhân</a></c:if>
                    <c:if test="${user.role == 'Admin'}">
                        <a class="nav-link" href="/crud/tk-game">Quản lý tài khoản game</a>
                    </c:if>
                    <c:if test="${user.role == 'Admin'}">
                        <a class="nav-link" href="/crud/hoa-don">Quản lý hoá đơn</a>
                    </c:if>
                    <c:if test="${user.role == 'Admin'}">
                        <a class="nav-link" href="/thong-ke">Thống kê</a>
                    </c:if>
                    <%--                    <a class="nav-link" href="http://localhost:27325/crud/tk-game">Tài Khoản--%>
                    <%--                        Game</a>--%>
                    <a href="/cart"
                    >
                        <button type="button" class="btn btn-outline-secondary">
                            <i class="fa-solid fa-cart-shopping"></i>
                            <span class="badge text-bg-secondary">${cart.size()}</span>
                        </button>
                    </a
                    >
                </div>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>
