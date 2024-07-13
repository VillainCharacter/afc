<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Orders</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(to right, #ff0000, #ffffff);
            font-family: 'Roboto', sans-serif;
            color: rgba(116, 116, 116, 0.667);
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            background-color: #ffffff;
            border-radius: 1rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            max-width: 1200px;
        }
        .card-header {
            background-color: #ffffff;
            border-radius: 1rem 1rem 0 0;
            padding: 1rem;
            text-align: center;
        }
        .card-body {
            background-color: #ffffff;
            border-radius: 0 0 1rem 1rem;
            padding: 2rem;
        }
        .nav-tabs {
            border-bottom: 1px solid #ddd;
            margin-bottom: 20px;
        }
        .nav-item {
            flex: 1;
            text-align: center;
        }
        .nav-link {
            color: #000;
            font-weight: 500;
            padding: 10px 15px;
            border: none;
            border-bottom: 3px solid transparent;
            transition: all 0.3s ease;
            width: 100%;
        }
        .nav-link:hover {
            border-bottom: 3px solid #ff0000;
        }
        .nav-link.active {
            color: #ff0000;
            border-bottom: 3px solid #ff0000;
            font-weight: 700;
        }
        .table {
            background-color: #ffffff;
            border: 1px solid #ddd;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 0.5rem;
            width: 100%;
            table-layout: fixed;
        }
        th, td {
            text-align: center;
            vertical-align: middle;
            padding: 0.75rem;
        }
        th {
            background-color: #ff0000;
            color: #ffffff;
            border-bottom: 2px solid #dddddd;
            font-weight: 700;
        }
        td {
            background-color: #ffffff;
            border-bottom: 1px solid #dddddd;
            font-weight: 400;
        }
        tr:nth-child(even) td {
            background-color: #f8f9fa;
        }
        tr:last-child td {
            border-bottom: none;
        }
        .btn-primary {
            background-color: #ff0000;
            border-color: #ff0000;
            font-weight: 700;
        }
        .btn-primary:hover {
            background-color: #cc0000;
            border-color: #cc0000;
        }
        .btn-secondary {
            background-color: #ff0000;
            border-color: #ff0000;
            font-weight: 700;
            margin-bottom: 20px;
        }
        .btn-secondary:hover {
            background-color: #cc0000;
            border-color: #cc0000;
        }
        h5 {
            margin-bottom: 0;
        }
    </style>
</head>
<body>
    <div class="container my-5">
        <div class="card-header">
            <a href="home">
                <img class="img-fluid my-auto align-items-center mb-0 pt-3" src="./img/logo2.png" width="200" height="200">
            </a>
        </div>
        <div class="card-body">
            <a href="home" class="btn btn-secondary">Quay về trang chủ</a>
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" href="#">Tất cả</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Đang xử lý</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Chờ giao hàng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Hoàn thành</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Đã hủy</a>
                </li>
            </ul>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Hình ảnh</th>
                        <th scope="col">Tên sản phẩm</th>
                        <th scope="col">Loại</th>
                        <th scope="col">Nhãn hàng</th>
                        <th scope="col">Số lượng</th>
                        <th scope="col">Giá tiền</th>
                        <th scope="col">Tổng tiền</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orders}">
                        <c:forEach var="detail" items="${order.orderDetails}">
                            <tr>
                                <td>
                                    <img style="width: 100px" src="${detail.pid.image}" alt="${detail.pid.name}" />
                                </td>
                                <td>${detail.pid.name}</td>
                                <td>${detail.pid.category.name}</td>
                                <td>${detail.pid.brand.name}</td>
                                <td>${detail.quantity}</td>
                                <td><fmt:formatNumber value="${detail.pid.price}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                                <td><fmt:formatNumber value="${detail.total}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="7" style="text-align: right; font-weight: bolder;">
                                <h5>Thành tiền: <a style="color: red; font-size: 30px"><fmt:formatNumber value="${order.total}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></a></h5>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="7" style="text-align: right; font-weight: bolder;">
                                <c:if test="${order.statusid.id == 1}">
                                    <a href="cancelorder?orderId=${order.id}" class="btn btn-primary ml-2">Hủy đơn hàng</a>
                                </c:if>
                                <a href="orderdetail?orderId=${order.id}" class="btn btn-primary ml-2">Xem chi tiết</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
