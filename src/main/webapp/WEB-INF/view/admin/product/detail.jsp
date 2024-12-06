<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <!-- <meta name="description" content="" />
            <meta name="author" content="" /> -->
                    <title>Detail Product</title>
                    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
                        rel="stylesheet" />
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp"></jsp:include>
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp"></jsp:include>
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Chi tiết sản phẩm</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item active"><a href="/admin">Thống kê</a></li>
                                        <li class="breadcrumb-item active"><a href="/admin/product">Sản phẩm</a></li>
                                    </ol>
                                    <div class="mt-5">
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <div class="d-flex justify-content-between">
                                                    <h3>Chi tiết sản phẩm: ${id}</h3>
                                                </div>
                                                <hr>
                                                <div class="card" style="width: 60%">
                                                    <img class="card-img-top" alt="Card image cap"
                                                        src="/images/product/${product.image}">
                                                    <div class="card-header">
                                                        Thông tin sản phẩm
                                                    </div>
                                                    <ul class="list-group list-group-flush">
                                                        <li class="list-group-item">ID: ${product.id}</li>
                                                        <li class="list-group-item">Tên: ${product.name}</li>
                                                        <li class="list-group-item">Giá:
                                                            <fmt:formatNumber type="number" value="${product.price}" />
                                                            đ
                                                        </li>
                                                        <li class="list-group-item">Chi tiết sản phẩm:
                                                            ${product.detailDesc}</li>
                                                        <li class="list-group-item">Tóm tắt:
                                                            ${product.shortDesc}
                                                        </li>
                                                        <li class="list-group-item">Số lượng: ${product.quantity}</li>
                                                        <li class="list-group-item">Hãng sản xuất: ${product.factory}
                                                        </li>
                                                        <li class="list-group-item">Mục đích sử dụng: ${product.target}
                                                        </li>
                                                    </ul>

                                                </div>
                                                <div>
                                                    <a href="/admin/product" class="btn btn-success mt-3">Trở về</a>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </main>
                            <jsp:include page="../layout/footer.jsp"></jsp:include>
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="js/scripts.js"></script>



                </body>

                </html>