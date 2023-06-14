<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--<c:set var="url">${pageContext.request.contextPath}</c:set>--%>
<html>
<head>
    <title>Bootstrap demo</title>
    <base href="${fn:substring(url, 0, fn:length(url) - fn:length(pageContext.request.requestURI))}${pageContext.request.contextPath}/"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/css.css">
</head>
<body>

<%@include file="../layout/header.jsp" %>

<section class="container">
    <h1 class="title">Chi Tiết Hoá Đơn</h1>
    <table class="table table-striped table-hover text-center">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">ID Hoá Đơn</th>
            <th scope="col">ID Tài Khoản</th>
            <th scope="col">Số Lượng</th>
            <th scope="col">Đơn Giá</th>
            <th scope="col">Thành Tiền</th>
            <th scope="col">Ngày Tạo</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${lstHDCT}" var="x">
            <tr>
                <td>${x.id}</td>
                <td>${x.hoaDon.id}</td>
                <td>${x.taiKhoanGame.id}</td>
                <td>${x.soLuong}</td>
                <td>${x.donGia}</td>
                <td>${x.thanhTien}</td>
                <td>${x.ngayTao}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/crud/hoa-don" class="btn btn-info">Back</a>
</section>

<%@include file="../layout/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>
</html>