<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
<%--<form action="/lab12/on-tap/add" method="post" class="container">--%>
<%--    <div class="mb-3">--%>
<%--        <label for="id" class="form-label">ID:</label>--%>
<%--        <input type="text" class="form-control" id="id" name="id">--%>
<%--    </div>--%>
<%--    <div class="mb-3">--%>
<%--        <label for="ten" class="form-label">Tên:</label>--%>
<%--        <input type="text" class="form-control" id="ten" name="ten">--%>
<%--    </div>--%>
<%--    <div class="mb-3">--%>
<%--        <label for="diem" class="form-label">Điểm:</label>--%>
<%--        <input type="text" class="form-control" id="diem" name="diem">--%>
<%--    </div>--%>
<%--    <div class="col-md-12 text-center">--%>
<%--        <button type="submit" class="btn btn-success">Thêm</button>--%>
<%--        <a href="http://localhost:27325" class="btn btn-success">Trang Chủ</a>--%>
<%--    </div>--%>
<%--</form>--%>
<section class="container">
    <table class="table table-striped table-hover text-center">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Mã TK</th>
            <th scope="col">Tên TK</th>
            <th scope="col">Số lượng</th>
            <th scope="col">Đơn Giá</th>
            <th scope="col">Server</th>
            <th scope="col">Ảnh</th>
            <th scope="col">Cac</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${lstTK}" var="x">
            <tr>
                <td>${x.id}</td>
                <td>${x.ma}</td>
                <td>${x.ten}</td>
                <td>${x.soLuong}</td>
                <td>${x.donGia}</td>
                <td>${x.server}</td>
                <td><img src="${x.anh}" class="img-thumbnail" alt="..."></td>
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