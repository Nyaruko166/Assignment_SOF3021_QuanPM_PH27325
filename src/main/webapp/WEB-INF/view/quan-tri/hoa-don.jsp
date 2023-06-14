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
    <link rel="stylesheet" href="/css/css.css">
</head>
<body>
<section class="container">

    <%@include file="../layout/header.jsp" %>

    <h1 class="title">Thông Tin Hoá Đơn</h1>
    <table class="table table-striped table-hover text-center">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Tổng Tiền</th>
            <th scope="col">Tên Khách Hàng</th>
            <th scope="col">Ngày Thanh toán</th>
            <th scope="col">Chức năng</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${lstHD}" var="x">
            <tr>
                <td>${x.id}</td>
                <td>${x.tongTien}</td>
                <td>${x.tenKhachHang}</td>
                <td>${x.ngayThanhToan}</td>
                <td><a href="/crud/hoa-don/detail/${x.id}" class="btn btn-success">Detail</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</section>

<%@include file="../layout/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>
</html>