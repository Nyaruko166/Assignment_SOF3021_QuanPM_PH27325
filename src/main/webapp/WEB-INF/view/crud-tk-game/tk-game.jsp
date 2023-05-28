<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CRUD TK</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/css.css">
</head>
<body>
<section class="container">
    <form id="suck" method="post" enctype="multipart/form-data" class="container" style="margin-bottom: 0px">
        <h1 class="title">Quản lý tài khoản</h1>
        <%--    <button type="button" class="btn btn-primary" id="liveToastBtn">Show live toast</button>--%>
        <%--    <div class="toast-container top-50 start-50 translate-middle">--%>
        <%--        <div id="liveToast" class="toast align-items-center text-bg-secondary border-0" role="alert"--%>
        <%--             aria-live="assertive"--%>
        <%--             aria-atomic="true">--%>
        <%--            <div class="toast-header">--%>
        <%--                <img width="1%" height="1%" src="/img/nya.jpg" class="rounded me-2" alt="...">--%>
        <%--                <strong class="me-auto">Thông Báo</strong>--%>
        <%--                <small>Right now</small>--%>
        <%--                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>--%>
        <%--            </div>--%>
        <%--            <div class="toast-body">--%>
        <%--                Vcl luon--%>
        <%--                <div class="mt-2 pt-2 border-top">--%>
        <%--                    <button type="button" class="btn btn-primary btn-sm" id="confirm" onclick="alert()">OK--%>
        <%--                    </button>--%>
        <%--                    <button type="button" class="btn btn-info btn-sm" data-bs-dismiss="toast" id="cancel">Cancel--%>
        <%--                    </button>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </div>--%>
        <%--    </div>--%>
        <c:if test="${not empty mess}">
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                <strong>${mess}</strong>
                <a class="btn-close" data-bs-dismiss="alert" aria-label="Close"
                   style="margin: 0" href="http://localhost:27325"></a>
            </div>
        </c:if>
        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <label for="ma" class="form-label">Mã:</label>
                    <input type="text" class="form-control" id="ma" name="ma" value="${tk.ma}">
                </div>
            </div>
            <div class="col-6">
                <div class="mb-3">
                    <label for="ten" class="form-label">Tên:</label>
                    <input type="text" class="form-control" id="ten" name="ten" value="${tk.ten}">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <label for="soLuong" class="form-label">Số Lượng:</label>
                    <input type="text" class="form-control" id="soLuong" name="soLuong" value="${tk.soLuong}">
                </div>
            </div>
            <div class="col-6">
                <div class="mb-3">
                    <label for="donGia" class="form-label">Đơn Giá:</label>
                    <input type="text" class="form-control" id="donGia" name="donGia" value="${tk.donGia}">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <label for="server" class="form-label">Server:</label>
                    <input type="text" class="form-control" id="server" name="server" value="${tk.server}">
                </div>
            </div>
            <div class="col-6">
                <div class="mb-3">
                    <label for="anh" class="form-label">Ảnh:</label>
                    <input type="file" class="form-control" id="anh" name="anh" value="hate my life">
                </div>
            </div>
        </div>
    </form>
    <div class="row">
        <div class="col-6">
            <form name="findByName">
                <div class="row">
                    <label for="findByName" class="form-label" style="margin-left: 10px">Tìm kiếm theo tên:</label>
                    <div class="col-10">
                        <input style="margin-left: 10px" type="text" class="form-control" id="findByName"
                               name="findByName"
                               placeholder="Nhập tên muốn tìm">
                    </div>
                    <div class="col-2">
                        <button style="margin-left: 10px" type="submit" class="btn btn-success">Search</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-6">
            <form name="findByRange">
                <div class="row">
                    <label for="findByRange" class="form-label">Tìm kiếm theo khoảng:</label>
                    <div class="col-5">
                        <input type="number" class="form-control" id="findByName" name="min"
                               placeholder="Giá trị nhỏ nhất">
                    </div>
                    <div class="col-5">
                        <input type="number" class="form-control" id="findByName" name="max"
                               placeholder="Giá trị lớn nhất">
                    </div>
                    <div class="col-2">
                        <button type="submit" class="btn btn-success">Search</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="col-md-12 text-center">
        <button form="suck" formaction="/crud/tk-game/add" type="submit" class="btn btn-success" name="add"
                style="margin: 0" onclick="return confirm('Bạn có muốn thêm?');">Thêm
        </button>
        <button form="suck" formaction="/crud/tk-game/update" type="submit" class="btn btn-success" name="update"
                style="margin: 0" onclick="return confirm('Bạn có muốn sửa?')">Sửa
        </button>
        <a class="btn btn-success" name="reset" href="http://localhost:27325"
           style="margin: 0">Reset
        </a>
    </div>
</section>
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
            <th scope="col">Chức Năng</th>
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
                <td><img width="20%" height="20%" src="${x.anh}" class="img-thumbnail" alt="..."></td>
                <td><a href="/crud/delete/${x.id}" class="btn btn-danger"
                       onclick="return confirm('Bạn có muốn xoá?');">Xoá</a>
                    <a href="/crud/detail/${x.id}" class="btn btn-info" id="detail"
                    >Detail</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous">
</script>
<script>
    // var toastTrigger = document.getElementById('cac')
    // var toastLiveExample = document.getElementById('liveToast')
    // if (toastTrigger) {
    //     var toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample)
    //     toastTrigger.addEventListener('click', () => {
    //         toastBootstrap.show()
    //     })
    // }

    // var check = false;
    // var href;
    //
    // function noti(param, event) {
    //     var toastLiveExample = document.getElementById('liveToast');
    //     var toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample);
    //     href = this.href;
    //     event.preventDefault();
    //     toastBootstrap.show();
    // }
    //
    // confirmCheck(function () {
    //     window.location = href;
    // })
    //
    // function alert() {
    //     alert("vkl luon");
    // }
</script>
<script src="/js/js.js"></script>
</body>
</html>