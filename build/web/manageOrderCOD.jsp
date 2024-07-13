<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Quản lý đơn hàng</title>
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <link href="assets/css/custom.css" rel="stylesheet" />
        <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
    </head>
    <body>
        <div id="wrapper">
            <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="homeAdmin1.jsp">Trang Nhân Viên</a>
                </div>
                <div style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;"> Last access : 30 May 2014 &nbsp; <a href="logout" class="btn btn-danger square-btn-adjust">Logout</a> </div>
            </nav>
            <nav class="navbar-default navbar-side" role="navigation">
                <div class="sidebar-collapse">
                    <center>
                        <ul class="nav" id="main-menu">
                            <li class="text-center">
                                <img src="img/logo1.png" class="user-image img-responsive" />
                            </li>
                            <li>
                                <a href="ordercod">
                                    <img src="img/iconpm.png" alt="Home" style="width: 38px; height: 38px; margin-left:5px;margin-right:7px;">
                                        Đơn hàng thanh toán bằng COD
                                </a>
                            </li>
                            <li>
                                <a href="ordervnpay">
                                    <img src="img/iconbrand.png" alt="Home" style="width: 40px; height: 40px; margin-left:5px;margin-right:5px;">
                                        Đơn hàng thanh toán bằng VNpay
                                </a>
                            </li>
                        </ul>
                    </center>
                </div>
            </nav>
            <div id="page-wrapper">
                <div id="page-inner">
                    <div class="container-xl">
                        <div class="table-responsive">
                            <div class="table-wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Mã đơn hàng</th>
                                            <th>Mail đặt hàng</th>
                                            <th>Tên người nhận</th>
                                            <th>SĐT nhận hàng</th>
                                            <th>Tổng tiền</th>
                                            <th>Trạng thái đơn hàng</th>
                                            <th>Xem chi tiết</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="order" items="${codOrders}" varStatus="status">
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td>ĐH${order.id}</td>
                                                <td>${order.userId.email}</td>
                                                <td>${order.name}</td>
                                                <td>${order.phone}</td>
                                                <td class="product-price">${order.total}</td>
                                                <td>
                                                    <form action="updatestatus" method="post">
                                                        <input type="hidden" name="orderId" value="${order.id}" />
                                                        <select name="statusId">
                                                            <c:forEach var="status" items="${statusList}">
                                                                <option value="${status.id}" <c:if test="${status.id == order.statusid.id}">selected</c:if>>${status.status}</option>
                                                            </c:forEach>
                                                        </select>
                                                        <button type="submit" class="btn btn-primary">Cập nhật</button>
                                                    </form>
                                                </td>
                                                <td colspan="7" style="text-align: right; font-weight: bolder;">
                                                    <a href="orderdetail?orderId=${order.id}" class="btn btn-primary">Xem chi tiết</a>                                     
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="assets/js/jquery-1.10.2.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.metisMenu.js"></script>
        <script src="assets/js/dataTables/jquery.dataTables.js"></script>
        <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
            });
        </script>
        <script src="assets/js/custom.js"></script>
    </body>
</html>