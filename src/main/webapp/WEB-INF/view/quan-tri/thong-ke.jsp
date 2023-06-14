<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--<c:set var="url">${pageContext.request.contextPath}</c:set>--%>
<%--<c:set var="productName" value=""/>--%>
<%--<c:forEach items="${lstTK}" var="element" varStatus="status">--%>
<%--    <c:set var="productName" value="${ten}${element.ten}"/>--%>
<%--    <c:if test="${!status.last}">--%>
<%--        <c:set var="productName" value="${ten}, "/>--%>
<%--    </c:if>--%>
<%--</c:forEach>--%>
<%--<c:set var="quantityBuy" value=""/>--%>
<%--<c:forEach items="${lstTK}" var="element" varStatus="status">--%>
<%--    <c:set var="quantityBuy" value="${soLuong}${element.soLuong}"/>--%>
<%--    <c:if test="${!status.last}">--%>
<%--        <c:set var="quantityBuy" value="${soLuong}, "/>--%>
<%--    </c:if>--%>
<%--</c:forEach>--%>
<%--<c:set var="quantity" value=""/>--%>
<%--<c:forEach items="${product}" var="element" varStatus="status">--%>
<%--    <c:set var="quantity" value="${quantity}${element.quantity}"/>--%>
<%--    <c:if test="${!status.last}">--%>
<%--        <c:set var="quantity" value="${quantity}, "/>--%>
<%--    </c:if>--%>
<%--</c:forEach>--%>

<%--<c:set var="productName" value=""/>--%>
<%--<c:forEach items="${lstTK}" var="element" varStatus="status">--%>
<%--    <c:set var="temp" value="${element.ten.split(',')}"/>--%>
<%--    <c:forEach items="${temp}" var="item">--%>
<%--        <c:set var="formattedItem" value="${item.trim()}"/>--%>
<%--        <c:set var="productName" value="${ten}'${formattedItem}'"/>--%>
<%--        <c:if test="${!status.last}">--%>
<%--            <c:set var="productName" value="${ten}, "/>--%>
<%--        </c:if>--%>
<%--    </c:forEach>--%>
<%--</c:forEach>--%>
<html>
<head>
    <title>Bootstrap demo</title>
    <base href="${fn:substring(url, 0, fn:length(url) - fn:length(pageContext.request.requestURI))}${pageContext.request.contextPath}/"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
<%--<form action="/thong-ke/loc/thang" method="post" class="container">--%>
<%--    <div class="mb-3">--%>
<%--        <label for="thang" class="form-label">Tháng:</label>--%>
<%--        <input type="text" class="form-control" id="thang" name="thang">--%>
<%--    </div>--%>
<%--    <div class="mb-3">--%>
<%--        <label for="nam" class="form-label">Năm:</label>--%>
<%--        <input type="text" class="form-control" id="nam" name="nam">--%>
<%--    </div>--%>
<%--    <div class="col-md-12 text-center">--%>
<%--        <button type="submit" class="btn btn-success">Lọc</button>--%>
<%--        <a href="http://localhost:27325" class="btn btn-success">Trang Chủ</a>--%>
<%--    </div>--%>
<%--</form>--%>
<section class="container">
    <h1>Thống kê</h1>
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
            </tr>
        </c:forEach>
        </tbody>
    </table>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<figure class="highcharts-figure">
    <div id="container"></div>

</figure>


<%--<script>--%>
<%--    // Data retrieved https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature--%>
<%--    Highcharts.chart('container', {--%>
<%--        chart: {--%>
<%--            type: 'spline'--%>
<%--        },--%>
<%--        title: {--%>
<%--            text: ''--%>
<%--        },--%>
<%--        // subtitle: {--%>
<%--        //     text: 'Source: ' +--%>
<%--        //         '<a href="https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature" ' +--%>
<%--        //         'target="_blank">Wikipedia.com</a>'--%>
<%--        // },--%>
<%--        xAxis: {--%>
<%--            categories: [${ten}],--%>
<%--            accessibility: {--%>
<%--                description: 'Months of the year'--%>
<%--            }--%>
<%--        },--%>
<%--        yAxis: {--%>
<%--            title: {--%>
<%--                text: 'Quantity Buy'--%>
<%--            },--%>
<%--            labels: {--%>
<%--                format: '{value}'--%>
<%--            }--%>
<%--        },--%>
<%--        tooltip: {--%>
<%--            crosshairs: true,--%>
<%--            shared: true--%>
<%--        },--%>
<%--        plotOptions: {--%>
<%--            spline: {--%>
<%--                marker: {--%>
<%--                    radius: 4,--%>
<%--                    lineColor: '#666666',--%>
<%--                    lineWidth: 1--%>
<%--                }--%>
<%--            }--%>
<%--        },--%>
<%--        series: [{--%>
<%--            name: 'quantity buy',--%>
<%--            marker: {--%>
<%--                symbol: 'square'--%>
<%--            },--%>
<%--            data: [${soLuong}]--%>

<%--        }]--%>
<%--    });--%>

<%--</script>--%>
</body>
</html>