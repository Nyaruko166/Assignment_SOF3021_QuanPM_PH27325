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
</head>
<body>
<form action="/thong-ke/loc/thang" method="post" class="container">
    <div class="mb-3">
        <label for="thang" class="form-label">Tháng:</label>
        <input type="text" class="form-control" id="thang" name="thang">
    </div>
    <div class="mb-3">
        <label for="nam" class="form-label">Năm:</label>
        <input type="text" class="form-control" id="nam" name="nam">
    </div>
    <div class="col-md-12 text-center">
        <button type="submit" class="btn btn-success">Lọc</button>
        <a href="http://localhost:27325" class="btn btn-success">Trang Chủ</a>
    </div>
</form>
<section class="container">
    <table class="table table-striped table-hover text-center">
        <thead>
        <tr>
            <th scope="col">Tên Tài Khoản</th>
            <th scope="col">Số Lượng</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${lstTK}" var="x">
            <tr>
                <td>${x.ten}</td>
                <td>${x.soLuong}</td>
                <td>${x.ngay}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>
</html>